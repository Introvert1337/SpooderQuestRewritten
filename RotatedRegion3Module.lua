-- Credits to EgoMoose, https://devforum.roblox.com/t/rotated-region-3-module/334068

local GJK = loadstring(game:HttpGet(""))()
local Supports = loadstring(game:HttpGet(""))()
local Vertices = loadstring(game:HttpGet(""))()

-- Class

local RotatedRegion3 = {}
RotatedRegion3.__index = RotatedRegion3

-- Private functions

local function getCorners(cf, s2)
	return {
		cf:PointToWorldSpace(Vector3.new(-s2.x, s2.y, s2.z));
		cf:PointToWorldSpace(Vector3.new(-s2.x, -s2.y, s2.z));
		cf:PointToWorldSpace(Vector3.new(-s2.x, -s2.y, -s2.z));
		cf:PointToWorldSpace(Vector3.new(s2.x, -s2.y, -s2.z));
		cf:PointToWorldSpace(Vector3.new(s2.x, s2.y, -s2.z));
		cf:PointToWorldSpace(Vector3.new(s2.x, s2.y, s2.z));
		cf:PointToWorldSpace(Vector3.new(s2.x, -s2.y, s2.z));
		cf:PointToWorldSpace(Vector3.new(-s2.x, s2.y, -s2.z));
	}
end

local function worldBoundingBox(set)
	local x, y, z = {}, {}, {}
	for i = 1, #set do x[i], y[i], z[i] = set[i].x, set[i].y, set[i].z end
	local min = Vector3.new(math.min(unpack(x)), math.min(unpack(y)), math.min(unpack(z)))
	local max = Vector3.new(math.max(unpack(x)), math.max(unpack(y)), math.max(unpack(z)))
	return min, max
end

-- Public Constructors

function RotatedRegion3.new(cframe, size)
	local self = setmetatable({}, RotatedRegion3)
	
	self.CFrame = cframe
	self.Size = size
	self.Shape = "Block"
	
	self.Set = Vertices.Block(cframe, size/2)
	self.Support = Supports.PointCloud
	self.Centroid = cframe.p
	
	self.AlignedRegion3 = Region3.new(worldBoundingBox(self.Set))

	return self
end

RotatedRegion3.Block = RotatedRegion3.new

function RotatedRegion3.Wedge(cframe, size)
	local self = setmetatable({}, RotatedRegion3)

	self.CFrame = cframe
	self.Size = size
	self.Shape = "Wedge"
	
	self.Set = Vertices.Wedge(cframe, size/2)
	self.Support = Supports.PointCloud
	self.Centroid = Vertices.GetCentroid(self.Set)
	
	self.AlignedRegion3 = Region3.new(worldBoundingBox(self.Set))

	return self
end

function RotatedRegion3.CornerWedge(cframe, size)
	local self = setmetatable({}, RotatedRegion3)

	self.CFrame = cframe
	self.Size = size
	self.Shape = "CornerWedge"
	
	self.Set = Vertices.CornerWedge(cframe, size/2)
	self.Support = Supports.PointCloud
	self.Centroid = Vertices.GetCentroid(self.Set)
	
	self.AlignedRegion3 = Region3.new(worldBoundingBox(self.Set))

	return self
end

function RotatedRegion3.Cylinder(cframe, size)
	local self = setmetatable({}, RotatedRegion3)

	self.CFrame = cframe
	self.Size = size
	self.Shape = "Cylinder"
	
	self.Set = {cframe, size/2}
	self.Support = Supports.Cylinder
	self.Centroid = cframe.p
	
	self.AlignedRegion3 = Region3.new(worldBoundingBox(getCorners(unpack(self.Set))))

	return self
end

function RotatedRegion3.Ball(cframe, size)
	local self = setmetatable({}, RotatedRegion3)

	self.CFrame = cframe
	self.Size = size
	self.Shape = "Ball"
	
	self.Set = {cframe, size/2}
	self.Support = Supports.Ellipsoid
	self.Centroid = cframe.p
	
	self.AlignedRegion3 = Region3.new(worldBoundingBox(getCorners(unpack(self.Set))))

	return self
end

function RotatedRegion3.FromPart(part)
	return RotatedRegion3[Vertices.Classify(part)](part.CFrame, part.Size)
end

-- Public Constructors

function RotatedRegion3:CastPoint(point)
	local gjk = GJK.new(self.Set, {point}, self.Centroid, point, self.Support, Supports.PointCloud)
	return gjk:IsColliding()
end

function RotatedRegion3:CastPart(part)
	local r3 = RotatedRegion3.FromPart(part)
	local gjk = GJK.new(self.Set, r3.Set, self.Centroid, r3.Centroid, self.Support, r3.Support)
	return gjk:IsColliding()
end

function RotatedRegion3:FindPartsInRegion3(ignore, maxParts)
	local found = {}
	local parts = game.Workspace:FindPartsInRegion3(self.AlignedRegion3, ignore, maxParts)
	for i = 1, #parts do
		if (self:CastPart(parts[i])) then
			table.insert(found, parts[i])
		end
	end
	return found
end

function RotatedRegion3:FindPartsInRegion3WithIgnoreList(ignore, maxParts)
	ignore = ignore or {}
	local found = {}
	local parts = game.Workspace:FindPartsInRegion3WithIgnoreList(self.AlignedRegion3, ignore, maxParts)
	for i = 1, #parts do
		if (self:CastPart(parts[i])) then
			table.insert(found, parts[i])
		end
	end
	return found
end

function RotatedRegion3:FindPartsInRegion3WithWhiteList(whiteList, maxParts)
	whiteList = whiteList or {}
	local found = {}
	local parts = game.Workspace:FindPartsInRegion3WithWhiteList(self.AlignedRegion3, whiteList, maxParts)
	for i = 1, #parts do
		if (self:CastPart(parts[i])) then
			table.insert(found, parts[i])
		end
	end
	return found
end

function RotatedRegion3:Cast(ignore, maxParts)
	ignore = type(ignore) == "table" and ignore or {ignore}
	return self:FindPartsInRegion3WithIgnoreList(ignore, maxParts)
end

--

return RotatedRegion3
