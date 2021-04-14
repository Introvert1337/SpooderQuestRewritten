
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local Players = game:GetService("Players")
local Player = Players.LocalPlayer
local Mouse = Player:GetMouse()
local TextService = game:GetService("TextService")
local library = {flags = {}}

local function tweenObject(object, data, time)
    local tweenInfo = TweenInfo.new(time, Enum.EasingStyle.Sine, Enum.EasingDirection.Out)
    local tween = TweenService:Create(object, tweenInfo, data)
    tween:Play()
    return tween
end

local http = game:GetService("HttpService")

if not isfile("spooderquest.config") then 
    writefile("spooderquest.config", tostring(http:JSONEncode({})))
end

local function GetSetting(name)
    if not isfile("spooderquest.config") then 
        writefile("spooderquest.config", tostring(http:JSONEncode({})))
    end
    local content = readfile("spooderquest.config")
    local parsed = http:JSONDecode(content)
    name = name:gsub("%s+", "")
    if parsed[tostring(game.GameId)] and parsed[tostring(game.GameId)][name] then 
        return parsed[tostring(game.GameId)][name] 
    end
end

local function AddSetting(name, value)
    if not isfile("spooderquest.config") then 
        writefile("spooderquest.config", tostring(http:JSONEncode({})))
    end
    
    local content = readfile("spooderquest.config")
    local parsed = http:JSONDecode(content)
    if not parsed[tostring(game.GameId)] then 
        parsed[tostring(game.GameId)] = {}
    end 
    parsed[tostring(game.GameId)][name:gsub("%s+", "")] = value 
    writefile("spooderquest.config", tostring(http:JSONEncode(parsed)))
end

function library:Window(TitleWhite)
    if game.CoreGui:FindFirstChild("BloxburgUi") then
        game.CoreGui:FindFirstChild("BloxburgUi"):Destroy()
    end
    local BloxburgUi = Instance.new("ScreenGui")
    local MainUIFrame = Instance.new("ImageLabel")
    local Cool = Instance.new("ImageLabel")
    local BloxburgCool = Instance.new("Frame")
    local TabsHolder = Instance.new("ImageLabel")
    local UIListLayout = Instance.new("UIListLayout")
    local UIPadding = Instance.new("UIPadding")
    local BloxburgTitle1 = Instance.new("Frame")
    local BloxburgTitle = Instance.new("TextLabel")
    local BloxburgHubTitle = Instance.new("TextLabel")
    BloxburgUi.Name = "BloxburgUi"
    BloxburgUi.Parent = game:GetService("CoreGui")
    BloxburgUi.DisplayOrder = 1
    MainUIFrame.Name = "MainUIFrame"
    MainUIFrame.Parent = BloxburgUi
    MainUIFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    MainUIFrame.BackgroundTransparency = 1.000
    MainUIFrame.Position = UDim2.new(0.252025217, 0, 0.226720661, 0)
    MainUIFrame.Size = UDim2.new(0, 551, 0, 406)
    MainUIFrame.Image = "rbxassetid://3570695787"
    MainUIFrame.ImageColor3 = Color3.fromRGB(22, 22, 22)
    MainUIFrame.ScaleType = Enum.ScaleType.Slice
    MainUIFrame.SliceCenter = Rect.new(100, 100, 100, 100)
    MainUIFrame.SliceScale = 0.050
    Cool.Name = "Cool"
    Cool.Parent = MainUIFrame
    Cool.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Cool.BackgroundTransparency = 1.000
    Cool.Position = UDim2.new(0.065, 0, 0.025, 0)
    Cool.Size = UDim2.new(0, 55, 0, 55)
    Cool.ZIndex = 2
    Cool.Image = "rbxassetid://166652117"
    BloxburgCool.Name = "BloxburgCool"
    BloxburgCool.Parent = MainUIFrame
    BloxburgCool.BackgroundColor3 = Color3.fromRGB(24, 24, 24)
    BloxburgCool.BorderSizePixel = 0
    BloxburgCool.Size = UDim2.new(0, 125, 0, 97)
    TabsHolder.Name = "TabsHolder"
    TabsHolder.Parent = MainUIFrame
    TabsHolder.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    TabsHolder.BackgroundTransparency = 1.000
    TabsHolder.Position = UDim2.new(0, 0, 0.25, 0)
    TabsHolder.Size = UDim2.new(0, 125, 0, 307)
    TabsHolder.Image = "rbxassetid://3570695787"
    TabsHolder.ImageColor3 = Color3.fromRGB(24, 24, 24)
    TabsHolder.ScaleType = Enum.ScaleType.Slice
    TabsHolder.SliceCenter = Rect.new(100, 100, 100, 100)
    TabsHolder.SliceScale = 0.050
    BloxburgTitle1.Name = "BloxburgTitle"
    BloxburgTitle1.Parent = MainUIFrame
    BloxburgTitle1.BackgroundColor3 = Color3.fromRGB(19, 19, 19)
    BloxburgTitle1.BorderSizePixel = 0
    BloxburgTitle1.Position = UDim2.new(0.226860255, 0, 0, 0)
    BloxburgTitle1.Size = UDim2.new(0, 426, 0, 35)
    BloxburgTitle.Name = "BloxburgTitle"
    BloxburgTitle.Parent = BloxburgTitle1
    BloxburgTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    BloxburgTitle.BackgroundTransparency = 1.000
    BloxburgTitle.BorderColor3 = Color3.fromRGB(27, 42, 53)
    BloxburgTitle.Position = UDim2.new(0.0148883378, 0, 0, 0)
    BloxburgTitle.Size = UDim2.new(0, 420, 0, 35)
    BloxburgTitle.Font = Enum.Font.GothamBold
    BloxburgTitle.Text = TitleWhite
    BloxburgTitle.TextColor3 = Color3.fromRGB(233, 233, 233)
    BloxburgTitle.TextSize = 15.000
    BloxburgTitle.TextXAlignment = Enum.TextXAlignment.Left
    BloxburgHubTitle.Name = "BloxburgHubTitle"
    BloxburgHubTitle.Parent = MainUIFrame
    BloxburgHubTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    BloxburgHubTitle.BackgroundTransparency = 1.000
    BloxburgHubTitle.Position = UDim2.new(0.02, 0, 0.16, 0)
    BloxburgHubTitle.Size = UDim2.new(0, 372, 0, 35)
    BloxburgHubTitle.Font = Enum.Font.GothamBold
    BloxburgHubTitle.Text = "Spooder Quest"
    BloxburgHubTitle.TextColor3 = Color3.fromRGB(84, 116, 224)
    BloxburgHubTitle.TextSize = 15.000
    BloxburgHubTitle.TextXAlignment = Enum.TextXAlignment.Left
    UIListLayout.Parent = TabsHolder
    UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
    UIPadding.Parent = TabsHolder
    local MainUITabPickedHolder = Instance.new("Frame")
    MainUITabPickedHolder.Name = "MainUITabPickedHolder"
    MainUITabPickedHolder.Parent = MainUIFrame
    MainUITabPickedHolder.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    MainUITabPickedHolder.BackgroundTransparency = 1.000
    MainUITabPickedHolder.Position = UDim2.new(0.226860255, 0, 0.0866336599, 0)
    MainUITabPickedHolder.Size = UDim2.new(0, 426, 0, 369)
    local connections = {}

    MainUIFrame.InputBegan:connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            local InitialPos = input.Position
            local InitialFramePos = MainUIFrame.Position
            connections.MouseMoved = UserInputService.InputChanged:Connect(function(input)
                if input.UserInputType == Enum.UserInputType.MouseMovement then
                    local delta = input.Position - InitialPos
                    tweenObject(MainUIFrame, {
                        Position = UDim2.new(InitialFramePos.X.Scale, InitialFramePos.X.Offset + delta.X, InitialFramePos.Y.Scale, InitialFramePos.Y.Offset + delta.Y)
                    }, 0.1)
                end
            end)
            MainUIFrame.InputEnded:connect(function(Input)
                if Input.UserInputType == Enum.UserInputType.MouseButton1 then
                    connections.MouseMoved:Disconnect()
                end
            end)
        end
    end)

    local opened = true

    UserInputService.InputBegan:Connect(function(input)
        if input.KeyCode == Enum.KeyCode.RightControl then
            if opened == true then
                if MainUIFrame.Parent ~= nil then
                    MainUIFrame.ClipsDescendants = true
                    MainUIFrame:TweenSize(UDim2.new(0, 0, 0, 404), Enum.EasingDirection.In, Enum.EasingStyle.Linear, 0.5, true)
                    opened = false
                    wait(0.5)
                end
            elseif opened == false then
                if MainUIFrame.Parent ~= nil then
                    MainUIFrame:TweenSize(UDim2.new(0, 551, 0, 404), Enum.EasingDirection.Out, Enum.EasingStyle.Linear, 0.5, true)
                    opened = true
                    wait(0.5)
                    MainUIFrame.ClipsDescendants = false
                end
            end
        end
    end)

    local window = {}
    function window:Notification(Type, content, callback)
        if Type == "Message" then
            local NotificationMain = Instance.new("ImageLabel")
            local NotificationDropShadow = Instance.new("ImageLabel")
            local NotificationTitleHodler = Instance.new("Frame")
            local NotificationTitle = Instance.new("TextLabel")
            local NotificationCool = Instance.new("ImageLabel")
            local NotificationText = Instance.new("TextLabel")
            local NotificationOkay = Instance.new("TextButton")
            NotificationMain.Name = "NotificationMain"
            NotificationMain.Parent = BloxburgUi
            NotificationMain.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            NotificationMain.BackgroundTransparency = 1.000
            NotificationMain.Position = UDim2.new(-0.3, 0, 0.775, 0)
            tweenObject(NotificationMain, {
                Position = UDim2.new(0.015, 0, 0.775, 0)
            }, 0.5)
            NotificationMain.Size = UDim2.new(0, 268, 0, 124)
            NotificationMain.Image = "rbxassetid://3570695787"
            NotificationMain.ImageColor3 = Color3.fromRGB(22, 22, 22)
            NotificationMain.ScaleType = Enum.ScaleType.Slice
            NotificationMain.SliceCenter = Rect.new(100, 100, 100, 100)
            NotificationMain.SliceScale = 0.050
            NotificationDropShadow.Name = "NotificationDropShadow"
            NotificationDropShadow.Parent = NotificationMain
            NotificationDropShadow.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            NotificationDropShadow.BackgroundTransparency = 1.000
            NotificationDropShadow.Position = UDim2.new(-0.315028518, 0, -0.540322602, 0)
            NotificationDropShadow.Size = UDim2.new(0, 442, 0, 258)
            NotificationDropShadow.ZIndex = -1
            NotificationDropShadow.Image = "rbxassetid://5089202498"
            NotificationTitleHodler.Name = "NotificationTitleHodler"
            NotificationTitleHodler.Parent = NotificationMain
            NotificationTitleHodler.BackgroundColor3 = Color3.fromRGB(14, 14, 14)
            NotificationTitleHodler.BorderSizePixel = 0
            NotificationTitleHodler.Size = UDim2.new(0, 268, 0, 31)
            NotificationTitle.Name = "NotificationTitle"
            NotificationTitle.Parent = NotificationTitleHodler
            NotificationTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            NotificationTitle.BackgroundTransparency = 1.000
            NotificationTitle.Position = UDim2.new(0.0261194035, 0, 0, 0)
            NotificationTitle.Size = UDim2.new(0, 261, 0, 31)
            NotificationTitle.Font = Enum.Font.GothamSemibold
            NotificationTitle.Text = "Notification"
            NotificationTitle.TextColor3 = Color3.fromRGB(233, 233, 233)
            NotificationTitle.TextSize = 14.000
            NotificationTitle.TextXAlignment = Enum.TextXAlignment.Left
            NotificationCool.Name = "NotificationCool"
            NotificationCool.Parent = NotificationTitleHodler
            NotificationCool.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            NotificationCool.BackgroundTransparency = 1.000
            NotificationCool.Position = UDim2.new(0.914178967, 0, 0.225806445, 0)
            NotificationCool.Size = UDim2.new(0, 17, 0, 17)
            NotificationCool.Image = "rbxgameasset://Images/w"
            NotificationText.Name = "NotificationText"
            NotificationText.Parent = NotificationMain
            NotificationText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            NotificationText.BackgroundTransparency = 1.000
            NotificationText.Position = UDim2.new(-0.0037313432, 0, 0.25, 0)
            NotificationText.Size = UDim2.new(0, 268, 0, 66)
            NotificationText.ZIndex = 2
            NotificationText.Font = Enum.Font.GothamSemibold
            NotificationText.Text = content.Text
            NotificationText.TextColor3 = Color3.fromRGB(233, 233, 233)
            NotificationText.TextSize = 14.000
            NotificationOkay.Name = "NotificationOkay"
            NotificationOkay.Parent = NotificationMain
            NotificationOkay.BackgroundColor3 = Color3.fromRGB(14, 14, 14)
            NotificationOkay.BorderSizePixel = 0
            NotificationOkay.Position = UDim2.new(0.0223880596, 0, 0.782258093, 0)
            NotificationOkay.Size = UDim2.new(0, 256, 0, 21)
            NotificationOkay.Font = Enum.Font.GothamSemibold
            NotificationOkay.Text = content.ConfirmText
            NotificationOkay.TextColor3 = Color3.fromRGB(233, 233, 233)
            NotificationOkay.TextSize = 13.000
            NotificationOkay.MouseButton1Click:connect(function()
                tweenObject(NotificationMain, {
                    Position = UDim2.new(-0.3, 0, 0.775, 0)
                }, 0.5)
                wait(0.5)
                NotificationMain:Destroy()
            end)
        elseif Type == "Error" then
            local ErrorMain = Instance.new("ImageLabel")
            local ErrorDropShadow = Instance.new("ImageLabel")
            local ErrorTitleHolder = Instance.new("Frame")
            local ErrorTitle = Instance.new("TextLabel")
            local ErrorBad = Instance.new("ImageLabel")
            local ErrorText = Instance.new("TextLabel")
            local ErrorOkay = Instance.new("TextButton")
            ErrorMain.Name = "ErrorMain"
            ErrorMain.Parent = BloxburgUi
            ErrorMain.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            ErrorMain.BackgroundTransparency = 1.000
            ErrorMain.Position = UDim2.new(-0.3, 0, 0.775, 0)
            tweenObject(ErrorMain, {
                Position = UDim2.new(0.015, 0, 0.775, 0)
            }, 0.5)
            ErrorMain.Size = UDim2.new(0, 268, 0, 124)
            ErrorMain.Image = "rbxassetid://3570695787"
            ErrorMain.ImageColor3 = Color3.fromRGB(22, 22, 22)
            ErrorMain.ScaleType = Enum.ScaleType.Slice
            ErrorMain.SliceCenter = Rect.new(100, 100, 100, 100)
            ErrorMain.SliceScale = 0.050
            ErrorDropShadow.Name = "ErrorDropShadow"
            ErrorDropShadow.Parent = ErrorMain
            ErrorDropShadow.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            ErrorDropShadow.BackgroundTransparency = 1.000
            ErrorDropShadow.Position = UDim2.new(-0.315028518, 0, -0.540322602, 0)
            ErrorDropShadow.Size = UDim2.new(0, 442, 0, 258)
            ErrorDropShadow.ZIndex = -1
            ErrorDropShadow.Image = "rbxassetid://5089202498"
            ErrorTitleHolder.Name = "ErrorTitleHolder"
            ErrorTitleHolder.Parent = ErrorMain
            ErrorTitleHolder.BackgroundColor3 = Color3.fromRGB(14, 14, 14)
            ErrorTitleHolder.BorderSizePixel = 0
            ErrorTitleHolder.Size = UDim2.new(0, 268, 0, 31)
            ErrorTitle.Name = "ErrorTitle"
            ErrorTitle.Parent = ErrorTitleHolder
            ErrorTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            ErrorTitle.BackgroundTransparency = 1.000
            ErrorTitle.Position = UDim2.new(0.0261194035, 0, 0, 0)
            ErrorTitle.Size = UDim2.new(0, 261, 0, 31)
            ErrorTitle.Font = Enum.Font.GothamSemibold
            ErrorTitle.Text = "ERROR"
            ErrorTitle.TextColor3 = Color3.fromRGB(233, 58, 53)
            ErrorTitle.TextSize = 14.000
            ErrorTitle.TextXAlignment = Enum.TextXAlignment.Left
            ErrorBad.Name = "ErrorBad"
            ErrorBad.Parent = ErrorTitleHolder
            ErrorBad.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            ErrorBad.BackgroundTransparency = 1.000
            ErrorBad.Position = UDim2.new(0.914178848, 0, 0.225806445, 0)
            ErrorBad.Size = UDim2.new(0, 17, 0, 17)
            ErrorBad.Image = "rbxgameasset://Images/d"
            ErrorBad.ImageColor3 = Color3.fromRGB(233, 58, 53)
            ErrorText.Name = "ErrorText"
            ErrorText.Parent = ErrorMain
            ErrorText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            ErrorText.BackgroundTransparency = 1.000
            ErrorText.Position = UDim2.new(-0.0037313432, 0, 0.25, 0)
            ErrorText.Size = UDim2.new(0, 268, 0, 66)
            ErrorText.ZIndex = 2
            ErrorText.Font = Enum.Font.GothamSemibold
            ErrorText.Text = content.Text
            ErrorText.TextColor3 = Color3.fromRGB(233, 233, 233)
            ErrorText.TextSize = 14.000
            ErrorOkay.Name = "ErrorOkay"
            ErrorOkay.Parent = ErrorMain
            ErrorOkay.BackgroundColor3 = Color3.fromRGB(14, 14, 14)
            ErrorOkay.BorderSizePixel = 0
            ErrorOkay.Position = UDim2.new(0.0223880596, 0, 0.782258093, 0)
            ErrorOkay.Size = UDim2.new(0, 256, 0, 21)
            ErrorOkay.Font = Enum.Font.GothamSemibold
            ErrorOkay.Text = content.ConfirmText
            ErrorOkay.TextColor3 = Color3.fromRGB(233, 233, 233)
            ErrorOkay.TextSize = 13.000
            ErrorOkay.MouseButton1Click:connect(function()
                tweenObject(ErrorMain, {
                    Position = UDim2.new(-0.3, 0, 0.775, 0)
                }, 0.5)
                wait(0.5)
                ErrorMain:Destroy()
            end)
        elseif Type == "Confirm" then
            local NotificationMain = Instance.new("ImageLabel")
            local NotificationDropShadow = Instance.new("ImageLabel")
            local NotificationTitleHodler = Instance.new("Frame")
            local NotificationTitle = Instance.new("TextLabel")
            local NotificationCool = Instance.new("ImageLabel")
            local NotificationText = Instance.new("TextLabel")
            local NotificationYes = Instance.new("TextButton")
            local NotificationNo = Instance.new("TextButton")
            NotificationMain.Name = "NotificationMain"
            NotificationMain.Parent = BloxburgUi
            NotificationMain.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            NotificationMain.BackgroundTransparency = 1.000
            NotificationMain.Position = UDim2.new(-0.3, 0, 0.775, 0)
            NotificationMain.Size = UDim2.new(0, 268, 0, 124)
            NotificationMain.Image = "rbxassetid://3570695787"
            NotificationMain.ImageColor3 = Color3.fromRGB(22, 22, 22)
            NotificationMain.ScaleType = Enum.ScaleType.Slice
            NotificationMain.SliceCenter = Rect.new(100, 100, 100, 100)
            NotificationMain.SliceScale = 0.050
            tweenObject(NotificationMain, {
                Position = UDim2.new(0.015, 0, 0.775, 0)
            }, 0.5)
            NotificationDropShadow.Name = "NotificationDropShadow"
            NotificationDropShadow.Parent = NotificationMain
            NotificationDropShadow.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            NotificationDropShadow.BackgroundTransparency = 1.000
            NotificationDropShadow.Position = UDim2.new(-0.315028518, 0, -0.540322602, 0)
            NotificationDropShadow.Size = UDim2.new(0, 442, 0, 258)
            NotificationDropShadow.ZIndex = -1
            NotificationDropShadow.Image = "rbxassetid://5089202498"
            NotificationTitleHodler.Name = "NotificationTitleHodler"
            NotificationTitleHodler.Parent = NotificationMain
            NotificationTitleHodler.BackgroundColor3 = Color3.fromRGB(14, 14, 14)
            NotificationTitleHodler.BorderSizePixel = 0
            NotificationTitleHodler.Size = UDim2.new(0, 268, 0, 31)
            NotificationTitle.Name = "NotificationTitle"
            NotificationTitle.Parent = NotificationTitleHodler
            NotificationTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            NotificationTitle.BackgroundTransparency = 1.000
            NotificationTitle.Position = UDim2.new(0.0261194035, 0, 0, 0)
            NotificationTitle.Size = UDim2.new(0, 261, 0, 31)
            NotificationTitle.Font = Enum.Font.GothamSemibold
            NotificationTitle.Text = "Confirm"
            NotificationTitle.TextColor3 = Color3.fromRGB(88, 170, 205)
            NotificationTitle.TextSize = 14.000
            NotificationTitle.TextXAlignment = Enum.TextXAlignment.Left
            NotificationCool.Name = "NotificationCool"
            NotificationCool.Parent = NotificationTitleHodler
            NotificationCool.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            NotificationCool.BackgroundTransparency = 1.000
            NotificationCool.Position = UDim2.new(0.914178967, 0, 0.225806445, 0)
            NotificationCool.Size = UDim2.new(0, 17, 0, 17)
            NotificationCool.Image = "rbxgameasset://Images/w"
            NotificationText.Name = "NotificationText"
            NotificationText.Parent = NotificationMain
            NotificationText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            NotificationText.BackgroundTransparency = 1.000
            NotificationText.Position = UDim2.new(-0.0037313432, 0, 0.25, 0)
            NotificationText.Size = UDim2.new(0, 268, 0, 66)
            NotificationText.ZIndex = 2
            NotificationText.Font = Enum.Font.GothamSemibold
            NotificationText.Text = content.Text
            NotificationText.TextColor3 = Color3.fromRGB(233, 233, 233)
            NotificationText.TextSize = 14.000
            NotificationYes.Name = "NotificationYes"
            NotificationYes.Parent = NotificationMain
            NotificationYes.BackgroundColor3 = Color3.fromRGB(14, 14, 14)
            NotificationYes.BorderSizePixel = 0
            NotificationYes.Position = UDim2.new(0.0223880596, 0, 0.782258093, 0)
            NotificationYes.Size = UDim2.new(0, 128, 0, 21)
            NotificationYes.Font = Enum.Font.GothamSemibold
            NotificationYes.Text = "Yes"
            NotificationYes.TextColor3 = Color3.fromRGB(0, 255, 0)
            NotificationYes.TextSize = 13.000
            NotificationNo.Name = "NotificationNo"
            NotificationNo.Parent = NotificationMain
            NotificationNo.BackgroundColor3 = Color3.fromRGB(14, 14, 14)
            NotificationNo.BorderSizePixel = 0
            NotificationNo.Position = UDim2.new(0.5, 0, 0.782258093, 0)
            NotificationNo.Size = UDim2.new(0, 128, 0, 21)
            NotificationNo.Font = Enum.Font.GothamSemibold
            NotificationNo.Text = "No"
            NotificationNo.TextColor3 = Color3.fromRGB(233, 0, 0)
            NotificationNo.TextSize = 13.000
            NotificationYes.MouseButton1Click:Connect(function()
                tweenObject(NotificationMain, {
                    Position = UDim2.new(-0.3, 0, 0.775, 0)
                }, 0.5)
                wait(0.5)
                NotificationMain:Destroy()
                NotificationMain = nil
                if callback then
                    callback(true)
                end
            end)
            NotificationNo.MouseButton1Click:Connect(function()
                tweenObject(NotificationMain, {
                    Position = UDim2.new(-0.3, 0, 0.775, 0)
                }, 0.5)
                wait(0.5)
                NotificationMain:Destroy()
                NotificationMain = nil
                if callback then
                    callback(false)
                end
            end)
        end
    end
    local activeTab = nil
    local activeTabFrame = nil
    function window:Tab(name)
        local TabSelected = Instance.new("TextButton")
        local TabTOpFrame = Instance.new("Frame")
        local TabBottomFrame = Instance.new("Frame")
        local MainUITabPicked = Instance.new("ScrollingFrame")
        TabSelected.Name = "TabSelected"
        TabSelected.Parent = TabsHolder
        TabSelected.BackgroundColor3 = Color3.fromRGB(24, 24, 24)
        TabSelected.BorderSizePixel = 0
        TabSelected.Size = UDim2.new(0, 125, 0, 30)
        TabSelected.AutoButtonColor = false
        TabSelected.Font = Enum.Font.GothamSemibold
        TabSelected.Text = name
        TabSelected.TextColor3 = Color3.fromRGB(66, 66, 66)
        TabSelected.TextSize = 13.000
        TabTOpFrame.Name = "TabTOpFrame"
        TabTOpFrame.Parent = TabSelected
        TabTOpFrame.BackgroundColor3 = Color3.fromRGB(84, 116, 224)
        TabTOpFrame.BorderColor3 = Color3.fromRGB(84, 116, 224)
        TabTOpFrame.BorderSizePixel = 0
        TabTOpFrame.Size = UDim2.new(0, 125, 0, 1)
        TabTOpFrame.BackgroundTransparency = 1
        TabBottomFrame.Name = "TabBottomFrame"
        TabBottomFrame.Parent = TabSelected
        TabBottomFrame.BackgroundColor3 = Color3.fromRGB(84, 116, 224)
        TabBottomFrame.BorderColor3 = Color3.fromRGB(84, 116, 224)
        TabBottomFrame.BorderSizePixel = 0
        TabBottomFrame.Position = UDim2.new(0, 0, 0.966666639, 0)
        TabBottomFrame.Size = UDim2.new(0, 125, 0, 1)
        TabBottomFrame.BackgroundTransparency = 1
        local UIListLayout_2 = Instance.new("UIListLayout")
        local UIPadding_2 = Instance.new("UIPadding")
        MainUITabPicked.Name = "MainUITabPicked"
        MainUITabPicked.Parent = MainUITabPickedHolder
        MainUITabPicked.CanvasSize = UDim2.new(0, 0, 0, 0)
        MainUITabPicked.Active = true
        MainUITabPicked.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        MainUITabPicked.BackgroundTransparency = 1.000
        MainUITabPicked.Size = UDim2.new(0, 426, 0, 369)
        MainUITabPicked.ScrollBarThickness = 2
        MainUITabPicked.Visible = false
        UIListLayout_2.Parent = MainUITabPicked
        UIListLayout_2.SortOrder = Enum.SortOrder.LayoutOrder
        UIListLayout_2.Padding = UDim.new(0, 8)
        UIPadding_2.Parent = MainUITabPicked
        UIPadding_2.PaddingLeft = UDim.new(0, 8)
        UIPadding_2.PaddingTop = UDim.new(0, 8)
        if activeTab == nil then
            MainUITabPicked.Visible = true
            activeTabFrame = MainUITabPicked
            tweenObject(TabSelected, {
                BackgroundColor3 = Color3.fromRGB(17, 17, 30)
            }, 0.5)
            tweenObject(TabSelected, {
                TextColor3 = Color3.fromRGB(84, 116, 224)
            }, 0.5)
            activeTab = TabSelected
            tweenObject(TabBottomFrame, {
                BackgroundTransparency = 0
            }, 0.5)
            tweenObject(TabTOpFrame, {
                BackgroundTransparency = 0
            }, 0.5)
        end
        TabSelected.MouseButton1Click:Connect(function()
            tweenObject(activeTab.TabBottomFrame, {
                BackgroundTransparency = 1
            }, 0.5)
            tweenObject(activeTab.TabTOpFrame, {
                BackgroundTransparency = 1
            }, 0.5)
            tweenObject(activeTab, {
                BackgroundColor3 = Color3.fromRGB(24, 24, 24)
            }, 0.5)
            tweenObject(activeTab, {
                TextColor3 = Color3.fromRGB(66, 66, 66)
            }, 0.5)
            activeTabFrame.Visible = false
            activeTab = TabSelected
            activeTabFrame = MainUITabPicked
            MainUITabPicked.Visible = true
            tweenObject(TabSelected, {
                BackgroundColor3 = Color3.fromRGB(17, 17, 30)
            }, 0.5)
            tweenObject(TabSelected, {
                TextColor3 = Color3.fromRGB(84, 116, 224)
            }, 0.5)
            tweenObject(TabBottomFrame, {
                BackgroundTransparency = 0
            }, 0.5)
            tweenObject(TabTOpFrame, {
                BackgroundTransparency = 0
            }, 0.5)
        end)
        local tab = {}
        local tabSize = 39
        local function ResizeTab()
            MainUITabPicked.CanvasSize = UDim2.new(0, 0, 0, tabSize)
        end

        function tab:Section(name)
            local SectionBack = Instance.new("ImageLabel")
            local SectionTitleBack = Instance.new("Frame")
            local SectionTitle = Instance.new("TextLabel")
            local SectionFrame = Instance.new("Frame")
            local UIListLayout_3 = Instance.new("UIListLayout")
            local UIPadding_3 = Instance.new("UIPadding")
            local UIListLayout_4 = Instance.new("UIListLayout")
            SectionBack.Name = "Section Back"
            SectionBack.Parent = MainUITabPicked
            SectionBack.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            SectionBack.BackgroundTransparency = 1.000
            SectionBack.Position = UDim2.new(0.018779343, 0, -0.978319764, 0)
            SectionBack.Size = UDim2.new(0, 403, 0, 31)
            SectionBack.Image = "rbxassetid://3570695787"
            SectionBack.ImageColor3 = Color3.fromRGB(15, 15, 15)
            SectionBack.ScaleType = Enum.ScaleType.Slice
            SectionBack.SliceCenter = Rect.new(100, 100, 100, 100)
            SectionBack.SliceScale = 0.050

            UIListLayout_4.Parent = SectionBack
            UIListLayout_4.SortOrder = Enum.SortOrder.LayoutOrder
            SectionTitleBack.Name = "SectionTitleBack"
            SectionTitleBack.Parent = SectionBack
            SectionTitleBack.BackgroundColor3 = Color3.fromRGB(14, 14, 14)
            SectionTitleBack.BorderSizePixel = 0
            SectionTitleBack.Size = UDim2.new(0, 403, 0, 31)
            SectionTitle.Name = "SectionTitle"
            SectionTitle.Parent = SectionTitleBack
            SectionTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            SectionTitle.BackgroundTransparency = 1.000
            SectionTitle.Position = UDim2.new(0.0148883378, 0, 0, 0)
            SectionTitle.Size = UDim2.new(0, 397, 0, 31)
            SectionTitle.Font = Enum.Font.GothamSemibold
            SectionTitle.Text = name
            SectionTitle.TextColor3 = Color3.fromRGB(233, 233, 233)
            SectionTitle.TextSize = 14.000
            SectionTitle.TextXAlignment = Enum.TextXAlignment.Left
            SectionFrame.Name = "SectionFrame"
            SectionFrame.Parent = SectionBack
            SectionFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            SectionFrame.BackgroundTransparency = 1.000
            SectionFrame.BorderSizePixel = 0
            SectionFrame.Position = UDim2.new(0, 0, 0.0775000006, 0)
            SectionFrame.Size = UDim2.new(0, 403, 0, 0)
            UIListLayout_3.Parent = SectionFrame
            UIListLayout_3.SortOrder = Enum.SortOrder.LayoutOrder
            UIListLayout_3.Padding = UDim.new(0, 8)
            UIPadding_3.Parent = SectionFrame
            UIPadding_3.PaddingLeft = UDim.new(0, 8)
            UIPadding_3.PaddingTop = UDim.new(0, 8)

            --tabSize = tabSize +
            tabSize = tabSize + 41
            ResizeTab()
            local sectionSize = 39
            local function ResizeSection()
                SectionBack.Size = UDim2.new(0, 403, 0, sectionSize)
                SectionFrame.Size = UDim2.new(0, 403, 0, sectionSize - 31)
            end

            local section = {}
            function section:Label(name)
                sectionSize = sectionSize + 39
                tabSize = tabSize + 39
                ResizeTab()
                ResizeSection()
                local LabelBack = Instance.new("Frame")
                local LabelTitle = Instance.new("TextLabel")
                LabelBack.Name = "LabelBack"
                LabelBack.Parent = SectionFrame
                LabelBack.BackgroundColor3 = Color3.fromRGB(24, 24, 24)
                LabelBack.BorderSizePixel = 0
                LabelBack.Position = UDim2.new(0.018779343, 0, 0.233062327, 0)
                LabelBack.Size = UDim2.new(0, 390, 0, 31)
                LabelTitle.Name = "LabelTitle"
                LabelTitle.Parent = LabelBack
                LabelTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                LabelTitle.BackgroundTransparency = 1.000
                LabelTitle.Position = UDim2.new(0.0147783253, 0, 0, 0)
                LabelTitle.Size = UDim2.new(0, 400, 0, 31)
                LabelTitle.Font = Enum.Font.GothamSemibold
                LabelTitle.TextColor3 = Color3.fromRGB(233, 233, 233)
                LabelTitle.TextSize = 13.000
                LabelTitle.Text = name
                LabelTitle.TextXAlignment = Enum.TextXAlignment.Left

                local label = {}
                function label:Update(name)
                    LabelTitle.Text = name
                end
                function label:Destroy()
                    LabelBack:Destroy()
                    sectionSize = sectionSize - 39 
                    tabSize = tabSize - 39
                    ResizeTab()
                    ResizeSection()
                end
                function label:GetText()
                    return LabelTitle.Text
                end
                return label
            end
            function section:Slider(name, options, callback)
                if not library.flags[name] then 
                    library.flags[name] = options.default or options.min
                end 
                local setting = GetSetting(name) 
                setting = setting and tonumber(setting)
                options.default = setting or options.default
                sectionSize = sectionSize + 63
                tabSize = tabSize + 63
                ResizeTab()
                ResizeSection()
                local Sliderback = Instance.new("Frame")
                local SliderTitle = Instance.new("TextLabel")
                local SliderBarBack = Instance.new("ImageButton")
                local Sliderhandle = Instance.new("ImageLabel")
                local SliderValueBack = Instance.new("ImageLabel")
                local SliderValue = Instance.new("TextBox")
                local TextButton = Instance.new("TextButton")
                local TextButton_2 = Instance.new("TextButton")

                Sliderback.Name = "Sliderback"
                Sliderback.Parent = SectionFrame
                Sliderback.BackgroundColor3 = Color3.fromRGB(24, 24, 24)
                Sliderback.BorderSizePixel = 0
                Sliderback.Position = UDim2.new(0.018779343, 0, 0.233062327, 0)
                Sliderback.Size = UDim2.new(0, 390, 0, 55)
                TextButton.Parent = Sliderback
                TextButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                TextButton.BackgroundTransparency = 1
                TextButton.Position = UDim2.new(0.675, 0, 0.0181818306, 0)
                TextButton.Size = UDim2.new(0, 35, 0, 35)
                TextButton.Font = Enum.Font.Gotham
                TextButton.Text = "-"
                TextButton.TextColor3 = Color3.fromRGB(255, 255, 255)
                TextButton.TextSize = 14.000
                TextButton_2.Parent = Sliderback
                TextButton_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                TextButton_2.BackgroundTransparency = 1
                TextButton_2.Position = UDim2.new(0.92, 0, 9.31322575e-09, 0)
                TextButton_2.Size = UDim2.new(0, 35, 0, 35)
                TextButton_2.Font = Enum.Font.Gotham
                TextButton_2.Text = "+"
                TextButton_2.TextColor3 = Color3.fromRGB(255, 255, 255)
                TextButton_2.TextSize = 14.000

                SliderTitle.Name = "SliderTitle"
                SliderTitle.Parent = Sliderback
                SliderTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                SliderTitle.BackgroundTransparency = 1.000
                SliderTitle.Position = UDim2.new(0.0147783253, 0, 0, 0)
                SliderTitle.Size = UDim2.new(0, 400, 0, 31)
                SliderTitle.Font = Enum.Font.GothamSemibold
                SliderTitle.Text = name
                SliderTitle.TextColor3 = Color3.fromRGB(233, 233, 233)
                SliderTitle.TextSize = 13.000
                SliderTitle.TextXAlignment = Enum.TextXAlignment.Left
                SliderBarBack.Name = "SliderBarBack"
                SliderBarBack.Parent = Sliderback
                SliderBarBack.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                SliderBarBack.BackgroundTransparency = 1.000
                SliderBarBack.Position = UDim2.new(0.0147783253, 0, 0.76363641, 0)
                SliderBarBack.Size = UDim2.new(0, 380, 0, 6)
                SliderBarBack.Image = "rbxassetid://3570695787"
                SliderBarBack.ImageColor3 = Color3.fromRGB(77, 77, 77)
                SliderBarBack.ScaleType = Enum.ScaleType.Slice
                SliderBarBack.SliceCenter = Rect.new(100, 100, 100, 100)
                SliderBarBack.SliceScale = 0.050
                Sliderhandle.Name = "Sliderhandle"
                Sliderhandle.Parent = SliderBarBack
                Sliderhandle.BackgroundColor3 = Color3.fromRGB(84, 116, 224)
                Sliderhandle.BackgroundTransparency = 1.000
                Sliderhandle.Size = UDim2.new(0, 0, 0, 6)
                Sliderhandle.Image = "rbxassetid://3570695787"
                Sliderhandle.ImageColor3 = Color3.fromRGB(84, 116, 224)
                Sliderhandle.ScaleType = Enum.ScaleType.Slice
                Sliderhandle.SliceCenter = Rect.new(100, 100, 100, 100)
                Sliderhandle.SliceScale = 0.050
                SliderValueBack.Name = "SliderValueBack"
                SliderValueBack.Parent = Sliderback
                SliderValueBack.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                SliderValueBack.BackgroundTransparency = 1.000
                SliderValueBack.Position = UDim2.new(0.78, 0, 0.109090909, 0)
                SliderValueBack.Size = UDim2.new(0, 50, 0, 25)
                SliderValueBack.Image = "rbxassetid://3570695787"
                SliderValueBack.ImageColor3 = Color3.fromRGB(14, 14, 14)
                SliderValueBack.ScaleType = Enum.ScaleType.Slice
                SliderValueBack.SliceCenter = Rect.new(100, 100, 100, 100)
                SliderValueBack.SliceScale = 0.050
                SliderValue.Name = "SliderValue"
                SliderValue.Parent = SliderValueBack
                SliderValue.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                SliderValue.BackgroundTransparency = 1.000
                SliderValue.Size = UDim2.new(0, 50, 0, 25)
                SliderValue.Font = Enum.Font.GothamSemibold
                SliderValue.Text = options.default or options.min < 0 and options.max > 0 and "0" or tostring(options.min)
                SliderValue.TextColor3 = Color3.fromRGB(233, 233, 233)
                SliderValue.TextSize = 13.000
                
                local OldCallback = callback or function() end
                callback = function(Value)
                    library.flags[name] = Value
                    AddSetting(name, tostring(Value))
                    return OldCallback(Value)
                end

                if options.default then
                    value = math.clamp(options.default, options.min, options.max)
                    local percent = 1 - ((options.max - value) / (options.max - options.min))
                    tweenObject(Sliderhandle, {
                        Size = UDim2.new(0, percent * 380, 0, 6)
                    }, 0.1)
                    manual = true
                    SliderValue.Text = tostring(value)
                    manual = false
                    callback(value)
                end

                local value = options.default or options.min;
                local connections = {}
                local manual = false
                TextButton.MouseButton1Click:Connect(function()
                    value = math.clamp(value - 1, options.min, options.max)
                    local percent = 1 - ((options.max - value) / (options.max - options.min))
                    tweenObject(Sliderhandle, {
                        Size = UDim2.new(0, percent * 380, 0, 6)
                    }, 0.1)
                    manual = true
                    SliderValue.Text = tostring(value)
                    manual = false
                    if callback then
                        callback(value)
                    end
                end)
                TextButton_2.MouseButton1Click:Connect(function()
                    value = math.clamp(value + 1, options.min, options.max)
                    local percent = 1 - ((options.max - value) / (options.max - options.min))
                    tweenObject(Sliderhandle, {
                        Size = UDim2.new(0, percent * 380, 0, 6)
                    }, 0.1)
                    manual = true
                    SliderValue.Text = tostring(value)
                    manual = false
                    if callback then
                        callback(value)
                    end
                end)
                SliderValue:GetPropertyChangedSignal("Text"):Connect(function()
                    if not manual then
                        if tonumber(SliderValue.Text) ~= nil then
                            value = math.clamp(tonumber(SliderValue.Text), options.min, options.max)
                            local percent = 1 - ((options.max - value) / (options.max - options.min))
                            tweenObject(Sliderhandle, {
                                Size = UDim2.new(0, percent * 380, 0, 6)
                            }, 0.1)
                            local con
                            con = SliderValue.FocusLost:Connect(function()
                                con:Disconnect()
                                if callback then
                                    callback(value)
                                end
                            end)
                        end
                    end
                end)

                SliderBarBack.MouseButton1Down:Connect(function()
                    value = math.floor((((tonumber(options.max) - tonumber(options.min)) / 380) * Sliderhandle.AbsoluteSize.X) + tonumber(options.min) + 0.5) or 0
                    SliderValue.Text = value
                    tweenObject(Sliderhandle, {
                        Size = UDim2.new(0, math.clamp(Mouse.X - Sliderhandle.AbsolutePosition.X, 0, 380), 0, 6)
                    }, 0.1)
                    tweenObject(Sliderhandle, {
                        ImageColor3 = Color3.fromRGB(255, 255, 255)
                    }, 0.2)
                    if callback then
                        callback(value)
                    end
                    connections.MoveConnection = Mouse.Move:Connect(function()
                        value = math.floor((((tonumber(options.max) - tonumber(options.min)) / 380) * Sliderhandle.AbsoluteSize.X) + tonumber(options.min) + 0.5) or 0
                        SliderValue.Text = value
                        tweenObject(Sliderhandle, {
                            Size = UDim2.new(0, math.clamp(Mouse.X - Sliderhandle.AbsolutePosition.X, 0, 380), 0, 6)
                        }, 0.1)
                        tweenObject(Sliderhandle, {
                            ImageColor3 = Color3.fromRGB(255, 255, 255)
                        }, 0.2)
                        if callback then
                            callback(value)
                        end
                    end)
                    connections.ReleaseConnection = UserInputService.InputEnded:Connect(function(mouse)
                        if mouse.UserInputType == Enum.UserInputType.MouseButton1 then
                            value = math.floor((((tonumber(options.max) - tonumber(options.min)) / 380) * Sliderhandle.AbsoluteSize.X) + tonumber(options.min) + 0.5) or 0
                            SliderValue.Text = value
                            tweenObject(Sliderhandle, {
                                Size = UDim2.new(0, math.clamp(Mouse.X - Sliderhandle.AbsolutePosition.X, 0, 380), 0, 6)
                            }, 0.1)
                            tweenObject(Sliderhandle, {
                                ImageColor3 = Color3.fromRGB(84, 116, 224)
                            }, 0.2)
                            connections.MoveConnection:Disconnect()
                            connections.ReleaseConnection:Disconnect()
                            if callback then
                                callback(value)
                            end
                        end
                    end)
                end)
                local slider = {}
                function slider:Update(val)
                    value = math.clamp(val, options.min, options.max)
                    local percent = 1 - ((options.max - value) / (options.max - options.min))
                    tweenObject(Sliderhandle, {
                        Size = UDim2.new(0, percent * 380, 0, 6)
                    }, 0.1)
                    if callback then
                        callback(value)
                    end
                end
                return slider
            end

            function section:Box(name, default, callback)
                default = GetSetting(name) or default 

                if not library.flags[name] then 
                    library.flags[name] = default or ""
                end 

                sectionSize = sectionSize + 39
                tabSize = tabSize + 39
                ResizeTab()
                ResizeSection()
                local TextBoxMain = Instance.new("Frame")
                local TextBoxTitle = Instance.new("TextLabel")
                local TextBox = Instance.new("TextBox")
                local TextBox_Roundify_5px = Instance.new("ImageLabel")
                TextBoxMain.Name = "TextBoxMain"
                TextBoxMain.Parent = SectionFrame
                TextBoxMain.BackgroundColor3 = Color3.fromRGB(24, 24, 24)
                TextBoxMain.BorderColor3 = Color3.fromRGB(27, 42, 53)
                TextBoxMain.BorderSizePixel = 0
                TextBoxMain.Position = UDim2.new(0.018779343, 0, 0.615176141, 0)
                TextBoxMain.Size = UDim2.new(0, 390, 0, 31)
                TextBoxTitle.Name = "TextBoxTitle"
                TextBoxTitle.Parent = TextBoxMain
                TextBoxTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                TextBoxTitle.BackgroundTransparency = 1.000
                TextBoxTitle.Position = UDim2.new(0.0147783253, 0, 0, 0)
                TextBoxTitle.Size = UDim2.new(0, 400, 0, 31)
                TextBoxTitle.Font = Enum.Font.GothamSemibold
                TextBoxTitle.Text = name
                TextBoxTitle.TextColor3 = Color3.fromRGB(233, 233, 233)
                TextBoxTitle.TextSize = 13.000
                TextBoxTitle.TextXAlignment = Enum.TextXAlignment.Left
                TextBox.Parent = TextBoxMain
                TextBox.BackgroundColor3 = Color3.fromRGB(13, 13, 13)
                TextBox.BackgroundTransparency = 1.000
                TextBox.BorderSizePixel = 0
                TextBox.Position = UDim2.new(0.270329684, 0, 0.193548381, 0)
                TextBox.Size = UDim2.new(0, 284, 0, 18)
                TextBox.ZIndex = 2
                TextBox.Font = Enum.Font.GothamSemibold
                TextBox.PlaceholderColor3 = Color3.fromRGB(66, 66, 66)
                TextBox.PlaceholderText = name
                TextBox.Text = default or ""
                TextBox.TextColor3 = Color3.fromRGB(233, 233, 233)
                TextBox.TextSize = 13.000
                TextBox_Roundify_5px.Name = "TextBox_Roundify_5px"
                TextBox_Roundify_5px.Parent = TextBox
                TextBox_Roundify_5px.Active = true
                TextBox_Roundify_5px.AnchorPoint = Vector2.new(0.5, 0.5)
                TextBox_Roundify_5px.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                TextBox_Roundify_5px.BackgroundTransparency = 1.000
                TextBox_Roundify_5px.Position = UDim2.new(0.5, 0, 0.5, 0)
                TextBox_Roundify_5px.Selectable = true
                TextBox_Roundify_5px.Size = UDim2.new(1, 0, 1, 0)
                TextBox_Roundify_5px.Image = "rbxassetid://3570695787"
                TextBox_Roundify_5px.ImageColor3 = Color3.fromRGB(13, 13, 13)
                TextBox_Roundify_5px.ScaleType = Enum.ScaleType.Slice
                TextBox_Roundify_5px.SliceCenter = Rect.new(100, 100, 100, 100)
                TextBox_Roundify_5px.SliceScale = 0.040
                local LastSize = -1

                local OldCallback = callback or function() end
                callback = function(Value)
                    library.flags[name] = Value
                    AddSetting(name, tostring(Value))
                    return OldCallback(Value)
                end

                TextBox:GetPropertyChangedSignal("Text"):connect(function()
                    local Size = TextService:GetTextSize(TextBox.Text, TextBox.TextSize + 1, TextBox.Font, TextBoxMain.AbsoluteSize)
                    local Length = string.len(TextBox.Text)
                    if Size.X > 284 then 
                        LastSize = Length
                        TextBox.TextScaled = true 
                    elseif Size.X <= 284 and Length < LastSize then 
                        TextBox.TextScaled = false 
                        TextBox.TextSize = 13
                    end
                end)

                TextBox.FocusLost:Connect(function()
                    if callback then
                        callback(TextBox.Text)
                    end
                end)

                if default and callback then 
                    callback(default)
                end

                local box = {}

                function box:Update(val)
                    TextBox.Text = val
                    if callback then
                        callback(val)
                    end
                end

                return box
            end
            function section:Picker(name, options, default, callback, dontsave)
                default = GetSetting(name) or default 

                if not library.flags[name] then 
                    library.flags[name] = default or options[1]
                end 

                sectionSize = sectionSize + 70
                tabSize = tabSize + 70
                ResizeTab()
                ResizeSection()
                local PickerBack = Instance.new("Frame")
                local PickerTitle = Instance.new("TextLabel")
                local OptionsHolder = Instance.new("ImageLabel")
                local UIListLayout = Instance.new("UIListLayout")
                PickerBack.Name = "PickerBack"
                PickerBack.Parent = SectionFrame
                PickerBack.BackgroundColor3 = Color3.fromRGB(24, 24, 24)
                PickerBack.BorderSizePixel = 0
                PickerBack.Position = UDim2.new(0.018779343, 0, 0.420054197, 0)
                PickerBack.Size = UDim2.new(0, 390, 0, 62)
                PickerTitle.Name = "PickerTitle"
                PickerTitle.Parent = PickerBack
                PickerTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                PickerTitle.BackgroundTransparency = 1.000
                PickerTitle.Position = UDim2.new(0.0147783253, 0, 0, 0)
                PickerTitle.Size = UDim2.new(0, 400, 0, 31)
                PickerTitle.Font = Enum.Font.GothamSemibold
                PickerTitle.Text = name
                PickerTitle.TextColor3 = Color3.fromRGB(233, 233, 233)
                PickerTitle.TextSize = 13.000
                PickerTitle.TextXAlignment = Enum.TextXAlignment.Left
                OptionsHolder.Name = "OptionsHolder"
                OptionsHolder.Parent = PickerBack
                OptionsHolder.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                OptionsHolder.BackgroundTransparency = 1.000
                OptionsHolder.Position = UDim2.new(0.0147783328, 0, 0.5, 0)
                OptionsHolder.Size = UDim2.new(0, 384, 0, 24)
                OptionsHolder.Image = "rbxassetid://3570695787"
                OptionsHolder.ImageColor3 = Color3.fromRGB(14, 14, 14)
                OptionsHolder.ScaleType = Enum.ScaleType.Slice
                OptionsHolder.SliceCenter = Rect.new(100, 100, 100, 100)
                OptionsHolder.SliceScale = 0.050
                UIListLayout.Parent = OptionsHolder
                UIListLayout.FillDirection = Enum.FillDirection.Horizontal
                UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
                local OldCallback = callback or function() end
                callback = function(Value)
                    library.flags[name] = Value
                    if dontsave ~= true then
                        AddSetting(name, tostring(Value))
                    end
                    return OldCallback(Value)
                end

                local activeButton = nil
                for i, v in next, options do
                    local OptionDeselected = Instance.new("TextButton")
                    OptionDeselected.Name = "OptionDeselected"
                    OptionDeselected.Parent = OptionsHolder
                    OptionDeselected.BackgroundColor3 = Color3.fromRGB(14, 14, 14)
                    OptionDeselected.BorderSizePixel = 0
                    OptionDeselected.Size = UDim2.new(0, 77, 0, 24)
                    OptionDeselected.AutoButtonColor = false
                    OptionDeselected.Font = Enum.Font.GothamSemibold
                    OptionDeselected.Text = v
                    OptionDeselected.TextColor3 = Color3.fromRGB(66, 66, 66)
                    OptionDeselected.TextSize = 13.000
                    if activeButton == nil then
                        if not default or default == v then
                            activeButton = OptionDeselected
                            OptionDeselected.TextColor3 = Color3.fromRGB(84, 116, 224)
                            if callback then
                                callback(v)
                            end
                        end
                    end
                    OptionDeselected.MouseButton1Click:Connect(function()
                        if activeButton == OptionDeselected then
                            return
                        end
                        if activeButton then
                            tweenObject(activeButton, {
                                TextColor3 = Color3.fromRGB(66, 66, 66)
                            }, 0.2)
                        end
                        tweenObject(OptionDeselected, {
                            TextColor3 = Color3.fromRGB(84, 116, 224)
                        }, 0.2)
                        activeButton = OptionDeselected
                        if callback then
                            callback(v)
                        end
                    end)
                end

                local picker = {}
                function picker:Update(value)
                    for i, v in next, OptionsHolder:GetChildren() do 
                        if v.Text == value then
                            if activeButton == v then
                                return
                            end
                            if activeButton then
                                tweenObject(activeButton, {
                                    TextColor3 = Color3.fromRGB(66, 66, 66)
                                }, 0.2)
                            end
                            tweenObject(v, {
                                TextColor3 = Color3.fromRGB(84, 116, 224)
                            }, 0.2)
                            activeButton = v
                            if callback then
                                callback(v.Text)
                            end
                            return
                        end
                    end
                end
                return picker
            end
            function section:Toggle(name, default, callback)
                local setting = GetSetting(name) 
                setting = setting == "true" and true or false
                default = setting or default 

                if not library.flags[name] then 
                    library.flags[name] = default or false 
                end 

                sectionSize = sectionSize + 39
                tabSize = tabSize + 39
                ResizeTab()
                ResizeSection()

                local ToggleBackButton = Instance.new("TextButton")
                local ToggleTitle = Instance.new("TextLabel")
                local ToggleIndicator = Instance.new("ImageLabel")
                ToggleBackButton.Name = "ToggleBackButton"
                ToggleBackButton.Parent = SectionFrame
                ToggleBackButton.BackgroundColor3 = Color3.fromRGB(24, 24, 24)
                ToggleBackButton.BorderSizePixel = 0
                ToggleBackButton.Size = UDim2.new(0, 390, 0, 31)
                ToggleBackButton.AutoButtonColor = false
                ToggleBackButton.Font = Enum.Font.SourceSans
                ToggleBackButton.Text = ""
                ToggleBackButton.TextColor3 = Color3.fromRGB(0, 0, 0)
                ToggleBackButton.TextSize = 14.000
                ToggleTitle.Name = "ToggleTitle"
                ToggleTitle.Parent = ToggleBackButton
                ToggleTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                ToggleTitle.BackgroundTransparency = 1.000
                ToggleTitle.Position = UDim2.new(0.0147783253, 0, 0, 0)
                ToggleTitle.Size = UDim2.new(0, 400, 0, 31)
                ToggleTitle.Font = Enum.Font.GothamSemibold
                ToggleTitle.Text = name
                ToggleTitle.TextColor3 = Color3.fromRGB(233, 233, 233)
                ToggleTitle.TextSize = 13.000
                ToggleTitle.TextXAlignment = Enum.TextXAlignment.Left
                ToggleIndicator.Name = "ToggleIndicator"
                ToggleIndicator.Parent = ToggleBackButton
                ToggleIndicator.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                ToggleIndicator.BackgroundTransparency = 1.000
                ToggleIndicator.Position = UDim2.new(0.933396459, 0, 0.161290318, 0)
                ToggleIndicator.Size = UDim2.new(0, 20, 0, 20)
                ToggleIndicator.Image = "rbxassetid://3570695787"
                ToggleIndicator.ImageColor3 = not default and Color3.fromRGB(0, 0, 0) or Color3.fromRGB(84, 116, 224)
                ToggleIndicator.ScaleType = Enum.ScaleType.Slice
                ToggleIndicator.SliceCenter = Rect.new(100, 100, 100, 100)
                ToggleIndicator.SliceScale = 0.050
                local OldCallback = callback or function() end
                callback = function(Value)
                    library.flags[name] = Value
                    AddSetting(name, tostring(Value))
                    return OldCallback(Value)
                end

                if default ~= nil and callback then 
                    callback(default)
                end

                ToggleBackButton.MouseButton1Click:Connect(function()--better color pls
                    
                    if ToggleIndicator.ImageColor3 == Color3.fromRGB(84, 116, 224) then
                        tweenObject(ToggleIndicator, {
                            ImageColor3 = Color3.fromRGB(0, 0, 0)
                        }, 0.1)
                        if callback then
                            callback(false)
                        end
                    elseif ToggleIndicator.ImageColor3 == Color3.fromRGB(0, 0, 0) then
                        tweenObject(ToggleIndicator, {
                            ImageColor3 = Color3.fromRGB(84, 116, 224)
                        }, 0.1)
                        if callback then
                            callback(true)
                        end
                    end
                end)

                local toggle = {}

                function toggle:Update(bool)
                    if ToggleIndicator.ImageColor3 == Color3.fromRGB(84, 116, 224) and bool == false then
                        tweenObject(ToggleIndicator, {
                            ImageColor3 = Color3.fromRGB(0, 0, 0)
                        }, 0.1)
                        if callback then
                            callback(false)
                        end
                    elseif ToggleIndicator.ImageColor3 == Color3.fromRGB(0, 0, 0) and bool == true then
                        tweenObject(ToggleIndicator, {
                            ImageColor3 = Color3.fromRGB(84, 116, 224)
                        }, 0.1)
                        if callback then
                            callback(true)
                        end
                    end
                end

                return toggle
            end
            function section:Button(name, callback)
                sectionSize = sectionSize + 39
                tabSize = tabSize + 39
                ResizeTab()
                ResizeSection()

                local Button = Instance.new("TextButton")
                local ButtonTitle = Instance.new("TextLabel")
                local ButtonCool = Instance.new("ImageLabel")
                Button.Name = "Button"
                Button.Parent = SectionFrame
                Button.BackgroundColor3 = Color3.fromRGB(24, 24, 24)
                Button.BorderSizePixel = 0
                Button.ClipsDescendants = true
                Button.Position = UDim2.new(0.018779343, 0, 0.0216802172, 0)
                Button.Size = UDim2.new(0, 390, 0, 31)
                Button.AutoButtonColor = false
                Button.Font = Enum.Font.SourceSans
                Button.Text = ""
                Button.TextColor3 = Color3.fromRGB(0, 0, 0)
                Button.TextSize = 14.000
                ButtonTitle.Name = "ButtonTitle"
                ButtonTitle.Parent = Button
                ButtonTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                ButtonTitle.BackgroundTransparency = 1.000
                ButtonTitle.Position = UDim2.new(0.0147783253, 0, 0, 0)
                ButtonTitle.Size = UDim2.new(0, 400, 0, 31)
                ButtonTitle.Font = Enum.Font.GothamBold
                ButtonTitle.Text = name
                ButtonTitle.TextColor3 = Color3.fromRGB(233, 233, 233)
                ButtonTitle.TextSize = 13.000
                ButtonTitle.TextXAlignment = Enum.TextXAlignment.Center
                ButtonCool.Name = "ButtonCool"
                ButtonCool.Parent = ButtonTitle
                ButtonCool.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                ButtonCool.BackgroundTransparency = 1.000
                ButtonCool.Position = UDim2.new(0.899178982, 0, 0.225806445, 0)
                ButtonCool.Size = UDim2.new(0, 17, 0, 17)
                ButtonCool.Image = "rbxgameasset://Images/w"
                Button.MouseEnter:Connect(function()
                    tweenObject(Button, {
                        BackgroundColor3 = Color3.fromRGB(64, 64, 64)
                    }, 0.3)
                end)

                Button.MouseLeave:Connect(function()
                    tweenObject(Button, {
                        BackgroundColor3 = Color3.fromRGB(24, 24, 24)
                    }, 0.3)
                end)
                Button.MouseButton1Click:Connect(function()
                    coroutine.resume(coroutine.create(function()
                        local Circle = Instance.new("ImageLabel")
                        Circle.Name = "Circle"
                        Circle.Parent = Button
                        Circle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                        Circle.BackgroundTransparency = 1
                        Circle.ZIndex = 10
                        Circle.Image = "rbxassetid://266543268"
                        Circle.ImageColor3 = Color3.fromRGB(255, 255, 255)
                        Circle.ImageTransparency = 0.900
                        Button.ClipsDescendants = true
                        Circle.Position = UDim2.new(0, Mouse.X - Circle.AbsolutePosition.X, 0, Mouse.Y - Circle.AbsolutePosition.Y)
                        Circle:TweenSizeAndPosition(UDim2.new(0, Button.AbsoluteSize.X * 1.5, 0, Button.AbsoluteSize.X * 1.5), UDim2.new(0.5, -Button.AbsoluteSize.X * 1.5 / 2, 0.5, -Button.AbsoluteSize.X * 1.5 / 2), "Out", "Quad", 0.75, false, nil)
                        tweenObject(Circle, {
                            ImageTransparency = 1
                        }, 0.75)
                        wait(0.75)
                        Circle:Destroy()
                    end))
                    if callback then
                        callback()
                    end
                end)
            end
            function section:ColorPicker(name, default, callback)
                local setting = GetSetting(name) 
                if setting then 
                    local NoSpaces = setting:gsub("%s+", "")
                    local Split = NoSpaces:split(",")
                    setting = Color3.fromRGB(tonumber(Split[1]), tonumber(Split[2]), tonumber(Split[3]))
                end 

                default = setting or default 

                if not library.flags[name] then 
                    library.flags[name] = default or Color3.fromRGB(255, 0, 0)
                end 

                sectionSize = sectionSize + 39
                tabSize = tabSize + 39
                ResizeTab()
                ResizeSection()

                local OldCallback = callback or function() end
                callback = function(Value)
                    library.flags[name] = Value
                    AddSetting(name, tostring(Value))
                    return OldCallback(Value)
                end

                local Main = Instance.new("ImageLabel")
                local Dark = Instance.new("ImageLabel")
                local White = Instance.new("ImageButton")
                local Val = Instance.new("ImageLabel")
                local Sat = Instance.new("ImageLabel")
                local UIGradient = Instance.new("UIGradient")
                local UIGradient_2 = Instance.new("UIGradient")
                local icon = Instance.new("ImageLabel")
                local Hue = Instance.new("ImageButton")
                local UIGradient_3 = Instance.new("UIGradient")
                local RBGbox = Instance.new("ImageLabel")
                local Holder = Instance.new("Frame")
                local UIListLayout = Instance.new("UIListLayout")
                local Back_R = Instance.new("ImageLabel")
                local R = Instance.new("TextBox")
                local Back_G = Instance.new("ImageLabel")
                local G = Instance.new("TextBox")
                local Back_B = Instance.new("ImageLabel")
                local B = Instance.new("TextBox")
                local Submit = Instance.new("ImageButton")
                local Title_2 = Instance.new("TextLabel")
                local Icon = Instance.new("ImageLabel")
                local ColorButton = Instance.new("TextButton")
                local ColorTitle = Instance.new("TextLabel")
                local ColorIndicator = Instance.new("ImageLabel")

                ColorButton.Name = "ColorButton"
                ColorButton.Parent = SectionFrame
                ColorButton.BackgroundColor3 = Color3.fromRGB(24, 24, 24)
                ColorButton.BorderSizePixel = 0
                ColorButton.Size = UDim2.new(0, 390, 0, 31)
                ColorButton.AutoButtonColor = false
                ColorButton.Font = Enum.Font.SourceSans
                ColorButton.Text = ""
                ColorButton.TextColor3 = Color3.fromRGB(0, 0, 0)
                ColorButton.TextSize = 14.000
                ColorTitle.Name = "ColorTitle"
                ColorTitle.Parent = ColorButton
                ColorTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                ColorTitle.BackgroundTransparency = 1.000
                ColorTitle.Position = UDim2.new(0.0147783253, 0, 0, 0)
                ColorTitle.Size = UDim2.new(0, 400, 0, 31)
                ColorTitle.Font = Enum.Font.GothamSemibold
                ColorTitle.Text = name
                ColorTitle.TextColor3 = Color3.fromRGB(233, 233, 233)
                ColorTitle.TextSize = 13.000
                ColorTitle.TextXAlignment = Enum.TextXAlignment.Left
                ColorIndicator.Name = "ToggleIndicator"
                ColorIndicator.Parent = ColorButton
                ColorIndicator.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                ColorIndicator.BackgroundTransparency = 1.000
                ColorIndicator.Position = UDim2.new(0.933396459, 0, 0.161290318, 0)
                ColorIndicator.Size = UDim2.new(0, 20, 0, 20)
                ColorIndicator.Image = "rbxassetid://3570695787"
                ColorIndicator.ImageColor3 = default or Color3.fromRGB(255,0,0)
                ColorIndicator.ScaleType = Enum.ScaleType.Slice
                ColorIndicator.SliceCenter = Rect.new(100, 100, 100, 100)
                ColorIndicator.SliceScale = 0.050

                Main.Name = "Colour"
                Main.Parent = MainUIFrame
                Main.BackgroundColor3 = Color3.fromRGB(22, 22, 22)
                Main.BackgroundTransparency = 1.000
                Main.BorderColor3 = Color3.fromRGB(27, 42, 53)
                Main.Position = UDim2.new(1, 10, 0, 0)
                Main.Size = UDim2.new(0, 157, 0, 156)
                Main.Image = "rbxassetid://4608020054"
                Main.ImageColor3 = Color3.fromRGB(22, 22, 22)
                Main.ScaleType = Enum.ScaleType.Slice
                Main.SliceCenter = Rect.new(128, 128, 128, 128)
                Main.SliceScale = 0.03
                Main.Visible = false

                Dark.Name = "Dark"
                Dark.Parent = Main
                Dark.AnchorPoint = Vector2.new(0.5, 0.5)
                Dark.BackgroundColor3 = Color3.fromRGB(22, 22, 22)
                Dark.BackgroundTransparency = 1.000
                Dark.BorderColor3 = Color3.fromRGB(27, 42, 53)
                Dark.Position = UDim2.new(0.5, 0, 0.5, 0)
                Dark.Size = UDim2.new(1, -10, 1, -10)
                Dark.Image = "rbxassetid://4608020054"
                Dark.ImageColor3 = Color3.fromRGB(14, 14, 14)
                Dark.ScaleType = Enum.ScaleType.Slice
                Dark.SliceCenter = Rect.new(128, 128, 128, 128)
                Dark.SliceScale = 0.02

                White.Name = "White"
                White.Parent = Dark
                White.BackgroundColor3 = Color3.fromRGB(22, 22, 22)
                White.BackgroundTransparency = 1.000
                White.BorderColor3 = Color3.fromRGB(27, 42, 53)
                White.Position = UDim2.new(0, 5, 0, 5)
                White.Size = UDim2.new(0, 116, 0, 88)
                White.Image = "rbxassetid://4608020054"
                White.ScaleType = Enum.ScaleType.Slice
                White.SliceCenter = Rect.new(128, 128, 128, 128)
                White.SliceScale = 0.02

                Val.Name = "Val"
                Val.Parent = White
                Val.BackgroundColor3 = Color3.fromRGB(22, 22, 22)
                Val.BackgroundTransparency = 1.000
                Val.BorderColor3 = Color3.fromRGB(27, 42, 53)
                Val.Size = UDim2.new(1, 0, 1, 0)
                Val.Image = "rbxassetid://4608020054"
                Val.ImageColor3 = default or Color3.fromRGB(255,0,0)
                Val.ScaleType = Enum.ScaleType.Slice
                Val.SliceCenter = Rect.new(128, 128, 128, 128)
                Val.SliceScale = 0.02

                Sat.Name = "Sat"
                Sat.Parent = Val
                Sat.BackgroundColor3 = Color3.fromRGB(22, 22, 22)
                Sat.BackgroundTransparency = 1.000
                Sat.BorderColor3 = Color3.fromRGB(27, 42, 53)
                Sat.Size = UDim2.new(1, 0, 1, 0)
                Sat.Image = "rbxassetid://4608020054"
                Sat.ScaleType = Enum.ScaleType.Slice
                Sat.SliceCenter = Rect.new(128, 128, 128, 128)
                Sat.SliceScale = 0.02

                UIGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 0, 0)), ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 0, 0))}
                UIGradient.Rotation = 90
                UIGradient.Transparency = NumberSequence.new{NumberSequenceKeypoint.new(0.00, 1.00), NumberSequenceKeypoint.new(1.00, 0.00)}
                UIGradient.Parent = Sat

                UIGradient_2.Transparency = NumberSequence.new{NumberSequenceKeypoint.new(0.00, 1.00), NumberSequenceKeypoint.new(1.00, 0.00)}
                UIGradient_2.Parent = Val

                icon.Name = "icon"
                icon.Parent = White
                icon.AnchorPoint = Vector2.new(0.5, 0.5)
                icon.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                icon.BackgroundTransparency = 1.000
                icon.Size = UDim2.new(0, 6, 0, 6)
                icon.ZIndex = 4
                icon.Image = "rbxassetid://5052625837"
                icon.ImageColor3 = Color3.fromRGB(130, 130, 130)

                Hue.Name = "Hue"
                Hue.Parent = Dark
                Hue.BackgroundColor3 = Color3.fromRGB(22, 22, 22)
                Hue.BackgroundTransparency = 1.000
                Hue.BorderColor3 = Color3.fromRGB(27, 42, 53)
                Hue.Position = UDim2.new(0, 124, 0, 5)
                Hue.Size = UDim2.new(1, -129, 0, 88)
                Hue.Image = "rbxassetid://4608020054"
                Hue.ScaleType = Enum.ScaleType.Slice
                Hue.SliceCenter = Rect.new(128, 128, 128, 128)
                Hue.SliceScale = 0.02

                UIGradient_3.Color = ColorSequence.new{ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 0, 0)), ColorSequenceKeypoint.new(0.167, Color3.fromRGB(255, 255, 0)), ColorSequenceKeypoint.new(0.333, Color3.fromRGB(0, 255, 0)), ColorSequenceKeypoint.new(0.5, Color3.fromRGB(0, 255, 255)), ColorSequenceKeypoint.new(0.667, Color3.fromRGB(0, 0, 255)), ColorSequenceKeypoint.new(0.833, Color3.fromRGB(255, 0, 255)), ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 0, 0))}
                UIGradient_3.Rotation = 90
                UIGradient_3.Parent = Hue

                RBGbox.Name = "RBGbox"
                RBGbox.Parent = Dark
                RBGbox.BackgroundColor3 = Color3.fromRGB(22, 22, 22)
                RBGbox.BackgroundTransparency = 1.000
                RBGbox.BorderColor3 = Color3.fromRGB(27, 42, 53)
                RBGbox.Position = UDim2.new(0, 5, 0, 97)
                RBGbox.Size = UDim2.new(1, -10, 0, 20)
                RBGbox.Image = "rbxassetid://4608020054"
                RBGbox.ImageColor3 = Color3.fromRGB(16, 16, 16)
                RBGbox.ScaleType = Enum.ScaleType.Slice
                RBGbox.SliceCenter = Rect.new(128, 128, 128, 128)
                RBGbox.SliceScale = 0.02

                Holder.Name = "Holder"
                Holder.Parent = RBGbox
                Holder.AnchorPoint = Vector2.new(0.5, 0.5)
                Holder.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                Holder.BackgroundTransparency = 1.000
                Holder.Position = UDim2.new(0.5, 0, 0.5, 0)
                Holder.Size = UDim2.new(1, -4, 1, -4)

                UIListLayout.Parent = Holder
                UIListLayout.FillDirection = Enum.FillDirection.Horizontal
                UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
                UIListLayout.Padding = UDim.new(0, 2)

                Back_R.Name = "Back_R"
                Back_R.Parent = Holder
                Back_R.BackgroundColor3 = Color3.fromRGB(22, 22, 22)
                Back_R.BackgroundTransparency = 1.000
                Back_R.BorderColor3 = Color3.fromRGB(27, 42, 53)
                Back_R.Position = UDim2.new(0, 5, 0, 97)
                Back_R.Size = UDim2.new(0, 43, 1, 0)
                Back_R.Image = "rbxassetid://4608020054"
                Back_R.ImageColor3 = Color3.fromRGB(22, 22, 22)
                Back_R.ScaleType = Enum.ScaleType.Slice
                Back_R.SliceCenter = Rect.new(128, 128, 128, 128)
                Back_R.SliceScale = 0.02

                R.Name = "R"
                R.Parent = Back_R
                R.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                R.BackgroundTransparency = 1.000
                R.Size = UDim2.new(0, 44, 1, 0)
                R.Font = Enum.Font.GothamSemibold
                R.Text = "R: 255"
                R.TextColor3 = Color3.fromRGB(255, 255, 255)
                R.TextSize = 10.000

                Back_G.Name = "Back"
                Back_G.Parent = Holder
                Back_G.BackgroundColor3 = Color3.fromRGB(22, 22, 22)
                Back_G.BackgroundTransparency = 1.000
                Back_G.BorderColor3 = Color3.fromRGB(27, 42, 53)
                Back_G.Position = UDim2.new(0, 5, 0, 97)
                Back_G.Size = UDim2.new(0, 43, 1, 0)
                Back_G.Image = "rbxassetid://4608020054"
                Back_G.ImageColor3 = Color3.fromRGB(22, 22, 22)
                Back_G.ScaleType = Enum.ScaleType.Slice
                Back_G.SliceCenter = Rect.new(128, 128, 128, 128)
                Back_G.SliceScale = 0.02

                G.Name = "G"
                G.Parent = Back_G
                G.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                G.BackgroundTransparency = 1.000
                G.Size = UDim2.new(0, 44, 1, 0)
                G.Font = Enum.Font.GothamSemibold
                G.Text = "G: 255"
                G.TextColor3 = Color3.fromRGB(255, 255, 255)
                G.TextSize = 10.000

                Back_B.Name = "Back"
                Back_B.Parent = Holder
                Back_B.BackgroundColor3 = Color3.fromRGB(22, 22, 22)
                Back_B.BackgroundTransparency = 1.000
                Back_B.BorderColor3 = Color3.fromRGB(27, 42, 53)
                Back_B.Position = UDim2.new(0, 5, 0, 97)
                Back_B.Size = UDim2.new(0, 43, 1, 0)
                Back_B.Image = "rbxassetid://4608020054"
                Back_B.ImageColor3 = Color3.fromRGB(22, 22, 22)
                Back_B.ScaleType = Enum.ScaleType.Slice
                Back_B.SliceCenter = Rect.new(128, 128, 128, 128)
                Back_B.SliceScale = 0.02

                B.Name = "B"
                B.Parent = Back_B
                B.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                B.BackgroundTransparency = 1.000
                B.Size = UDim2.new(0, 44, 1, 0)
                B.Font = Enum.Font.GothamSemibold
                B.Text = "G: 255"
                B.TextColor3 = Color3.fromRGB(255, 255, 255)
                B.TextSize = 10.000

                Submit.Name = "Submit"
                Submit.Parent = Dark
                Submit.BackgroundColor3 = Color3.fromRGB(22, 22, 22)
                Submit.BackgroundTransparency = 1.000
                Submit.BorderColor3 = Color3.fromRGB(27, 42, 53)
                Submit.Position = UDim2.new(0, 5, 0, 121)
                Submit.Size = UDim2.new(1, -10, 0, 20)
                Submit.Image = "rbxassetid://4608020054"
                Submit.ImageColor3 = Color3.fromRGB(22, 22, 22)
                Submit.ScaleType = Enum.ScaleType.Slice
                Submit.SliceCenter = Rect.new(128, 128, 128, 128)
                Submit.SliceScale = 0.02

                Title_2.Name = "Title"
                Title_2.Parent = Submit
                Title_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                Title_2.BackgroundTransparency = 1.000
                Title_2.BorderSizePixel = 0
                Title_2.Position = UDim2.new(0, 5, 0, 0)
                Title_2.Size = UDim2.new(0, 42, 1, 0)
                Title_2.ZIndex = 3
                Title_2.Font = Enum.Font.GothamSemibold
                Title_2.Text = "Submit"
                Title_2.TextColor3 = Color3.fromRGB(255, 255, 255)
                Title_2.TextSize = 10.000
                Title_2.TextXAlignment = Enum.TextXAlignment.Left

                Icon.Name = "Icon"
                Icon.Parent = Submit
                Icon.AnchorPoint = Vector2.new(1, 0.5)
                Icon.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                Icon.BackgroundTransparency = 1.000
                Icon.Position = UDim2.new(1, -3, 0.5, 0)
                Icon.Size = UDim2.new(0, 14, 0, 14)
                Icon.ZIndex = 6
                Icon.Image = "rbxassetid://6267058610"

                local Satdown = false
                local Huedown = false

                local OldHue = 1
                local OldSat = 1
                local OldVal = 1

                if default then 
                    local h, s, v = default:ToHSV()

                    OldHue, OldSat, OldVal = h, s, v 
                end

                local function UpdColour(NewHue, NewSat, NewVal)
                    OldHue = NewHue or OldHue
                    OldSat = NewSat or OldSat
                    OldVal = NewVal or OldVal
                    return Color3.fromHSV(OldHue, OldSat, OldVal)
                end

                White.MouseButton1Down:Connect(function()
                    Satdown = true
                end)

                Hue.MouseButton1Down:Connect(function()
                    Huedown = true
                end)

                UserInputService.InputEnded:Connect(function(input)
                    if input.UserInputType == Enum.UserInputType.MouseButton1 then
                        Satdown = false;
                        Huedown = false;
                    end;
                end);

                Mouse.Move:Connect(function()
                    if Satdown then
                        local AbsPos = White.AbsolutePosition
                        local AbsSize = White.AbsoluteSize

                        local SizeX = AbsSize.X
                        local SizeY = AbsSize.Y

                        local RelX = math.clamp(Mouse.X - AbsPos.X, 0, SizeX) / SizeX
                        local RelY = math.clamp(Mouse.Y - AbsPos.Y, 0, SizeY) / SizeY

                        ColorIndicator.ImageColor3 = UpdColour(nil, RelX, 1 - RelY)
                        
                        R.Text = "R: "..math.floor(ColorIndicator.ImageColor3.R * 255)
                        G.Text = "G: "..math.floor(ColorIndicator.ImageColor3.G * 255)
                        B.Text = "B: "..math.floor(ColorIndicator.ImageColor3.B * 255)
                    end
                    
                    if Huedown then
                        local PosY = Hue.AbsolutePosition.Y
                        local SizeY = Hue.AbsoluteSize.Y
                        local RelY = math.clamp(Mouse.Y - PosY, 0, SizeY) / SizeY

                        Val.ImageColor3 = Color3.fromHSV(RelY, 1, 1)
                        ColorIndicator.ImageColor3 = UpdColour(RelY)
                        
                        R.Text = "R: "..math.floor(ColorIndicator.ImageColor3.R * 255)
                        G.Text = "G: "..math.floor(ColorIndicator.ImageColor3.G * 255)
                        B.Text = "B: "..math.floor(ColorIndicator.ImageColor3.B * 255)
                    end
                end)

                local OldRText, OldGText, OldBText = R.Text, G.Text, B.Text

                R.FocusLost:connect(function()
                    if not tonumber(R.Text) then 
                        R.Text = OldRText 
                        return
                    end 

                    R.Text = "R: "..tostring(math.floor(tonumber(R.Text)))
                    OldRText = R.Text
                    ColorIndicator.ImageColor3 = Color3.fromRGB(math.floor(tonumber(R.Text:sub(4))), math.floor(tonumber(G.Text:sub(4))), math.floor(tonumber(B.Text:sub(4))))
                end)

                G.FocusLost:connect(function()
                    if not tonumber(G.Text) then 
                        G.Text = OldGText 
                        return
                    end 

                    G.Text = "G: "..tostring(math.floor(tonumber(G.Text)))
                    OldRText = G.Text
                    ColorIndicator.ImageColor3 = Color3.fromRGB(math.floor(tonumber(R.Text:sub(4))), math.floor(tonumber(G.Text:sub(4))), math.floor(tonumber(B.Text:sub(4))))
                end)

                B.FocusLost:connect(function()
                    if not tonumber(B.Text) then 
                        B.Text = OldBText 
                        return
                    end 

                    B.Text = "B: "..tostring(math.floor(tonumber(B.Text)))
                    OldRText = B.Text
                    ColorIndicator.ImageColor3 = Color3.fromRGB(math.floor(tonumber(R.Text:sub(4))), math.floor(tonumber(G.Text:sub(4))), math.floor(tonumber(B.Text:sub(4))))
                end)
                
                Submit.MouseButton1Click:Connect(function()
                    Main.Visible = false

                    if callback then
                        callback(ColorIndicator.ImageColor3)
                    end
                end)

                ColorButton.MouseButton1Click:Connect(function()
                    Main.Visible = not Main.Visible
                end)
            end
            function section:Keybind(name, default, callback)
                local setting = GetSetting(name) 
                setting = setting and setting:split(".")[3]
                default = setting or default 

                sectionSize = sectionSize + 39
                tabSize = tabSize + 39
                ResizeTab()
                ResizeSection()

                local OldCallback = callback or function() end
                callback = function(Value)
                    library.flags[name] = Value
                    AddSetting(name, tostring(Value))
                    return OldCallback(Value)
                end

                local KeybindButton = Instance.new("TextButton")
                local KeybindTitle = Instance.new("TextLabel")
                local KeybindValueback = Instance.new("ImageLabel")
                local KeybindValue = Instance.new("TextLabel")
                KeybindButton.Name = "KeybindButton"
                KeybindButton.Parent = SectionFrame
                KeybindButton.BackgroundColor3 = Color3.fromRGB(24, 24, 24)
                KeybindButton.BorderSizePixel = 0
                KeybindButton.ClipsDescendants = true
                KeybindButton.Size = UDim2.new(0, 390, 0, 31)
                KeybindButton.AutoButtonColor = false
                KeybindButton.Font = Enum.Font.SourceSans
                KeybindButton.Text = ""
                KeybindButton.TextColor3 = Color3.fromRGB(0, 0, 0)
                KeybindButton.TextSize = 14.000
                KeybindTitle.Name = "KeybindTitle"
                KeybindTitle.Parent = KeybindButton
                KeybindTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                KeybindTitle.BackgroundTransparency = 1.000
                KeybindTitle.Position = UDim2.new(0.0147783253, 0, 0, 0)
                KeybindTitle.Size = UDim2.new(0, 400, 0, 31)
                KeybindTitle.Font = Enum.Font.GothamSemibold
                KeybindTitle.Text = name
                KeybindTitle.TextColor3 = Color3.fromRGB(233, 233, 233)
                KeybindTitle.TextSize = 13.000
                KeybindTitle.TextXAlignment = Enum.TextXAlignment.Left
                KeybindValueback.Name = "KeybindValueback"
                KeybindValueback.Parent = KeybindButton
                KeybindValueback.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                KeybindValueback.BackgroundTransparency = 1.000
                KeybindValueback.Position = UDim2.new(0.862068951, 0, 0.109090909, 0)
                KeybindValueback.Size = UDim2.new(0, 50, 0, 25)
                KeybindValueback.Image = "rbxassetid://3570695787"
                KeybindValueback.ImageColor3 = Color3.fromRGB(14, 14, 14)
                KeybindValueback.ScaleType = Enum.ScaleType.Slice
                KeybindValueback.SliceCenter = Rect.new(100, 100, 100, 100)
                KeybindValueback.SliceScale = 0.050
                KeybindValue.Name = "KeybindValue"
                KeybindValue.Parent = KeybindValueback
                KeybindValue.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                KeybindValue.BackgroundTransparency = 1.000
                KeybindValue.Size = UDim2.new(0, 50, 0, 25)
                KeybindValue.Font = Enum.Font.GothamSemibold
                KeybindValue.Text = default or ". . ."
                KeybindValue.TextColor3 = Color3.fromRGB(233, 233, 233)
                KeybindValue.TextSize = 13.000
                
                local pressConnection

                KeybindButton.MouseButton1Click:Connect(function()
                    if pressConnection then
                        pressConnection:Disconnect()
                    end
                    KeybindValue.Text = ". . ."
                    pressConnection = UserInputService.InputBegan:Connect(function(input)
                        pressConnection:Disconnect()
                        KeybindValue.Text = string.split(tostring(input.KeyCode), ".")[3]
                        if callback then
                            callback(input.KeyCode)
                        end
                    end)
                end)
            end
            function section:SearchBox(name, options, default, callback, dontsave)
                default = GetSetting(name) or default 

                sectionSize = sectionSize + 39
                tabSize = tabSize + 39
                ResizeTab()
                ResizeSection()
                local OldCallback = callback or function() end
                callback = function(Value)
                    library.flags[name] = Value
                    if dontsave ~= true then
                        AddSetting(name, tostring(Value))
                    end
                    return OldCallback(Value)
                end
                local TextBoxMain = Instance.new("Frame")
                local TextBoxTitle = Instance.new("TextLabel")
                local TextBox = Instance.new("TextBox")
                --local TextBox_Roundify_5px = Instance.new("ImageLabel")
                TextBoxMain.Name = "TextBoxMain"
                TextBoxMain.Parent = SectionFrame
                TextBoxMain.BackgroundColor3 = Color3.fromRGB(24, 24, 24)
                TextBoxMain.BorderColor3 = Color3.fromRGB(27, 42, 53)
                TextBoxMain.BorderSizePixel = 0
                TextBoxMain.Position = UDim2.new(0.018779343, 0, 0.615176141, 0)
                TextBoxMain.Size = UDim2.new(0, 390, 0, 31)
                TextBoxTitle.Name = "TextBoxTitle"
                TextBoxTitle.Parent = TextBoxMain
                TextBoxTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                TextBoxTitle.BackgroundTransparency = 1.000
                TextBoxTitle.Position = UDim2.new(0.0147783253, 0, 0, 0)
                TextBoxTitle.Size = UDim2.new(0, 400, 0, 31)
                TextBoxTitle.Font = Enum.Font.GothamSemibold
                TextBoxTitle.Text = name
                TextBoxTitle.TextColor3 = Color3.fromRGB(233, 233, 233)
                TextBoxTitle.TextSize = 13.000
                TextBoxTitle.TextXAlignment = Enum.TextXAlignment.Left
                TextBox.Parent = TextBoxMain
                TextBox.BackgroundColor3 = Color3.fromRGB(13, 13, 13)
                TextBox.BackgroundTransparency = 0
                TextBox.BorderSizePixel = 0
                TextBox.Position = UDim2.new(0.270329684, 0, 0.193548381, 0)
                TextBox.Size = UDim2.new(0, 284, 0, 18)
                TextBox.ZIndex = 2
                TextBox.Font = Enum.Font.GothamSemibold
                TextBox.PlaceholderColor3 = Color3.fromRGB(66, 66, 66)
                TextBox.PlaceholderText = default or name
                TextBox.Text = default or ""
                TextBox.TextColor3 = Color3.fromRGB(233, 233, 233)
                TextBox.TextSize = 13.000
                local SearchBoxBack = Instance.new("ImageLabel")
                local ScrollingFrame = Instance.new("ScrollingFrame")
                local UIListLayout = Instance.new("UIListLayout")
                local Title = Instance.new("TextLabel")
                local Frame = Instance.new("Frame")
                SearchBoxBack.Name = "SearchBoxBack"
                SearchBoxBack.Parent = MainUITabPickedHolder
                SearchBoxBack.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                SearchBoxBack.BackgroundTransparency = 1.000
                SearchBoxBack.Position = UDim2.new(0, 0, 0, 0)
                SearchBoxBack.Size = UDim2.new(0, 210, 0, 36)
                SearchBoxBack.Image = "rbxassetid://3570695787"
                SearchBoxBack.ImageColor3 = Color3.fromRGB(22, 22, 22)
                SearchBoxBack.ImageTransparency = 1
                SearchBoxBack.ScaleType = Enum.ScaleType.Slice
                SearchBoxBack.SliceCenter = Rect.new(100, 100, 100, 100)
                SearchBoxBack.SliceScale = 0.050
                SearchBoxBack.Visible = false
                SearchBoxBack.ZIndex = -4
                ScrollingFrame.Parent = SearchBoxBack
                ScrollingFrame.Active = true
                ScrollingFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                ScrollingFrame.BackgroundTransparency = 1.000
                ScrollingFrame.BorderSizePixel = 0
                ScrollingFrame.Position = UDim2.new(0, 0, 0, 31)
                ScrollingFrame.Size = UDim2.new(0, 210, 1, -32)
                ScrollingFrame.BottomImage = ""
                ScrollingFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
                ScrollingFrame.ScrollBarThickness = 2
                ScrollingFrame.TopImage = ""
                ScrollingFrame.ZIndex = -4
                UIListLayout.Parent = ScrollingFrame
                UIListLayout.SortOrder = Enum.SortOrder.Name
                Title.Name = "Title"
                Title.Parent = SearchBoxBack
                Title.BackgroundColor3 = Color3.fromRGB(22, 22, 22)
                Title.BackgroundTransparency = 0
                Title.Size = UDim2.new(0, 210, 0, 31)
                Title.Font = Enum.Font.GothamSemibold
                Title.Text = name
                Title.BorderSizePixel = 0
                Title.TextColor3 = Color3.fromRGB(233, 233, 233)
                Title.TextSize = 13.000
                Title.ZIndex = -4
                Frame.Parent = SearchBoxBack
                Frame.BackgroundColor3 = Color3.fromRGB(84, 116, 224)
                Frame.BorderSizePixel = 0
                Frame.Position = UDim2.new(0, 0, 0, 31)
                Frame.Size = UDim2.new(0, 210, 0, 1)
                Frame.ZIndex = -4
                local buttons = {}
                local isDone = false
                local function updateVisibles()
                    local si = 33
                    for i, v in next, buttons do
                        if v.Visible == true then
                            si = si + 30
                        end
                    end
                    if si >= 183 then
                        ScrollingFrame.CanvasSize = UDim2.new(0, 0, 0, si - 33)
                        SearchBoxBack.Size = UDim2.new(0, 210, 0, 183)
                    else
                        ScrollingFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
                        SearchBoxBack.Size = UDim2.new(0, 210, 0, si)
                    end
                end

                local function searchboxon()
                    if isDone == false then
                        if SearchBoxBack.Position == UDim2.new(0, 0, 0, 0) then
                            SearchBoxBack.Visible = true
                            tweenObject(SearchBoxBack, {
                                Position = UDim2.new(1.05, 0, 0, 0)
                            }, 0.4)
                        end
                        if #buttons == 0 then
                            for i, v in next, options do
                                local TextButton = Instance.new("TextButton")
                                TextButton.Parent = ScrollingFrame
                                TextButton.BackgroundColor3 = Color3.fromRGB(22, 22, 22)
                                TextButton.BorderSizePixel = 0
                                TextButton.AutoButtonColor = false
                                TextButton.Position = UDim2.new(-0.0153846154, 0, 0, 0)
                                TextButton.Size = UDim2.new(0, 215, 0, 30)
                                TextButton.Font = Enum.Font.GothamSemibold
                                TextButton.TextColor3 = Color3.fromRGB(255, 255, 255)
                                TextButton.TextSize = 14.000
                                TextButton.Text = v
                                TextButton.ZIndex = -4
                                TextButton.Visible = false
                                table.insert(buttons, TextButton)
                                TextButton.MouseEnter:Connect(function()
                                    tweenObject(TextButton, {
                                        BackgroundColor3 = Color3.fromRGB(77, 77, 77)
                                    }, 0.2)
                                end)
                                TextButton.MouseLeave:Connect(function()
                                    tweenObject(TextButton, {
                                        BackgroundColor3 = Color3.fromRGB(22, 22, 22)
                                    }, 0.2)
                                end)
                                TextButton.MouseButton1Click:Connect(function()
                                    isDone = true
                                    TextBox.Text = v
                                    if callback then
                                        callback(v)
                                    end
                                    local tw = tweenObject(SearchBoxBack, {
                                        Position = UDim2.new(0, 0, 0, 0)
                                    }, 0.4)
                                    tw.Completed:wait()
                                    SearchBoxBack.Visible = false
                                    for i, v in next, buttons do
                                        v:Destroy()
                                        buttons[i] = nil
                                    end
                                    isDone = false
                                end)
                            end
                        end
                        updateVisibles()
                        for i, v in pairs(buttons) do
                            if string.sub(string.lower(v.Text), 1, string.len(TextBox.Text)) == string.lower(TextBox.Text) then
                                if v.Visible == false then
                                    spawn(function()
                                        v.Visible = true
                                        updateVisibles()
                                        tweenObject(v, {
                                            TextTransparency = 0
                                        }, 0.2)
                                        tweenObject(v, {
                                            BackgroundTransparency = 0
                                        }, 0.2)
                                    end)
                                end
                            else
                                if v.Visible == true then
                                    spawn(function()
                                        local tw = tweenObject(v, {
                                            TextTransparency = 1
                                        }, 0.2)
                                        tweenObject(v, {
                                            BackgroundTransparency = 0
                                        }, 0.2)
                                        tw.Completed:wait(0.1)
                                        v.Visible = false
                                        updateVisibles()
                                    end)
                                end
                            end
                        end
                    end
                end

                if default then 
                    for i, v in next, options do 
                        if v == default then 
                            TextBox.Text = v 
                            if callback then 
                                callback(v)
                            end
                        end 
                    end
                end

                TextBox.Focused:Connect(searchboxon)
                TextBox.FocusLost:Connect(function()
                    wait(0.5)
                    isDone = true
                    local tw = tweenObject(SearchBoxBack, {
                        Position = UDim2.new(0, 0, 0, 0)
                    }, 0.4)
                    tw.Completed:wait()
                    SearchBoxBack.Visible = false
                    for i, v in next, buttons do
                        v:Destroy()
                        buttons[i] = nil
                    end
                    isDone = false
                end)
                TextBox:GetPropertyChangedSignal("Text"):Connect(searchboxon)

                local searchbox = {}
                function searchbox:Update(val)
                    if table.find(options, val) then 
                        TextBox.Text = val
                    end
                end
                return searchbox
            end
            return section
        end
        return tab
    end
    return window
end

shared.Settings = {
    Lobby = {
        Safety = {
            WalkEnabled = false, 
            WalkTime = 10,
            HideNametag = false
        },
        
        Misc = {
            WaitTime = 0, --Wait before script activates
            AutoCollectDaily = true
        }
    },

    Dungeon = {
        HideNameplate = false,
        
        Configuration = {
            Hardcore = false,
            AutoSelectHighest = true
        },
        
        CustomDungeon = {
            Name = "Aquatic Temple",
            Difficulty = "Nightmare"
        },
    },

    Autofarm = {
        Walkspeed = 30, -- Higher than 30 is sometimes risky
        DistanceFromMobs = 50,
        AttackRange = 55,
        SmallTeleports = true, -- Autofarm won't work well on aquatic with this disabled
        Instakill = true
    },

    AutoSell = {
        Enabled = false,
        SellTriplicatedSpells = true,
        KeepItemsLevelRequirement = 999,
        RaritiesToKeep = {"legendary", "epic"},
        ItemsToKeep = {
            ["Desert Fury"] = {"legendary"},
            ["Crystalized Greatsword"] = {"legendary"},
            ["Staff of the Gods"] = {"legendary"},
            ["Soul Stealer Greatsword"] = {"legendary"},
            ["Beastmaster Spell Scythe"] = {"legendary"},
            ["Beastmaster War Scythe"] = {"legendary"},
            ["Dual Phoenix Daggers"] = {"legendary"},
            ["Phoenix Greatstaff"] = {"legendary"},
            ["Sakura Greatstaff"] = {"legendary"},
            ["Sakura Katana"] = {"legendary"},
            ["Overlord's Rageblade"] = {"legendary"},
            ["Overlord's Manablade"] = {"legendary"},
            ["Kraken Slayer"] = {"legendary"},
            ["Sea Serpent's Wings"] = {"legendary"},
            ["Inventor's Greatsword"] = {"legendary"},
            ["Inventor's Spellblade"] = {"legendary"},
            ["Hextech Overloaded Greatstaff +30"] = {"legendary"},
            ["Dual Bioforged Drills +30"] = {"legendary"},
            ["Dual Bioforged Drills +30"] = {"legendary"},
            ["Dual Godforged Blades +30"] = {"legendary"},
            ["Godforged Greatstaff +30"] = {"legendary"},
            ["Twisted Wood Greatstaff +30"] = {"legendary"},
            ["Twisted Wood Greatsword +30"] = {"legendary"},
            ["Galactic Pike"] = {"legendary"},
            ["Galactic Dual Blades"] = {"legendary"},
            ["Red Knight Helmet"] = {"epic"},
            ["Red Knight Armor"] = {"epic"},
            ["Templar Hood"] = {"epic"},
            ["Templar Robes"] = {"epic"},
            ["Ice King's Warrior Helmet"] = {"epic"},
            ["Ice King's Warrior Armor"] = {"epic"},
            ["Ice King's Mage Hood"] = {"epic"},
            ["Ice King's Mage Robes"] = {"epic"},
            ["Ice King's Guardian Helmet"] = {"epic"},
            ["Ice King's Guardian Armor"] = {"epic"},
            ["Godly Warrior Helmet"] = {"epic"},
            ["Godly Warrior Armor"] = {"epic"},
            ["Godly Mage Helmet"] = {"epic"},
            ["Godly Mage Robes"] = {"epic"},
            ["Godly Guardian Helmet"] = {"epic"},
            ["Godly Guardian Armor"] = {"epic"},
            ["Titan-forged Warrior Helmet"] = {"epic"},
            ["Titan-forged Warrior Armor"] = {"epic"},
            ["Titan-forged Mage Helmet"] = {"epic"},
            ["Titan-forged Mage Armor"] = {"epic"},
            ["Titan-forged Guardian Helmet"] = {"epic"},
            ["Titan-forged Guardian Armor"] = {"epic"},
            ["Glorious Warrior Helmet"] = {"epic"},
            ["Glorious Warrior Armor"] = {"epic"},
            ["Glorious Mage Hood"] = {"epic"},
            ["Glorious Mage Armor"] = {"epic"},
            ["Glorious Guardian Helmet"] = {"epic"},
            ["Glorious Guardian Armor"] = {"epic"},
            ["Ancestral Warrior Helmet"] = {"epic"},
            ["Ancestral Warrior Armor"] = {"epic"},
            ["Ancestral Mage Hood"] = {"epic"},
            ["Ancestral Mage Armor"] = {"epic"},
            ["Ancestral Guardian Helmet"] = {"epic"},
            ["Ancestral Guardian Armor"] = {"epic"},
            ["Overlord's Warrior Hat"] = {"epic"},
            ["Overlord's Warrior Armor"] = {"epic"},
            ["Overlord's Mage Hat"] = {"epic"},
            ["Overlord's Mage Robes"] = {"epic"},
            ["Overlord's Guardian Hat"] = {"epic"},
            ["Overlord's Guardian Armor"] = {"epic"},
            ["Mythical Warrior Helmet"] = {"epic"},
            ["Mythical Warrior Armor"] = {"epic"},
            ["Mythical Mage Helmet"] = {"epic"},
            ["Mythical Mage Armor"] = {"epic"},
            ["Mythical Guardian Helmet"] = {"epic"},
            ["Mythical Guardian Armor"] = {"epic"},
            ["War-forged Warrior Helmet"] = {"epic"},
            ["War-forged Warrior Armor"] = {"epic"},
            ["War-forged Mage Helmet"] = {"epic"},
            ["War-forged Mage Armor"] = {"epic"},
            ["War-forged Guardian Helmet"] = {"epic"},
            ["War-forged Guardian Armor"] = {"epic"},
            ["Alien Warrior Helmet"] = {"epic", "rare"},
            ["Alien Warrior Armor"] = {"epic", "rare"},
            ["Alien Mage Helmet"] = {"epic", "rare"},
            ["Alien Mage Armor"] = {"epic", "rare"},
            ["Alien Guardian Helmet"] = {"epic", "rare"},
            ["Alien Guardian Armor"] = {"epic", "rare"},
            ["Commander's Warrior Helmet"] = {"epic", "rare"},
            ["Commander's Warrior Armor"] = {"epic", "rare"},
            ["Commander's Mage Helmet"] = {"epic", "rare"},
            ["Commander's Mage Armor"] = {"epic", "rare"},
            ["Commander's Guardian Helmet"] = {"epic", "rare"},
            ["Commander's Guardian Armor"] = {"epic", "rare"},
            ["Inventor's Warrior Helmet +30"] = {"epic"},
            ["Inventor's Warrior Armor +30"] = {"epic"},
            ["Inventor's Mage Helmet +30"] = {"epic"},
            ["Inventor's Mage Armor +30"] = {"epic"},
            ["Inventor's Guardian Helmet +30"] = {"epic"},
            ["Inventor's Guardian Armor +30"] = {"epic"},
            ["Heavenly Warrior Helmet +30"] = {"epic"},
            ["Heavenly Warrior Armor +30"] = {"epic"},
            ["Heavenly Mage Helmet +30"] = {"epic"},
            ["Heavenly Mage Armor +30"] = {"epic"},
            ["Heavenly Guardian Helmet +30"] = {"epic"},
            ["Heavenly Guardian Armor +30"] = {"epic"},
            ["Nature Warrior Helmet +30"] = {"epic"},
            ["Nature Warrior Armor +30"] = {"epic"},
            ["Nature Mage Helmet +30"] = {"epic"},
            ["Nature Mage Armor +30"] = {"epic"},
            ["Nature Guardian Helmet +30"] = {"epic"},
            ["Nature Guardian Armor +30"] = {"epic"},
            ["Lava King's Warrior Helmet"] = {"rare", "epic"},
            ["Lava King's Warrior Armor"] = {"rare", "epic"},
            ["Lava King's Mage Helmet"] = {"rare", "epic"},
            ["Lava King's Mage Armor"] = {"rare", "epic"},
            ["Molten Forged Mage Helmet"] = {"epic"},
            ["Molten Forged Mage Armor"] = {"epic"},
            ["Molten Forged Warrior Helmet"] = {"epic"},
            ["Molten Forged Warrior Armor"] = {"epic"},
            ["Aquatic Warrior Helmet"] = {"rare", "epic", "uncommon", "common"},
            ["Aquatic Warrior Armor"] = {"rare", "epic", "uncommon", "common"},
            ["Aquatic Mage Helmet"] = {"rare", "epic", "uncommon", "common"},
            ["Aquatic Mage Armor"] = {"rare", "epic", "uncommon", "common"},
            ["Riptide Warrior Helmet"] = {"rare", "epic", "uncommon", "common"},
            ["Riptide Warrior Armor"] = {"rare", "epic", "uncommon", "common"},
            ["Riptide Mage Helmet"] = {"rare", "epic", "uncommon", "common"},
            ["Riptide Mage Armor"] = {"rare", "epic", "uncommon", "common"},
            ["Triton Warrior Helmet"] = {"rare", "epic", "uncommon", "common"},
            ["Triton Warrior Armor"] = {"rare", "epic", "uncommon", "common"},
            ["Triton Mage Armor"] = {"rare", "epic", "uncommon", "common"},
            ["Triton Mage Helmet"] = {"rare", "epic", "uncommon", "common"},
            ["Triton Guardian Helmet"] = {"rare", "epic", "uncommon", "common"},
            ["Triton Guardian Armor"] = {"rare", "epic", "uncommon", "common"},
            ["Serpent Pike"] = {"rare", "epic", "uncommon", "common"},
            ["Enchanted Sea Daggers"] = {"rare", "epic", "uncommon", "common"},
            ["Aquatic Spear"] = {"rare", "epic", "uncommon", "common"},
            ["Ocean Pearl Staff"] = {"rare", "epic", "uncommon", "common"},
            ["Oceanic Greatsword"] = {"rare", "epic", "uncommon", "common"},
            ["Enchanted Serpent Daggers"] = {"rare", "epic", "uncommon", "common"},
            ["Spear Strike"] = {"rare"},
            ["Water Orb"] = {"rare"},
            ["Ice Barrage"] = {"epic"},
            ["Ice Crash"] = {"epic"},
            ["Aquatic Smite"] = {"epic"},
            ["Ice Spikes"] = {"epic"},
            ["Twin Slash"] = {"epic"},
            ["Enhanced Inner Rage"] = {"legendary"},
            ["Lava Barrage"] = {"epic"},
            ["Blade Fall"] = {"epic"},
            ["Battle Shout"] = {"uncommon"},
            ["Innervate"] = {"epic"},
            ["Explosive Mine"] = {"epic"},
            ["Vortex Grenade"] = {"epic"},
            ["Electric Field"] = {"epic"},
            ["Energy Orb"] = {"epic"},
            ["Dual Magma Shields"] = {"epic"},
            ["Volcanic Greatsword"] = {"epic"},
            ["Magma Infused Waraxe"] = {"epic"},
            ["Shattered Magma Blade"] = {"epic"},
            ["Ancient Lava Axe"] = {"epic"},
            ["Dual Hellfire Blades"] = {"epic"}
        }
    },

    AutoEquip = {
        Enabled = false, 
        EquipType = "physical" -- "physical", "spell"
    },

    AutoUpgrade = {
        Enabled = false, 
        UpgradeType = "physicalPower" -- "physicalPower", "stamina", "spellPower"
    },

    AutoSkill = {
        Enabled = false,
        SkillType = { -- Precentages to upgrade each skill point
            ["physicalPower"] = 100,
            ["spellPower"] = 0,
            ["stamina"] = 0
        }
    },

    LagReductions = {
        BadGraphics = true,
        DestroyGear = true,
        DisableSpellEffects = true
    },

    CustomUI = {
        Enabled = true,
        Name = "Spooder Gang On Top",
        Level = "1337",
        EXP = "1337",
        HP = "1337",
        Gold = "1337",
        Avatar = "https://www.roblox.com/asset-thumbnail/image?assetId=2833845574&width=420&height=420&format=png"
    },

    WaitForJoiners = {
        Enabled = false,
        Host = "Account1",
        Joiners = {
            
        }
    },

    MultiFarm = {
        Enabled = false,
        Host = "Account1",
        Joiners = {

        }
    },

    Webhook = {
        Enabled = false,
        Url = "https://discord.com/api/webhooks/"
    }
}

local Environment = getgenv()

do 
    Environment.Settings = {} 

    for Index, Value in next, shared.Settings do 
        Environment.Settings[Index] = Value 
    end
end


local Window = library:Window("Settings")

local Lobby = Window:Tab("Lobby")
local Autofarm = Window:Tab("Autofarm")
local AutoSell = Window:Tab("Auto Sell")
local AutoEquip = Window:Tab("Auto Equip")
local AutoSkill = Window:Tab("Auto Skill")
local LagReduce = Window:Tab("Lag Reduce")
local CustomUI = Window:Tab("Custom UI")
local WaitForJoinersTab = Window:Tab("Wait For Joiners")
local MultiFarmTab = Window:Tab("Multi Farm")
local Webhook = Window:Tab("Webhook")

local SafetyLobby = Lobby:Section("Safety")
local MiscLobby = Lobby:Section("Misc")

local Configuration = Lobby:Section("Dungeon")

local AutofarmSettings = Autofarm:Section("Settings")
local SafetyAutofarm = Autofarm:Section("Safety")

local SellSettings = AutoSell:Section("Settings")
local SellRarities = AutoSell:Section("Rarities To Keep")
local SellItems = AutoSell:Section("Items To Keep")
local SellList = AutoSell:Section("Items List")

local Equip = AutoEquip:Section("Equip")
local Upgrade = AutoEquip:Section("Upgrade")

local SkillSettings = AutoSkill:Section("Settings")

local Options = LagReduce:Section("Options")

local CustomUISettings = CustomUI:Section("Settings")

local WaitForJoiners = WaitForJoinersTab:Section("Wait For Joiners")
local JoinersList = WaitForJoinersTab:Section("Joiners List")
local MultiFarm = MultiFarmTab:Section("Multi Farm")
local MultiJoinersList = MultiFarmTab:Section("Joiners List")

local WebhookSettings = Webhook:Section("Settings")

local Rarities = {"legendary", "epic", "rare", "uncommon", "common"}

--//safety

SafetyLobby:Toggle("Walk Enabled", false, function(Value)
    Settings.Lobby.Safety.WalkEnabled = Value
end)

SafetyLobby:Slider("Walk Time", {min = 0, max = 30, default = 10}, function(Value)
    Settings.Lobby.Safety.WalkTime = Value
end)

SafetyLobby:Toggle("Hide Nametag", false, function(Value)
    Settings.Lobby.Safety.HideNametag = Value
end)

--//misc

MiscLobby:Slider("Execute Wait Time", {min = 0, max = 20, default = 0}, function(Value)
    Settings.Lobby.Misc.WaitTime = Value
end)

MiscLobby:Toggle("Collect Daily", true, function(Value)
    Settings.Lobby.Misc.AutoCollectDaily = Value
end)

--//dungeon

Configuration:Toggle("Hardcore", false, function(Value)
    Settings.Dungeon.Configuration.Hardcore = Value
end)

Configuration:Toggle("Auto Highest Dungeon", true, function(Value)
    Settings.Dungeon.Configuration.AutoSelectHighest = Value
end)

Configuration:Box("Dungeon Name", "Aquatic Temple", function(Value)
    Settings.Dungeon.CustomDungeon.Name = Value
end)

Configuration:Box("Dungeon Diff", "Nightmare", function(Value)
    Settings.Dungeon.CustomDungeon.Difficulty = Value
end)

--//autofarm

AutofarmSettings:Slider("Walkspeed", {min = 0, max = 35, default = 30}, function(Value)
    Settings.Autofarm.Walkspeed = Value
end)

AutofarmSettings:Slider("Distance From Mobs", {min = 0, max = 70, default = 50}, function(Value)
    Settings.Autofarm.DistanceFromMobs = Value
end)

AutofarmSettings:Slider("Attack Range", {min = 5, max = 75, default = 55}, function(Value)
    Settings.Autofarm.AttackRange = Value
end)

AutofarmSettings:Toggle("Instakill", true, function(Value)
    Settings.Autofarm.Instakill = Value
end)

AutofarmSettings:Toggle("Small Teleports", true, function(Value)
    Settings.Autofarm.SmallTeleports = Value
end)

--//safety autofarm

SafetyAutofarm:Toggle("Hide Nameplate", false, function(Value)
    Settings.Dungeon.HideNameplate = Value
end)

--//equip

Equip:Toggle("Enable", false, function(Value)
    Settings.AutoEquip.Enabled = Value
end)

Equip:Picker("Equip Type", {"physical", "spell"}, function(Value)
    Settings.AutoEquip.EquipType = Value
    Settings.AutoUpgrade.UpgradeType = Value == "physical" and "physicalPower" or "spellPower"
end)

--//upgrade

Upgrade:Toggle("Upgrade Equipped", false, function(Value)
    Settings.AutoUpgrade.Enabled = Value
end)

--//autoskill

SkillSettings:Toggle("Enable", false, function(Value)
    Settings.AutoSkill.Enabled = Value
end)

local SkillTypes = {"physicalPower", "spellPower", "stamina"}

for Index, Skilltype in next, SkillTypes do
    SkillSettings:Slider(Skilltype, {min = 0, max = 100, default = Skilltype == "physicalPower" and 100 or 0}, function(Value)
        Settings.AutoSkill.SkillType[Skilltype] = Value
    end)
end

--//lag reduce

Options:Toggle("Bad Graphics", true, function(Value)
    Settings.LagReductions.BadGraphics = Value
end)

Options:Toggle("Destroy Gear", true, function(Value)
    Settings.LagReductions.DestroyGear = Value
end)

Options:Toggle("Disable Spell Effects", true, function(Value)
    Settings.LagReductions.DisableSpellEffects = Value
end)

--//custom ui

local UIOptions = {"Name", "Level", "EXP", "HP", "Gold", "Avatar"}

CustomUISettings:Toggle("UI Enabled", true, function(Value)
    Settings.CustomUI.Enabled = Value
end)

for Index, Option in next, UIOptions do
    local Default

    if Option == "Name" then 
        Default = "Spooder Gang On Top"
    elseif Option == "Avatar" then 
        Default = "https://www.roblox.com/asset-thumbnail/image?assetId=2833845574&width=420&height=420&format=png"
    else 
        Default = "1337"
    end 

    CustomUISettings:Box(Option, Defaul, function(Value)
        Settings.CustomUI[Option] = Value
    end)
end

--//joiners

if not isfile("spooder.waitforjoiners") then 
    writefile("spooder.waitforjoiners", game:GetService("HttpService"):JSONEncode({Joiners = Settings.WaitForJoiners.Joiners, Host = Settings.WaitForJoiners.Host}))
else 
    local Decoded = game:GetService("HttpService"):JSONDecode(readfile("spooder.waitforjoiners")) 

    Settings.WaitForJoiners.Joiners = Decoded.Joiners 
    Settings.WaitForJoiners.Host = Decoded.Host
end

local JoinerName
local JoinersLabels = {}

WaitForJoiners:Toggle("Wait Enabled", false, function(Value)
    Settings.WaitForJoiners.Enabled = Value
end)

WaitForJoiners:Box("Host", "Host", function(Value)
    Settings.WaitForJoiners.Host = Value

    if JoinersLabels[Settings.WaitForJoiners.Host] then 
        JoinersLabels[Settings.WaitForJoiners.Host]:Update(Value)
    end
end)

WaitForJoiners:Box("Joiner", "Joiner", function(Value)
    JoinerName = Value
end)

JoinersLabels[Settings.WaitForJoiners.Host] = JoinersList:Label("Host: " .. Settings.WaitForJoiners.Host)

for Index, Joiner in next, Settings.WaitForJoiners.Joiners do
    JoinersLabels[Joiner] = JoinersList:Label("Joiner: " .. Joiner)
end

WaitForJoiners:Button("Add Joiner", function()
    if JoinerName and JoinerName ~= "" and not table.find(Settings.WaitForJoiners.Joiners, JoinerName) and not JoinersLabels[JoinerName] then 
        table.insert(Settings.WaitForJoiners.Joiners, JoinerName) 

        JoinersLabels[JoinerName] = JoinersList:Label("Joiner: " .. JoinerName)

        writefile("spooder.waitforjoiners", game:GetService("HttpService"):JSONEncode({Joiners = Settings.WaitForJoiners.Joiners, Host = Settings.WaitForJoiners.Host}))
    end
end)

WaitForJoiners:Button("Remove Joiner", function()
    if JoinerName and JoinerName ~= "" then
        if table.find(Settings.WaitForJoiners.Joiners, JoinerName) then 
            table.remove(Settings.WaitForJoiners.Joiners, table.find(Settings.WaitForJoiners.Joiners, JoinerName))
        end

        for Index, Label in next, JoinersLabels do 
            if Label:GetText() == "Joiner: " .. JoinerName or Label:GetText() == "Host: " .. JoinerName then
                Label:Destroy()
            end
        end 

        JoinersLabels[JoinerName] = nil

        writefile("spooder.waitforjoiners", game:GetService("HttpService"):JSONEncode(Settings.WaitForJoiners.Joiners))
    end
end)

--// multi farm 

if not isfile("spooder.multifarm") then 
    writefile("spooder.multifarm", game:GetService("HttpService"):JSONEncode({Joiners = Settings.MultiFarm.Joiners, Host = Settings.MultiFarm.Host}))
else 
    local Decoded = game:GetService("HttpService"):JSONDecode(readfile("spooder.multifarm")) 

    Settings.MultiFarm.Joiners = Decoded.Joiners 
    Settings.MultiFarm.Host = Decoded.Host
end

local MultiName
local MultiJoinersLabels = {}

MultiFarm:Toggle("Multifarm Enabled", false, function(Value)
    Settings.MultiFarm.Enabled = Value
end)

MultiFarm:Box("Host", "Host", function(Value)
    Settings.MultiFarm.Host = Value

    if MultiJoinersLabels[Settings.MultiFarm.Host] then 
        MultiJoinersLabels[Settings.MultiFarm.Host]:Update(Value)
    end
end)

MultiFarm:Box("Joiner", "Joiner", function(Value)
    MultiName = Value
end)

MultiJoinersLabels[Settings.MultiFarm.Host] = MultiJoinersList:Label("Host: " .. Settings.MultiFarm.Host)

for Index, Joiner in next, Settings.MultiFarm.Joiners do
    MultiJoinersLabels[Joiner] = MultiJoinersList:Label("Joiner: " .. Joiner)
end

MultiFarm:Button("Add Joiner", function()
    if MultiName and MultiName ~= "" and not table.find(Settings.MultiFarm.Joiners, MultiName) and not MultiJoinersLabels[JoinerName] then 
        table.insert(Settings.MultiFarm.Joiners, JoinerName) 

        MultiJoinersLabels[MultiName] = MultiJoinersList:Label("Joiner: " .. MultiName)

        writefile("spooder.multifarm", game:GetService("HttpService"):JSONEncode({Joiners = Settings.MultiFarm.Joiners, Host = Settings.MultiFarm.Host}))
    end
end)

MultiFarm:Button("Remove Joiner", function()
    if MultiName and MultiName ~= "" then
        if table.find(Settings.MultiFarm.Joiners, MultiName) then 
            table.remove(Settings.MultiFarm.Joiners, table.find(Settings.MultiFarm.Joiners, MultiName))
        end

        for Index, Label in next, MultiJoinersLabels do 
            if Label:GetText() == "Joiner: " .. MultiName or Label:GetText() == "Host: " .. MultiName then
                Label:Destroy()
            end
        end 

        MultiJoinersLabels[MultiName] = nil

        writefile("spooder.multifarm", game:GetService("HttpService"):JSONEncode(Settings.MultiFarm.Joiners))
    end
end)

--//Webhook

WebhookSettings:Toggle("Webhook Enabled", false, function(Value)
    Settings.Webhook.Enabled = Value
end)

WebhookSettings:Box("Url", "Webhook Url", function(Value)
    Settings.Webhook.Url = Value
end)

--// autosell

SellSettings:Toggle("Autosell Enabled", false, function(Value)
    Settings.AutoSell.Enabled = Value
end)

SellSettings:Toggle("Sell Triplicated Spells", false, function(Value)
    Settings.AutoSell.SellTriplicatedSpells = Value
end)

SellSettings:Slider("Level Requirement", {min = 1, max = 200, default = 200}, function(Value)
    Settings.AutoSell.KeepItemsLevelRequirement = Value
end)

for Index, Rarity in next, Rarities do 
    SellRarities:Toggle(Rarity, (Rarity == "legendary" or Rarity == "epic") and true or false, function(Value)
        if Value then 
            table.insert(Settings.AutoSell.RaritiesToKeep, Rarity)
        else 
            if table.find(Settings.AutoSell.RaritiesToKeep, Rarity) then 
                table.remove(Settings.AutoSell.RaritiesToKeep, table.find(Settings.AutoSell.RaritiesToKeep, Rarity))
            end
        end
    end)
end

local CurrentItem = {
    Name = nil, 
    Rarities = {}
}

SellItems:Box("Item Name", "Item Name", function(Value)
    CurrentItem.Name = Value
end)

for Index, Rarity in next, Rarities do 
    SellItems:Toggle(Rarity, (Rarity == "legendary" or Rarity == "epic") and true or false, function(Value)
        if Value then 
            table.insert(CurrentItem.Rarities, Rarity)
        else 
            if table.find(CurrentItem.Rarities, Rarity) then 
                table.remove(CurrentItem.Rarities, table.find(CurrentItem.Rarities, Rarity))
            end
        end
    end)
end

local ItemLabels = {}

if not isfile("spooder.autosell") then 
    writefile("spooder.autosell", game:GetService("HttpService"):JSONEncode(Settings.AutoSell.ItemsToKeep))
else 
    Settings.AutoSell.ItemsToKeep = game:GetService("HttpService"):JSONDecode(readfile("spooder.autosell"))
end

SellItems:Button("Add Item", function()
    if CurrentItem.Name and #CurrentItem.Rarities > 0 then
        Settings.AutoSell.ItemsToKeep[CurrentItem.Name] = CurrentItem.Rarities

        local RarityString = ""
        
        for _, Rarity in next, CurrentItem.Rarities do 
            RarityString = RarityString .. Rarity .. ", "
        end 

        local Found = false

        for Index, Label in next, ItemLabels do 
            local Text = Label:GetText()

            if Text:split(":")[1]:sub(1, #Text - 1) == CurrentItem.Name .. " " then
                Label:Update(CurrentItem.Name .. " : " .. RarityString)
                Found = true 
                break
            end
        end 

        if not Found then 
            ItemLabels[CurrentItem.Name] = SellList:Label(CurrentItem.Name .. " : " .. RarityString)
        end

        writefile("spooder.autosell", game:GetService("HttpService"):JSONEncode(Settings.AutoSell.ItemsToKeep))
    end
end)

SellItems:Button("Remove Item", function()
    Settings.AutoSell.ItemsToKeep[CurrentItem.Name] = nil

    for Index, Label in next, ItemLabels do 
        local Text = Label:GetText()

        if Text:split(":")[1]:sub(1, #Text - 1) == CurrentItem.Name .. " " then
            Label:Destroy()
        end
    end 

    ItemLabels[CurrentItem.Name] = nil

    writefile("spooder.autosell", game:GetService("HttpService"):JSONEncode(Settings.AutoSell.ItemsToKeep))
end)

for Index, Item in next, Settings.AutoSell.ItemsToKeep do 
    local RarityString = ""

    for _, Rarity in next, Item do 
        RarityString = RarityString .. Rarity .. ", "
    end 

    ItemLabels[Index] = SellList:Label(Index .. " : " .. RarityString)
end

--// Init

loadstring(game:HttpGet("https://raw.githubusercontent.com/Introvert1337/RandomStuff/main/bruh.lua"))()

request = http_request or request or (syn and syn.request)

game:GetService("LogService").MessageOut:Connect(function(Message) -- Teleports to lobby if you get kicked
    if Message:find("Server Kick Message:") then
        TeleportService:Teleport(2414851778)
    end
end)

for Index, Connection in next, getconnections(Player.Idled) do 
    Connection:Disable()
end

--// Join Dungeon 

local LobbyUtilities = {}
local remotes = ReplicatedStorage:WaitForChild("remotes")

do 
    LobbyUtilities.AutoSell = {}
    LobbyUtilities.AutoEquip = {}
    LobbyUtilities.AutoUpgrade = {}
    LobbyUtilities.AutoSkill = {}
    LobbyUtilities.Dungeon = {}
    LobbyUtilities.Misc = {}
    LobbyUtilities.Gui = {}

    function LobbyUtilities.Dungeon:GetHighestDungeon()
        local Levels = {}
        local getDungeonStats = remotes.getDungeonStats
        local DungeonStats = {}

        for _, Dungeon in next, Player.PlayerGui:WaitForChild("queueGui"):WaitForChild("chooseDungeon"):WaitForChild("backgroundFillLeft"):WaitForChild("ScrollingFrame"):GetChildren() do
            local Name = Settings.Dungeon.CustomDungeon.Name
            if Name ~= "Egg Island" and Name ~= "UIListLayout" then
                local Stats = getDungeonStats:InvokeServer(Name)
                Stats.Name = Name
                table.insert(DungeonStats, Stats)
            end
        end

        local PlayerLevel = Player.leaderstats.Level.Value
        
        for _, Stats in next, DungeonStats do
            for Index, Stat in next, Stats do 
                if Index ~= "imageId" and Index ~= "Name" then 
                    table.insert(Levels, {Requirement = Stat.levelReq, Name = Stats.Name, Difficulty = Index})
                end
            end
        end 
        
        table.sort(Levels, function(a, b)
            return a.Requirement < b.Requirement
        end)
        
        local Dungeon
        local Difficulty
        
        for Index, Level in next, Levels do 
            if Index == #Levels or Level.Requirement <= PlayerLevel and Levels[Index + 1].Requirement > PlayerLevel then 
                Dungeon = Level.Name 
                Difficulty = Level.Difficulty
                break
            end
        end

        return Dungeon, Difficulty, Settings.Dungeon.Configuration.Hardcore 
    end

    function LobbyUtilities.Dungeon:GetDungeonInfo()
        if not Settings.Dungeon.Configuration.AutoSelectHighest then 
            return Settings.Dungeon.CustomDungeon.Name, Settings.Dungeon.CustomDungeon.Difficulty, Settings.Dungeon.Configuration.Hardcore 
        else 
            return LobbyUtilities.Dungeon:GetHighestDungeon()
        end
    end

    function LobbyUtilities.Dungeon:JoinDungeon()
        local Dungeon, Difficulty, Hardcore = LobbyUtilities.Dungeon:GetDungeonInfo() 

        local WaitForFriendsTotal = not Settings.MultiFarm.Enabled and #Settings.WaitForJoiners.Joiners + 2 or (#Settings.WaitForJoiners.Joiners + #Settings.MultiFarm.Joiners) + 2

        if Settings.MultiFarm.Enabled then
            repeat
                if Player.Name == Settings.MultiFarm.Host then
                    remotes.createLobby:InvokeServer(Dungeon, Difficulty, 0, Hardcore, true, false)
                end
            
                for Index, Joiner in next, Settings.MultiFarm.Joiners do
                    if Players:FindFirstChild(Joiner) then
                        if Player.Name == Settings.MultiFarm.Host then 
                            remotes.addPlayerToWhitelist:FireServer(Joiner)
                        end

                        if Player.Name ~= Settings.MultiFarm.Host and workspace.games.inLobby:FindFirstChild(Settings.MultiFarm.Host) then
                            remotes.joinDungeon:InvokeServer(Settings.MultiFarm.Host)
                        end
                    end
                end

                wait(1)
            until workspace.games.inLobby:FindFirstChild(Settings.MultiFarm.Host) and #workspace.games.inLobby[Settings.MultiFarm.Host]:GetChildren() == #Settings.MultiFarm.Joiners + 2
        end 

        if Settings.WaitForJoiners.Enabled then 
            repeat
                if Player.Name == Settings.WaitForJoiners.Host then
                    remotes.createLobby:InvokeServer(Dungeon, Difficulty, 0, Hardcore, true, false)
                end

                for Index, Joiner in next, Settings.WaitForJoiners.Joiners do
                    if Players:FindFirstChild(Joiner) then
                        wait(1)

                        if Player.Name == Settings.WaitForJoiners.Host then
                            remotes.addPlayerToWhitelist:FireServer(Joiner)
                        end
                    end
                end

                wait(1)
            until workspace.games.inLobby:FindFirstChild(Settings.WaitForJoiners.Host) and #workspace.games.inLobby[Settings.WaitForJoiners.Host]:GetChildren() == WaitForFriendsTotal
        end

        if not Settings.WaitForJoiners.Enabled and not Settings.MultiFarm.Enabled then 
            return remotes.createLobby:InvokeServer(Dungeon, Difficulty, 0, Hardcore, true, false) 
        end
    end

    function LobbyUtilities.Dungeon:StartDungeon()
        if not Settings.MultiFarm.Enabled or Player.Name == Settings.MultiFarm.Host then
            return remotes.startDungeon:FireServer()
        end
    end

    function LobbyUtilities.Misc:AwaitPlayerLoaded()
        wait(Settings.Lobby.Misc.WaitTime)

        repeat 
            remotes.loadPlayerCharacter:FireServer()
            wait(1) 
        until Player.Character and Player.Character:FindFirstChild("Humanoid") and Player.Character:FindFirstChild("HumanoidRootPart")
    end

    function LobbyUtilities.Misc:HideNametag()
        coroutine.wrap(function()
            local Character = Player.Character or Player.CharacterAdded:Wait()
            local playerNameplate = Player.Character:WaitForChild("playerNameplate")

            playerNameplate:Destroy()
        end)()
    end
    
    function LobbyUtilities.Misc:GetRandomPosition(Pos, Pos2) 
        return Vector3.new(random(min(Pos.X, Pos2.X), max(Pos.X, Pos2.X)), Pos.Y, random(min(Pos.Z, Pos2.Z), max(Pos.Z, Pos2.Z)))
    end 

    function LobbyUtilities.Misc:WalkInLobby()
        local Path = PathfindingService:CreatePath()
        Path:ComputeAsync(Player.Character.HumanoidRootPart.Position, LobbyUtilities.Misc:GetRandomPosition(Vector3.new(161, 4, 1074), Vector3.new(5, 6, 1007)))
        local Waypoints = Path:GetWaypoints()

        for Index, Waypoint in next, Waypoints do 
            if Waypoint.Action == Enum.PathWaypointAction.Jump then 
                Player.Character.Humanoid.Jump = true
            else 
                Player.Character.Humanoid:MoveTo(Waypoint.Position)
                Player.Character.Humanoid.MoveToFinished:Wait()
            end
        end
        
        wait(Settings.Lobby.Safety.WalkTime)
    end

    function LobbyUtilities.Misc:CollectDaily()
        if CoreGui:FindFirstChild("PurchasePromptApp") then
            CoreGui.PurchasePromptApp:Destroy()
        end
        
        workspace.dailyRewardTouchPart.CFrame = Player.Character.HumanoidRootPart.CFrame
    end
    
    function LobbyUtilities.AutoSell:GetInfo(Item)
        local Split = Item:split("_")

        return Split[1], tonumber(Split[2])
    end

    function LobbyUtilities.AutoSell:IsSellable(Data, Type, Invy)
        if Type == "ability" then
            if Data.equipped.e or Data.equipped.q then
                return false
            end
        else
            if Data.equipped then
                return false
            end
        end

        local TriplicatedFound = 0

        for Index, Value in next, Invy do
            for _, Item in next, Value do
                if type(Item) ~= "boolean" then
                    local ItemType, ItemId = LobbyUtilities.AutoSell:GetInfo(_)
                    
                    if ItemType == "ability" and Item.name == Data.name then 
                        TriplicatedFound = TriplicatedFound + 1 

                        if TriplicatedFound == 2 then 
                            return false 
                        end 
                    end
                end
            end
        end

        if Data.levelReq >= Settings.AutoSell.KeepItemsLevelRequirement then 
            return false 
        end
        
        for Index, Value in next, Settings.AutoSell.RaritiesToKeep do
            if Value == Data.rarity then
                return false 
            end
        end
        
        for Index, Rarities in next, Settings.AutoSell.ItemsToKeep do
            if Data.name == Index then
                for _, Rarity in next, Rarities do
                    if Data.rarity == Rarity then
                        return false
                    end
                end
            end
        end

        return true
    end

    function LobbyUtilities.AutoSell:Sell()
        local SellTable = {helmet = {}, chest = {}, weapon = {}, ability = {}}
        local Invy = remotes.reloadInvy:InvokeServer()
        
        for Index, Value in next, Invy do
            for _, Item in next, Value do
                if type(Item) ~= "boolean" then
                    local ItemType, ItemId = LobbyUtilities.AutoSell:GetInfo(_)
                    
                    if LobbyUtilities.AutoSell:IsSellable(Item, ItemType, Invy) then
                        table.insert(SellTable[ItemType], ItemId)
                    end
                end
            end
        end

        return remotes.sellItemEvent:FireServer(SellTable)
    end
    
    function LobbyUtilities.AutoUpgrade:GetUpgradeType(Data)
        if Data.name:find("Mage") then 
            return "spell" 
        end

        if Data.name:find("Warrior") then 
            return "physic" 
        end
        
        if (Data.spellPower or 0) > (Data.physicalPower or 1) then
            return "physical"
        else 
            return "spell"
        end
    end

    function LobbyUtilities.AutoUpgrade:UpgradeItem(Type, Id, UpgradeType, Upgrade)
        remotes.unequipItem:InvokeServer(Type, Id)
        remotes.upgradeItem:FireServer(Type, Id, UpgradeType, Upgrade)
        remotes.equipItem:InvokeServer(Type, Id)
    end

    function LobbyUtilities.AutoUpgrade:CalculateCost(Total, Current)
        local i = 0
        local r = 100

        for o = 1, Total do
            local a = 0

            if o > 1 then
                local s = 1.06 * r + 50
                if 220 < s - r then
                    a = r + 220
                else
                    a = s
                end
            else
                a = r
            end

            if Current < o then 
                if o <= 466 then
                    i = i + a
                else
                    i = i + 100000
                    a = 100000
                end
            end
            
            r = a
        end

        return i
    end

    function LobbyUtilities.AutoUpgrade:GetHighestUpgrade(Max, Current)
        local Highest = Max - Current 
        local Gold = Player.leaderstats.Gold.Value

        for Index = Highest, Current + 1, -1 do 
            if LobbyUtilities.AutoUpgrade:CalculateCost(Index, Current) <= Gold then 
                return Index - Current 
            end
        end
    end

    function LobbyUtilities.AutoUpgrade:UpgradeEquippedItems()
        for Index, Value in next, remotes.reloadInvy:InvokeServer() do
            for _, Item in next, Value do
                local Type, Id = LobbyUtilities.AutoSell:GetInfo(_)

                if type(Item) ~= "boolean" and Type ~= "ability" and Item.equipped and Item.currentUpgrade ~= Item.maxUpgrades then
                    LobbyUtilities.AutoUpgrade:UpgradeItem(Type, Id, LobbyUtilities.AutoUpgrade:GetUpgradeType(Item), LobbyUtilities.AutoUpgrade:GetHighestUpgrade(Item.maxUpgrades, Item.currentUpgrade))
                end
            end
        end
    end
    
    function LobbyUtilities.AutoEquip:EquipBestItems() 
        local BestItems = {helmet = nil, chest = nil, weapon = nil}
        local ItemValues = {helmet = 0, chest = 0, weapon = 0}
        for Index, Value in next, remotes.reloadInvy:InvokeServer() do
            for _, Item in next, Value do
                if type(Item) ~= "boolean" then
                    local Type, Id = LobbyUtilities.AutoSell:GetInfo(_)
                    local ItemType = Settings.AutoEquip.EquipType == "spell" and "spellPower" or (Type == "weapon" and "physicalDamage" or "physicalPower")

                    if Type ~= "ability" and Item[ItemType] > ItemValues[Type] then
                        ItemValues[Type] = Item[ItemType]
                        BestItems[Type] = Id
                    end
                end
            end
        end

        for Index = 1, 3 do
            local Type = Index == 1 and "helmet" or Index == 2 and "chest" or "weapon"
            remotes.equipItem:InvokeServer(Type, BestItems[Type])
            wait(1)
        end
    end

    function LobbyUtilities.AutoSkill:GetCorrectSkill()
        local SkillType = Settings.AutoSkill.SkillType
        local Random = random(1, 100)
        local CurrentIndex = 0

        table.sort(SkillType, function(a, b)
            return a > b
        end)

        for Index, Value in next, SkillType do
            CurrentIndex = CurrentIndex + 1 

            if Random <= Value and Random > (SkillType[CurrentIndex + 1] or 0) then 
                return Index 
            end
        end
    end

    function LobbyUtilities.AutoSkill:UpgradeSkills()
        local SkillPoints = Player.skillPoints.Value
        local SkillType = LobbyUtilities.AutoSkill:GetCorrectSkill()

        for Index = 0, SkillPoints do 
            remotes.spendSkillPoint:FireServer(SkillType)
        end
    end

    function LobbyUtilities.Gui:ChangeGui()
        local Frame = Player.PlayerGui:WaitForChild("playerStatus"):WaitForChild("Frame")
        
        Frame.playerName.Text = tostring(Settings.CustomUI.Name)
        Frame.levelBorder.level.Text = tostring(Settings.CustomUI.Level)
        Frame.xpFrame.xp.Text = tostring(Settings.CustomUI.EXP)
        Frame.healthFrame.health.Text = tostring(Settings.CustomUI.HP)
        Frame.moneyMain.TextLabel.Text = tostring(Settings.CustomUI.Gold)
        Frame.portraitBorder.portrait.Image = Settings.CustomUI.Avatar

        if Frame.xpFrame:FindFirstChild("xpUpdater") then
            Frame.xpFrame.xpUpdater:Destroy()
        end
        
        if Frame.healthFrame:FindFirstChild("healthUpdater") then
            Frame.healthFrame.healthUpdater:Destroy()
        end
    end
end

if game.PlaceId == 2414851778 then
    if Settings.Lobby.Safety.HideNametag then 

        LobbyUtilities.Misc:HideNametag()
    end 

    LobbyUtilities.Misc:AwaitPlayerLoaded()

    if Settings.AutoSell.Enabled then
        LobbyUtilities.AutoSell:Sell()
    end

    if Settings.AutoEquip.Enabled then
       LobbyUtilities.AutoEquip:EquipBestItems()
    end

    if Settings.AutoUpgrade.Enabled then 
        LobbyUtilities.AutoUpgrade:UpgradeEquippedItems()
    end

    if Settings.AutoSkill.Enabled then 
        LobbyUtilities.AutoSkill:UpgradeSkills()
    end

    if Settings.Lobby.Misc.AutoCollectDaily then 
        LobbyUtilities.Misc:CollectDaily()
    end

    if Settings.Lobby.Safety.WalkEnabled then 
        LobbyUtilities.Misc:WalkInLobby()
    end 

    LobbyUtilities.Dungeon:JoinDungeon()
    LobbyUtilities.Dungeon:StartDungeon()

    return
end

local SupportedDungeons = {
    [6216785535] = "Aquatic Temple",
    [5281215714] = "Volcanic Chambers",
    [4628698373] = "Orbital Outpost",
    [4113459044] = "Steampunk Sewers",
    [3737465474] = "Ghastly Harbor",
    [3488584454] = "The Canals",
    [3277965370] = "Samurai Palace",
    [3119903031] = "The Underworld",
    [2606294912] = "Desert Temple"
}

if not SupportedDungeons[game.PlaceId] then 
    return 
end

--// Base Tables 

local AttackManager = {} -- Object to manage enemy attacks
local MovementManager = {} -- Object to manage player movement
local DodgeManager = {} -- Object to manage attack/enemy dodging
local EnemyManager = {} -- Object to manage enemy related functions
local PlayerAttackManager = {} -- Object to manage player-casted attacks
local Utilities = {} -- Misc functions for utility
local Variables = {} -- Object to store variables

--// Variable Definitions 

do 
    --// Misc Variables 

    Variables.ProjectilesFolder = ReplicatedStorage.projectiles
    Variables.enemyProjectilesFolder = ReplicatedStorage.enemyProjectiles
    Variables.Walkspeed = Settings.Autofarm.Walkspeed
    Variables.IsPathfinding = false 
    Variables.IsGoingBack = false
    Variables.AttackRange = Settings.Autofarm.AttackRange
    Variables.IsDodgingSlam = false
    Variables.LaserAttacks = {}
    Variables.HasDoneSlam = false
    Variables.IsSeaKing = true
    Variables.BossCastedAttacks = {}
    Variables.SpreadLine = {}
    Variables.IsAquatic = game.PlaceId == 6216785535
    Variables.IsVolcanic = game.PlaceId == 5281215714
    Variables.ForceDestination = nil
    Variables.IsGhastly = game.PlaceId == 3737465474
    Variables.IsSteampunk = game.PlaceId == 4113459044
    Variables.IsDesert = game.PlaceId == 2606294912
    Variables.BossMiniMobs = {
        ["Blood Minion"] = true,
        ["Infected Pirate"] = true,
        ["Ice Minion"] = true,
        ["Tracking Minion"] = true,
        ["Flame Minion"] = true,
        ["Stone Minion"] = true
    }
    Variables.PrimaryPartAttacks = {
        ["spikePrecast"] = true
    }
    Variables.ForceCount = 0
    Variables.GhastlyBorders = {}
    Variables.BossNames = {
        ["temple core generator"] = true,
        ["ancient temple protector"] = true,
        ["sea king"] = true,
        ["deity of the volcano"] = true,
        ["ancient lava mage"] = true,
        ["lava king"] = true,
        ["lord varosh"] = true,
        ["tesla master"] = true,
        ["the destroyer"] = true,
        ["cyclops siege bot"] = true, 
        ["evil scientist"] = true, 
        ["cannon blaster 2000"] = true,
        ["the kraken"] = true,
        ["mage overlord"] = true,
        ["warrior overlord"] = true,
        ["guardian overlord"] = true,
        ["demonic overgrowth"] = true,
        ["kolvumar"] = true,
        ["demon lord azrallik"] = true,
        ["sanada yukimura"] = true,
        ["ancient golem guardian"] = true,
        ["miyamoto musashi"] = true
    }

    Variables.IgnoreAfterDead = {
        ["burly enforcer"] = true,
        ["cannon crab"] = true
    }

    Variables.InstakillMobs = {
        ["Sand Peasant"] = true,
        ["Sand Giant"] = true,
        ["Frost Minion"] = true,
        ["Frost Wizard"] = true,
        ["Pirate Rifleman"] = true,
        ["Pirate Savage"] = true,
        ["Elementalist"] = true,
        ["King's Guard"] = true,
        ["Dark Mage"] = true,
        ["Demon Warrior"] = true,
        ["Samurai Swordsman"] = true,
        ["Bodyguard"] = true,
        ["Raider"] = true,
        ["Spinner Bot"] = true,
        ["Fighter Bot"] = true,
        ["Hammer Bot"] = true,
        ["Hologram Assassin"] = true,
        ["Hologram Warrior"] = true,
        ["Chicken Mage"] = true,
        ["Chicken Brawler"] = true
    }

    --// Other Variables 

    DodgeManager.SafeRadius = 4.8 -- Amount of "safe" area needed to be classified as "safe"
    DodgeManager.BackDistance = Settings.Autofarm.DistanceFromMobs -- Distance the script will attempt to stay away from the nearest enemy
    DodgeManager.PartMatrix = {} -- Table for the grid of parts which will be used to find safe areas
    DodgeManager.CustomDodges = {}

    AttackManager.ActiveAttacks = {} -- Table to store all active enemy attacks
end

--// Functions 

do 
    function Utilities:Debug(Summary, Info) -- Sends a debug log to the console with argument 1 (string) and argument 2 (string)
        if Info then
            return warn("Debug | " .. tostring(Summary) .. "\n" .. "Info: " .. tostring(Info))
        else 
            return warn("Debug | " .. tostring(Summary)) 
        end
    end
end

do 
    function AttackManager:IsAttackActive(Attack) -- Checks if argument 1 (instance) is a valid enemy attack
        local Name = Attack.Name:lower()

        if workspace.dungeon:FindFirstChild("room2") and workspace.dungeon.room2.enemyFolder:FindFirstChild("Temple Core Generator") and Attack.Parent and not Attack.Parent:FindFirstChild("hitBox") and Attack.Parent:FindFirstChild("precast") and Attack.Parent.precast.Size == Vector3.new(16, 1, 150) then
            wait()

            if Attack.Parent and table.find(Variables.LaserAttacks, Attack.Parent) then 
                return true 
            end
        end

        if Attack.Parent and Attack.Parent.Name == "thirdBossSafeSpots" then 
            return false 
        end

        if Attack.Parent and Attack.Parent.Name == "safeSpotCircle" then 
            return false 
        end

        if Attack.Parent and Attack.Parent.Name == "forceField" then 
            return false 
        end

        if Attack.Parent and Attack.Parent.Name == "secondBossRockFall" then 
            return false 
        end

        if Attack.Parent and Attack.Parent.Name == "thirdBossSafeSpot" then 
            return false 
        end

        if Attack.Parent and Attack.Parent.Name:lower() == "thirdbossspreadline" then
            if Attack.Parent:FindFirstChild("precast") then
                if Variables.SpreadLine[Attack.Parent] and Variables.SpreadLine[Attack.Parent] < 2 then 
                    return true 
                elseif not Variables.SpreadLine[Attack.Parent] then
                    if Attack.Parent.precast.Transparency < 1 then 
                        if not Variables.SpreadLine[Attack.Parent] then 
                            Variables.SpreadLine[Attack.Parent] = 0 

                            Attack.Parent.precast:GetPropertyChangedSignal("Transparency"):connect(function()
                                if Attack.Parent.precast.Transparency == 1 or Attack.Parent.precast.Transparency == 0 then
                                    Variables.SpreadLine[Attack.Parent] = Variables.SpreadLine[Attack.Parent] + 1
                                end
                            end)
                        end 

                        return true 
                    end
                else 
                    return false
                end 
            end
        end

        if Attack.Transparency < 1 and Attack.Parent and Variables.PrimaryPartAttacks[Attack.Parent.Name] then 
            return true 
        end

        if Name:find("hitbox") or Name:find("precast") then -- Check if "attack" is an actual attack part
            if Attack.Parent and Variables.ProjectilesFolder:FindFirstChild(Attack.Parent.Name) then -- Checks if "attack" isn't player-casted
                return false
            end

            if Attack.Parent and (Attack.Parent:FindFirstChild("precast") or Attack.Parent:FindFirstChild("preCast")) then 
                local precast = Attack.Parent:FindFirstChild("precast") or Attack.Parent:FindFirstChild("preCast") 

                return precast.Transparency < 1 or (Attack.Parent and Attack.Parent.Parent and (Attack.Parent.Parent.Name == "secondBossLines" or Attack.Parent.Parent.Name == "thirdBossExplosionShot")) -- Checks if attack is visible
            else 
                return true
            end
        end
    end

    function AttackManager:IsAttackSafe(Attack)
        if Variables.BossCastedAttacks[Attack] then 
            local Nearest = EnemyManager:GetNearestEnemy()

            if not Nearest or Nearest.Name ~= Variables.BossCastedAttacks[Attack] then 
                return true 
            end 
        end 

        return false
    end

    function AttackManager:CheckIntersection(Position, Part) -- Checks intersection between argument 1 (Vector3) and argument 2 (Instance)
        return CheckIntersection(Position, Part, DodgeManager)
    end
end

local Whitelist = {workspace.Terrain} 

if workspace:FindFirstChild("borders") then 
    table.insert(Whitelist, workspace.borders)
end

for Index, Room in next, workspace.dungeon:GetChildren() do 
    for Index, Descendant in next, Room:GetChildren() do 
        if Descendant.ClassName == "Part" or Descendant.ClassName == "UnionOperation" or Descendant.ClassName == "WedgePart" then
            if Descendant.Transparency < 1 then 
                table.insert(Whitelist, Descendant)
            end 
        elseif Descendant.ClassName == "Model" then 
            table.insert(Whitelist, Descendant)
        end 
    end 
end

for Index, Child in next, workspace:GetChildren() do 
    if Child.ClassName == "Part" or Child.ClassName == "UnionOperation" or Child.ClassName == "WedgePart" then
        if Child.Transparency < 1 then 
            table.insert(Whitelist, Child)
        end 
    elseif Child.ClassName == "Model" and Child ~= Player.Character then 
        table.insert(Whitelist, Child)
    end 
end

if workspace:FindFirstChild("Map") and workspace.Map:FindFirstChild("Models") then 
    table.insert(Whitelist, workspace.Map.Models)
end

do 
    function Utilities:Cast(Origin, Target) -- Casts a ray from argument 1 (Vector3), to argument 2 (Vector3)
        local Direction = (Target - Origin) -- Converts tbe target position to the direction relative to the origin, to be used in the racyast

        local raycastParams = RaycastParams.new() -- Creates new RaycastParams object
        raycastParams.FilterType = Enum.RaycastFilterType.Whitelist -- Make Racycast whitelist based
        raycastParams.FilterDescendantsInstances = Whitelist -- Whitelists borders and terrain
        raycastParams.IgnoreWater = true -- Ignores water

        local raycastResult = workspace:Raycast(Origin, Direction, raycastParams) -- Casts ray

        if raycastResult then
            return raycastResult.Instance -- Returns ray hit if there is one
        end
        
        return false
    end
end

do 
    function EnemyManager:GetNearestEnemy() -- Gets the nearest enemy relative to the player
        return GetNearestEnemy()
    end

    function EnemyManager:MoveToNearestEnemy() -- Moves player to nearest enemy
        if not Player.Character or not Player.Character:FindFirstChild("HumanoidRootPart") or not Player.Character:FindFirstChild("Head") then 
            return 
        end -- Checks if player character exists

        if Variables.ForceDestination then
            return MovementManager:Pathfind(Variables.ForceDestination)
        end

        local Nearest = EnemyManager:GetNearestEnemy() -- Gets nearest enemy

        if Nearest and Nearest:FindFirstChild("HumanoidRootPart") and Nearest.Humanoid.Health > 0 then -- Checks if nearest enemy is alive
            return MovementManager:Pathfind(Nearest.HumanoidRootPart.Position) -- Pathfinds to nearest enemy
        end
    end

    function EnemyManager:LookAtNearestEnemy()
        if not Player.Character or not Player.Character:FindFirstChild("HumanoidRootPart") or not Player.Character:FindFirstChild("Head") then 
            return 
        end 
        
        local Nearest = EnemyManager:GetNearestEnemy()  -- Gets nearest enemy

        if Nearest and Nearest:FindFirstChild("HumanoidRootPart") then -- Checks if enemy is alive
            local EnemyPosition = Nearest.HumanoidRootPart.Position -- Defines enemy position
            local PlayerPosition = Player.Character.HumanoidRootPart.Position -- Defines player position 

            Player.Character.HumanoidRootPart.CFrame = CFrame.new(PlayerPosition, Vector3.new(EnemyPosition.X, PlayerPosition.Y, EnemyPosition.Z)) -- Sets player look
        end
    end
end

do 
    function PlayerAttackManager:CastSpells() -- Casts player spells
        for Index, Spell in next, Player.Backpack:GetChildren() do -- Loops through player backpack
            if Spell:FindFirstChild("cooldown") and Spell.cooldown.Value <= 0 then -- Checks if spell isn't on cooldown
                local Event = Spell:FindFirstChildOfClass("RemoteEvent") -- Gets spell cast event

                if Event then 
                    Event:FireServer() -- Casts spell using event
                end 
            end
        end
    end
end

do 
    function DodgeManager:IsPositionSafe(Position, IgnoreCast, IgnoreList) -- Checks if argument 1 (Vector3) is a safe position, ignores raycast check if argument 2 is true (boolean), ignores any specified attacks in argument 3 (table)
        return IsPositionSafe(Position, IgnoreCast, IgnoreList, Utilities, AttackManager, Variables)
    end

    function DodgeManager:GetOptimalPosition() -- Gets the oprimal dodge position
        return GetOptimalPosition(Variables, DodgeManager, EnemyManager)
    end

    function DodgeManager:GetBackVector(AquaticSecond) -- Gets a vector which moves backwards from the nearest enemy
        if AquaticSecond then 	
            local Closest = EnemyManager:GetNearestEnemy()	
            if Closest and Closest:FindFirstChild("HumanoidRootPart") then	
                local CurrentPosition = Player.Character.HumanoidRootPart.Position	
                local Forward = Closest.HumanoidRootPart.CFrame	
        	
                local Furthest = nil	
                local Distance = 0	
                for Index = 0, DodgeManager.BackDistance do	
                    local Vector = Forward:ToWorldSpace(CFrame.new(0, 0, -Index)).Position	
                    local Relative = Vector - CurrentPosition	
                    if DodgeManager:IsPositionSafe(Vector) then	
                        if Index > Distance then	
                            Furthest = Vector	
                            Distance = Index	
                        end	
                    else	
                        break 	
                    end	
                end	
                return Furthest	
            end	
        end
        
        local PlayerPosition = Player.Character.HumanoidRootPart.CFrame
        local Back = (PlayerPosition:ToWorldSpace(CFrame.new(0, 0, 25))).Position
        
        if workspace:FindFirstChild("playerSpawn") and workspace.playerSpawn.ClassName == "SpawnLocation" then 
            Spawn = workspace.playerSpawn 
        else 
            Spawn = workspace.SpawnLocation 
        end 
        
        if not Utilities:Cast(PlayerPosition.Position, Back) and not AttackManager:CheckIntersection(Back, Spawn) then
            return Back
        else
            for Radius = 1, 40 do 
                for Direction = 1, 2 do 
                    local Distance = Radius * 2
                    
                    if Direction == 1 then 
                        Distance = Distance * -1 
                    end 
                    
                    local Back = (PlayerPosition * CFrame.new(Distance, -2, 25 - Radius)).Position
                    
                    if not Utilities:Cast(PlayerPosition.Position, Back) and not AttackManager:CheckIntersection(Back, Spawn) then 
                        return Back 
                    end 
                end 
            end
        end
    end

    function DodgeManager:AddCustomDodge(Data)
        DodgeManager.CustomDodges[Data.AttackName] = {Identify = Data.IdentifyCallback, Dodge = Data.DodgeCallback}
    end
end

do 
    function MovementManager:MoveToPosition(Position) -- Statically moves to argument 1 (Vector3), gets custom static waypoints if argument 2 is true (boolean)
        if not Player.Character or not Player.Character:FindFirstChild("Humanoid") or not Player.Character:FindFirstChild("HumanoidRootPart") then 
            return 
        end

        Player.Character.Humanoid:MoveTo(Position) -- Moves to destination
        Player.Character.Humanoid.MoveToFinished:wait() -- Waits for movement to finish
    end 

    function MovementManager:Pathfind(Position, Failed) -- Pathfinds to argument 1 (Vector3)
        if not Player.Character or not Player.Character:FindFirstChild("Humanoid") or not Player.Character:FindFirstChild("HumanoidRootPart") then 
            return 
        end -- Checks if player character exists

        local Radius, Height = 4, 5 

        if Failed then 
            if Variables.IsGhastly then 
                Radius, Height = 0.1, 0.1
            elseif Variables.IsSteampunk then 
                Radius, Height = 1, 1 
            else 
                Radius, Height = 0.1, 0.1 
            end 
        end

        local Path = PathfindingService:CreatePath({ -- Creates path object
            AgentRadius = Radius,
            AgentHeight = Height
        })
        
        Path:ComputeAsync(Player.Character.HumanoidRootPart.Position, Position) -- Computes path 
        local Waypoints = Path:GetWaypoints() -- Defines path waypoints

        if Path.Status ~= Enum.PathStatus.Success then -- Re computes path if computation failed
            --Utilities:Debug("No Path Found", tostring(Position))
            return MovementManager:Pathfind(Position, true)
        end;

        Path.Blocked:Connect(function() -- Re-computes path when path is blocked
            --Utilities:Debug("Path Blocked", tostring(Position))
            if game.PlaceId == 3119903031 and workspace.dungeon.bossRoom.enemyFolder:FindFirstChild("Demon Lord Azrallik") then
                return MovementManager:MoveToPosition(Position)
            else 
                return MovementManager:Pathfind(Position, true)
            end
        end)

        for Index, Waypoint in next, Waypoints do -- Loops through path waypoints
            if Player.Character and Player.Character:FindFirstChild("Humanoid") and Player.Character:FindFirstChild("HumanoidRootPart") then -- Checks if player is alive
                if Waypoint.Action == Enum.PathWaypointAction.Jump then -- Checks if you need to jump for the waypoint
                    if Variables.IsSteampunk or Variables.IsGhastly or game.PlaceId == 3488584454 then 
                        Player.Character.Humanoid.JumpPower = 36
                        wait()
                    end 

                    Player.Character.Humanoid.Jump = true -- Jumps

                    if Variables.IsSteampunk or game.PlaceId == 3488584454 or Variables.IsGhastly then 
                        wait()
                        Player.Character.Humanoid.JumpPower = 18
                    end
                else
                     if workspace:FindFirstChild("playerSpawn") and workspace.playerSpawn.ClassName == "SpawnLocation" then 
                        Spawn = workspace.playerSpawn 
                    else 
                        Spawn = workspace.SpawnLocation 
                     end 
                     
                    local CheckSpawn = not AttackManager:CheckIntersection(Waypoint.Position, Spawn) or (workspace.dungeon:FindFirstChild("room1") and workspace.dungeon.room1:FindFirstChild("barrier"))
                     
                    if DodgeManager:IsPositionSafe(Waypoint.Position, true) and (Variables.IsDesert or CheckSpawn) then
                        MovementManager:MoveToPosition(Waypoint.Position) -- Moves to waypoint
                    else 
                        --Utilities:Debug("Path Unsafe", tostring(Position))
                        break
                    end
                end
            else 
                break 
            end
        end
    end
end

--// Set player properties 

if Settings.CustomUI.Enabled then
    LobbyUtilities.Gui:ChangeGui()
end

local function CharacterChildAdded(Character)
    Character.ChildAdded:Connect(function(Child)
        if Settings.Dungeon.HideNameplate and Child.Name == "playerNameplate" then 
            wait()
            Child:Destroy()
        end 
    
        if Settings.LagReductions.DestroyGear then 
            if Child.ClassName == "Accessory" then 
                if not Child:FindFirstChild("swing") then 
                    Child:Destroy() 
                else 
                    if Child:FindFirstChildOfClass("Model") then 
                        Child:FindFirstChildOfClass("Model"):Destroy()
                    end
                end 
            end 
        end
    end)
end

if Settings.LagReductions.DisableSpellEffects then
    Player.PlayerGui:WaitForChild("abilityLocal").Disabled = true
    Player.PlayerGui.abilityLocal:WaitForChild("abilityLocal2").Disabled = true
end 

local Character = Player.Character or Player.CharacterAdded:Wait()

if Character:FindFirstChild("Humanoid") then 
    local Humanoid = Character.Humanoid

    Humanoid.WalkSpeed = Variables.Walkspeed
    Humanoid.AutoRotate = false
end

CharacterChildAdded(Character)

Player.CharacterAdded:Connect(function(Character)
    local Humanoid = Character:WaitForChild("Humanoid")

    CharacterChildAdded(Character)

    Humanoid.WalkSpeed = Variables.Walkspeed
    Humanoid.AutoRotate = false
    Variables.IsGoingBack = false 
    Variables.IsPathfinding = false
end)

if Settings.LagReductions.DestroyGear then 
    for Index, Child in next, Player.Character:GetChildren() do 
        if Child.ClassName == "Accessory" then 
            if not Child:FindFirstChild("swing") then 
                Child:Destroy() 
            else 
                if Child:FindFirstChildOfClass("Model") then 
                    Child:FindFirstChildOfClass("Model"):Destroy()
                end
            end 
        end 
    end 
end

if Settings.Dungeon.HideNameplate then
    Player.Character:WaitForChild("playerNameplate"):Destroy()
end

Player.PlayerGui.ChildAdded:Connect(function(Child)
    if Settings.LagReductions.DisableSpellEffects and Child.Name == "abilityLocal" then 
        Child.Disabled = true
        Child:WaitForChild("abilityLocal2").Disabled = true
    end

    if Settings.CustomUI.Enabled and Child.Name == "playerStatus" then 
        LobbyUtilities.Gui:ChangeGui()
    end
end)

local function ChangePartGraphics(Descendant)
    if Descendant.ClassName == "Part" or Descendant.ClassName == "SpawnLocation" or Descendant.ClassName == "WedgePart" or Descendant.ClassName == "Terrain" or Descendant.ClassName == "MeshPart" then
        Descendant.Material = "Plastic"
    elseif Descendant.ClassName == "Decal" or Descendant.ClassName == "Texture" then
        Descendant:Destroy()
    end
end

if Settings.LagReductions.BadGraphics then 
    for Index, Descendant in next, workspace:GetDescendants() do
        ChangePartGraphics(Descendant)
    end

    workspace.DescendantAdded:Connect(function(Descendant)
        ChangePartGraphics(Descendant)
    end)
end

if Variables.IsDesert then 
    for Index, Child in next, workspace:WaitForChild("dungeon"):GetChildren() do
        for Index, Descendant in next, Child:GetChildren() do
            if Descendant.ClassName == "Part" then
                if Descendant.Name == "barrier" or Descendant.Orientation.X % 1 ~= 0 or Descendant.Orientation.Y % 1 ~= 0 or Descendant.Orientation.Z % 1 ~= 0 then 
                    Descendant:Destroy() 
                end 
            elseif Descendant.ClassName == "Model" or Descendant.ClassName == "UnionOperation" or Descendant.ClassName == "WedgePart" then
                Descendant:Destroy() 
            end
        end
    end
end 

--// Start Dungeon 
remotes.changeStartValue:FireServer()
wait(5)

if game.PlaceId == 3277965370 then 
    for Index, Value in next, workspace:GetChildren() do 
        if Value.Name == "Part" and Value.ClassName == "Part" then 
            local Corridor = Value.BrickColor == BrickColor.new("Red flip/flop") and floor(Value.Size.Y) == 4 
            local Wall = (Value.BrickColor == BrickColor.new("Really black") or Value.BrickColor == BrickColor.new("Smoky grey")) and floor(Value.Size.Y) == 51
            local Wall2 = (Value.BrickColor == BrickColor.new("Dark taupe") or Value.BrickColor == BrickColor.new("Dirt brown")) and (floor(Value.Size.Y) == 32 or floor(Value.Size.Z) == 45)
            local Wall3 = Value.BrickColor == BrickColor.new("Black") and floor(Value.Size.Y) == 12 
            local Corridor2 = Value.BrickColor == BrickColor.new("Smoky grey") and floor(Value.Size.Y) == 23
            local Corridor3 = Value.BrickColor == BrickColor.new("Dark stone grey") and floor(Value.Size.X) == 5
            local Stairs = Value.BrickColor == BrickColor.new("Dirt brown") and floor(Value.Size.Y) == 2
            local Stairs2 = Value.BrickColor == BrickColor.new("Smoky grey") and floor(Value.Size.X) == 91
            local Stairs3 = Value.BrickColor == BrickColor.new("Dirt brown") and floor(Value.Size.Y) == 5
            local Stairs4 = Value.BrickColor == BrickColor.new("Black") and floor(Value.Size.Y) == 62
            local Platform1 = Value.BrickColor == BrickColor.new("Bright orange") and floor(Value.Size.X) == 92
    
            if Corridor or Wall or Wall2 or Wall3 or Corridor2 or Corridor3 or Stairs2 then
                Value:Destroy()
            elseif Stairs3 then 
                Value.Size = Value.Size - Vector3.new(0, 3, 0)
            elseif Stairs4 then
                Value.Size = Value.Size - Vector3.new(0, 7, 0)
            elseif Platform1 or Stairs then 
                Value.Position = Value.Position - Vector3.new(0, 2, 0)
            end
        elseif Value.Name == "Union" and Value.ClassName == "UnionOperation" and Value.BrickColor == BrickColor.new("Rust") and (floor(Value.Size.Y) == 23 or floor(Value.Size.Y) == 51) then 
            Value:Destroy()
        end
    end

    workspace.eliteSwordsman.ChildAdded:Connect(function(Child)
        if Child.Name == "Ultimate Swordsman" then 
            repeat wait() until Child.PrimaryPart

            local partHitBox = Instance.new("Part")
            partHitBox.Anchored = true
            partHitBox.CanCollide = false
            partHitBox.Transparency = 1
            partHitBox.CFrame = Child.PrimaryPart.CFrame
            partHitBox.Size = Vector3.new(40, 40, 40)
            partHitBox.Name = "hitBox"
            partHitBox.Parent = workspace

            repeat 
                if Child and Child.PrimaryPart then 
                    partHitBox.CFrame = Child.PrimaryPart.CFrame
                end 

                wait() 
            until not Child or not Child:IsDescendantOf(workspace) or not Child.PrimaryPart
        end
    end)
end

if game.PlaceId == 6216785535 then
    for Index, Child in next, workspace:GetChildren() do 
        if Child.Name == "Model" and Child.ClassName == "Model" then 
            for Index, Descendant in next, Child:GetChildren() do 
                if Descendant.ClassName == "Part" and Descendant.Name == "MeshPart" and floor(Descendant.Size.X) == 93 then 
                    Descendant.Size = Descendant.Size - Vector3.new(0, 2, 0)
                    
                    for Index, Tile in next, Child:GetChildren() do 
                        if Tile.Name == "Aqua tile" or Tile.Name == "Part" then 
                            Tile:Destroy()
                        end 
                    end 
                    
                    break
                end
            end
        end 
    end

    for Index, Value in next, workspace:GetDescendants() do 
        if Value.Name == "Part" and Value.ClassName == "Part" and floor(Value.Size.X) == 6 and floor(Value.Size.Z) == 6 and Value.BrickColor == BrickColor.new("Earth blue") then
            Value:Destroy()
        elseif Value.Name == "MeshPart" and Value.ClassName == "Part" and Value.BrickColor == BrickColor.new("Earth blue") and (floor(Value.Size.X) == 132 or floor(Value.Size.X) == 79) and floor(Value.Size.Z) == 36 then 
            Value.Size = Value.Size + Vector3.new(0, 0, 15)
        end 
    end

    workspace.dungeon.room6.enemyFolder.ChildAdded:Connect(function(Child)
        if Child.Name == "Ancient Temple Protector" then 
            Whitelist = {workspace.Terrain}

            if workspace:FindFirstChild("borders") then 
                table.insert(Whitelist, workspace.borders)
            end

            for Index, Value in next, workspace.dungeon:GetChildren() do 	
                if Value:FindFirstChild("barrier") then 	
                    table.insert(Whitelist, Value.barrier)	
                end	
            end
        end
    end)

    workspace.dungeon.room6.enemyFolder.ChildRemoved:Connect(function(Child)
        if Child.Name == "Ancient Temple Protector" then 
            Whitelist = {workspace.Terrain} 

            if workspace:FindFirstChild("borders") then 
                table.insert(Whitelist, workspace.borders)
            end

            for Index, Room in next, workspace.dungeon:GetChildren() do 
                for Index, Descendant in next, Room:GetChildren() do 
                    if Descendant.ClassName == "Part" or Descendant.ClassName == "UnionOperation" or Descendant.ClassName == "WedgePart" then
                        if Descendant.Transparency < 1 then 
                            table.insert(Whitelist, Descendant)
                        end 
                    elseif Descendant.ClassName == "Model" then 
                        table.insert(Whitelist, Descendant)
                    end 
                end 
            end

            for Index, Child in next, workspace:GetChildren() do 
                if Child.ClassName == "Part" or Child.ClassName == "UnionOperation" or Child.ClassName == "WedgePart" then
                    if Child.Transparency < 1 then 
                        table.insert(Whitelist, Child)
                    end 
                elseif Child.ClassName == "Model" and Child ~= Player.Character then 
                    table.insert(Whitelist, Child)
                end 
            end

            if workspace:FindFirstChild("Map") and workspace.Map:FindFirstChild("Models") then 
                table.insert(Whitelist, workspace.Map.Models)
            end
        end
    end)
end

if game.PlaceId == 4628698373 then
    for Index, Child in next, workspace.Map.Models:GetChildren() do 
        if Child.Name == "Pillar1" then 
            Child:Destroy()
        end
    end

    for Index, Child in next, workspace.Map.Parts.Misc:GetChildren() do 
        if Child.BrickColor == BrickColor.new("Laurel green") then 
            Child:Destroy()
        end
    end
end

if game.PlaceId == 3488584454 then 
    for Index, Value in next, workspace:GetChildren() do 
        if Value.Name == "Model" and Value.ClassName == "Model" and Value:FindFirstChildOfClass("Part") then 
            for Index, Descendant in next, Value:GetChildren() do 
                if Descendant.ClassName == "Part" and Descendant:FindFirstChildOfClass("PointLight") then 
                    Value:Destroy()
                    break 
                end 
            end
        end 
    end
end

if game.PlaceId == 3488584454 then 
    for Index, Value in next, workspace:GetDescendants() do 
        if Value.ClassName == "UnionOperation" and Value.Name == "Union" and ((Value.BrickColor == BrickColor.new("Black") and Value.Material == Enum.Material.Metal) or ((Value.BrickColor == BrickColor.new("Medium stone grey") or Value.BrickColor == BrickColor.new("Laurel green")) and Value.Material == Enum.Material.Concrete)) then
            if Value.BrickColor == BrickColor.new("Laurel green") then 
                Value.Parent:Destroy()
            else
                Value:Destroy()
            end
        elseif Value.ClassName == "Model" and Value:FindFirstChild("Meshes/Venetianlightpole") and Value:FindFirstChild("Meshes/Venetianlightpolelightcurve") then 
            Value:Destroy()
        end 
    end

    local Part = Instance.new("Part")
    Part.Transparency = 0.5
    Part.CanCollide = true
    Part.Position = Vector3.new(-59.6364441, 15.4100065, 118.320824)
    Part.Size = Vector3.new(45, 20, 40)
    Part.Anchored = true 
    Part.Parent = workspace
end

if Variables.IsGhastly then 
    for Index, Border in next, workspace.borders:GetChildren() do 
        if Border.Position.Y >= 165 and Border.Position.Y <= 210 and Border.Position.X <= 100 then 
            Variables.GhastlyBorders[Border] = true 
            Border.Parent = nil
        end 
    end 

    coroutine.wrap(function()
        local Kraken = workspace.dungeon.room4.enemyFolder:WaitForChild("The Kraken")
        local HumanoidRootPart = Kraken:WaitForChild("HumanoidRootPart")

        for Border, _ in next, Variables.GhastlyBorders do 
            Border.Parent = workspace.borders 
        end 
        
        Variables.ForceDestination = Vector3.new(101, 59, -525) 

        repeat wait() until HumanoidRootPart.Position.Y > -20

        Variables.ForceDestination = nil

        Player.Character.LowerTorso.Root:Destroy()
        Player.Character.LowerTorso.Anchored = true
    end)()

    workspace.dungeon.bossRoom.enemyFolder.ChildAdded:Connect(function(Child)
        if Child.Name == "Sea Serpent" then 
            repeat wait() until Child and Child:IsDescendantOf(workspace) and Child.PrimaryPart and Child:FindFirstChild("Humanoid") and Child.Humanoid.Health > 0
            
            while Child and Child:IsDescendantOf(workspace) and Child.PrimaryPart and Child:FindFirstChild("Humanoid") and Child.Humanoid.Health > 0 do
                if Player.Character and Player.Character:FindFirstChild("HumanoidRootPart") and Player.Character:FindFirstChild("Humanoid") then 
                    Player.Character.HumanoidRootPart.CFrame = Child.PrimaryPart.CFrame * CFrame.new(0, 0, 10)
                    Player.Character.Humanoid:ChangeState(11)
                end

                RunService.Heartbeat:Wait()
            end

            Player.Character.HumanoidRootPart.CFrame = Player.Character.HumanoidRootPart.CFrame * CFrame.new(0, 220, 0)
        end
    end)

    for Index, Value in next, workspace:GetDescendants() do 
        if Value.Name == "Roundshot" or Value.Name == "Wooden barrel" then 
            Value:Destroy()
        end 
    end
end

--// Webhook

local Inventory = remotes.reloadInvy:InvokeServer()

local RarityColors = {
    ["legendary"] = "16030217",
    ["epic"] = "9586333",
    ["rare"] = "4935107",
    ["uncommon"] = "6013520",
    ["common"] = "10000536"
}

local function GetClearTime()
    local timeLeft = workspace.timeLeft.Value 
    local Minutes = (timeLeft - timeLeft % 60) / 60
    return string.format("%02i", Minutes)..":"..string.format("%02i", timeLeft - Minutes * 60)
end 

workspace.dungeonProgress.Changed:Connect(function(Value)
    if request and Value ~= "" and Value ~= "inProgress" and Value ~=  "playersNotReady" then
        local WebhookData = {
            {
                color = "0",
                author = {
                    name = "Spooder Quest Drop Notifier";
                };
                fields = {
                    {
                        name = "Dungeon: ";
                        value = MarketplaceService:GetProductInfo(game.PlaceId).Name
                    };
                    {
                        name = "Clear Time: ";
                        value = GetClearTime();
                    };
                };
            }
        }
        
        wait(2)
        
        local NewInventory = remotes.reloadInvy:InvokeServer()
        
        for Name, Data in next, NewInventory do 
            for Index, Value in next, Data do 
                if not Inventory[Name][Index] then 
                    local ItemData = {}
                    ItemData.description = "```\n"..string.gsub(Value.name, "^%l", string.upper).."```"
                    ItemData.color = RarityColors[Value.rarity]
                    table.insert(WebhookData, ItemData)
                end
            end
        end

        request({
            Url = Settings.Webhook.Url;
            Method = "POST";
            Headers = {
                ["Content-Type"] = "application/json";
            };
            Body = game:GetService("HttpService"):JSONEncode({
                embeds = WebhookData
            });
        })
    end
end)

--// Create part matrix 

local PlayerPosition = Player.Character.HumanoidRootPart.Position

local Folder = Instance.new("Folder")
Folder.Name = HttpService:GenerateGUID(false)
Folder.Parent = workspace 

local Size = Variables.IsAquatic and 4.4 or 4.2

for X = -36, 36, 3 do 
    for Z = -36, 36, 3 do
        local Part = Instance.new("Part")
        Part.Transparency = 1
        Part.CanCollide = false 
        Part.Position = PlayerPosition + Vector3.new(X, 0, Z)
        Part.Size = Vector3.new(Size, 10, Size)
        Part.Anchored = true 
        Part.Parent = Folder

        Part.Touched:Connect(function() end)

        table.insert(DodgeManager.PartMatrix, {Instance = Part, X = X, Z = Z})
    end
end

table.sort(DodgeManager.PartMatrix, function(First, Next)
    return (PlayerPosition - First.Instance.Position).Magnitude < (PlayerPosition - Next.Instance.Position).Magnitude
end)

local ChildAdded 

ChildAdded = workspace.ChildAdded:Connect(function(Child)
    if _G.StopFarm then 
        ChildAdded:Disconnect()
    end 

    local Nearest = EnemyManager:GetNearestEnemy()
    local CustomDodge = DodgeManager.CustomDodges[Child.Name] 

    if CustomDodge then 
        CustomDodge.Dodge(Child, Nearest)
    else 
        for Index, Dodge in next, DodgeManager.CustomDodges do 
            if Dodge.Identify(Child, Nearest) then 
                Dodge.Dodge(Child, Nearest)
            end
        end
    end 
end)

workspace.DescendantAdded:connect(function(Descendant)
    if Descendant:IsA("Part") and AttackManager:IsAttackActive(Descendant) and Descendant.Parent then
        local Nearest = EnemyManager:GetNearestEnemy()

        if not DodgeManager.CustomDodges["slamInstakillAttack"].Identify(Descendant.Parent, Nearest) then
            table.insert(AttackManager.ActiveAttacks, Descendant)

            if Nearest and (Variables.BossNames[Nearest.Name:lower()] or Variables.IgnoreAfterDead[Nearest.Name:lower()]) then
                Variables.BossCastedAttacks[Descendant] = Nearest.Name 
            end

            repeat 
                wait() 
            until not Descendant or not AttackManager:IsAttackActive(Descendant) or not Descendant:IsDescendantOf(workspace) or AttackManager:IsAttackSafe(Descendant)

            if Variables.BossCastedAttacks[Descendant] then 
                Variables.BossCastedAttacks[Descendant] = nil 
            end 

            table.remove(AttackManager.ActiveAttacks, table.find(AttackManager.ActiveAttacks, Descendant))
        end
    end
end)

--// Add custom dodges

DodgeManager:AddCustomDodge({
    AttackName = "slamInstakillAttack",
    IdentifyCallback = function(Attack, Nearest)
        if not Nearest or Nearest.Name ~= "Ancient Temple Protector" then
            return false 
        end 

        if Attack.ClassName == "Model" then
            local hitBox = Attack:WaitForChild("hitBox")

            if hitBox.Size.Z == 10 and hitBox.Size.Y == 150 and hitBox.Size.X % 10 == 0 and hitBox.Size.X >= 10 and hitBox.Size.X <= 150 then
                return true
            end
        end

        return false
    end,
    DodgeCallback = function(Attack)
        local hitBox = Attack:WaitForChild("hitBox")
        local PlayerPosition = Player.Character.HumanoidRootPart.Position

        if (Player.Character.HumanoidRootPart.Position - hitBox.Position).Magnitude <= 12 and not Variables.IsDodgingSlam then
            Variables.IsDodgingSlam = true
            Variables.IsGoingBack = true
            Variables.IsPathfinding = true

            Player.Character.HumanoidRootPart.CFrame = Player.Character.HumanoidRootPart.CFrame * CFrame.new(0, 0, -17)

            wait(1.5)

            Variables.IsDodgingSlam = false
            Variables.IsGoingBack = false
            Variables.IsPathfinding = false
        end
    end
})

DodgeManager:AddCustomDodge({
    AttackName = "firstBossLaserPrecast",
    IdentifyCallback = function(Attack, Nearest)
        if not Nearest or Nearest.Name ~= "Temple Core Generator" then
            return false 
        end 

        if Attack.ClassName == "Model" and Attack.Name == "Model" then
            local PrimaryPart, precast = Attack:WaitForChild("PrimaryPart"), Attack:WaitForChild("precast")

            if PrimaryPart and precast and not Attack:FindFirstChild("hitBox") and PrimaryPart.Size == Vector3.new(4, 1, 2) and precast.Size == Vector3.new(16, 1, 150) then
                return true
            end
        end

        return false
    end,
    DodgeCallback = function(Attack)
        table.insert(Variables.LaserAttacks, Attack)
        wait(1.5)
        table.remove(Variables.LaserAttacks, table.find(Variables.LaserAttacks, Attack))
    end
})

DodgeManager:AddCustomDodge({
    AttackName = "finalBossOrbShot",
    IdentifyCallback = function(Attack, Nearest)
        if Attack.ClassName == "Part" and Nearest and Nearest.Name == "Sea King" and Attack.Size == Vector3.new(20, 20, 20) then
            return true
        end

        return false
    end,
    DodgeCallback = function(Attack, Nearest)
        local Origin = Attack.Position

        local MoveConnection 

        MoveConnection = Attack:GetPropertyChangedSignal("Position"):Connect(function()
            MoveConnection:Disconnect()
            
            local partHitBox = Instance.new("Part")
            partHitBox.Anchored = true
            partHitBox.CanCollide = false
            partHitBox.Transparency = 1
            partHitBox.CFrame = CFrame.lookAt(Origin, Attack.Position)
            partHitBox.Size = Vector3.new(Attack.Size.X + 10, 5, 800)
            partHitBox.Name = "hitBox"
            partHitBox.Parent = workspace
            
            repeat 
                wait() 
            until Attack == nil or not Attack:IsDescendantOf(workspace)

            partHitBox:Destroy() 
        end)

        repeat 
            wait() 
        until Attack == nil or not Attack:IsDescendantOf(workspace)
    end
})

DodgeManager:AddCustomDodge({
    AttackName = "firstBossFollowOrb",
    IdentifyCallback = function(Attack, Nearest)
        return Attack.Name == "firstBossFollowOrb"
    end,
    DodgeCallback = function(Attack)

        local Origin = Attack.Position

        Attack:GetPropertyChangedSignal("Position"):Connect(function()
            local partHitBox = Instance.new("Part")
            partHitBox.Anchored = true
            partHitBox.CanCollide = false
            partHitBox.Transparency = 1
            partHitBox.CFrame = CFrame.lookAt(Origin, Attack.Position)
            partHitBox.Size = Vector3.new(Attack.Size.X + 10, 5, 800)
            partHitBox.Name = "hitBox"
            partHitBox.Parent = workspace
            
            repeat 
                wait() 
            until Attack == nil or not Attack:IsDescendantOf(workspace)

            partHitBox:Destroy() 
        end)
    end
})

DodgeManager:AddCustomDodge({
    AttackName = "OrbAttacks",
    IdentifyCallback = function(Attack)
        if Attack.ClassName == "Part" then
            for Index, Projectile in next, Variables.enemyProjectilesFolder:GetChildren() do 
                if Projectile.ClassName == "Part" and (Projectile.Name:lower():find("orb") or Projectile.Name:lower():find("ball")) and Projectile.Size == Attack.Size and Projectile.Name ~= "finalBossOrbShot" then 
                    return true 
                end
            end
        end

        return false
    end,
    DodgeCallback = function(Attack)
        local Origin = Attack.Position

        local MoveConnection 

        MoveConnection = Attack:GetPropertyChangedSignal("Position"):Connect(function()
            MoveConnection:Disconnect()
            
            local partHitBox = Instance.new("Part")
            partHitBox.Anchored = true
            partHitBox.CanCollide = false
            partHitBox.Transparency = 1
            partHitBox.CFrame = CFrame.lookAt(Origin, Attack.Position)
            partHitBox.Size = Vector3.new(Attack.Size.X + 5, 5, 800)
            partHitBox.Name = "hitBox"
            partHitBox.Parent = workspace
            
            repeat 
                wait() 
            until Attack == nil or not Attack:IsDescendantOf(workspace)

            partHitBox:Destroy() 
        end)
    end
})

DodgeManager:AddCustomDodge({
    AttackName = "mageProjectileBall",
    IdentifyCallback = function(Attack)
        return Attack.Name == "mageProjectileBall"
    end,
    DodgeCallback = function(Attack)
        repeat wait() until Attack.PrimaryPart 

        local Origin = Attack.PrimaryPart.Position

        local MoveConnection 

        MoveConnection = Attack.PrimaryPart:GetPropertyChangedSignal("Position"):Connect(function()
            MoveConnection:Disconnect()
            
            local partHitBox = Instance.new("Part")
            partHitBox.Anchored = true
            partHitBox.CanCollide = false
            partHitBox.Transparency = 1
            partHitBox.CFrame = CFrame.lookAt(Origin, Attack.PrimaryPart.Position)
            partHitBox.Size = Vector3.new(4, 5, 800)
            partHitBox.Name = "hitBox"
            partHitBox.Parent = workspace
            
            repeat 
                wait() 
            until Attack == nil or not Attack:IsDescendantOf(workspace)

            partHitBox:Destroy() 
        end)
    end
})

DodgeManager:AddCustomDodge({
    AttackName = "secondBossCrescent",
    IdentifyCallback = function(Attack)
        return Attack.Name == "secondBossCrescent"
    end,
    DodgeCallback = function(Attack)
        repeat wait() until Attack.PrimaryPart 

        local Origin = Attack.PrimaryPart.Position

        local MoveConnection 

        MoveConnection = Attack.PrimaryPart:GetPropertyChangedSignal("Position"):Connect(function()
            MoveConnection:Disconnect()
            
            local partHitBox = Instance.new("Part")
            partHitBox.Anchored = true
            partHitBox.CanCollide = false
            partHitBox.Transparency = 1
            partHitBox.CFrame = CFrame.lookAt(Origin, Attack.PrimaryPart.Position)
            partHitBox.Size = Vector3.new(12, 5, 800)
            partHitBox.Name = "hitBox"
            partHitBox.Parent = workspace
            
            repeat 
                wait() 
            until Attack == nil or not Attack:IsDescendantOf(workspace)

            partHitBox:Destroy() 
        end)
    end
})

DodgeManager:AddCustomDodge({
    AttackName = "thirdBossSafeSpot",
    IdentifyCallback = function(Attack, Nearest)
        return Attack.Name == "thirdBossSafeSpot"
    end,
    DodgeCallback = function(Attack)
        repeat wait() until Attack:FindFirstChild("precast") and Attack.PrimaryPart
        Variables.ForceDestination = Attack.PrimaryPart.Position
        repeat wait() until not Attack or not Attack:IsDescendantOf(workspace) or not Attack:FindFirstChild("precast") or Attack.precast.Transparency == 1
        Variables.ForceDestination = nil
    end
})

DodgeManager:AddCustomDodge({
    AttackName = "BossMiniMobs",
    IdentifyCallback = function(Attack, Nearest)
        return Variables.BossMiniMobs[Attack.Name]
    end,
    DodgeCallback = function(Attack)
        Attack:WaitForChild("Humanoid")

        repeat wait() until Attack.PrimaryPart

        local partHitBox = Instance.new("Part")
        partHitBox.Anchored = true
        partHitBox.CanCollide = false
        partHitBox.Transparency = 1
        partHitBox.CFrame = Attack.PrimaryPart.CFrame
        partHitBox.Size = Vector3.new(5, 5, 5)
        partHitBox.Name = "hitBox"
        partHitBox.Parent = workspace

        Attack.PrimaryPart:GetPropertyChangedSignal("CFrame"):Connect(function()
            partHitBox.CFrame = Attack.PrimaryPart.CFrame
        end)

        Attack.Humanoid.Health = 0 

        wait(3)

        Attack:Destroy()
    end
})

DodgeManager:AddCustomDodge({
    AttackName = "thirdBossLifeStealBeams",
    IdentifyCallback = function(Attack, Nearest)
        return Attack.Name == "thirdBossLifeStealBeams"
    end,
    DodgeCallback = function(Attack, Nearest)
        local partHitBox = Instance.new("Part")
        partHitBox.Anchored = true
        partHitBox.CanCollide = false
        partHitBox.Transparency = 1
        partHitBox.CFrame = Nearest.PrimaryPart.CFrame * CFrame.new(0, 0, -75)
        partHitBox.Size = Vector3.new(40, 40, 150)
        partHitBox.Name = "hitBox"
        partHitBox.Parent = workspace

        wait(1.5)

        partHitBox:Destroy()
    end
})

DodgeManager:AddCustomDodge({
    AttackName = "thirdBossSafeSpots",
    IdentifyCallback = function(Attack, Nearest)
        return Attack.Name == "thirdBossSafeSpots"
    end,
    DodgeCallback = function(Attack, Nearest)
        Attack:WaitForChild("precast")

        local Distance = huge 
        local Closest 
    
        for Index, Value in next, Attack:GetChildren() do
            if Value.Name == "hitBox" then
                local Magnitude = (Player.Character.HumanoidRootPart.Position - Value.Position).Magnitude

                if Magnitude < Distance then
                    Distance = Magnitude
                    Closest = Value
                end
            elseif Value.Name == "cog" then
                Value:Destroy()
            end
        end
    
        local SideA = (Closest.CFrame * CFrame.new(0, 0, (Closest.Size.Z / -2) + 5)).Position
        local SideB = (Closest.CFrame * CFrame.new(0, 0, (Closest.Size.Z / 2) - 5)).Position

        local BestSafeSpot = (Nearest.PrimaryPart.Position - SideA).Magnitude < (Nearest.PrimaryPart.Position - SideB).Magnitude and SideA or SideB
          
        Variables.ForceDestination = BestSafeSpot

        repeat wait() until not Attack or not Attack:IsDescendantOf(workspace) or not Attack:FindFirstChild("precast") or Attack.precast.Transparency == 1
        
        Variables.ForceDestination = nil
    end
})

DodgeManager:AddCustomDodge({
    AttackName = "safeSpotCircle",
    IdentifyCallback = function(Attack, Nearest)
        return Attack.Name == "safeSpotCircle"
    end,
    DodgeCallback = function(Attack, Nearest)
        Attack:GetPropertyChangedSignal("Position"):Wait()

        Variables.ForceDestination = Attack.Position

        while Attack ~= nil and workspace:FindFirstChild(Attack.Name) and workspace:FindFirstChild(Attack.Name).Transparency > 0 do
            wait()
        end

        --repeat wait() until not Attack or not Attack:IsDescendantOf(workspace) or Attack.Transparency == 1
        
        Variables.ForceDestination = nil
    end
})

DodgeManager:AddCustomDodge({
    AttackName = "forceField",
    IdentifyCallback = function(Attack, Nearest)
        return Attack.Name == "forceField"
    end,
    DodgeCallback = function(Attack, Nearest)
        Variables.ForceCount = Variables.ForceCount + 1
        
        Variables.ForceDestination = Attack.Position

        if Variables.ForceCount == 2 then 
            Variables.ForceCount = 0
            Variables.ForceDestination = nil
        end
    end
})

DodgeManager:AddCustomDodge({
    AttackName = "Kraken Tentacle",
    IdentifyCallback = function(Attack, Nearest)
        return Attack.Name == "Kraken Tentacle"
    end,
    DodgeCallback = function(Attack, Nearest)
        local Debounce = true
        Attack:WaitForChild("Humanoid")

        while Attack and Attack:IsDescendantOf(workspace) and Attack:FindFirstChild("Humanoid") and Attack.Humanoid.Health > 0 do
            if #Attack.Humanoid:GetPlayingAnimationTracks() == 2 and Debounce then
                Debounce = false

                local partHitBox = Instance.new("Part")
                partHitBox.CFrame = Attack.PrimaryPart.CFrame * CFrame.new(0, 10, -60)
                partHitBox.Size = Vector3.new(14, 5, 128)
                partHitBox.CanCollide = false
                partHitBox.Transparency = 1
                partHitBox.Anchored = true
                partHitBox.Name = "hitBox"
                partHitBox.Parent = workspace
                wait(3)
                partHitBox:Destroy()      

                wait(3)
                Debounce = true
            end

            wait()
        end
    end
})

local MainLoopConnection 

local CustomSize = {
    ["the destroyer"] = 4.5,
    ["demon lord azrallik"] = 4.2
}

coroutine.wrap(function()
    while wait() do 
        local Swing, AttackSpeed 

        if Player.Character then
            for Index, Value in next, Player.Character:GetChildren() do
                if Value.ClassName == "Accessory" and Value:FindFirstChild("swing") and Value:FindFirstChild("attackSpeed") then
                    Swing, AttackSpeed = Value.swing, Value.attackSpeed.Value
                end
            end
        end

        local Nearest = EnemyManager:GetNearestEnemy()

        if Nearest and Nearest:FindFirstChild("HumanoidRootPart") and Nearest.PrimaryPart and Player.Character and Player.Character:FindFirstChild("HumanoidRootPart") and (Player.Character.HumanoidRootPart.Position - Nearest.HumanoidRootPart.Position).Magnitude - Nearest.PrimaryPart.Size.Z / 2 < 13 then 
            wait(AttackSpeed / 10)
            Swing:FireServer()
        end
    end
end)()


sethiddenproperty = sethiddenproperty or set_hidden_property or sethiddenprop or set_hidden_prop
setsimulationradius = setsimulationradius or set_simulation_radius or function(Radius) if sethiddenproperty then sethiddenproperty(Player, "SimulationRadius", Radius) end end

MainLoopConnection = RunService.Heartbeat:Connect(function()
    if _G.StopFarm then
        MainLoopConnection:Disconnect()
    end

    if Settings.Autofarm.Instakill and setsimulationradius then
        setsimulationradius(1000, 1000)
        Player.MaximumSimulationRadius = 1000
    end

    if Player.Character and Player.Character:FindFirstChild("HumanoidRootPart") then -- Checks is player character exists
        local PlayerCFrame = Player.Character.HumanoidRootPart.CFrame -- Defines player cframe into a variable

        local Nearest = EnemyManager:GetNearestEnemy() -- Gets nearest enemy

        if Variables.IsDesert and Settings.Autofarm.Instakill and not Variables.ForceDestination then 
            Variables.ForceDestination = workspace.dungeon.bossRoom.startPart.Position
        end

        if Settings.Autofarm.Instakill then 
            coroutine.wrap(function()
                for Index, Child in next, workspace.dungeon:GetChildren() do
                    if Child:FindFirstChild("enemyFolder") then 
                        for SecondIndex, Descendant in next, Child.enemyFolder:GetChildren() do 
                            if Variables.InstakillMobs[Descendant.Name] and Descendant:IsA("Model") and Descendant:FindFirstChild("HumanoidRootPart") and Descendant:FindFirstChild("Humanoid") then 
                                if game.PlaceId == 3277965370 or game.PlaceId == 3119903031 then 
                                    local Timeout = false 

                                    delay(2, function()
                                        Timeout = true
                                    end)

                                    repeat wait() until (Descendant:FindFirstChildWhichIsA("Accessory") and Descendant:FindFirstChildWhichIsA("Accessory"):WaitForChild("Handle"):FindFirstChild("AccessoryWeld")) or Timeout
                                end 

                                Descendant.Humanoid.Health = 0
                            end
                        end
                    end
                end
            end)()
        end

        for Index, Data in next, DodgeManager.PartMatrix do -- Sets all parts in grid to correct position
            if Nearest and Nearest:FindFirstChild("HumanoidRootPart") and Nearest.Name == "Ancient Temple Protector" then 
                local NearestPosition = Nearest.HumanoidRootPart.Position 

                PlayerCFrame = CFrame.new(PlayerCFrame.Position, Vector3.new(NearestPosition.X, PlayerCFrame.Position.Y, NearestPosition.Z))
            end 

            Data.Instance.CFrame = PlayerCFrame * CFrame.new(Data.X, 0, Data.Z)

            if Nearest and CustomSize[Nearest.Name:lower()] then 
                local Size = CustomSize[Nearest.Name:lower()]  

                Data.Instance.Size = Vector3.new(Size, 10, Size)
            else 
                Data.Instance.Size = Vector3.new(Size, 10, Size)
            end
        end

        if Nearest and Nearest.Name:lower() == "deity of the volcano" then 
            if workspace.dungeon.room5:FindFirstChild("barrier") then 
                workspace.dungeon.room5.barrier:Destroy()
            end 
            
            Variables.ForceDestination = Vector3.new(-1327.83984, 10.8149433, 696.619507)
        else 
            if Variables.ForceDestination == Vector3.new(-1327.83984, 10.8149433, 696.619507) then
                Variables.ForceDestination = nil 
            end
        end

        if Nearest and Nearest.Name == "Sea King" then 
            if not workspace:FindFirstChild("hitBox") then
                Variables.IsSeaKing = true 

                if Player.Character:FindFirstChild("Humanoid") then 
                    Player.Character.Humanoid.WalkSpeed = min(Variables.Walkspeed, 32)
                end
            else 
                Variables.IsSeaKing = false
            end

            DodgeManager.BackDistance = 50
        else 
            Variables.IsSeaKing = false
        end

        if Variables.ForceDestination and Player.Character:FindFirstChild("Humanoid") then 
            Player.Character.Humanoid.WalkSpeed = min(Variables.ForceDestination == Vector3.new(-1327.83984, 10.8149433, 696.619507) and 32 or 30, Variables.Walkspeed)
        else 
            if Player.Character:FindFirstChild("Humanoid") then 
                Player.Character.Humanoid.WalkSpeed = Variables.Walkspeed
            end
        end

        if not DodgeManager:IsPositionSafe(DodgeManager.PartMatrix[1].Instance) then -- Checks if player is not currently safe
            local SafePosition = DodgeManager:GetOptimalPosition() -- Gets a safe position

            local TPDistance = 8

            if (Nearest and Nearest.Parent and workspace.dungeon:FindFirstChild("room7") and Nearest.Parent == workspace.dungeon.room7.enemyFolder) or not Variables.IsAquatic then 
                if not Variables.IsSeaKing then 
                    TPDistance = 6.5 
                else 
                    TPDistance = 6
                end
            end

            if SafePosition then -- If safe position exists
                if not Settings.Autofarm.SmallTeleports or (PlayerCFrame.Position - SafePosition.Position).Magnitude > TPDistance then -- Check if distance between safe position and player are less than 8
                    Variables.IsPathfinding = true
                    Variables.IsGoingBack = true
                    MovementManager:MoveToPosition(SafePosition.Position) -- Moves to safe position
                    Variables.IsGoingBack = false
                    Variables.IsPathfinding = false
                else
                    Player.Character.HumanoidRootPart.CFrame = SafePosition -- Teleports to safe position
                end
            end
        else 
            if (Nearest and Nearest:FindFirstChild("HumanoidRootPart") and Nearest:FindFirstChild("Humanoid") and Nearest.Humanoid.Health > 0) or Variables.ForceDestination then -- Checks is enemy is alive
                local Magnitude = (Player.Character.HumanoidRootPart.Position - Vector3.new(Nearest.HumanoidRootPart.Position.X, Player.Character.HumanoidRootPart.Position.Y, Nearest.HumanoidRootPart.Position.Z)).Magnitude -- Gets the distance between the player and the nearest enemy
                
                if Nearest.Name == "Sanada Yukimura" then 
                    Magnitude = (Player.Character.HumanoidRootPart.Position - Nearest.HumanoidRootPart.Position).Magnitude
                end 

                if floor(Magnitude) <= Variables.AttackRange and not (Variables.IsPathfinding and Variables.ForceDestination) then -- Checks if player is close enough to attack
                    EnemyManager:LookAtNearestEnemy() -- Looks at nearest enemy

                    delay(0.02, function()
                        PlayerAttackManager:CastSpells()
                    end)
                end

                if not Variables.IsDodgingSlam then
                    if (floor(Magnitude) > DodgeManager.BackDistance or Variables.ForceDestination) and not Variables.IsPathfinding then -- Checks if the player is too close to the enemy
                        Variables.IsPathfinding = true
                        EnemyManager:MoveToNearestEnemy() -- Moves to nearest enemy
                        Variables.IsPathfinding = false
                    elseif floor(Magnitude) < DodgeManager.BackDistance and not Variables.IsGoingBack and not Variables.ForceDestination then -- Checks if player is too far from the enemy
                        local BackVector = DodgeManager:GetBackVector(Nearest.Name == "Ancient Temple Protector") -- Gets backwards position

                        if BackVector then
                            Variables.IsGoingBack = true
                            MovementManager:MoveToPosition(BackVector)
                            Variables.IsGoingBack = false
                        end
                    end
                end
            end
        end
    end
end)
