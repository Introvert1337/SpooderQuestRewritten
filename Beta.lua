repeat wait() until game:IsLoaded()
local remotes = game:GetService("ReplicatedStorage"):WaitForChild("remotes")
local LocalPlayer = game:GetService("Players").LocalPlayer

if game.PlaceId == 2414851778 then 
    repeat 
        remotes.loadPlayerCharacter:FireServer()
        wait() 
    until LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") and LocalPlayer.Character:FindFirstChild("playerNameplate")

    remotes.createLobby:InvokeServer("Aquatic Temple", shared.Difficulty, 0, false, true, false)
    remotes.startDungeon:FireServer()

    return;
end;

if game.PlaceId ~= 6216785535 then return end

local HitboxManager = {}
local DodgingManager = {}
local EnemyManager = {}
local Utilities = {}

game:GetService("LogService").MessageOut:Connect(function(Message)
    if string.find(Message, "Server Kick Message:") then
        game:GetService("TeleportService"):Teleport(2414851778)
    end
end)

local Player = game:GetService("Players").LocalPlayer

repeat wait() until Player.Character and Player.Character:FindFirstChild("HumanoidRootPart")
remotes.changeStartValue:FireServer()
wait(5)

local enemyProjectiles = game:GetService("ReplicatedStorage").enemyProjectiles

Player.Character.Humanoid.WalkSpeed = shared.Walkspeed
Player.Character.Humanoid.AutoRotate = false
local Heartbeat = game:GetService("RunService").Heartbeat
local TweenService = game:GetService("TweenService")


local projectiles = game:GetService("ReplicatedStorage").projectiles

local BackDistance = 50
local AttackRange = 55

local floor = math.floor
local max = math.max

local SpreadLine = {}
local Laser = {}

HitboxManager.AllAttacks = {}

for i,v in next, workspace.borders:GetChildren() do 
    table.insert(HitboxManager.AllAttacks, v)
end

local huge = math.huge
local min = math.min
local abs = math.abs
local ceil = math.ceil

local GayThingy = false

DodgingManager.CheckSize = 4.8

do  
    HitboxManager.Parts = {}
    HitboxManager.RawParts = {}

    DodgingManager.Ignore = {"secondbossslamhitbox"}    

    local PathfindingService = game:GetService("PathfindingService")

    function EnemyManager:GetNearestEnemy()
        local Nearest = nil
        local Distance = huge
        local CurrentPosition = Player.Character.HumanoidRootPart.Position

        for Index, Child in next, workspace.dungeon:GetChildren() do
            if Child:FindFirstChild("enemyFolder") and Child.enemyFolder:FindFirstChildOfClass("Model") then
                for SecondIndex, Descendant in next, Child.enemyFolder:GetChildren() do
                    if Descendant:IsA("Model") and Descendant:FindFirstChild("HumanoidRootPart") and Descendant:FindFirstChild("Humanoid") then
                        local Magnitude = (CurrentPosition - Descendant.HumanoidRootPart.Position).Magnitude

                        if Magnitude < Distance then
                            Distance = Magnitude
                            Nearest = Descendant
                        end
                    end
                end
            end
        end

        if game.PlaceId == 6216785535 and Nearest and Nearest:FindFirstChild("HumanoidRootPart") and Nearest.HumanoidRootPart.Position.X >= -1330 and (Nearest.HumanoidRootPart.Position.Y >= -20 and Nearest.HumanoidRootPart.Position.Y < 0) then 
            local NewNearest
            local NewDistance = huge
            
            for Index, Child in next, workspace.dungeon.room3.enemyFolder:GetChildren() do
                if Child:IsA("Model") and Child:FindFirstChild("HumanoidRootPart") and Child:FindFirstChild("Humanoid") and Child.HumanoidRootPart.Position.X < -1330 and Child.HumanoidRootPart.Position.Y < 0 then
                    local Magnitude = (CurrentPosition - Child.HumanoidRootPart.Position).Magnitude
    
                    if Magnitude < NewDistance then
                        NewDistance = Magnitude
                        NewNearest = Child
                    end
                end
            end
    
            if NewNearest then 
                return NewNearest 
            end
        end

        if game.PlaceId == 6216785535 and Nearest and Nearest:FindFirstChild("HumanoidRootPart") and Nearest.HumanoidRootPart.Position.Y >= 90 then 
            local NewNearest
            local NewDistance = huge
            
            for Index, Child in next, workspace.dungeon.room5.enemyFolder:GetChildren() do
                if Child:IsA("Model") and Child:FindFirstChild("HumanoidRootPart") and Child:FindFirstChild("Humanoid") and Child.HumanoidRootPart.Position.Y < 90 then
                    local Magnitude = (CurrentPosition - Child.HumanoidRootPart.Position).Magnitude
    
                    if Magnitude < NewDistance then
                        NewDistance = Magnitude
                        NewNearest = Child
                    end
                end
            end
    
            if NewNearest then 
                return NewNearest 
            end
        end

        if game.PlaceId == 3041739550 and workspace:FindFirstChild("initialHunterBossEntry") then 
            local Clone = workspace.initialHunterBossEntry:Clone()
            Clone.hitBox.CFrame = CFrame.new(Clone.hitBox.CFrame.X + 5, Clone.PrimaryPart.CFrame.Y, Clone.hitBox.CFrame.Z)
            Clone.hitBox.Name = "HumanoidRootPart"

            return Clone
        end

        return Nearest
    end

    function HitboxManager:IsInstakillAttack(Part)
        if Part.Name == "secondBossSlamHitbox" then
            local hitBox = Part:WaitForChild("hitBox")

            if hitBox.Size.Z == 10 and hitBox.Size.Y == 150 and hitBox.Size.X % 10 == 0 and hitBox.Size.X >= 10 and hitBox.Size.X <= 150 then
                local Closest = EnemyManager:GetNearestEnemy()
        
                if Closest and Closest.Name ~= "Sea King" then
                    return true 
                end 
            end
        end

        return false
    end

    function HitboxManager:IdentifyAttack(Part, Check)
        local Name = Part.Name:lower()

        if Part.Parent and Part.Parent.Name == "firstBossLaserPrecast" then
            wait()
            if Part.Parent and table.find(Laser, Part.Parent) then 
                return true 
            end
        end

        if Part.Parent and HitboxManager:IsInstakillAttack(Part.Parent) then 
            return false 
        end 

        if Part.Parent and Part.Parent.Name == "silkBlast" then 
            return true 
        end
        
        if not table.find(DodgingManager.Ignore, Name) then
            if Part.Parent and Part.Parent.Name:lower() == "thirdbossspreadline" then
                if Part.Parent:FindFirstChild("precast") then
                    if SpreadLine[Part.Parent] and SpreadLine[Part.Parent] < 2 then 
                        return true 
                    else 
                        if Part.Parent.precast.Transparency < 1 then 
                            if not SpreadLine[Part.Parent] then 
                                SpreadLine[Part.Parent] = 0 

                                Part.Parent.precast:GetPropertyChangedSignal("Transparency"):connect(function()
                                    if Part.Parent.precast.Transparency == 1 or Part.Parent.precast.Transparency == 0 then
                                        SpreadLine[Part.Parent] = SpreadLine[Part.Parent] + 1
                                    end
                                end)
                            end 

                            return true 
                        end
                    end 
                end
            else
                if (Name:find("hitbox") or (Name:find("precast") and not Check)) and Part.Parent then 
                    if projectiles:FindFirstChild(Part.Parent.Name) then
                        return false  
                    end
                    if Part.Parent:FindFirstChild("precast") then 
                        return Part.Parent.precast.Transparency < 1
                    else 
                        return true
                    end
                end
            end
        end
        
        return false
    end

    function HitboxManager:Cast(Start, End)
        local part = workspace:FindPartOnRayWithWhitelist(Ray.new(Start, End - Start), {workspace.borders, workspace.Terrain})

        return part
    end

    function HitboxManager:IsSafe(Part, Path, Blacklist)
        if GayThingy then 
            return true 
        end 

        if not Player.Character or not Player.Character:FindFirstChild("HumanoidRootPart") then return end 
        
        if typeof(Part) == "Instance" then
            if HitboxManager:Cast(Player.Character.HumanoidRootPart.Position, Part.Position) and not Path then 
                return false 
            end
    
            for Index, Attack in next, HitboxManager.AllAttacks do
                if HitboxManager:isInsideBrick(Part.Position, Attack) then
                    return false
                end
            end
        else 
            if HitboxManager:Cast(Player.Character.HumanoidRootPart.Position, Part) and not Path then 
                return false 
            end
    
            for Index, Attack in next, HitboxManager.AllAttacks do 
                if HitboxManager:isInsideBrick(Part, Attack) and Attack.Parent and Attack.Parent.Name ~= "borders" and (not Blacklist or not table.find(Blacklist, Attack)) then
                    return false
                end
            end
        end
        return true
    end

    function HitboxManager:isInsideBrick(position, brick)
        local pos = brick.CFrame:PointToObjectSpace(position)
        local Size = brick.Size + Vector3.new(DodgingManager.CheckSize, 0, DodgingManager.CheckSize)
        return abs(pos.X) <= Size.X / 2 and abs(pos.Z) <= Size.Z / 2
    end

    function DodgingManager:GetOptimalPosition(TouchingParts)
        for Index, Data in next, HitboxManager.Parts do
            if HitboxManager:IsSafe(Data.Part) then
                return Data.Part.Position
            end
        end
    end

    function Utilities:GetLookCFrame(LookAt)
        return CFrame.new(Player.Character.HumanoidRootPart.Position, LookAt) -- deprecated construtor go brrr
    end

    function EnemyManager:LookAtNearestEnemy()
        local Nearest = EnemyManager:GetNearestEnemy() 
        if Nearest and Nearest:FindFirstChild("HumanoidRootPart") then 
            local NearestPos = Nearest.HumanoidRootPart.Position
            local LookCFrame = Utilities:GetLookCFrame(Vector3.new(NearestPos.X, Player.Character.HumanoidRootPart.Position.Y, NearestPos.Z))

            if LookCFrame then 
                Player.Character.HumanoidRootPart.CFrame = LookCFrame
            end
        end
    end

    function DodgingManager:MoveToPosition(Position, Dodge)
        if not Player.Character or not Player.Character:FindFirstChild("Humanoid") or not Player.Character:FindFirstChild("HumanoidRootPart") then return end
        if not HitboxManager:IsSafe(Position, false) then return end

        if Dodge then 
            local origin, destination = Player.Character.HumanoidRootPart.Position, Position

            local Touching = {} 

            for i,v in next, HitboxManager.AllAttacks do 
                if HitboxManager:isInsideBrick(origin, v) then 
                    table.insert(Touching, v)
                end
            end 

            local Waypoints = {}
            local Magnitude = (origin - destination).magnitude 

            for i = 1, Magnitude do 
                table.insert(Waypoints, origin + (destination - origin) * (i / Magnitude))
            end

            for i,v in next, Waypoints do 
                if HitboxManager:IsSafe(Player.Character.HumanoidRootPart.Position) then 
                    break 
                end 

                if HitboxManager:IsSafe(v, nil, Touching) or not HitboxManager:IsSafe(Player.Character.HumanoidRootPart.Position) then 
                    if (Player.Character.HumanoidRootPart.Position - Waypoints[#Waypoints]).Magnitude <= 7 then 
                        local FurthestSafe = Waypoints[#Waypoints] 
                        
                        local Nearest = EnemyManager:GetNearestEnemy()

                        if Nearest and Nearest:FindFirstChild("HumanoidRootPart") then 
                            local comp = {Nearest.HumanoidRootPart.CFrame:GetComponents()}

                            comp[1] = FurthestSafe.X 
                            comp[2] = FurthestSafe.Y 
                            comp[3] = FurthestSafe.Z

                            Player.Character.HumanoidRootPart.CFrame = CFrame.new(unpack(comp))
                        else 
                            Player.Character.HumanoidRootPart.CFrame = CFrame.new(FurthestSafe)
                        end

                        break
                    else 
                        if HitboxManager:IsSafe(Player.Character.HumanoidRootPart.Position) then 
                            break 
                        else 
                            Player.Character.Humanoid:MoveTo(v)
                            Player.Character.Humanoid.MoveToFinished:wait()
                        end 
                    end
                end
            end
        else 
            if HitboxManager:IsSafe(Position) or GayThingy then
                Player.Character.Humanoid:MoveTo(Position);
                Player.Character.Humanoid.MoveToFinished:wait()
            end
        end
    end

    DodgingManager.IsPathfinding = false

    function DodgingManager:Pathfind(Position, DoCheck)
        if not Player.Character or not Player.Character:FindFirstChild("Humanoid") or not Player.Character:FindFirstChild("HumanoidRootPart") then return end

        local Path = PathfindingService:CreatePath({
            AgentCanJump = false,
            AgentRadius = 3,
            AgentHeight = 5
        })
        
        Path:ComputeAsync(Player.Character.HumanoidRootPart.Position, Position)
        local Waypoints = Path:GetWaypoints()

        Path.Blocked:Connect(function()
            if Player.Character:FindFirstChildOfClass('Humanoid') then
                Player.Character.Humanoid.Jump = true
            end;
            return DodgingManager:Pathfind(Position, DoCheck);
        end)

        if(Path.Status ~= Enum.PathStatus.Success) then
            if Player.Character:FindFirstChildOfClass('Humanoid') then
                Player.Character.Humanoid.Jump = true
            end;
            return DodgingManager:Pathfind(Position, DoCheck);
        end;

        for Index, Waypoint in next, Waypoints do 
            if Player.Character and Player.Character:FindFirstChild("HumanoidRootPart") then

                if Waypoint.Action == Enum.PathWaypointAction.Jump and Player.Character:FindFirstChildWhichIsA("Humanoid") then
                    Player.Character.Humanoid.Jump = true
                else
                    local Magnitude = (Player.Character.HumanoidRootPart.Position - Position).Magnitude
                
                    local Nearest = EnemyManager:GetNearestEnemy() 
    
                    if Player.Character and Player.Character:FindFirstChild("Humanoid") and Player.Character:FindFirstChild("HumanoidRootPart") then
                        if HitboxManager:IsSafe(Waypoint.Position, true) or DoCheck == false then
                            if not HitboxManager:isInsideBrick(Waypoint.Position, workspace.playerSpawn) or workspace.dungeon.room1:FindFirstChild("barrier") then
                                DodgingManager:MoveToPosition(Waypoint.Position)
                            else 
                                break 
                            end
                        else 
                            break
                        end
                    else 
                        break 
                    end
                end
            else 
                break 
            end
        end
    end

    DodgingManager.IsGoingToBackVector = false

    function EnemyManager:MoveToNearestEnemy()
        if not Player.Character or not Player.Character:FindFirstChild("HumanoidRootPart") or not Player.Character:FindFirstChild("Head") then return end 

        local Nearest = EnemyManager:GetNearestEnemy() 

        if Nearest and Nearest:FindFirstChild("HumanoidRootPart") then 
            DodgingManager:Pathfind(Nearest.HumanoidRootPart.Position, true)
        end
    end

    function EnemyManager:CastSpells()
        for Index, Spell in next, Player.Backpack:GetChildren() do 
            if Spell:FindFirstChild("cooldown") and Spell.cooldown.Value <= 0 then
                local Event = Spell:FindFirstChildOfClass("RemoteEvent") 
                if Event then 
                    Event:FireServer()
                end 
            end
        end
    end

    function DodgingManager:GetBackVector()
        local Closest = EnemyManager:GetNearestEnemy()
        if Closest and Closest:FindFirstChild("HumanoidRootPart") then
            local CurrentPosition = Player.Character.HumanoidRootPart.Position
            local Forward = Closest.HumanoidRootPart.CFrame
    
            local Furthest = nil
            local Distance = 0

            for Index = 0, BackDistance do
                local Vector = Forward:ToWorldSpace(CFrame.new(0, 0, -Index)).Position

                local Relative = Vector - CurrentPosition

                if HitboxManager:IsSafe(Vector) then
                    if Index > Distance then
                        Furthest = Vector
                        Distance = Index
                    end
                else
                    break 
                end
            end

            if GayThingy then 
                Furthest = Furthest - Vector3.new(0, 0, 20)
            end

            return Furthest
        end
    end
end

Player.CharacterAdded:connect(function(Character)
    local Humanoid = Character:WaitForChild("Humanoid")
    Humanoid.WalkSpeed = shared.Walkspeed
    Humanoid.AutoRotate = false
    DodgingManager.IsPathfinding = false
    StopLoop = false
end)

local CurrentPosition = Player.Character.HumanoidRootPart.Position

workspace.Terrain:Clear()

for i = -22, 22, 2 do 
    for k = -22, 22, 2 do
        local Part = Instance.new("Part")
        Part.Transparency = 1
        Part.CanCollide = false 
        Part.Position = CurrentPosition + Vector3.new(i, 0, k)
        Part.Size = Vector3.new(4.8, 10, 4.8)
        Part.Anchored = true 
        Part.Parent = workspace

        table.insert(HitboxManager.Parts, {Part = Part, X = i, Z = k})
        table.insert(HitboxManager.RawParts, Part)
    end
end

table.insert(HitboxManager.RawParts, Player.Character)

table.sort(HitboxManager.Parts, function(a, b)
    return (CurrentPosition - a.Part.Position).magnitude < (CurrentPosition - b.Part.Position).magnitude
end)

local SilkBlastSafeSpots = {Vector3.new(-132.435944, 237.592529, -894.529907), Vector3.new(-114.921638, 235.781372, -834.34137), Vector3.new(-92.5981598, 235.066513, -896.379761)}
local StopLoop = false

local OldBackDistance = BackDistance
local OldAttackRange = AttackRange

local IsDoingSlam = false
local IsDoingSafeSpot = false
local AnimationPlayed = false

workspace.ChildAdded:Connect(function(child)
    local Closest = EnemyManager:GetNearestEnemy()
        
    if Closest and Closest.Name == "Ancient Temple Protector" then
        if HitboxManager:IsInstakillAttack(child) then 
            local hitBox = child:WaitForChild("hitBox")

            local hitBox = child:WaitForChild("hitBox")

            if abs(Player.Character.HumanoidRootPart.Position.X - hitBox.Position.X) <= 12 and not IsDoingSlam then
                IsDoingSlam = true
                DodgingManager.IsGoingToBackVector = true
                Player.Character.HumanoidRootPart.CFrame = hitBox.CFrame * CFrame.new(0, 0, 7)
                wait(1)
                DodgingManager.IsGoingToBackVector = false
                IsDoingSlam = false
            end
        end
    end

    if child.Name == "firstBossLaserPrecast" then 
        table.insert(Laser, child)
        wait(1.5)
        table.remove(Laser, table.find(Laser, child))
    end

    if child.Name == "silkBlast" then 
        StopLoop = true 

        local Closest 
        local Distance = huge 

        for Index, Position in next, SilkBlastSafeSpots do 
            local Magnitude = (Player.Character.HumanoidRootPart.Position - Position).Magnitude 

            if Magnitude < Distance then 
                Distance = Magnitude 
                Closest = Position 
            end 
        end

        DodgingManager:Pathfind(Closest, false)

        StopLoop = false
    end

    if child.Name == "firstBossMoveOrb" then 
        local originalPos = child.Position

        local con
        con = child:GetPropertyChangedSignal("Position"):Connect(function()
            con:Disconnect()
            local partHitBox = Instance.new("Part")
            partHitBox.Anchored = true
            partHitBox.CanCollide = false
            partHitBox.Transparency = 1
            partHitBox.CFrame = CFrame.lookAt(originalPos, child.Position)
            partHitBox.Size = Vector3.new(20, 5, 800)
            partHitBox.Name = "hitBox"
            partHitBox.Parent = workspace
            
            repeat 
                wait() 
            until child == nil or not child:IsDescendantOf(workspace)
            partHitBox:Destroy() 
        end)
    end

    if child.Name == "finalBossOrbShot" then 
        local originalPos = child.Position

        local con
        con = child:GetPropertyChangedSignal("Position"):Connect(function()
            con:Disconnect()
            local partHitBox = Instance.new("Part")
            partHitBox.Anchored = true
            partHitBox.CanCollide = false
            partHitBox.Transparency = 1
            partHitBox.CFrame = CFrame.lookAt(originalPos, child.Position)
            partHitBox.Size = Vector3.new(child.Size.X + 5, 5, 800)
            partHitBox.Name = "hitBox"
            partHitBox.Parent = workspace

            spawn(function()
                wait(0.8)
                GayThingy = true 
                wait(2)
                GayThingy = false 
            end)
            
            repeat 
                wait() 
            until child == nil or not child:IsDescendantOf(workspace)
            partHitBox:Destroy() 
        end)
    end

    if child.Name == "firstBossFollowOrb" then 
        local originalPos = child.Position

        child:GetPropertyChangedSignal("Position"):Connect(function()
            local partHitBox = Instance.new("Part")
            partHitBox.Anchored = true
            partHitBox.CanCollide = false
            partHitBox.Transparency = 1
            partHitBox.CFrame = CFrame.lookAt(originalPos, child.Position)
            partHitBox.Size = Vector3.new(child.Size.X + 5, 5, 800)
            partHitBox.Name = "hitBox"
            partHitBox.Parent = workspace
            
            repeat 
                wait() 
            until child == nil or not child:IsDescendantOf(workspace)
            partHitBox:Destroy() 
        end)
    end
end)

local IsDoingFinalBossOrb = false

workspace.DescendantAdded:connect(function(Descendant)
    if Descendant:IsA("Part") and HitboxManager:IdentifyAttack(Descendant) then
        table.insert(HitboxManager.AllAttacks, Descendant)
        repeat wait() until not Descendant or not HitboxManager:IdentifyAttack(Descendant)
        table.remove(HitboxManager.AllAttacks, table.find(HitboxManager.AllAttacks, Descendant))
    end
end)

if game.PlaceId == 2606294912 or game.PlaceId == 2743806150 then 
    if game.PlaceId == 2606294912 then 
        for Index, Object in next, workspace.dungeon:GetDescendants() do 
            if Object.Name:lower():find("wall") or (Object:IsA("Part") and Object.Material == Enum.Material.Concrete and Object.BrickColor == BrickColor.new("Light red")) or Object.Name == "barrier" then 
                Object:Destroy()
            end 
        end
    end

    setsimulationradius(math.huge, math.huge) 

    for Index, Child in next, workspace.dungeon:GetChildren() do
        if Child:FindFirstChild("enemyFolder") and Child.enemyFolder:FindFirstChildOfClass("Model") then
            for SecondIndex, Descendant in next, Child.enemyFolder:GetChildren() do
                if Descendant:IsA("Model") and Descendant:FindFirstChild("HumanoidRootPart") and Descendant:FindFirstChild("Humanoid") and Descendant:FindFirstChild("enemyStyle") then
                    Descendant.Humanoid.Health = -0
                end
            end
        end
    end
    
    workspace.dungeon.DescendantAdded:connect(function(Descendant)
        if Descendant:IsA("Humanoid") and Descendant.Parent.Name ~= "Ice Elemental" then 
            Descendant.Parent:WaitForChild("enemyStyle")

            Descendant.Health = -0
        end
    end)
end

for i,v in next, workspace:GetDescendants() do
    if v.ClassName == "Part" or v.ClassName == "SpawnLocation" or v.ClassName == "WedgePart" or v.ClassName == "Terrain" or v.ClassName == "MeshPart" then
        v.Material = "Plastic"
    elseif v.ClassName == "Decal" or v.ClassName == "Texture" then
        v:Destroy()
    end
end

local connection;
connection = game:GetService("RunService").Heartbeat:Connect(function()
    setsimulationradius(math.huge, math.huge) 

    if(_G.stop) then
        connection:Disconnect();
        connection = nil;

        _G.stop = nil;
    end;

    if not StopLoop and Player.Character and Player.Character:FindFirstChild("HumanoidRootPart") then
        CurrentPosition = Player.Character.HumanoidRootPart.CFrame

        local Nearest = EnemyManager:GetNearestEnemy() 

        if Nearest and Nearest:FindFirstChild("Humanoid") and (game.PlaceId == 2606294912 or game.PlaceId == 2743806150) then
            if Nearest.Name ~= "Ice Elemental" then 
                Nearest.Humanoid.Health = -0
            end
        end

        for Index, Data in next, HitboxManager.Parts do 
            Data.Part.CFrame = CurrentPosition * CFrame.new(Data.X, 0, Data.Z)
        end

        if not HitboxManager:IsSafe(CurrentPosition.Position) and not GayThingy then 
            local SafePosition = DodgingManager:GetOptimalPosition()
            if SafePosition then
                if (CurrentPosition.Position - SafePosition).Magnitude > 7 then
                    DodgingManager.IsPathfinding = true
                    DodgingManager:MoveToPosition(SafePosition, true)
                    DodgingManager.IsPathfinding = false
                else
                    if Nearest and Nearest:FindFirstChild("HumanoidRootPart") then 
                        local comp = {Nearest.HumanoidRootPart.CFrame:GetComponents()}

                        comp[1] = SafePosition.X 
                        comp[2] = SafePosition.Y 
                        comp[3] = SafePosition.Z

                        Player.Character.HumanoidRootPart.CFrame = CFrame.new(unpack(comp))
                    else 
                        Player.Character.HumanoidRootPart.CFrame = CFrame.new(SafePosition)
                    end
                end;
            end
        else 
            if Nearest and Nearest:FindFirstChild("HumanoidRootPart") then 
                local Magnitude = (Player.Character.HumanoidRootPart.Position - Nearest.HumanoidRootPart.Position).Magnitude 
                
                if floor(Magnitude) <= AttackRange or not HitboxManager:IsSafe(Player.Character.HumanoidRootPart.Position) then
                    EnemyManager:LookAtNearestEnemy()
                end

                if floor(Magnitude) <= AttackRange then 
                    spawn(function() 
                        wait(0.01)
                        EnemyManager:CastSpells()
                    end)
                end

                if Nearest.Name == "Ancient Temple Protector" then 
                    BackDistance = 60
                    AttackRange = 65
                elseif Nearest.Name == "Sea King" then 
                    if GayThingy then 
                        BackDistance = 80
                    else 
                        BackDistance = 50
                    end 

                    AttackRange = 55
                else 
                    BackDistance = OldBackDistance 
                    AttackRange = OldAttackRange
                end

                if IsDoingSlam or Nearest.Name == "Sea King" or GayThingy then 
                    local BackVector = DodgingManager:GetBackVector() 
                    if BackVector then
                        DodgingManager.IsGoingToBackVector = true
                        DodgingManager:MoveToPosition(BackVector)
                        DodgingManager.IsGoingToBackVector = false
                    end
                else
                    if floor(Magnitude) > BackDistance and not DodgingManager.IsPathfinding then
                        DodgingManager.IsPathfinding = true
                        EnemyManager:MoveToNearestEnemy()
                        DodgingManager.IsPathfinding = false
                    elseif floor(Magnitude) < BackDistance and not DodgingManager.IsGoingToBackVector then
                        local BackVector = DodgingManager:GetBackVector() 
                        if BackVector then
                            DodgingManager.IsGoingToBackVector = true
                            DodgingManager:MoveToPosition(BackVector)
                            DodgingManager.IsGoingToBackVector = false
                        end
                    end
                end
            end
        end
    end
end)
