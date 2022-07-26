repeat wait() until game:IsLoaded()

local LunaUI = {}

do  local ui =  game:GetService("CoreGui").RobloxGui.Modules:FindFirstChild("Luna")  if ui then ui:Destroy() end end

local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local LocalPlayer = game:GetService("Players").LocalPlayer
local Mouse = LocalPlayer:GetMouse()
local tween = game:GetService("TweenService")

local LunaColor = {RainbowColorValue = 0, HueSelectionPosition = 0}
local PresetColor = Color3.fromRGB(85, 85, 127)


coroutine.wrap(
	function()
		while wait() do
			LunaColor.RainbowColorValue = LunaColor.RainbowColorValue + 1 / 255
			LunaColor.HueSelectionPosition = LunaColor.HueSelectionPosition + 1

			if LunaColor.RainbowColorValue >= 1 then
				LunaColor.RainbowColorValue = 0
			end

			if LunaColor.HueSelectionPosition == 160 then
				LunaColor.HueSelectionPosition = 0
			end
		end
	end
)()


local Luna = Instance.new("ScreenGui")
Luna.Name = "Luna"
Luna.Parent = game:GetService("CoreGui").RobloxGui.Modules
Luna.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

if syn then
	syn.protect_gui(game:GetService("CoreGui").RobloxGui.Modules:FindFirstChild("Luna"))
end

getgenv().Settings = {
	Key = Enum.KeyCode.RightControl
}

local function MakeDraggable(topbarobject, object)
	local Dragging = nil
	local DragInput = nil
	local DragStart = nil
	local StartPosition = nil

	local function Update(input)
		local Delta = input.Position - DragStart
		local pos =
			UDim2.new(
				StartPosition.X.Scale,
				StartPosition.X.Offset + Delta.X,
				StartPosition.Y.Scale,
				StartPosition.Y.Offset + Delta.Y
			)
		local Tween = TweenService:Create(object, TweenInfo.new(0.2), {Position = pos})
		Tween:Play()
	end

	topbarobject.InputBegan:Connect(
		function(input)
			if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
				Dragging = true
				DragStart = input.Position
				StartPosition = object.Position

				input.Changed:Connect(
					function()
						if input.UserInputState == Enum.UserInputState.End then
							Dragging = false
						end
					end
				)
			end
		end
	)

	topbarobject.InputChanged:Connect(
		function(input)
			if
				input.UserInputType == Enum.UserInputType.MouseMovement or
				input.UserInputType == Enum.UserInputType.Touch
			then
				DragInput = input
			end
		end
	)

	UserInputService.InputChanged:Connect(
		function(input)
			if input == DragInput and Dragging then
				Update(input)
			end
		end
	)
end

function LunaUI.create()
	LunaFocus = false
	
	local MainSceen = Instance.new("Frame")
	
	MainSceen.Name = "MainSceen"
	MainSceen.Parent = Luna
	MainSceen.Active = true
	MainSceen.AnchorPoint = Vector2.new(0.5, 0.5)
	MainSceen.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
	MainSceen.BorderColor3 = Color3.fromRGB(10, 10, 10)
	MainSceen.ClipsDescendants = true
	MainSceen.Position = UDim2.new(0.474336475, 0, 0.324846715, 0)
	MainSceen.Size = UDim2.new(0, 0, 0, 0)
	
	tween:Create(MainSceen,TweenInfo.new(0.4,Enum.EasingStyle.Back),{Size = UDim2.new(0, 525, 0, 440)}):Play()
	
	local Main_UiConner = Instance.new("UICorner")
	
	Main_UiConner.CornerRadius = UDim.new(0, 9)
	Main_UiConner.Name = "Main_UiConner"
	Main_UiConner.Parent = MainSceen
	
	local ClickFrame = Instance.new("Frame")
	
	ClickFrame.Name = "ClickFrame"
	ClickFrame.Parent = MainSceen
	ClickFrame.AnchorPoint = Vector2.new(0.5, 0.5)
	ClickFrame.BackgroundColor3 = Color3.fromRGB(240, 244, 242)
	ClickFrame.BackgroundTransparency = 1.000
	ClickFrame.Position = UDim2.new(0.160435274, 0, 0.499144733, 0)
	ClickFrame.Size = UDim2.new(0, 168, 0, 439)
	
	local NameReal = Instance.new("TextLabel")
	
	NameReal.Name = "NameReal"
	NameReal.Parent = MainSceen
	NameReal.Active = true
	NameReal.AnchorPoint = Vector2.new(0.5, 0)
	NameReal.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	NameReal.BackgroundTransparency = 1.000
	NameReal.Position = UDim2.new(0.14046073, 17, 0.915909111, 0)
	NameReal.Size = UDim2.new(0.322724581, -14, 0.0380000025, 20)
	NameReal.Font = Enum.Font.GothamBold
	NameReal.Text = "Takab Hub"
	NameReal.TextColor3 = Color3.fromRGB(85, 85, 127)
	NameReal.TextSize = 13.000
	NameReal.TextWrapped = true
	NameReal.TextXAlignment = Enum.TextXAlignment.Left
	
	local Logo_2 = Instance.new("ImageLabel")
	
	Logo_2.Name = "Logo"
	Logo_2.Parent = MainSceen
	Logo_2.Active = true
	Logo_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Logo_2.BackgroundTransparency = 1.000
	Logo_2.Position = UDim2.new(0.0647619069, 0, 0.0454545468, 0)
	Logo_2.Size = UDim2.new(0, 100, 0, 100)
	Logo_2.Image = "rbxassetid://9513349012"
	
	local MainSceen2 = Instance.new("Frame")
	
	MainSceen2.Name = "MainSceen2"
	MainSceen2.Parent = MainSceen
	MainSceen2.Active = true
	MainSceen2.AnchorPoint = Vector2.new(0.5, 0.5)
	MainSceen2.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
	MainSceen2.BackgroundTransparency = 1.000
	MainSceen2.BorderSizePixel = 0
	MainSceen2.Position = UDim2.new(0.499762595, 0, 0.499515384, 0)
	MainSceen2.Size = UDim2.new(0, 524, 0, 439)
	
	local ScolTapBarFrame = Instance.new("Frame")
	
	ScolTapBarFrame.Name = "ScolTapBarFrame"
	ScolTapBarFrame.Parent = MainSceen2
	ScolTapBarFrame.AnchorPoint = Vector2.new(0.5, 0.5)
	ScolTapBarFrame.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
	ScolTapBarFrame.BackgroundTransparency = 1.000
	ScolTapBarFrame.BorderSizePixel = 0
	ScolTapBarFrame.Position = UDim2.new(0.160025209, 0, 0.583629191, 5)
	ScolTapBarFrame.Selectable = true
	ScolTapBarFrame.Size = UDim2.new(0.341, -10, 0.531, 23)
	
	local KeyButton = Instance.new("TextButton")

	KeyButton.Name = "Key"
	KeyButton.Parent = ScolTapBarFrame
	KeyButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	KeyButton.BackgroundTransparency = 1.000
	KeyButton.Position = UDim2.new(0.07732898, 0, 1, 0)
	KeyButton.Size = UDim2.new(0, 154, 0, 26)
	KeyButton.Font = Enum.Font.Gotham
	KeyButton.Text = "[ " .. getgenv().Settings.Key.Name .." ] "
	KeyButton.TextColor3 = Color3.fromRGB(109, 109, 109)
	KeyButton.TextSize = 12.000
	KeyButton.TextXAlignment = Enum.TextXAlignment.Left
	
	KeyButton.MouseButton1Click:Connect(function()
		KeyButton.Text = "Select Key"
		local inputwait = UserInputService.InputBegan:wait()
		if inputwait.KeyCode.Name ~= "Unknown" then
			getgenv().Settings.Key = inputwait.KeyCode
			KeyButton.Text = "[ " .. getgenv().Settings.Key.Name .." ] "

			Key = inputwait.KeyCode.Name
		end
	end)
	local uitoggled = false
	UserInputService.InputBegan:Connect(function(io, p)
		if io.KeyCode == getgenv().Settings.Key then
			if uitoggled == false then
				uitoggled = true
				TweenService:Create(
					MainSceen,
					TweenInfo.new(.5, Enum.EasingStyle.Quart, Enum.EasingDirection.In),
					{Size = UDim2.new(0, 0, 0, 0)}
				):Play()
			else
				TweenService:Create(
					MainSceen,
					TweenInfo.new(.4, Enum.EasingStyle.Back, Enum.EasingDirection.Out),
					{Size = UDim2.new(0, 525, 0, 440)}
				):Play()
				repeat wait() until MainSceen.Size == UDim2.new(0, 525, 0, 440)
				uitoggled = false
			end
		end
	end)
	
	local ScrollingFrame_Menubar = Instance.new("ScrollingFrame")
	
	ScrollingFrame_Menubar.Name = "ScrollingFrame_Menubar"
	ScrollingFrame_Menubar.Parent = ScolTapBarFrame
	ScrollingFrame_Menubar.Active = true
	ScrollingFrame_Menubar.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	ScrollingFrame_Menubar.BackgroundTransparency = 1.000
	ScrollingFrame_Menubar.BorderColor3 = Color3.fromRGB(27, 42, 53)
	ScrollingFrame_Menubar.BorderSizePixel = 0
	ScrollingFrame_Menubar.Position = UDim2.new(0, 0, 0.0191065446, 0)
	ScrollingFrame_Menubar.Size = UDim2.new(1.05936217, -10, 0.923487365, 23)
	ScrollingFrame_Menubar.HorizontalScrollBarInset = Enum.ScrollBarInset.ScrollBar
	ScrollingFrame_Menubar.ScrollBarThickness = 3
	
	local UIListLayout_Menubar = Instance.new("UIListLayout")
	local UIPadding_Menubar = Instance.new("UIPadding")
	
	UIListLayout_Menubar.Name = "UIListLayout_Menubar"
	UIListLayout_Menubar.Parent = ScrollingFrame_Menubar
	UIListLayout_Menubar.SortOrder = Enum.SortOrder.LayoutOrder
	UIListLayout_Menubar.Padding = UDim.new(0, 12)

	UIPadding_Menubar.Name = "UIPadding_Menubar"
	UIPadding_Menubar.Parent = ScrollingFrame_Menubar
	UIPadding_Menubar.PaddingLeft = UDim.new(0, 30)
	UIPadding_Menubar.PaddingTop = UDim.new(0, 7)
	
	local PageOrders = -1
	
	local Container_Page = Instance.new("Frame")
	
	Container_Page.Name = "Container_Page"
	Container_Page.Parent = MainSceen2
	Container_Page.AnchorPoint = Vector2.new(0.5, 0.5)
	Container_Page.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Container_Page.BackgroundTransparency = 1.000
	Container_Page.ClipsDescendants = true
	Container_Page.Position = UDim2.new(0.660313249, 0, 0.499615937, 0)
	Container_Page.Size = UDim2.new(0, 355, 0, 439)
	
	local pagesFolder = Instance.new("Folder")
	
	pagesFolder.Name = "pagesFolder"
	pagesFolder.Parent = Container_Page
	
	local UIPage = Instance.new("UIPageLayout")
	
	UIPage.Name = "UIPage"
	UIPage.Parent = pagesFolder
	UIPage.SortOrder = Enum.SortOrder.LayoutOrder
	UIPage.VerticalAlignment = Enum.VerticalAlignment.Bottom
	UIPage.EasingStyle = Enum.EasingStyle.Cubic
	UIPage.Padding = UDim.new(0, 15)
	UIPage.FillDirection = Enum.FillDirection.Vertical
	UIPage.TweenTime = 0.3
	
	MakeDraggable(ClickFrame,MainSceen)
	
	local LunaTab = {}
	
	local FrameNotification = Instance.new("Frame")
	
	FrameNotification.Name = "FrameNotification"
	FrameNotification.Parent = Luna
	FrameNotification.Active = true
	FrameNotification.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	FrameNotification.BackgroundTransparency = 1.000
	FrameNotification.ClipsDescendants = true
	FrameNotification.Position = UDim2.new(0.844123185, 0, 0.0110429451, 0)
	FrameNotification.Size = UDim2.new(0.146448776, 0, 0.973006129, 0)
	
	local UIListLayout = Instance.new("UIListLayout")
	local UIPadding = Instance.new("UIPadding")
	
	UIListLayout.Parent = FrameNotification
	UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
	UIListLayout.Padding = UDim.new(0, 5)

	UIPadding.Parent = FrameNotification
	UIPadding.PaddingLeft = UDim.new(0, 5)
	UIPadding.PaddingTop = UDim.new(0, 5)
	
	function LunaUI:Notification(text,text2,delays)
		local MainNotification = Instance.new("Frame")
		local UICorner = Instance.new("UICorner")

		MainNotification.Name = "Main"
		MainNotification.Parent = FrameNotification
		MainNotification.Active = true
		MainNotification.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
		MainNotification.BackgroundTransparency = 0.100
		MainNotification.BorderColor3 = Color3.fromRGB(27, 42, 53)
		MainNotification.BorderSizePixel = 0
		MainNotification.Size = UDim2.new(0, 0, 0.0117016882, 0)

		UICorner.Parent = MainNotification
		
		local Line = Instance.new("Frame")

		Line.Name = "Line"
		Line.Parent = MainNotification
		Line.BackgroundColor3 = Color3.fromRGB(106, 106, 106)
		Line.BorderSizePixel = 0
		Line.Position = UDim2.new(0, 0, 0.290697694, 0)
		Line.Size = UDim2.new(0.999320805, 0, 0.0117016882, 0)

		local Header = Instance.new("TextLabel")

		Header.Name = "Header"
		Header.Parent = MainNotification
		Header.Active = true
		Header.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Header.BackgroundTransparency = 1.000
		Header.Size = UDim2.new(0.999320805, 0, 0.292542189, 0)
		Header.Font = Enum.Font.Gotham
		Header.Text = tostring(text)
		Header.TextColor3 = Color3.fromRGB(255, 255, 255)
		Header.TextSize = 12.000

		local Description = Instance.new("TextLabel")

		Description.Name = "Description"
		Description.Parent = MainNotification
		Description.Active = true
		Description.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Description.BackgroundTransparency = 1.000
		Description.Position = UDim2.new(0, 0, 0.383720934, 0)
		Description.Size = UDim2.new(0.999320805, 0, 0.620189488, 0)
		Description.Font = Enum.Font.Gotham
		Description.Text = tostring(text2)
		Description.TextColor3 = Color3.fromRGB(186, 186, 186)
		Description.TextSize = 11.000
		Description.TextYAlignment = Enum.TextYAlignment.Top
		
		TweenService:Create(
			MainNotification,
			TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
			{Size = UDim2.new(0.969957054, 0, 0.10844893, 0)}
		):Play()
		
		delay(tonumber(delays),function()
			TweenService:Create(
				Header,
				TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
				{TextTransparency = 1}
			):Play()
			TweenService:Create(
				Description,
				TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
				{TextTransparency = 1}
			):Play()
			TweenService:Create(
				MainNotification,
				TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
				{Size = UDim2.new(0, 0, 0.10844893, 0)}
			):Play()
			wait(.2)
			MainNotification:Destroy()
		end
		)
	end
	
	function LunaTab.createtab(text,logo)
		if logo == nil then
			logo = 7072981376
		end
		
		PageOrders = PageOrders + 1
		
		local name = tostring(text) or tostring(math.random(1,5000))
		
		local Frame_Tap = Instance.new("Frame")
		
		Frame_Tap.Name = text.."Server"
		Frame_Tap.Parent = ScrollingFrame_Menubar
		Frame_Tap.Active = true
		Frame_Tap.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Frame_Tap.BackgroundTransparency = 1.000
		Frame_Tap.Size = UDim2.new(0, 70, 0, 24)
		
		local TextButton_Tap = Instance.new("TextButton")
		
		TextButton_Tap.Name = "TextButton_Tap"
		TextButton_Tap.Parent = Frame_Tap
		TextButton_Tap.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		TextButton_Tap.BackgroundTransparency = 1.000
		TextButton_Tap.Position = UDim2.new(0.114666745, 0, 0.100000381, 0)
		TextButton_Tap.Size = UDim2.new(0, 66, 0, 20)
		TextButton_Tap.Font = Enum.Font.GothamBold
		TextButton_Tap.Text = tostring(text)
		TextButton_Tap.TextColor3 = Color3.fromRGB(109, 109, 109)
		TextButton_Tap.TextSize = 11.000
		TextButton_Tap.TextWrapped = true
		TextButton_Tap.TextXAlignment = Enum.TextXAlignment.Left
		
		local Logo = Instance.new("ImageLabel")
		
		Logo.Name = "Logo"
		Logo.Parent = Frame_Tap
		Logo.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Logo.BackgroundTransparency = 1.000
		Logo.Position = UDim2.new(-0.19, 0, 0.18, 0)
		Logo.Size = UDim2.new(0, 15, 0, 15)
		Logo.Image = "http://www.roblox.com/asset/?id="..tostring(logo)
		Logo.ImageColor3 = Color3.fromRGB(255, 255, 255)
		Logo.ImageTransparency = 0.6
		
		local ButtonGradient = Instance.new("Frame")
		local UICorner = Instance.new("UICorner")
		local UIGradient = Instance.new("UIGradient")

		ButtonGradient.Name = "ButtonGradient"
		ButtonGradient.Parent = Frame_Tap
		ButtonGradient.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		ButtonGradient.Position = UDim2.new(-0.242476985, 0, 0, 0)
		ButtonGradient.Size = UDim2.new(0, 0, 0, 22)
		ButtonGradient.ZIndex = 0

		UICorner.CornerRadius = UDim.new(0, 4)
		UICorner.Parent = ButtonGradient

		UIGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(85, 85, 127)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(68, 68, 102))}
		UIGradient.Parent = ButtonGradient
		
		local MainPage = Instance.new("Frame")
		
		MainPage.Name = name.."_MainPage"
		MainPage.Parent = pagesFolder
		MainPage.Active = true
		MainPage.BackgroundColor3 = Color3.fromRGB(42, 42, 42)
		MainPage.BackgroundTransparency = 1.000
		MainPage.BorderSizePixel = 0
		MainPage.ClipsDescendants = true
		MainPage.Position = UDim2.new(0, 0, -0.000269166427, 0)
		MainPage.Size = UDim2.new(0, 356, 0, 439)
		
		MainPage.LayoutOrder = PageOrders
		
		TextButton_Tap.MouseButton1Click:connect(function()
			if MainPage.Name == text.."_MainPage" then
				UIPage:JumpToIndex(MainPage.LayoutOrder)

			end
			for i ,v in next , ScrollingFrame_Menubar:GetChildren() do
				if v:IsA("Frame") then
					TweenService:Create(
						v.TextButton_Tap,
						TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
						{TextColor3 = Color3.fromRGB(100, 100, 100)}
					):Play()
					TweenService:Create(
						v.Logo,
						TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
						{ImageTransparency = 0.6}
					):Play()
					TweenService:Create(
						v.ButtonGradient,
						TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
						{Size = UDim2.new(0, 0, 0, 22)}
					):Play()
				end
				TweenService:Create(
					TextButton_Tap,
					TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
					{TextColor3 = Color3.fromRGB(255, 255, 255)}
				):Play()
				TweenService:Create(
					Logo,
					TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
					{ImageTransparency = 0}
				):Play()
				TweenService:Create(
					ButtonGradient,
					TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
					{Size = UDim2.new(0, 147, 0, 22)}
				):Play()
			end
		end)

		if LunaFocus == false then
			TweenService:Create(
				TextButton_Tap,
				TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
				{TextColor3 = Color3.fromRGB(255, 255, 255)}
			):Play()

			TweenService:Create(
				Logo,
				TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
				{ImageTransparency = 0}
			):Play()
			TweenService:Create(
				ButtonGradient,
				TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
				{Size = UDim2.new(0, 147, 0, 22)}
			):Play()

			MainPage.Visible = true
			Frame_Tap.Name  = text .. "Server"
			LunaFocus  = true
		end
		
		local ScrollingFrame_Pagefrist = Instance.new("ScrollingFrame")
		
		ScrollingFrame_Pagefrist.Name = "ScrollingFrame_Pagefrist"
		ScrollingFrame_Pagefrist.Parent = MainPage
		ScrollingFrame_Pagefrist.Active = true
		ScrollingFrame_Pagefrist.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		ScrollingFrame_Pagefrist.BackgroundTransparency = 1.000
		ScrollingFrame_Pagefrist.BorderSizePixel = 0
		ScrollingFrame_Pagefrist.ClipsDescendants = false
		ScrollingFrame_Pagefrist.Position = UDim2.new(-0.00118658517, 0, -0.000269166427, 0)
		ScrollingFrame_Pagefrist.Size = UDim2.new(0, 356, 0, 439)
		ScrollingFrame_Pagefrist.CanvasSize = UDim2.new(0, 0, 0, 0)
		ScrollingFrame_Pagefrist.HorizontalScrollBarInset = Enum.ScrollBarInset.Always
		ScrollingFrame_Pagefrist.ScrollBarThickness = 3
		
		local UIGridLayout_Pagefrist = Instance.new("UIGridLayout")
		local UIPadding_Pagefrist = Instance.new("UIPadding")
		
		UIGridLayout_Pagefrist.Name = "UIGridLayout_Pagefrist"
		UIGridLayout_Pagefrist.Parent = ScrollingFrame_Pagefrist
		UIGridLayout_Pagefrist.FillDirection = Enum.FillDirection.Vertical
		UIGridLayout_Pagefrist.SortOrder = Enum.SortOrder.LayoutOrder
		UIGridLayout_Pagefrist.CellPadding = UDim2.new(0, 15, 0, 30)
		UIGridLayout_Pagefrist.CellSize = UDim2.new(0, 340, 0, 420)

		UIPadding_Pagefrist.Name = "UIPadding_Pagefrist"
		UIPadding_Pagefrist.Parent = ScrollingFrame_Pagefrist
		UIPadding_Pagefrist.PaddingLeft = UDim.new(0, 8)
		UIPadding_Pagefrist.PaddingTop = UDim.new(0, 10)
		
		local LunaPage = {}
		
		function LunaPage.page()
			local Pageframe = Instance.new("Frame")
			
			Pageframe.Name = "Pageframe"
			Pageframe.Parent = ScrollingFrame_Pagefrist
			Pageframe.Active = true
			Pageframe.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
			Pageframe.BorderSizePixel = 0
			Pageframe.Size = UDim2.new(0, 435, 0, 395)
			
			local PageFrameStroke = Instance.new("UIStroke")

			PageFrameStroke.Parent = Pageframe
			PageFrameStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
			PageFrameStroke.Color = Color3.fromRGB(25,25,25)
			PageFrameStroke.Thickness = 2
			PageFrameStroke.Transparency = 0.2
			
			local ScrollingFrame_Pageframe = Instance.new("ScrollingFrame")
			
			ScrollingFrame_Pageframe.Name = "ScrollingFrame_Pageframe"
			ScrollingFrame_Pageframe.Parent = Pageframe
			ScrollingFrame_Pageframe.Active = true
			ScrollingFrame_Pageframe.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			ScrollingFrame_Pageframe.BackgroundTransparency = 1.000
			ScrollingFrame_Pageframe.BorderSizePixel = 0
			ScrollingFrame_Pageframe.Position = UDim2.new(0, 0, 0.0761904791, 0)
			ScrollingFrame_Pageframe.Size = UDim2.new(0, 340, 0, 388)
			ScrollingFrame_Pageframe.ScrollBarThickness = 3
			
			local ScrollingFrame_PageframeUIListLayout = Instance.new("UIListLayout")
			local ScrollingFrame_PageframeUIPadding = Instance.new("UIPadding")
			
			ScrollingFrame_PageframeUIListLayout.Name = "ScrollingFrame_PageframeUIListLayout"
			ScrollingFrame_PageframeUIListLayout.Parent = ScrollingFrame_Pageframe
			ScrollingFrame_PageframeUIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
			ScrollingFrame_PageframeUIListLayout.Padding = UDim.new(0, 10)

			ScrollingFrame_PageframeUIPadding.Name = "ScrollingFrame_PageframeUIPadding"
			ScrollingFrame_PageframeUIPadding.Parent = ScrollingFrame_Pageframe
			ScrollingFrame_PageframeUIPadding.PaddingLeft = UDim.new(0, 10)
			ScrollingFrame_PageframeUIPadding.PaddingTop = UDim.new(0, 10)
			
			local Glow = Instance.new("ImageLabel")
			
			Glow.Name = "Glow"
			Glow.Parent = Pageframe
			Glow.Active = true
			Glow.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Glow.BackgroundTransparency = 1.000
			Glow.Position = UDim2.new(-0.0578724593, 0, -0.0604636073, 0)
			Glow.Size = UDim2.new(0, 381, 0, 471)
			Glow.Image = "rbxassetid://5028857084"
			Glow.ImageColor3 = Color3.fromRGB(0, 0, 0)
			
			local UICorner = Instance.new("UICorner")
			local UICorner_2 = Instance.new("UICorner")
			local TextLabel = Instance.new("TextLabel")
			local UICorner_3 = Instance.new("UICorner")

			UICorner.CornerRadius = UDim.new(0, 9)
			UICorner.Parent = MainSceen2

			UICorner_2.CornerRadius = UDim.new(0, 4)
			UICorner_2.Parent = Pageframe

			TextLabel.Parent = Pageframe
			TextLabel.Active = true
			TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			TextLabel.BackgroundTransparency = 1.000
			TextLabel.ClipsDescendants = true
			TextLabel.Position = UDim2.new(0.0205882359, 0, 0, 0)
			TextLabel.Size = UDim2.new(0, 333, 0, 31)
			TextLabel.Font = Enum.Font.GothamBold
			TextLabel.Text = TextButton_Tap.Text
			TextLabel.TextColor3 = Color3.fromRGB(85, 85, 127)
			TextLabel.TextSize = 12.000
			TextLabel.TextXAlignment = Enum.TextXAlignment.Left

			UICorner_3.CornerRadius = UDim.new(0, 2)
			UICorner_3.Parent = MainPage
			
			ScrollingFrame_PageframeUIListLayout:GetPropertyChangedSignal('AbsoluteContentSize'):Connect(function()
				ScrollingFrame_Pageframe.CanvasSize = UDim2.new(0,0,0,ScrollingFrame_PageframeUIListLayout.AbsoluteContentSize.Y + 120)
			end)

			UIGridLayout_Pagefrist:GetPropertyChangedSignal('AbsoluteContentSize'):Connect(function()
				ScrollingFrame_Pagefrist.CanvasSize = UDim2.new(0,0,0,UIGridLayout_Pagefrist.AbsoluteContentSize.Y + 15)
			end)

			game:GetService("RunService").Stepped:Connect(function ()
				pcall(function ()
					ScrollingFrame_Menubar.CanvasSize = UDim2.new(0,0, 0,UIListLayout_Menubar.AbsoluteContentSize.Y + 20)
					ScrollingFrame_Pageframe.CanvasSize = UDim2.new(0,0,0,ScrollingFrame_PageframeUIListLayout.AbsoluteContentSize.Y +25)
				end)
			end)
			
			local LunaFunction = {}
			
			function LunaFunction:Button(text,callback)
				local ButtonFrame = Instance.new("Frame")
				local Button = Instance.new("TextButton")
				local UICorner = Instance.new("UICorner")

				ButtonFrame.Name = "ButtonFrame"
				ButtonFrame.Parent = ScrollingFrame_Pageframe
				ButtonFrame.BackgroundColor3 = Color3.fromRGB(18, 18, 18)
				ButtonFrame.BackgroundTransparency = 1.000
				ButtonFrame.Size = UDim2.new(0, 318, 0, 21)
				ButtonFrame.BorderSizePixel = 0

				Button.Name = "Button"
				Button.AnchorPoint = Vector2.new(0.5, 0.5)
				Button.Position = UDim2.new(0.5, 0, 0.5, 0)
				Button.Parent = ButtonFrame
				Button.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				Button.BackgroundTransparency = 1.000
				Button.Size = UDim2.new(0, 318, 0, 18)
				Button.AutoButtonColor = false
				Button.Font = Enum.Font.Gotham
				Button.Text = tostring(text)
				Button.TextColor3 = Color3.fromRGB(255, 255, 255)
				Button.TextSize = 12.000

				UICorner.CornerRadius = UDim.new(0, 6)
				UICorner.Parent = Button
				
				local ButtonStroke = Instance.new("UIStroke")

				ButtonStroke.Parent = Button
				ButtonStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
				ButtonStroke.Color = Color3.fromRGB(85, 85, 127)
				ButtonStroke.Thickness = 1.4
				ButtonStroke.Transparency = 0
				
				Button.MouseButton1Down:Connect(function()
					pcall(callback)
					TweenService:Create(
						Button,
						TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
						{Size = UDim2.new(0, 310, 0, 10)} -- UDim2.new(0, 128, 0, 25)
					):Play()
					TweenService:Create(
						Button,
						TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
						{TextSize = 10} -- UDim2.new(0, 128, 0, 25)
					):Play()
					TweenService:Create(
						ButtonFrame,
						TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
						{BackgroundTransparency = 0} -- UDim2.new(0, 128, 0, 25)
					):Play()
					wait(0.1)
					TweenService:Create(
						Button,
						TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
						{Size = UDim2.new(0, 318, 0, 18)} -- UDim2.new(0, 128, 0, 25)
					):Play()
					TweenService:Create(
						Button,
						TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
						{TextSize = 12} -- UDim2.new(0, 128, 0, 25)
					):Play()
					TweenService:Create(
						ButtonFrame,
						TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
						{BackgroundTransparency = 1} -- UDim2.new(0, 128, 0, 25)
					):Play()
				end)
			end
			
			function LunaFunction:Toggle(text,default,callback)
				local ToggleFrame = Instance.new("Frame")
				local Toggle = Instance.new("TextButton")
				local Title = Instance.new("TextLabel")
				local Toggle1 = Instance.new("TextButton")
				local Toggle1Corner = Instance.new("UICorner")
				local Toggle2 = Instance.new("TextButton")
				local Toggle2Corner = Instance.new("UICorner")
				local Check = Instance.new("ImageLabel")

				ToggleFrame.Name = "ToggleFrame"
				ToggleFrame.Parent = ScrollingFrame_Pageframe
				ToggleFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				ToggleFrame.BackgroundTransparency = 1.000
				ToggleFrame.Position = UDim2.new(0.0121212117, 0, 0.0687830672, 0)
				ToggleFrame.Size = UDim2.new(0, 314, 0, 21)

				Toggle.Name = "Toggle"
				Toggle.Parent = ToggleFrame
				Toggle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				Toggle.BackgroundTransparency = 1.000
				Toggle.Size = UDim2.new(0, 314, 0, 21)
				Toggle.Font = Enum.Font.SourceSans
				Toggle.Text = ""
				Toggle.TextColor3 = Color3.fromRGB(0, 0, 0)
				Toggle.TextSize = 14.000

				Title.Name = "Title"
				Title.Parent = Toggle
				Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				Title.BackgroundTransparency = 1.000
				Title.ClipsDescendants = true
				Title.Position = UDim2.new(0.0191082805, 0, 0, 0)
				Title.Size = UDim2.new(0, 274, 0, 21)
				Title.Font = Enum.Font.Gotham
				Title.Text = tostring(text)
				Title.TextColor3 = Color3.fromRGB(255, 255, 255)
				Title.TextSize = 12.000
				Title.TextXAlignment = Enum.TextXAlignment.Left

				Toggle1.Name = "Toggle1"
				Toggle1.Parent = Toggle
				Toggle1.AnchorPoint = Vector2.new(0.5, 0.5)
				Toggle1.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				Toggle1.BackgroundTransparency = 1.000
				Toggle1.BorderSizePixel = 0
				Toggle1.Position = UDim2.new(0.980000019, 0, 0.5, 0)
				Toggle1.Size = UDim2.new(0, 23, 0, 23)
				Toggle1.AutoButtonColor = false
				Toggle1.Font = Enum.Font.SourceSans
				Toggle1.Text = ""
				Toggle1.TextColor3 = Color3.fromRGB(0, 0, 0)
				Toggle1.TextSize = 1.000

				Toggle1Corner.CornerRadius = UDim.new(0, 7)
				Toggle1Corner.Name = "Toggle1Corner"
				Toggle1Corner.Parent = Toggle1
				
				local Toggle1Stroke = Instance.new("UIStroke")

				Toggle1Stroke.Parent = Toggle1
				Toggle1Stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
				Toggle1Stroke.Color = Color3.fromRGB(85, 85, 127)
				Toggle1Stroke.Thickness = 1.4
				Toggle1Stroke.Transparency = 0

				Toggle2.Name = "Toggle2"
				Toggle2.Parent = Toggle1
				Toggle2.AnchorPoint = Vector2.new(0.5, 0.5)
				Toggle2.BackgroundColor3 = Color3.fromRGB(85, 85, 127)
				Toggle2.BorderSizePixel = 0
				Toggle2.ClipsDescendants = true
				Toggle2.Position = UDim2.new(0.5, 0, 0.5, 0)
				Toggle2.Size = UDim2.new(0, 0, 0, 0)
				Toggle2.AutoButtonColor = false
				Toggle2.Font = Enum.Font.SourceSans
				Toggle2.Text = ""
				Toggle2.TextColor3 = Color3.fromRGB(0, 0, 0)
				Toggle2.TextSize = 1.000

				Toggle2Corner.CornerRadius = UDim.new(0, 7)
				Toggle2Corner.Name = "Toggle2Corner"
				Toggle2Corner.Parent = Toggle2

				Check.Name = "Check"
				Check.Parent = Toggle2
				Check.AnchorPoint = Vector2.new(0.5, 0.5)
				Check.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				Check.BackgroundTransparency = 1.000
				Check.Position = UDim2.new(0.5, 0, 0.5, 0)
				Check.Size = UDim2.new(0, 0, 0, 0)
				Check.Image = "rbxassetid://7072706620"
				
				local FocusToggle = false
				
				Toggle2.MouseButton1Down:Connect(function()
					if FocusToggle == false then
						TweenService:Create(
							Toggle2,
							TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
							{Size = UDim2.new(0, 23, 0, 23)} -- UDim2.new(0, 128, 0, 25)
						):Play()
						wait(0.1)
						TweenService:Create(
							Check,
							TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
							{Size = UDim2.new(0, 19, 0, 19)} -- UDim2.new(0, 128, 0, 25)
						):Play()
					else
						TweenService:Create(
							Check,
							TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
							{Size = UDim2.new(0, 0, 0, 0)} -- UDim2.new(0, 128, 0, 25)
						):Play()
						wait(0.1)
						TweenService:Create(
							Toggle2,
							TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
							{Size = UDim2.new(0, 0, 0, 0)} -- UDim2.new(0, 128, 0, 25)
						):Play()
					end
					FocusToggle = not FocusToggle
					callback(FocusToggle)
				end)
				
				Toggle1.MouseButton1Down:Connect(function()
					if FocusToggle == false then
						TweenService:Create(
							Toggle2,
							TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
							{Size = UDim2.new(0, 23, 0, 23)} -- UDim2.new(0, 128, 0, 25)
						):Play()
						wait(0.1)
						TweenService:Create(
							Check,
							TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
							{Size = UDim2.new(0, 19, 0, 19)} -- UDim2.new(0, 128, 0, 25)
						):Play()
					else
						TweenService:Create(
							Check,
							TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
							{Size = UDim2.new(0, 0, 0, 0)} -- UDim2.new(0, 128, 0, 25)
						):Play()
						wait(0.1)
						TweenService:Create(
							Toggle2,
							TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
							{Size = UDim2.new(0, 0, 0, 0)} -- UDim2.new(0, 128, 0, 25)
						):Play()
					end
					FocusToggle = not FocusToggle
					callback(FocusToggle)
				end)
				
				Toggle.MouseButton1Down:Connect(function()
					if FocusToggle == false then
						TweenService:Create(
							Toggle2,
							TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
							{Size = UDim2.new(0, 23, 0, 23)} -- UDim2.new(0, 128, 0, 25)
						):Play()
						wait(0.1)
						TweenService:Create(
							Check,
							TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
							{Size = UDim2.new(0, 19, 0, 19)} -- UDim2.new(0, 128, 0, 25)
						):Play()
					else
						TweenService:Create(
							Check,
							TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
							{Size = UDim2.new(0, 0, 0, 0)} -- UDim2.new(0, 128, 0, 25)
						):Play()
						wait(0.1)
						TweenService:Create(
							Toggle2,
							TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
							{Size = UDim2.new(0, 0, 0, 0)} -- UDim2.new(0, 128, 0, 25)
						):Play()
					end
					FocusToggle = not FocusToggle
					callback(FocusToggle)
				end)
				
				if default == true then
					TweenService:Create(
						Toggle2,
						TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
						{Size = UDim2.new(0, 23, 0, 23)} -- UDim2.new(0, 128, 0, 25)
					):Play()
					wait(0.1)
					TweenService:Create(
						Check,
						TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
						{Size = UDim2.new(0, 19, 0, 19)} -- UDim2.new(0, 128, 0, 25)
					):Play()
					FocusToggle = not FocusToggle
					callback(FocusToggle)
				end
			end
			
			function LunaFunction:Dropdown(text,list,callback)
				local dropfunc = {}
				local DropTog = false
				local Dropdown = Instance.new("Frame")
				local DropBtn = Instance.new("TextButton")
				local UICorner_15 = Instance.new("UICorner")
				local DropText = Instance.new("TextLabel")
				local UICorner_16 = Instance.new("UICorner")
				local keyboard_arrow_left = Instance.new("ImageButton")
				local DropHold = Instance.new("Frame")
				local Droplist = Instance.new("ScrollingFrame")
				local UIListLayout_5 = Instance.new("UIListLayout")
				local UIPadding = Instance.new("UIPadding")
				local UICorner_18 = Instance.new("UICorner")

				Dropdown.Name = "Dropdown"
				Dropdown.Parent = ScrollingFrame_Pageframe
				Dropdown.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				Dropdown.BackgroundTransparency = 1.000
				Dropdown.Position = UDim2.new(0, 0, 0, 0)
				Dropdown.Size = UDim2.new(0, 318, 0, 21)
				Dropdown.ClipsDescendants = true
				
				DropBtn.Name = "DropBtn"
				DropBtn.Parent = Dropdown
				DropBtn.BackgroundColor3 = Color3.fromRGB(42, 42, 42)
				DropBtn.BorderColor3 = Color3.fromRGB(0, 0, 0)
				DropBtn.BorderSizePixel = 0
				DropBtn.Position = UDim2.new(0, 0, 0, 0)
				DropBtn.Size = UDim2.new(0,318,0,21)
				DropBtn.Font = Enum.Font.GothamSemibold
				DropBtn.Text = ""
				DropBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
				DropBtn.TextSize = 13.000
				DropBtn.AutoButtonColor = false

				UICorner_15.CornerRadius = UDim.new(0, 5)
				UICorner_15.Parent = DropBtn

				DropText.Name = "DropText"
				DropText.Parent = DropBtn
				DropText.BackgroundColor3 = Color3.fromRGB(42, 42, 42)
				DropText.BackgroundTransparency = 1.000
				DropText.Position = UDim2.new(0.0121402545, 0, 0.0466926247, -1)
				DropText.Size = UDim2.new(0, 288, 0, 25)
				DropText.Font = Enum.Font.Gotham
				DropText.Text = "".. text ..": nil"
				DropText.TextColor3 = Color3.fromRGB(255, 255, 255)
				DropText.TextSize = 12.000
				DropText.TextXAlignment = Enum.TextXAlignment.Left

				UICorner_16.CornerRadius = UDim.new(0, 5)
				UICorner_16.Parent = DropText

				keyboard_arrow_left.Name = "keyboard_arrow_left"
				keyboard_arrow_left.Parent = DropBtn
				keyboard_arrow_left.BackgroundTransparency = 1.000
				keyboard_arrow_left.Position = UDim2.new(0.902036726, 0, 0.13, 0)
				keyboard_arrow_left.Size = UDim2.new(0, 19, 0, 19)
				keyboard_arrow_left.ZIndex = 2
				keyboard_arrow_left.Image = "rbxassetid://3926305904"
				keyboard_arrow_left.ImageRectOffset = Vector2.new(724, 284)
				keyboard_arrow_left.ImageRectSize = Vector2.new(36, 36)

				DropHold.Name = "DropHold"
				DropHold.Parent = Dropdown
				DropHold.AnchorPoint = Vector2.new(0.5,0.5)
				DropHold.BackgroundColor3 = Color3.fromRGB(30,30,30)
				DropHold.BorderSizePixel = 0
				DropHold.Position = UDim2.new(0.5, 0, 0.151162788, 22)
				DropHold.Size = UDim2.new(0, 318, 0, 0)
				DropHold.ClipsDescendants = true

				Droplist.Name = "Droplist"
				Droplist.Parent = DropHold
				Droplist.Active = true
				Droplist.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				Droplist.BackgroundTransparency = 1.000
				Droplist.Size = UDim2.new(0, 318, 0, 133)
				Droplist.ScrollBarThickness = 3
				Droplist.BorderSizePixel = 0

				UIListLayout_5.Parent = Droplist
				UIListLayout_5.SortOrder = Enum.SortOrder.LayoutOrder
				UIListLayout_5.Padding = UDim.new(0, 2)

				UIPadding.Parent = Droplist
				UIPadding.PaddingLeft = UDim.new(0, 4)
				UIPadding.PaddingTop = UDim.new(0, 3)


				UICorner_18.CornerRadius = UDim.new(0, 3)
				UICorner_18.Parent = DropHold

				keyboard_arrow_left.MouseButton1Click:Connect(function()
					if DropTog == false then
						TweenService:Create(
							Dropdown,
							TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
							{Size = UDim2.new(0, 318, 0, 172)} -- UDim2.new(0, 128, 0, 25)
						):Play()
						TweenService:Create(
							DropHold,
							TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
							{Size = UDim2.new(0, 318, 0, 133)} -- UDim2.new(0, 128, 0, 25)
						):Play()
						TweenService:Create(
							DropHold,
							TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
							{Position = UDim2.new(0.5, 0, 0.151162788, 65)} -- UDim2.new(0, 128, 0, 25)
						):Play()
						TweenService:Create(
							keyboard_arrow_left,
							TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
							{Rotation = 272} -- UDim2.new(0, 128, 0, 25)
						):Play()
					else
						TweenService:Create(
							Dropdown,
							TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
							{Size = UDim2.new(0, 318, 0, 21)} -- UDim2.new(0, 128, 0, 25)
						):Play()
						TweenService:Create(
							DropHold,
							TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
							{Size = UDim2.new(0, 318, 0, 0)} -- UDim2.new(0, 128, 0, 25)
						):Play()
						TweenService:Create(
							DropHold,
							TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
							{Position = UDim2.new(0.5, 0, 0.151162788, 65)} -- UDim2.new(0, 128, 0, 25)
						):Play()
						TweenService:Create(
							keyboard_arrow_left,
							TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
							{Rotation = 0} -- UDim2.new(0, 128, 0, 25)
						):Play()
					end
					DropTog = not DropTog
				end)
				DropBtn.MouseButton1Click:Connect(function()
					if DropTog == false then
						TweenService:Create(
							Dropdown,
							TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
							{Size = UDim2.new(0, 318, 0, 172)} -- UDim2.new(0, 128, 0, 25)
						):Play()
						TweenService:Create(
							DropHold,
							TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
							{Size = UDim2.new(0, 318, 0, 133)} -- UDim2.new(0, 128, 0, 25)
						):Play()
						TweenService:Create(
							DropHold,
							TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
							{Position = UDim2.new(0.5, 0, 0.151162788, 65)} -- UDim2.new(0, 128, 0, 25)
						):Play()
						TweenService:Create(
							keyboard_arrow_left,
							TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
							{Rotation = 272} -- UDim2.new(0, 128, 0, 25)
						):Play()
					else
						TweenService:Create(
							Dropdown,
							TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
							{Size = UDim2.new(0, 318, 0, 21)} -- UDim2.new(0, 128, 0, 25)
						):Play()
						TweenService:Create(
							DropHold,
							TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
							{Size = UDim2.new(0, 318, 0, 0)} -- UDim2.new(0, 128, 0, 25)
						):Play()
						TweenService:Create(
							DropHold,
							TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
							{Position = UDim2.new(0.5, 0, 0.151162788, 65)} -- UDim2.new(0, 128, 0, 25)
						):Play()
						TweenService:Create(
							keyboard_arrow_left,
							TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
							{Rotation = 0} -- UDim2.new(0, 128, 0, 25)
						):Play()
					end
					DropTog = not DropTog
				end)

				for i,v in next, list do

					local DropBn = Instance.new("TextButton")
					local UICorner_17 = Instance.new("UICorner")
					local TextLabel = Instance.new("TextLabel")

					DropBn.Name = "DropBn"
					DropBn.Parent = Droplist
					DropBn.BackgroundColor3 = Color3.fromRGB(25,25,25)
					DropBn.Size = UDim2.new(0, 310, 0, 17)
					DropBn.Font = Enum.Font.SourceSans
					DropBn.Text = ""
					DropBn.TextColor3 = Color3.fromRGB(0, 0, 0)
					DropBn.TextSize = 14.000
					DropBn.AutoButtonColor = false

					UICorner_17.CornerRadius = UDim.new(0, 4)
					UICorner_17.Parent = DropBn

					TextLabel.Parent = DropBn
					TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					TextLabel.BackgroundTransparency = 1.000
					TextLabel.Position = UDim2.new(0.0209790207, 0, 0, 0)
					TextLabel.Size = UDim2.new(0, 310, 0, 17)
					TextLabel.Font = Enum.Font.Gotham
					TextLabel.Text = v
					TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
					TextLabel.TextSize = 12.000
					TextLabel.TextXAlignment = Enum.TextXAlignment.Left

					Droplist.CanvasSize = UDim2.new(0, 0, 0, UIListLayout_5.AbsoluteContentSize.Y + 5)
					
					DropBn.MouseEnter:Connect(function()
						TweenService:Create(
							TextLabel,
							TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
							{TextColor3 = Color3.fromRGB(85, 85, 127)} -- UDim2.new(0, 128, 0, 25)
						):Play()
					end)
					
					DropBn.MouseLeave:Connect(function()
						TweenService:Create(
							TextLabel,
							TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
							{TextColor3 = Color3.fromRGB(255, 255, 255)} -- UDim2.new(0, 128, 0, 25)
						):Play()
					end)

					DropBn.MouseButton1Click:Connect(function()
						pcall(callback, v)
						DropText.Text = text .. ": ".. v
						DropTog = not DropTog
						TweenService:Create(
							Dropdown,
							TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
							{Size = UDim2.new(0, 318, 0, 21)} -- UDim2.new(0, 128, 0, 25)
						):Play()
						TweenService:Create(
							DropHold,
							TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
							{Size = UDim2.new(0, 318, 0, 0)} -- UDim2.new(0, 128, 0, 25)
						):Play()
						TweenService:Create(
							DropHold,
							TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
							{Position = UDim2.new(0.5, 0, 0.151162788, 65)} -- UDim2.new(0, 128, 0, 25)
						):Play()
						TweenService:Create(
							keyboard_arrow_left,
							TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
							{Rotation = 0} -- UDim2.new(0, 128, 0, 25)
						):Play()
					end)
				end
				function dropfunc:Add(addtext)

					local DropBn = Instance.new("TextButton")
					local UICorner_17 = Instance.new("UICorner")
					local TextLabel = Instance.new("TextLabel")

					DropBn.Name = "DropBn"
					DropBn.Parent = Droplist
					DropBn.BackgroundColor3 = Color3.fromRGB(25,25,25)
					DropBn.Size = UDim2.new(0, 310, 0, 17)
					DropBn.Font = Enum.Font.SourceSans
					DropBn.Text = ""
					DropBn.TextColor3 = Color3.fromRGB(0, 0, 0)
					DropBn.TextSize = 14.000
					DropBn.AutoButtonColor = false

					UICorner_17.CornerRadius = UDim.new(0, 4)
					UICorner_17.Parent = DropBn

					TextLabel.Parent = DropBn
					TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					TextLabel.BackgroundTransparency = 1.000
					TextLabel.Position = UDim2.new(0.0209790207, 0, 0, 0)
					TextLabel.Size = UDim2.new(0, 310, 0, 17)
					TextLabel.Font = Enum.Font.Gotham
					TextLabel.Text = addtext
					TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
					TextLabel.TextSize = 12.000
					TextLabel.TextXAlignment = Enum.TextXAlignment.Left
					
					DropBn.MouseEnter:Connect(function()
						TweenService:Create(
							TextLabel,
							TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
							{TextColor3 = Color3.fromRGB(85, 85, 127)} -- UDim2.new(0, 128, 0, 25)
						):Play()
					end)

					DropBn.MouseLeave:Connect(function()
						TweenService:Create(
							TextLabel,
							TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
							{TextColor3 = Color3.fromRGB(255, 255, 255)} -- UDim2.new(0, 128, 0, 25)
						):Play()
					end)

					Droplist.CanvasSize = UDim2.new(0, 0, 0, UIListLayout_5.AbsoluteContentSize.Y + 5)

					DropBn.MouseButton1Click:Connect(function()
						pcall(callback, addtext)
						DropText.Text = text .. ": ".. addtext
						DropTog = not DropTog
						TweenService:Create(
							Dropdown,
							TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
							{Size = UDim2.new(0, 318, 0, 21)} -- UDim2.new(0, 128, 0, 25)
						):Play()
						TweenService:Create(
							DropHold,
							TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
							{Size = UDim2.new(0, 318, 0, 0)} -- UDim2.new(0, 128, 0, 25)
						):Play()
						TweenService:Create(
							DropHold,
							TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
							{Position = UDim2.new(0.5, 0, 0.151162788, 65)} -- UDim2.new(0, 128, 0, 25)
						):Play()
						TweenService:Create(
							keyboard_arrow_left,
							TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
							{Rotation = 0} -- UDim2.new(0, 128, 0, 25)
						):Play()
					end)
				end
				function dropfunc:Clear()
					DropText.Text = text
					TweenService:Create(
						Dropdown,
						TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
						{Size = UDim2.new(0, 318, 0, 21)} -- UDim2.new(0, 128, 0, 25)
					):Play()
					TweenService:Create(
						DropHold,
						TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
						{Size = UDim2.new(0, 318, 0, 0)} -- UDim2.new(0, 128, 0, 25)
					):Play()
					TweenService:Create(
						DropHold,
						TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
						{Position = UDim2.new(0.5, 0, 0.151162788, 65)} -- UDim2.new(0, 128, 0, 25)
					):Play()
					TweenService:Create(
						keyboard_arrow_left,
						TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
						{Rotation = 0} -- UDim2.new(0, 128, 0, 25)
					):Play()
					for i, v in next, Droplist:GetChildren() do
						if v.Name == "DropBn" then
							v:Destroy()
						end
					end
					if DropTog == true then
						DropText.Text = text
					end
				end
				return dropfunc
			end
			
			function LunaFunction:Slider(text,floor,min,max,de,callback)

				local sliderfunc = {}

				local SliderFrame = Instance.new("Frame")
				local Slider = Instance.new("TextButton")
				local ToggleUICorner = Instance.new("UICorner")
				local TextLabel = Instance.new("TextLabel")
				local ShowValueFrame = Instance.new("Frame")
				local CustomValue = Instance.new("TextBox")
				local ValueFrame = Instance.new("Frame")
				local ValueFrameUICorner = Instance.new("UICorner")
				local PartValue = Instance.new("Frame")
				local MainValue = Instance.new("Frame")
				local UICorner = Instance.new("UICorner")
				local ConneValue = Instance.new("Frame")
				local UICorner_2 = Instance.new("UICorner")

				SliderFrame.Name = "SliderFrame"
				SliderFrame.Parent = ScrollingFrame_Pageframe
				SliderFrame.Active = true
				SliderFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				SliderFrame.BackgroundTransparency = 1.000
				SliderFrame.Size = UDim2.new(0, 318, 0, 40)

				Slider.Name = "Slider"
				Slider.Parent = SliderFrame
				Slider.BackgroundColor3 = Color3.fromRGB(0, 110, 255)
				Slider.BackgroundTransparency = 1.000
				Slider.Size = UDim2.new(0, 318, 0, 40)
				Slider.AutoButtonColor = false
				Slider.Font = Enum.Font.Gotham
				Slider.Text = ""
				Slider.TextColor3 = Color3.fromRGB(255, 255, 255)
				Slider.TextSize = 12.000

				ToggleUICorner.CornerRadius = UDim.new(0, 4)
				ToggleUICorner.Name = "ToggleUICorner"
				ToggleUICorner.Parent = Slider

				TextLabel.Parent = Slider
				TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				TextLabel.BackgroundTransparency = 1
				TextLabel.Position = UDim2.new(0.01, 0, 0, 0)
				TextLabel.Size = UDim2.new(0, 100, 0, 20)
				TextLabel.Font = Enum.Font.Gotham
				TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
				TextLabel.TextSize = 12.000
				TextLabel.TextTransparency = 0
				TextLabel.Text = tostring(text)
				TextLabel.TextXAlignment = Enum.TextXAlignment.Left

				ShowValueFrame.Name = "ShowValueFrame"
				ShowValueFrame.Parent = Slider
				ShowValueFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				ShowValueFrame.BackgroundTransparency = 1.000
				ShowValueFrame.Position = UDim2.new(0.85, 0, 0.5, 0)
				ShowValueFrame.Size = UDim2.new(0, 59, 0, 20)

				CustomValue.Name = "CustomValue"
				CustomValue.Parent = ShowValueFrame
				CustomValue.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				CustomValue.BackgroundTransparency = 1.000
				CustomValue.BorderColor3 = Color3.fromRGB(27, 42, 53)
				CustomValue.ClipsDescendants = true
				CustomValue.Size = UDim2.new(0, 59, 0, 20)
				CustomValue.Font = Enum.Font.Gotham
				CustomValue.Text = ""
				CustomValue.TextColor3 = Color3.fromRGB(255, 255, 255)
				CustomValue.TextSize = 12.000
				CustomValue.TextTransparency = 1
				if floor == true then
					CustomValue.Text =  tostring(de and string.format("%.1f",(de / max) * (max - min) + min) or 0)
				else
					CustomValue.Text =  tostring(de and math.floor( (de / max) * (max - min) + min) or 0)
				end

				ValueFrame.Name = "ValueFrame"
				ValueFrame.Parent = Slider
				ValueFrame.BackgroundColor3 = Color3.fromRGB(42, 42, 42)
				ValueFrame.BorderSizePixel = 0
				ValueFrame.Position = UDim2.new(0.4, 0, 0.15, 0)
				ValueFrame.Size = UDim2.new(0, 190, 0, 6)

				ValueFrameUICorner.CornerRadius = UDim.new(0, 4)
				ValueFrameUICorner.Name = "ValueFrameUICorner"
				ValueFrameUICorner.Parent = ValueFrame

				local ValueStroke = Instance.new("UIStroke")

				ValueStroke.Thickness = 1
				ValueStroke.Name = ""
				ValueStroke.Parent = ValueFrame
				ValueStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
				ValueStroke.LineJoinMode = Enum.LineJoinMode.Round
				ValueStroke.Color = Color3.fromRGB(50,50,50)
				ValueStroke.Transparency = 0

				PartValue.Name = "PartValue"
				PartValue.Parent = ValueFrame
				PartValue.AnchorPoint = Vector2.new(0.5, 0.5)
				PartValue.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				PartValue.BackgroundTransparency = 1.000
				PartValue.Position = UDim2.new(0.5, 0, 0.5, 0)
				PartValue.Size = UDim2.new(0, 190, 0, 6)

				MainValue.Name = "MainValue"
				MainValue.Parent = PartValue
				MainValue.BackgroundColor3 = Color3.fromRGB(85, 85, 127)
				MainValue.BorderSizePixel = 0
				MainValue.Size = UDim2.new((de or 0) / max, 0, 0, 6)

				UICorner.CornerRadius = UDim.new(0, 4)
				UICorner.Parent = MainValue

				ConneValue.Name = "ConneValue"
				ConneValue.Parent = PartValue
				ConneValue.AnchorPoint = Vector2.new(0.5, 0.5)
				ConneValue.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				ConneValue.Position = UDim2.new((de or 0)/max, 0.5, 0.5,0, 0)
				ConneValue.Size = UDim2.new(0, 0, 0, 0)
				ConneValue.BorderSizePixel = 0

				UICorner_2.Parent = ConneValue

				local function move(input)
					local pos =
						UDim2.new(
							math.clamp((input.Position.X - ValueFrame.AbsolutePosition.X) / ValueFrame.AbsoluteSize.X, 0, 1),
							0,
							0.5,
							0
						)
					local pos1 =
						UDim2.new(
							math.clamp((input.Position.X - ValueFrame.AbsolutePosition.X) / ValueFrame.AbsoluteSize.X, 0, 1),
							0,
							0,
							6
						)

					MainValue:TweenSize(pos1, "Out", "Sine", 0.2, true)

					TweenService:Create(
						CustomValue,
						TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
						{TextTransparency = 0} -- UDim2.new(0, 128, 0, 25)
					):Play()
					if floor == true then
						local value = string.format("%.1f",((pos.X.Scale * max) / max) * (max - min) + min)
						CustomValue.Text = tostring(value)
						pcall(callback, CustomValue.Text)
					else
						local value = math.floor(((pos.X.Scale * max) / max) * (max - min) + min)
						CustomValue.Text = tostring(value)
						pcall(callback, CustomValue.Text)
					end
				end
				
				local dragging = false
				ConneValue.InputBegan:Connect(
					function(input)
						if input.UserInputType == Enum.UserInputType.MouseButton1 then
							dragging = true

						end
					end
				)
				ConneValue.InputEnded:Connect(
					function(input)
						if input.UserInputType == Enum.UserInputType.MouseButton1 then
							dragging = false
							TweenService:Create(
								CustomValue,
								TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
								{TextTransparency = 1} -- UDim2.new(0, 128, 0, 25)
							):Play()
						end
					end
				)
				SliderFrame.InputBegan:Connect(
					function(input)
						if input.UserInputType == Enum.UserInputType.MouseButton1 then
							dragging = true
							TweenService:Create(
								CustomValue,
								TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
								{TextTransparency = 0} -- UDim2.new(0, 128, 0, 25)
							):Play()
						end
					end
				)
				SliderFrame.InputEnded:Connect(
					function(input)
						if input.UserInputType == Enum.UserInputType.MouseButton1 then
							dragging = false
							TweenService:Create(
								CustomValue,
								TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
								{TextTransparency = 1} -- UDim2.new(0, 128, 0, 25)
							):Play()
						end
					end
				)


				ValueFrame.InputBegan:Connect(
					function(input)
						if input.UserInputType == Enum.UserInputType.MouseButton1 then
							dragging = true

						end
					end
				)
				ValueFrame.InputEnded:Connect(
					function(input)
						if input.UserInputType == Enum.UserInputType.MouseButton1 then
							dragging = false
							TweenService:Create(
								CustomValue,
								TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
								{TextTransparency = 1} -- UDim2.new(0, 128, 0, 25)
							):Play()
						end
					end
				)
				game:GetService("UserInputService").InputChanged:Connect(function(input)
					if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
						move(input)
					end
				end)

				CustomValue.FocusLost:Connect(function()
					if CustomValue.Text == "" then
						CustomValue.Text  = de
					end
					if  tonumber(CustomValue.Text) > max then
						CustomValue.Text  = max
					end
					MainValue:TweenSize(UDim2.new((CustomValue.Text or 0) / max, 0, 0, 6), "Out", "Sine", 0.2, true)
					ConneValue:TweenPosition(UDim2.new((CustomValue.Text or 0)/max, 0,0.5, 0) , "Out", "Sine", 0.2, true)
					if floor == true then
						CustomValue.Text = tostring(CustomValue.Text and string.format("%.1f",(CustomValue.Text / max) * (max - min) + min) )
					else
						CustomValue.Text = tostring(CustomValue.Text and math.floor( (CustomValue.Text / max) * (max - min) + min) )
					end
					pcall(callback, CustomValue.Text)
				end)
				function sliderfunc:Update(value)
					MainValue:TweenSize(UDim2.new((value or 0) / max, 0, 0, 6), "Out", "Sine", 0.2, true)
					CustomValue.Text = value

					pcall(function()
						pcall(callback, CustomValue.Text)
					end)
				end
				return sliderfunc
			end
			
			function LunaFunction:Blank(count)
				if count == nil then
					count = 0.01
				end
				local BlankFrame = Instance.new("Frame")


				BlankFrame.Name = "Mainframenoti"
				BlankFrame.Parent = ScrollingFrame_Pageframe
				BlankFrame.BackgroundColor3 = Color3.fromRGB(10,10,10)
				BlankFrame.BackgroundTransparency = 1
				BlankFrame.BorderSizePixel = 0
				BlankFrame.ClipsDescendants = false
				BlankFrame.AnchorPoint = Vector2.new(0.5, 0.5)
				BlankFrame.Position = UDim2.new(0.498, 0, 0.5, 0)
				BlankFrame.Size = UDim2.new(0, 238, 0, count)
			end
			
			function LunaFunction:Label(text)

				local Refresh = {}

				local LabelFrame = Instance.new("Frame")
				local Label = Instance.new("TextButton")

				LabelFrame.Name = "LabelFrame"
				LabelFrame.Parent = ScrollingFrame_Pageframe
				LabelFrame.Active = true
				LabelFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				LabelFrame.BackgroundTransparency = 1.000
				LabelFrame.Size = UDim2.new(0, 318, 0, 20)

				Label.Name = "Label"
				Label.Parent = LabelFrame
				Label.BackgroundColor3 = Color3.fromRGB(0, 110, 255)
				Label.BackgroundTransparency = 1.000
				Label.Size = UDim2.new(0, 318, 0, 20)
				Label.AutoButtonColor = false
				Label.Font = Enum.Font.Gotham
				Label.Text = tostring(text)
				Label.ClipsDescendants = true
				Label.TextXAlignment = Enum.TextXAlignment.Center
				Label.TextColor3 = Color3.fromRGB(255, 255, 255)
				Label.TextSize = 12.000

				function Refresh:Change(textchange)
					Label.Text = tostring(textchange)
				end
				return Refresh
			end
			
			function LunaFunction:Line()
				local LineFrame = Instance.new("Frame")
				local Line = Instance.new("TextButton")

				LineFrame.Name = "LineFrame"
				LineFrame.Parent = ScrollingFrame_Pageframe
				LineFrame.Active = true
				LineFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				LineFrame.BackgroundTransparency = 1.000
				LineFrame.Size = UDim2.new(0, 318, 0, 5)

				Line.Name = "Line"
				Line.Parent = LineFrame
				Line.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				Line.BackgroundTransparency = 0.850
				Line.Size = UDim2.new(0, 318, 0, 1)
				Line.AutoButtonColor = false
				Line.Font = Enum.Font.Gotham
				Line.Text = ""
				Line.TextColor3 = Color3.fromRGB(255, 255, 255)
				Line.TextSize = 12.000
			end
			
			function LunaFunction:ColorPicker(text,preset,callback)
				local Pixker = Instance.new("Frame")

				Pixker.Name = "Pixker"
				Pixker.Parent = ScrollingFrame_Pageframe
				Pixker.BackgroundColor3 = Color3.fromRGB(23, 23, 23)
				Pixker.Position = UDim2.new(0.0833333358, 0, 0.235135213, 0)
				Pixker.Size = UDim2.new(0, 318, 0, 33)
				Pixker.BackgroundTransparency = 1
				Pixker.BorderSizePixel = 0 
				Pixker.AnchorPoint = Vector2.new(0.5, 0.5)
				Pixker.Position = UDim2.new(0.5, 0, 0.5, 0)
				Pixker.ClipsDescendants = true

				local TextFrameColor = Instance.new("TextLabel")

				TextFrameColor.Parent = Pixker
				TextFrameColor.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				TextFrameColor.BorderSizePixel = 0
				TextFrameColor.Size = UDim2.new(0, 200, 0, 34)
				TextFrameColor.Font = Enum.Font.SourceSans
				TextFrameColor.Text = "  "
				TextFrameColor.TextColor3 = Color3.fromRGB(0, 0, 0)
				TextFrameColor.TextSize = 14.000
				TextFrameColor.BackgroundTransparency = 1
				TextFrameColor.Position = UDim2.new(0., 0, 0., 0)

				local TextReal = Instance.new("TextLabel")

				TextReal.Parent = TextFrameColor
				TextReal.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				TextReal.BorderSizePixel = 0
				TextReal.Size = UDim2.new(0, 140, 0, 34)
				TextReal.Font = Enum.Font.Gotham
				TextReal.Text = text
				TextReal.TextColor3 = Color3.fromRGB(155,155, 155)
				TextReal.TextSize = 12.000
				TextReal.BackgroundTransparency = 1
				TextReal.Position = UDim2.new(0.05, 0, 0., 0)
				TextReal.TextXAlignment = Enum.TextXAlignment.Left

				local BoxColor = Instance.new("Frame")

				BoxColor.Name = "BoxColor"
				BoxColor.Parent = TextFrameColor
				BoxColor.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				BoxColor.Position = UDim2.new(1.4, 0, 0.5, 0)
				BoxColor.Size = UDim2.new(0, 50, 0, 15)
				BoxColor.AnchorPoint = Vector2.new(0.5, 0.5)

				local BoxColorCorner = Instance.new("UICorner")

				BoxColorCorner.CornerRadius = UDim.new(0, 8)
				BoxColorCorner.Name = "BoxColorCorner"
				BoxColorCorner.Parent = BoxColor

				local TextButton_Dropdown = Instance.new("TextButton")


				TextButton_Dropdown.Parent = TextFrameColor
				TextButton_Dropdown.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
				TextButton_Dropdown.BorderSizePixel = 0
				TextButton_Dropdown.Position = UDim2.new(0., 0, 0.14705883, 0)
				TextButton_Dropdown.Size = UDim2.new(0, 200, 0, 33)
				TextButton_Dropdown.Font = Enum.Font.SourceSans
				TextButton_Dropdown.Text = "  "
				TextButton_Dropdown.TextColor3 = Color3.fromRGB(0, 0, 0)
				TextButton_Dropdown.TextSize = 14.000
				TextButton_Dropdown.AutoButtonColor = false 
				--TextButton_Dropdown.AnchorPoint = Vector2.new(0.5, 0.5)
				TextButton_Dropdown.Position = UDim2.new(0, 0, 0, 0)
				TextButton_Dropdown.BackgroundTransparency = 1

				-- Rainbow Toggle 

				
				local Toggle1 = Instance.new("TextButton")
				local Toggle1Corner = Instance.new("UICorner")
				local Toggle2 = Instance.new("TextButton")
				local Toggle2Corner = Instance.new("UICorner")
				local Check = Instance.new("ImageLabel")
				
				Toggle1.Name = "Toggle1"
				Toggle1.Parent = TextFrameColor
				Toggle1.AnchorPoint = Vector2.new(0.5, 0.5)
				Toggle1.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				Toggle1.BackgroundTransparency = 1.000
				Toggle1.BorderSizePixel = 0
				Toggle1.Position = UDim2.new(0.2, 0, 1.87, 0)
				Toggle1.Size = UDim2.new(0, 23, 0, 23)
				Toggle1.AutoButtonColor = false
				Toggle1.Font = Enum.Font.SourceSans
				Toggle1.Text = ""
				Toggle1.TextColor3 = Color3.fromRGB(0, 0, 0)
				Toggle1.TextSize = 1.000

				Toggle1Corner.CornerRadius = UDim.new(0, 7)
				Toggle1Corner.Name = "Toggle1Corner"
				Toggle1Corner.Parent = Toggle1

				local Toggle1Stroke = Instance.new("UIStroke")

				Toggle1Stroke.Parent = Toggle1
				Toggle1Stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
				Toggle1Stroke.Color = Color3.fromRGB(85, 85, 127)
				Toggle1Stroke.Thickness = 1.4
				Toggle1Stroke.Transparency = 0

				Toggle2.Name = "Toggle2"
				Toggle2.Parent = Toggle1
				Toggle2.AnchorPoint = Vector2.new(0.5, 0.5)
				Toggle2.BackgroundColor3 = Color3.fromRGB(85, 85, 127)
				Toggle2.BorderSizePixel = 0
				Toggle2.ClipsDescendants = true
				Toggle2.Position = UDim2.new(0.5, 0, 0.5, 0)
				Toggle2.Size = UDim2.new(0, 0, 0, 0)
				Toggle2.AutoButtonColor = false
				Toggle2.Font = Enum.Font.SourceSans
				Toggle2.Text = ""
				Toggle2.TextColor3 = Color3.fromRGB(0, 0, 0)
				Toggle2.TextSize = 1.000

				Toggle2Corner.CornerRadius = UDim.new(0, 7)
				Toggle2Corner.Name = "Toggle2Corner"
				Toggle2Corner.Parent = Toggle2

				Check.Name = "Check"
				Check.Parent = Toggle2
				Check.AnchorPoint = Vector2.new(0.5, 0.5)
				Check.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				Check.BackgroundTransparency = 1.000
				Check.Position = UDim2.new(0.5, 0, 0.5, 0)
				Check.Size = UDim2.new(0, 0, 0, 0)
				Check.Image = "rbxassetid://7072706620"

				local TextButton_3_Toggle2 = Instance.new("TextLabel")

				TextButton_3_Toggle2.Parent = Toggle1
				TextButton_3_Toggle2.BackgroundColor3 = Color3.fromRGB(32, 32,32)
				TextButton_3_Toggle2.BorderColor3 = Color3.fromRGB(249, 53, 139)
				TextButton_3_Toggle2.BorderSizePixel = 0
				TextButton_3_Toggle2.AnchorPoint = Vector2.new(0.5, 0.5)
				TextButton_3_Toggle2.Position = UDim2.new(2.4, 0, 0.5, 0)
				TextButton_3_Toggle2.Size = UDim2.new(0, 500, 0, 21)
				TextButton_3_Toggle2.Font = Enum.Font.Gotham
				TextButton_3_Toggle2.Text = "Rainbow"
				TextButton_3_Toggle2.TextColor3 = Color3.fromRGB(255, 255, 255)
				TextButton_3_Toggle2.TextSize = 12.000
				TextButton_3_Toggle2.BackgroundTransparency = 1 

				local OMF = Instance.new("TextButton")

				OMF.Parent = Toggle1
				OMF.BackgroundTransparency =1
				OMF.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				OMF.BorderSizePixel = 0
				OMF.Size = UDim2.new(0, 300, 0, 20)
				OMF.AutoButtonColor = false
				OMF.Font = Enum.Font.SourceSans
				OMF.Text = " "
				OMF.TextColor3 = Color3.fromRGB(0, 0, 0)
				OMF.TextSize = 12.000
				OMF.AnchorPoint = Vector2.new(0.5, 0.5)
				OMF.Position = UDim2.new(1.3, 0, 0.5, 0)

				local Color =  Instance.new("ImageLabel")

				Color.Name = "Color"
				Color.Parent = TextFrameColor
				Color.BackgroundColor3 = Color3.fromRGB(255, 0, 4)
				Color.Position = UDim2.new(0.05,0,4,0)
				Color.Size = UDim2.new(0, 300, 0, 40)
				Color.ZIndex = 0
				Color.BorderSizePixel = 0
				Color.Image = "rbxassetid://4155801252"

				local ColorFucj = Instance.new("UICorner")

				ColorFucj.CornerRadius = UDim.new(0, 4)
				ColorFucj.Name = ""
				ColorFucj.Parent = Color

				local ColorSelection =  Instance.new("ImageLabel")

				ColorSelection.Name = "ColorSelection"
				ColorSelection.Parent = Color
				ColorSelection.AnchorPoint = Vector2.new(0.5, 0.5)
				ColorSelection.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				ColorSelection.BackgroundTransparency = 1.000
				ColorSelection.Position = UDim2.new(preset and select(3, Color3.toHSV(preset)))
				ColorSelection.Size = UDim2.new(0, 18, 0, 18)
				ColorSelection.Image = "http://www.roblox.com/asset/?id=4805639000"
				ColorSelection.ScaleType = Enum.ScaleType.Fit
				ColorSelection.Visible = true

				local Hue =  Instance.new("ImageLabel")

				Hue.Name = "Hue2"
				Hue.Parent = TextFrameColor
				Hue.Position = UDim2.new(0.05,0,3,0)
				Hue.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				Hue.Size = UDim2.new(0, 300, 0, 25)
				Hue.ZIndex = 0
				Hue.BorderSizePixel = 0

				local ColorFucj2 = Instance.new("UICorner")

				ColorFucj2.CornerRadius = UDim.new(0, 4)
				ColorFucj2.Name = ""
				ColorFucj2.Parent = Hue

				local HueGradient = Instance.new("UIGradient")

				HueGradient.Color = ColorSequence.new {
					ColorSequenceKeypoint.new(0.00, Color3.fromRGB(255, 0, 4)),
					ColorSequenceKeypoint.new(0.20, Color3.fromRGB(234, 255, 0)),
					ColorSequenceKeypoint.new(0.40, Color3.fromRGB(21, 255, 0)),
					ColorSequenceKeypoint.new(0.60, Color3.fromRGB(0, 255, 255)),
					ColorSequenceKeypoint.new(0.80, Color3.fromRGB(0, 17, 255)),
					ColorSequenceKeypoint.new(0.90, Color3.fromRGB(255, 0, 251)),
					ColorSequenceKeypoint.new(1.00, Color3.fromRGB(255, 0, 4))
				}			
				HueGradient.Rotation = 0
				HueGradient.Name = "HueGradient"
				HueGradient.Parent = Hue

				local HueSelection =  Instance.new("ImageLabel")

				HueSelection.Name = "HueSelection"
				HueSelection.Parent = Hue
				HueSelection.AnchorPoint = Vector2.new(0.5, 0.5)
				HueSelection.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				HueSelection.BackgroundTransparency = 1.000
				HueSelection.Position = UDim2.new(preset and select(3, Color3.toHSV(preset)))
				HueSelection.Size = UDim2.new(0, 18, 0, 18)
				HueSelection.Image = "http://www.roblox.com/asset/?id=4805639000"
				HueSelection.ScaleType = Enum.ScaleType.Fit
				HueSelection.Visible = true

				local UwU = false 


				OMF.MouseButton1Click:Connect(function()
					if  UwU == false  then
						TweenService:Create(
							Toggle2,
							TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
							{Size = UDim2.new(0, 23, 0, 23)} -- UDim2.new(0, 128, 0, 25)
						):Play()
						wait(0.1)
						TweenService:Create(
							Check,
							TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
							{Size = UDim2.new(0, 19, 0, 19)} -- UDim2.new(0, 128, 0, 25)
						):Play()
					else
						TweenService:Create(
							Toggle2,
							TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
							{Size = UDim2.new(0, 0, 0, 0)} -- UDim2.new(0, 128, 0, 25)
						):Play()
						wait(0.1)
						TweenService:Create(
							Check,
							TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
							{Size = UDim2.new(0, 0, 0, 0)} -- UDim2.new(0, 128, 0, 25)
						):Play()
					end
					UwU = not UwU
				end
				)

				OMF.MouseButton1Down:Connect(
					function()
						RainbowColorPicker = not RainbowColorPicker

						if ColorInput then
							ColorInput:Disconnect()
						end

						if HueInput then
							HueInput:Disconnect()
						end

						if RainbowColorPicker then


							OldToggleColor = BoxColor.BackgroundColor3
							OldColor = Color.BackgroundColor3
							OldColorSelectionPosition = ColorSelection.Position
							OldHueSelectionPosition = HueSelection.Position

							while RainbowColorPicker do
								BoxColor.BackgroundColor3 = Color3.fromHSV(LunaColor.RainbowColorValue, 1, 1)
								Color.BackgroundColor3 = Color3.fromHSV(LunaColor.RainbowColorValue, 1, 1)

								ColorSelection.Position = UDim2.new(1, 0, 0, 0)
								HueSelection.Position = UDim2.new(0,  LunaColor.HueSelectionPosition, 0.5,0)

								pcall(callback, BoxColor.BackgroundColor3)
								wait()
							end
						elseif not RainbowColorPicker then

							BoxColor.BackgroundColor3 = OldToggleColor
							Color.BackgroundColor3 = OldColor

							ColorSelection.Position = OldColorSelectionPosition
							HueSelection.Position = OldHueSelectionPosition

							pcall(callback, BoxColor.BackgroundColor3)
						end
					end
				)
				Toggle2.MouseButton1Down:Connect(
					function()
						RainbowColorPicker = not RainbowColorPicker

						if ColorInput then
							ColorInput:Disconnect()
						end

						if HueInput then
							HueInput:Disconnect()
						end

						if RainbowColorPicker then


							OldToggleColor = BoxColor.BackgroundColor3
							OldColor = Color.BackgroundColor3
							OldColorSelectionPosition = ColorSelection.Position
							OldHueSelectionPosition = HueSelection.Position

							while RainbowColorPicker do
								BoxColor.BackgroundColor3 = Color3.fromHSV(LunaColor.RainbowColorValue, 1, 1)
								Color.BackgroundColor3 = Color3.fromHSV(LunaColor.RainbowColorValue, 1, 1)

								ColorSelection.Position = UDim2.new(1, 0, 0, 0)
								HueSelection.Position = UDim2.new(0,  LunaColor.HueSelectionPosition, 0.5,0)

								pcall(callback, BoxColor.BackgroundColor3)
								wait()
							end
						elseif not RainbowColorPicker then

							BoxColor.BackgroundColor3 = OldToggleColor
							Color.BackgroundColor3 = OldColor

							ColorSelection.Position = OldColorSelectionPosition
							HueSelection.Position = OldHueSelectionPosition

							pcall(callback, BoxColor.BackgroundColor3)
						end
					end
				)


				local function UpdateColorPicker(nope)
					BoxColor.BackgroundColor3 = Color3.fromHSV(ColorH, ColorS, ColorV)
					Color.BackgroundColor3 = Color3.fromHSV(ColorH, 1, 1)

					pcall(callback, BoxColor.BackgroundColor3)
				end
				ColorH =
					1 -
					(math.clamp(HueSelection.AbsolutePosition.Y - Hue.AbsolutePosition.Y, 0, Hue.AbsoluteSize.Y) /
						Hue.AbsoluteSize.Y)
				ColorS =
					(math.clamp(ColorSelection.AbsolutePosition.X - Color.AbsolutePosition.X, 0, Color.AbsoluteSize.X) /
						Color.AbsoluteSize.X)
				ColorV =
					1 -
					(math.clamp(ColorSelection.AbsolutePosition.Y - Color.AbsolutePosition.Y, 0, Color.AbsoluteSize.Y) /
						Color.AbsoluteSize.Y)

				BoxColor.BackgroundColor3 = preset
				Color.BackgroundColor3 = preset
				pcall(callback, BoxColor.BackgroundColor3)

				local RainbowColorPicker = false 

				Color.InputBegan:Connect(
					function(input)
						if input.UserInputType == Enum.UserInputType.MouseButton1 then
							if RainbowColorPicker then
								return
							end

							if ColorInput then
								ColorInput:Disconnect()
							end

							ColorInput =
								RunService.RenderStepped:Connect(function()
										local ColorX =(math.clamp(Mouse.X - Color.AbsolutePosition.X, 0, Color.AbsoluteSize.X) /Color.AbsoluteSize.X)
										local ColorY =(math.clamp(Mouse.Y - Color.AbsolutePosition.Y, 0, Color.AbsoluteSize.Y) /Color.AbsoluteSize.Y)

										ColorSelection.Position = UDim2.new(ColorX, 0, ColorY, 0)
										ColorS = ColorX
										ColorV = 1 - ColorY

										UpdateColorPicker(true)
									end
								)
						end
					end
				)


				Color.InputEnded:Connect(
					function(input)
						if input.UserInputType == Enum.UserInputType.MouseButton1 then
							if ColorInput then
								ColorInput:Disconnect()
							end
						end
					end
				)

				Hue.InputBegan:Connect(
					function(input)
						if input.UserInputType == Enum.UserInputType.MouseButton1 then
							if RainbowColorPicker then
								return
							end

							if HueInput then
								HueInput:Disconnect()
							end

							HueInput =
								RunService.RenderStepped:Connect(
									function()
										local HueY =(math.clamp(Mouse.Y - Hue.AbsolutePosition.Y, 0, Hue.AbsoluteSize.Y) /
											Hue.AbsoluteSize.Y)
										local HueX =(math.clamp(Mouse.X- Hue.AbsolutePosition.X, 0, Hue.AbsoluteSize.X) /
											Hue.AbsoluteSize.X)

										HueSelection.Position = UDim2.new(HueX, 0, HueY, 0)
										ColorH = 1 - HueY

										UpdateColorPicker(true)
									end
								)
						end
					end
				)

				Hue.InputEnded:Connect(
					function(input)
						if input.UserInputType == Enum.UserInputType.MouseButton1 then
							if HueInput then
								HueInput:Disconnect()
							end
						end
					end
				)
				local sk = false 
				TextButton_Dropdown.MouseButton1Click:Connect(function()
					if sk == false then 
						TweenService:Create(
							Pixker,
							TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
							{Size = UDim2.new(0, 318, 0, 180)}
						):Play()
					else
						TweenService:Create(
							Pixker,
							TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
							{Size = UDim2.new(0, 318, 0, 33)}
						):Play()
					end
					sk = not sk 
				end
				)
			end
			
			return LunaFunction
		end
		return LunaPage
	end
	return LunaTab
end
---------------------------------------------------------UI--------------------------------


			if _G.Team == "Pirate" then
				for i,v in pairs(getconnections(game:GetService("Players").LocalPlayer.PlayerGui.Main.ChooseTeam.Container.Pirates.Frame.ViewportFrame.TextButton.MouseButton1Click)) do
					v.Function()
				end
			elseif _G.Team == "Marine" then
				for i,v in pairs(getconnections(game:GetService("Players").LocalPlayer.PlayerGui.Main.ChooseTeam.Container.Marines.Frame.ViewportFrame.TextButton.MouseButton1Click)) do
					v.Function()
				end
			else
				for i,v in pairs(getconnections(game:GetService("Players").LocalPlayer.PlayerGui.Main.ChooseTeam.Container.Pirates.Frame.ViewportFrame.TextButton.MouseButton1Click)) do
					v.Function()
				end
			end
			if _G.Team == "Pirate" then
				for i,v in pairs(getconnections(game:GetService("Players").LocalPlayer.PlayerGui.Main.ChooseTeam.Container.Pirates.Frame.ViewportFrame.TextButton.MouseButton1Click)) do
					v.Function()
				end
			elseif _G.Team == "Marine" then
				for i,v in pairs(getconnections(game:GetService("Players").LocalPlayer.PlayerGui.Main.ChooseTeam.Container.Marines.Frame.ViewportFrame.TextButton.MouseButton1Click)) do
					v.Function()
				end
			else
				for i,v in pairs(getconnections(game:GetService("Players").LocalPlayer.PlayerGui.Main.ChooseTeam.Container.Pirates.Frame.ViewportFrame.TextButton.MouseButton1Click)) do
					v.Function()
				end
			end
wait(.5)

local Main = LunaUI.create()
 
 LunaUI:Notification("Blox Fruits Takab Premium","Takab Hub is Loading...",5)

LunaUI:Notification("DISCORD TAKAB HUB","https://discord.gg/464zmHcH99",5)
wait(3)
 
 local Tab1 = Main.createtab("Auto Farm")
 local Stats = Main.createtab("Stats")
 local TPSEC = Main.createtab("Teleport")
 local dun = Main.createtab("Dungeon")
 local buy = Main.createtab("Buy Item")
 local misc = Main.createtab("Misc")
 local aimbots = Main.createtab("Aimbot")
 local music = Main.createtab("Music")

local Page = Tab1.page()
local Page2 = Stats.page()
local Page3 = TPSEC.page()
local Page4 = dun.page()
local Page5 = buy.page()
local Page6 = misc.page()
local Page7 = aimbots.page()
local Page8 = music.page()

 -------------
 
 --2753915549 --OLD WORLD
 --4442272183 --NEW WORLD
 _G.FARM = false 
 _G.TOOLUP = ""
 _G.WEAPONUO = "None"
 _G.AUTOEQUIP = false
 _G.QUEST = 1
 
 
 
 
 local vu = game:GetService("VirtualUser")
 game:GetService("Players").LocalPlayer.Idled:connect(function()
 vu:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
 wait()
 vu:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
 end)
 
 
 
 
 
 
 
 
 
 
 function quest() -- QUESTTTTTTTTTTTTTTTT
 
 if game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == true then
 
 else
StopTween()
 repeat TP(_G.QUESTMON) wait() until _G.StopTween == true or not _G.FARM or (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - _G.QUESTMON.Position).Magnitude <= 8
 
 wait(0.5)
 local args = {
 [1] = "StartQuest",
 [2] = _G.NAMEQUEST,
 [3] = _G.QUESTNUM
 }
 
 game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
 
 wait(0.5)
 
 end
 end
 
 
 
 
 

 
 
 
 
 function attack() -- ATACKKKKKKKKKKKKKK
 
 require(game:GetService("Players").LocalPlayer.PlayerScripts.CombatFramework.CameraShaker).CameraShakeInstance.CameraShakeState = {FadingIn = 3,FadingOut = 2,Sustained = 0,Inactive =1}
 game:GetService'VirtualUser':CaptureController()
 game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))
 
 
 end
 
 
 function TPMON()
     local mon = game:GetService("Workspace").Enemies:GetChildren()
     for i,v in pairs(mon) do
   
         if v.Name == _G.Mon then
             v.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
             v.HumanoidRootPart.CanCollide = false
   
             TP(v.HumanoidRootPart.CFrame * _G.FARMMODE)
 
 
     
   
     end
     end
     
     end
 
 
     
 
 
     function StopTween()
         pcall(function()
             tween:Cancel()
             _G.StopTween = true
             wait()
             _G.StopTween = false
         end)
     end
 
 
 
 
 --------------------------------------------------------------------------------------------------
 
 
 
 
 
 
 
 
 
 
local placeId = game.PlaceId
	if placeId == 2753915549 then
		OldWorld = true
	elseif placeId == 4442272183 then
		newworld = true
	elseif placeId == 7449423635 then
		thirdworld = true
	end











function checklevel()
    local MYLEVEL = game:GetService("Players").LocalPlayer.Data.Level.Value
    if OldWorld then
        magbring = 240
		if MYLEVEL == 1 or MYLEVEL <= 9 then -- Bandit
		            magbring = 400
					
					_G.Mon = "Bandit [Lv. 5]"
					_G.NAMEQUEST = "BanditQuest1"
					_G.QUESTNUM = 1
			        _G.NameMon = "Bandit"
					_G.QUESTMON = CFrame.new(1059.37195, 15.4495068, 1550.4231, 0.939700544, -0, -0.341998369, 0, 1, -0, 0.341998369, 0, 0.939700544)
					_G.PUK = CFrame.new(1353.44885, 3.40935516, 1376.92029, 0.776053488, -6.97791975e-08, 0.630666852, 6.99138596e-08, 1, 2.4612488e-08, -0.630666852, 2.49917598e-08, 0.776053488)
				elseif MYLEVEL == 10 or MYLEVEL <= 14 then -- Monkey
					
					_G.Mon = "Monkey [Lv. 14]"
					_G.NAMEQUEST = "JungleQuest"
					_G.QUESTNUM = 1
			        _G.NameMon = "Monkey"
					_G.QUESTMON = CFrame.new(-1598.08911, 35.5501175, 153.377838, 0, 0, 1, 0, 1, -0, -1, 0, 0)
					_G.PUK = CFrame.new(-1402.74609, 98.5633316, 90.6417007, 0.836947978, 0, 0.547282517, -0, 1, -0, -0.547282517, 0, 0.836947978)
				elseif MYLEVEL == 15 or MYLEVEL <= 29 then -- Gorilla
					
					_G.Mon = "Gorilla [Lv. 20]"
					_G.NAMEQUEST = "JungleQuest"
					_G.QUESTNUM = 2
			        _G.NameMon = "Gorilla"
					_G.QUESTMON = CFrame.new(-1598.08911, 35.5501175, 153.377838, 0, 0, 1, 0, 1, -0, -1, 0, 0)
					_G.PUK = CFrame.new(-1267.89001, 66.2034225, -531.818115, -0.813996196, -5.25169774e-08, -0.580869019, -5.58769671e-08, 1, -1.21082593e-08, 0.580869019, 2.26011476e-08, -0.813996196)
				elseif MYLEVEL == 30 or MYLEVEL <= 39 then
	            	_G.Mon = "Pirate [Lv. 35]"
	            	_G.NAMEQUEST = "BuggyQuest1"
	            	_G.QUESTNUM = 1
	            	_G.NameMon = "Pirate"
	            	_G.QUESTTEXT = "Reward:\n$3,000\n10,000 Exp."
	            	_G.QUESTMON = CFrame.new(-1139.56116, 4.75204945, 3825.97827, -0.947666645, 2.60038924e-08, 0.319261551, 3.65571005e-08, 1, 2.70626153e-08, -0.319261551, 3.73176157e-08, -0.947666645)
	            	_G.PUK = CFrame.new(-1223.64111, 4.75204945, 3914.84668, -0.99005419, 5.39223821e-09, 0.140686572, -6.35229591e-10, 1, -4.27983267e-08, -0.140686572, -4.24620303e-08, -0.99005419)
	        	elseif MYLEVEL == 40 or MYLEVEL <= 59 then
	            	_G.Mon = "Brute [Lv. 45]"
	            	_G.NAMEQUEST = "BuggyQuest1"
            		_G.QUESTNUM = 2
            		_G.NameMon = "Brute"
               		_G.QUESTTEXT = "Reward:\n$3,500\n18,000 Exp."
            		_G.QUESTMON = CFrame.new(-1139.56116, 4.75204945, 3825.97827, -0.947666645, 2.60038924e-08, 0.319261551, 3.65571005e-08, 1, 2.70626153e-08, -0.319261551, 3.73176157e-08, -0.947666645)
            		_G.PUK = CFrame.new(-1140.92944, 14.8098745, 4317.16455, -0.943479657, 3.71900555e-08, -0.331430465, 1.7316566e-08, 1, 6.2915845e-08, 0.331430465, 5.36205853e-08, -0.943479657)
            	elseif MYLEVEL == 60 or MYLEVEL <= 74 then
            		_G.Mon = "Desert Bandit [Lv. 60]"
            		_G.NAMEQUEST = "DesertQuest"
            		_G.QUESTNUM = 1
            		_G.NameMon = "Desert Bandit"
            		_G.QUESTTEXT = "Reward:\n$4,000\n35,000 Exp."
            		_G.QUESTMON = CFrame.new(896.408142, 6.43846178, 4389.37891, -0.846945703, -2.31297754e-08, 0.531679392, -1.55507234e-08, 1, 1.87315088e-08, -0.531679392, 7.59657048e-09, -0.846945703)
            		_G.PUK = CFrame.new(949.532593, 15.2893953, 4403.09912, -0.832314849, -4.19622452e-08, 0.55430311, 7.94023236e-10, 1, 7.68949704e-08, -0.55430311, 6.44409539e-08, -0.832314849)
            	elseif MYLEVEL == 75 or MYLEVEL <= 89 then
            		_G.Mon = "Desert Officer [Lv. 70]"
            		_G.NAMEQUEST = "DesertQuest"
            		_G.QUESTNUM = 2
            		_G.NameMon = "Desert Officer"
            		_G.QUESTTEXT = "Reward:\n$4,500\n50,000 Exp."
            		_G.QUESTMON = CFrame.new(896.408142, 6.43846178, 4389.37891, -0.846945703, -2.31297754e-08, 0.531679392, -1.55507234e-08, 1, 1.87315088e-08, -0.531679392, 7.59657048e-09, -0.846945703)
            		_G.PUK = CFrame.new(1547.40369, 14.4520388, 4359.40625, 0.228631318, -1.20783e-07, -0.973513126, -3.43095508e-08, 1, -1.32126871e-07, 0.973513126, 6.36091286e-08, 0.228631318)
    			elseif MYLEVEL == 90 or MYLEVEL <= 99 then -- Snow Bandits
					
					_G.Mon = "Snow Bandit [Lv. 90]"
					_G.NAMEQUEST = "SnowQuest"
					_G.QUESTNUM = 1
			        _G.NameMon = "Snow Bandit"
					_G.QUESTMON = CFrame.new(1389.74451, 86.6520844, -1298.90796, -0.342042685, 0, 0.939684391, 0, 1, 0, -0.939684391, 0, -0.342042685)
					_G.PUK = CFrame.new(1412.92346, 55.3503647, -1260.62036, -0.246266365, -0.0169920288, -0.969053388, 0.000432241941, 0.999844253, -0.0176417865, 0.969202161, -0.00476344163, -0.246220857)
				elseif MYLEVEL == 100 or MYLEVEL <= 119 then -- Snowman
					
					_G.Mon = "Snowman [Lv. 100]"
					_G.NAMEQUEST = "SnowQuest"
					_G.QUESTNUM = 2
			        _G.NameMon = "Snowman"
					_G.QUESTMON = CFrame.new(1389.74451, 86.6520844, -1298.90796, -0.342042685, 0, 0.939684391, 0, 1, 0, -0.939684391, 0, -0.342042685)
					_G.PUK = CFrame.new(1376.86401, 97.2779999, -1396.93115, -0.986755967, 7.71178321e-08, -0.162211925, 7.71531674e-08, 1, 6.08143536e-09, 0.162211925, -6.51427134e-09, -0.986755967)
				elseif MYLEVEL == 120 or MYLEVEL <= 149 then -- Chief Petty Officer
					
					_G.Mon = "Chief Petty Officer [Lv. 120]"
					_G.NAMEQUEST = "MarineQuest2"
					_G.QUESTNUM = 1
			        _G.NameMon = "Chief Petty Officer"
					_G.QUESTMON = CFrame.new(-5039.58643, 27.3500385, 4324.68018, 0, 0, -1, 0, 1, 0, 1, 0, 0)
					_G.PUK = CFrame.new(-4882.8623, 22.6520386, 4255.53516, 0.273695946, -5.40380647e-08, -0.96181643, 4.37720793e-08, 1, -4.37274998e-08, 0.96181643, -3.01326679e-08, 0.273695946)
				elseif MYLEVEL == 150 or MYLEVEL <= 174 then -- Sky Bandit
					
					_G.Mon = "Sky Bandit [Lv. 150]"
					_G.NAMEQUEST = "SkyQuest"
					_G.QUESTNUM = 1
				    _G.NameMon = "Sky Bandit"
					_G.QUESTMON = CFrame.new(-4839.53027, 716.368591, -2619.44165, 0.866007268, 0, 0.500031412, 0, 1, 0, -0.500031412, 0, 0.866007268)
					_G.PUK = CFrame.new(-4959.51367, 365.39267, -2974.56812, 0.964867651, 7.74418396e-08, 0.262737453, -6.95931988e-08, 1, -3.91783708e-08, -0.262737453, 1.95171506e-08, 0.964867651)
				elseif MYLEVEL == 175 or MYLEVEL <= 189 then -- Dark Master
					
					_G.Mon = "Dark Master [Lv. 175]"
					_G.NAMEQUEST = "SkyQuest"
					_G.QUESTNUM = 2
				    _G.NameMon = "Dark Master"
					_G.QUESTMON = CFrame.new(-4839.53027, 716.368591, -2619.44165, 0.866007268, 0, 0.500031412, 0, 1, 0, -0.500031412, 0, 0.866007268)
					_G.PUK = CFrame.new(-5079.98096, 376.477356, -2194.17139, 0.465965867, -3.69776352e-08, 0.884802461, 3.40249851e-09, 1, 4.00000886e-08, -0.884802461, -1.56281423e-08, 0.465965867)
				elseif MYLEVEL == 190 or MYLEVEL <= 209 then
					
					_G.Mon = "Prisoner [Lv. 190]"
					_G.QUESTNUM = 1
					_G.NAMEQUEST = "PrisonerQuest"
				    _G.NameMon = "Prisoner"
					_G.QUESTMON = CFrame.new(5308.93115, 1.65517521, 475.120514, -0.0894274712, -5.00292918e-09, -0.995993316, 1.60817859e-09, 1, -5.16744869e-09, 0.995993316, -2.06384709e-09, -0.0894274712)
					_G.PUK = CFrame.new(5433.39307, 88.678093, 514.986877, 0.879988372, 0, -0.474995494, 0, 1, 0, 0.474995494, 0, 0.879988372)
				elseif MYLEVEL == 210 or MYLEVEL <= 249 then
					
					_G.Mon = "Dangerous Prisoner [Lv. 210]"
					_G.QUESTNUM = 2
					_G.NAMEQUEST = "PrisonerQuest"
				    _G.NameMon = "Dangerous Prisoner"
					_G.QUESTMON = CFrame.new(5308.93115, 1.65517521, 475.120514, -0.0894274712, -5.00292918e-09, -0.995993316, 1.60817859e-09, 1, -5.16744869e-09, 0.995993316, -2.06384709e-09, -0.0894274712)
					_G.PUK = CFrame.new(5433.39307, 88.678093, 514.986877, 0.879988372, 0, -0.474995494, 0, 1, 0, 0.474995494, 0, 0.879988372)
				elseif MYLEVEL == 250 or MYLEVEL <= 274 then -- Toga Warrior
					
					_G.Mon = "Toga Warrior [Lv. 250]"
					_G.NAMEQUEST = "ColosseumQuest"
					_G.QUESTNUM = 1
				    _G.NameMon = "Toga Warrior"
					_G.QUESTMON = CFrame.new(-1576.11743, 7.38933945, -2983.30762, 0.576966345, 1.22114863e-09, 0.816767931, -3.58496594e-10, 1, -1.24185606e-09, -0.816767931, 4.2370063e-10, 0.576966345)
					_G.PUK = CFrame.new(-1779.97583, 44.6077499, -2736.35474, 0.984437346, 4.10396339e-08, 0.175734788, -3.62286876e-08, 1, -3.05844168e-08, -0.175734788, 2.3741821e-08, 0.984437346)
				elseif MYLEVEL == 275 or MYLEVEL <= 299 then -- Gladiato
					
					_G.Mon = "Gladiator [Lv. 275]"
					_G.NAMEQUEST = "ColosseumQuest"
					_G.QUESTNUM = 2
					_G.NameMon = "Gladiator"
					_G.QUESTMON = CFrame.new(-1576.11743, 7.38933945, -2983.30762, 0.576966345, 1.22114863e-09, 0.816767931, -3.58496594e-10, 1, -1.24185606e-09, -0.816767931, 4.2370063e-10, 0.576966345)
					_G.PUK = CFrame.new(-1274.75903, 58.1895943, -3188.16309, 0.464524001, 6.21005611e-08, 0.885560572, -4.80449414e-09, 1, -6.76054768e-08, -0.885560572, 2.71497012e-08, 0.464524001)
				elseif MYLEVEL == 300 or MYLEVEL <= 329 then -- Military Soldier
					
					_G.Mon = "Military Soldier [Lv. 300]"
					_G.NAMEQUEST = "MagmaQuest"
					_G.QUESTNUM = 1
                    _G.NameMon = "Military Soldier"
					_G.QUESTMON = CFrame.new(-5316.55859, 12.2370615, 8517.2998, 0.588437557, -1.37880001e-08, -0.808542669, -2.10116209e-08, 1, -3.23446478e-08, 0.808542669, 3.60215964e-08, 0.588437557)
					_G.PUK = CFrame.new(-5363.01123, 41.5056877, 8548.47266, -0.578253984, -3.29503091e-10, 0.815856814, 9.11209668e-08, 1, 6.498761e-08, -0.815856814, 1.11920997e-07, -0.578253984)
				elseif MYLEVEL == 330 or MYLEVEL <= 374 then -- Military Spy
					_G.NameMon = "Military Spy"
					_G.Mon = "Military Spy [Lv. 325]"
					_G.NAMEQUEST = "MagmaQuest"
					_G.QUESTNUM = 2
					_G.QUESTMON = CFrame.new(-5316.55859, 12.2370615, 8517.2998, 0.588437557, -1.37880001e-08, -0.808542669, -2.10116209e-08, 1, -3.23446478e-08, 0.808542669, 3.60215964e-08, 0.588437557)
					_G.PUK = CFrame.new(-5787.99023, 120.864456, 8762.25293, -0.188358366, -1.84706277e-08, 0.982100308, -1.23782129e-07, 1, -4.93306951e-09, -0.982100308, -1.22495649e-07, -0.188358366)
		elseif MYLEVEL == 375 or MYLEVEL <= 399 then
		_G.Mon = "Fishman Warrior [Lv. 375]"
		_G.NAMEQUEST = "FishmanQuest"
		_G.QUESTNUM = 1
		_G.NameMon = "Fishman Warrior"
		_G.QUESTTEXT = "Reward:\n$8,750\n2,500,000 Exp."
		_G.QUESTMON = CFrame.new(61122.2422, 18.4716377, 1568.84778, 0.971045971, -1.77007031e-08, 0.238892734, 4.80190776e-09, 1, 5.45760841e-08, -0.238892734, -5.18487475e-08, 0.971045971)
		_G.PUK = CFrame.new(60898.043, 18.4828224, 1550.9906, -0.0750192106, -4.46996573e-09, 0.997182071, 3.6461556e-10, 1, 4.51002746e-09, -0.997182071, 7.0192685e-10, -0.0750192106)
        if _G.FARM and (_G.QUESTMON.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 3000 then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(61163.8515625, 11.6796875, 1819.7841796875))
        end
        elseif MYLEVEL == 400 or MYLEVEL <= 449 then
		_G.Mon = "Fishman Commando [Lv. 400]"
		_G.NAMEQUEST = "FishmanQuest"
		_G.QUESTNUM = 2
		_G.NameMon = "Fishman Commando"
		_G.QUESTTEXT = "Reward:\n$9,000\n3,000,000 Exp."
		_G.QUESTMON = CFrame.new(61122.2422, 18.4716377, 1568.84778, 0.971045971, -1.77007031e-08, 0.238892734, 4.80190776e-09, 1, 5.45760841e-08, -0.238892734, -5.18487475e-08, 0.971045971)
		_G.PUK = CFrame.new(61885.4063, 18.4828224, 1500.37195, 0.722261012, 4.84021889e-08, -0.691620588, 1.27929427e-08, 1, 8.33434299e-08, 0.691620588, -6.90435726e-08, 0.722261012)
        if _G.FARM and (_G.QUESTMON.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 3000 then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(61163.8515625, 11.6796875, 1819.7841796875))
        end
        elseif MYLEVEL == 450 or MYLEVEL <= 474 then
		_G.Mon = "God's Guard [Lv. 450]"
		_G.NAMEQUEST = "SkyExp1Quest"
		_G.QUESTNUM = 1
		_G.NameMon = "God's Guard"
		_G.QUESTTEXT = "Reward:\n$8,750\n3,800,000 Exp."
		_G.QUESTMON = CFrame.new(-4721.28369, 845.277161, -1954.95154, -0.979754269, -1.72096932e-08, 0.200205252, -2.52417198e-09, 1, 7.36076018e-08, -0.200205252, 7.16119786e-08, -0.979754269)
		_G.PUK = CFrame.new(-4630.00635, 866.902954, -1936.76331, -0.656243384, 9.12737941e-12, 0.754549265, 3.58402819e-09, 1, 3.10498938e-09, -0.754549265, 4.74195483e-09, -0.656243384)
        if _G.FARM and (_G.QUESTMON.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 3000 then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-4607.82275, 872.54248, -1667.55688))
        end
        elseif MYLEVEL == 475 or MYLEVEL <= 524 then
		_G.Mon = "Shanda [Lv. 475]"
		_G.NAMEQUEST = "SkyExp1Quest"
		_G.QUESTNUM = 2
		_G.NameMon = "Shanda"
		_G.QUESTTEXT = "Reward:\n$9,000\n4,300,000 Exp."
		_G.QUESTMON = CFrame.new(-7861.79736, 5545.49316, -379.920776, 0.504107952, -1.41941534e-08, -0.863640666, -1.31181936e-08, 1, -2.40923566e-08, 0.863640666, 2.34745521e-08, 0.504107952)
		_G.PUK = CFrame.new(-7682.69775, 5607.36279, -445.691833, 0.786274791, -4.48163426e-08, -0.617877364, -4.81674345e-09, 1, -7.86622607e-08, 0.617877364, 6.48263239e-08, 0.786274791)
        if _G.FARM and (_G.QUESTMON.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 3000 then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-7894.6176757813, 5547.1416015625, -380.29119873047))
        end
        elseif MYLEVEL == 525 or MYLEVEL <= 549 then
		_G.Mon = "Royal Squad [Lv. 525]"
		_G.NAMEQUEST = "SkyExp2Quest"
		_G.QUESTNUM = 1
		_G.NameMon = "Royal Squad"
		_G.QUESTTEXT = "Reward:\n$9,500\n4,600,000 Exp."
		_G.QUESTMON = CFrame.new(-7902.23242, 5635.96387, -1411.96741, -0.0435957126, -2.13718043e-09, 0.999049246, 4.23562352e-10, 1, 2.15769735e-09, -0.999049246, 5.1722604e-10, -0.0435957126)
		_G.PUK = CFrame.new(-7579.42285, 5628.39111, -1540.75073, -0.0374937952, 1.17099557e-08, 0.999296963, -3.30279164e-08, 1, -1.29574085e-08, -0.999296963, -3.34905081e-08, -0.0374937952)
		elseif MYLEVEL == 550 or MYLEVEL <= 624 then
		_G.Mon = "Royal Soldier [Lv. 550]"
		_G.NAMEQUEST = "SkyExp2Quest"
		_G.QUESTNUM = 2
		_G.NameMon = "Royal Soldier"
		_G.QUESTTEXT = "Reward:\n$9,750\n5,000,000 Exp."
		_G.QUESTMON = CFrame.new(-7902.23242, 5635.96387, -1411.96741, -0.0435957126, -2.13718043e-09, 0.999049246, 4.23562352e-10, 1, 2.15769735e-09, -0.999049246, 5.1722604e-10, -0.0435957126)
		_G.PUK = CFrame.new(-7834.84717, 5681.36182, -1790.76782, -0.102890432, 3.28112684e-08, 0.994692683, -6.45397762e-08, 1, -3.96622966e-08, -0.994692683, -6.82781121e-08, -0.102890432)
		elseif MYLEVEL == 625 or MYLEVEL <= 649 then
		_G.Mon = "Galley Pirate [Lv. 625]"
		_G.NAMEQUEST = "FountainQuest"
		_G.QUESTNUM = 1
		_G.NameMon = "Galley Pirate"
		_G.QUESTTEXT = "Reward:\n$10,000\n5,800,000 Exp."
		_G.QUESTMON = CFrame.new(5254.52734, 38.5011368, 4049.80127, -0.0732342899, 2.23174847e-08, -0.997314751, 1.2052287e-07, 1, 1.35274023e-08, 0.997314751, -1.19208565e-07, -0.0732342899)
		_G.PUK = CFrame.new(5597.58936, 41.5013657, 3960.55371, -0.584786832, 4.98908861e-08, 0.811187029, 4.10757259e-08, 1, -3.18919575e-08, -0.811187029, 1.4670098e-08, -0.584786832)
		elseif MYLEVEL >= 650 then
		_G.Mon = "Galley Captain [Lv. 650]"
		_G.NAMEQUEST = "FountainQuest"
		_G.QUESTNUM = 2
		_G.NameMon = "Galley Captain"
		_G.QUESTTEXT = "Reward:\n$10,000\n6,300,000 Exp."
		_G.QUESTMON = CFrame.new(5254.52734, 38.5011368, 4049.80127, -0.0732342899, 2.23174847e-08, -0.997314751, 1.2052287e-07, 1, 1.35274023e-08, 0.997314751, -1.19208565e-07, -0.0732342899)
		_G.PUK = CFrame.new(5705.8252, 52.241478, 4890.11035, -0.969319642, 4.40228476e-09, 0.245803744, -7.88622412e-09, 1, -4.90088397e-08, -0.245803744, -4.94436954e-08, -0.969319642)    
		end
		end
		if newworld then
		    magbring = 400
		if MYLEVEL == 700 or MYLEVEL <= 724 then
		_G.Mon = "Raider [Lv. 700]"
		_G.NAMEQUEST = "Area1Quest"
		_G.QUESTNUM = 1
		_G.NameMon = "Raider"
		_G.QUESTTEXT = "Reward:\n$10,250\n6,750,000 Exp."
		_G.QUESTMON = CFrame.new(-424.080078, 73.0055847, 1836.91589, 0.253544956, -1.42165932e-08, 0.967323601, -6.00147771e-08, 1, 3.04272909e-08, -0.967323601, -6.5768397e-08, 0.253544956)
		_G.PUK = CFrame.new(-141.872437, 96.6845093, 2491.01538, 0.13152431, 0, -0.991312981, -0, 1.00000012, -0, 0.991312981, 0, 0.13152431)
		elseif MYLEVEL == 725 or MYLEVEL <= 774 then
		_G.Mon = "Mercenary [Lv. 725]"
		_G.NAMEQUEST = "Area1Quest"
		_G.QUESTNUM = 2
		_G.NameMon = "Mercenary"
		_G.QUESTTEXT = "Reward:\n$10,500\n7,000,000 Exp."
		_G.QUESTMON = CFrame.new(-424.080078, 73.0055847, 1836.91589, 0.253544956, -1.42165932e-08, 0.967323601, -6.00147771e-08, 1, 3.04272909e-08, -0.967323601, -6.5768397e-08, 0.253544956)
		_G.PUK = CFrame.new(-938.497314, 80.9546738, 1443.98608, 0.231955677, 0, 0.972726345, -0, 1, -0, -0.972726345, 0, 0.231955677)
		elseif MYLEVEL == 775 or MYLEVEL <= 874 then
		_G.Mon = "Swan Pirate [Lv. 775]"
		_G.NAMEQUEST = "Area2Quest"
		_G.QUESTNUM = 1
		_G.NameMon = "Swan Pirate"
		_G.QUESTTEXT = "Reward:\n$10,750\n7,500,000 Exp."
		_G.QUESTMON = CFrame.new(632.698608, 73.1055908, 918.666321, -0.0319722369, 8.96074881e-10, -0.999488771, 1.36326533e-10, 1, 8.92172336e-10, 0.999488771, -1.07732087e-10, -0.0319722369)
		_G.PUK = CFrame.new(967.233276, 141.309494, 1210.06384, 0.999673784, 5.40161649e-09, -0.0255404469, -7.62258967e-09, 1, -8.68617107e-08, 0.0255404469, 8.7028063e-08, 0.999673784)
		elseif MYLEVEL == 875 or MYLEVEL <= 899 then
		_G.Mon = "Marine Lieutenant [Lv. 875]"
		_G.NAMEQUEST = "MarineQuest3"
		_G.QUESTNUM = 1
		_G.NameMon = "Marine Lieutenant"
		_G.QUESTTEXT = "Reward:\n$11,250\n9,000,000 Exp."
		_G.QUESTMON = CFrame.new(-2443.04639, 73.0161057, -3220.30225, -0.854058921, -6.13997599e-08, -0.520176232, -1.30658604e-08, 1, -9.65840883e-08, 0.520176232, -7.56919505e-08, -0.854058921)
		_G.PUK = CFrame.new(-2967.00757, 72.9661407, -2972.7478, 0.977851391, 8.27619218e-08, -0.209300488, -6.95268412e-08, 1, 7.05923142e-08, 0.209300488, -5.44767893e-08, 0.977851391)
		elseif MYLEVEL == 900 or MYLEVEL <= 949 then
		_G.Mon = "Marine Captain [Lv. 900]"
		_G.NAMEQUEST = "MarineQuest3"
		_G.QUESTNUM = 2
		_G.NameMon = "Marine Captain"
		_G.QUESTTEXT = "Reward:\n$11,500\n10,500,000 Exp."
		_G.QUESTMON = CFrame.new(-2443.04639, 73.0161057, -3220.30225, -0.854058921, -6.13997599e-08, -0.520176232, -1.30658604e-08, 1, -9.65840883e-08, 0.520176232, -7.56919505e-08, -0.854058921)
		_G.PUK = CFrame.new(-1818.36401, 93.3760834, -3203.57788, 0.315930545, 4.84752114e-08, 0.948782325, 1.37578589e-08, 1, -5.56731905e-08, -0.948782325, 3.06420738e-08, 0.315930545)
		elseif MYLEVEL == 950 or MYLEVEL <= 974 then
		_G.Mon = "Zombie [Lv. 950]"
		_G.NAMEQUEST = "ZombieQuest"
		_G.QUESTNUM = 1
		_G.NameMon = "Zombie"
		_G.QUESTTEXT = "Reward:\n$11,750\n11,000,000 Exp."
		_G.QUESTMON = CFrame.new(-5492.79395, 48.5151672, -793.710571, 0.321800292, -6.24695815e-08, 0.946807742, 4.05616092e-08, 1, 5.21931227e-08, -0.946807742, 2.16082796e-08, 0.321800292)
		_G.PUK = CFrame.new(-5736.03516, 126.031998, -728.026184, 0.0818082988, -5.90035434e-08, 0.996648133, 3.5947787e-09, 1, 5.89069167e-08, -0.996648133, -1.23634614e-09, 0.0818082988)
		elseif MYLEVEL == 975 or MYLEVEL <= 999 then
		_G.Mon = "Vampire [Lv. 975]"
		_G.NAMEQUEST = "ZombieQuest"
		_G.QUESTNUM = 2
		_G.NameMon = "Vampire"
		_G.QUESTTEXT = "Reward:\n$12,000\n12,000,000 Exp."
		_G.QUESTMON = CFrame.new(-5492.79395, 48.5151672, -793.710571, 0.321800292, -6.24695815e-08, 0.946807742, 4.05616092e-08, 1, 5.21931227e-08, -0.946807742, 2.16082796e-08, 0.321800292)
		_G.PUK = CFrame.new(-6028.23584, 6.40270138, -1295.4563, 0.667547405, 0, 0.744567394, -0, 1.00000012, -0, -0.744567394, 0, 0.667547405)
		elseif MYLEVEL == 1000 or MYLEVEL <= 1049 then
		_G.Mon = "Snow Trooper [Lv. 1000]"
		_G.NAMEQUEST = "SnowMountainQuest"
		_G.QUESTNUM = 1
		_G.NameMon = "Snow Trooper"
		_G.QUESTTEXT = "Reward:\n$12,250\n13,000,000 Exp."
		_G.QUESTMON = CFrame.new(605.670532, 401.422028, -5370.10107, 0.459257662, -9.56824509e-10, -0.888303101, 5.98925964e-10, 1, -7.67489405e-10, 0.888303101, -1.79552401e-10, 0.459257662)
		_G.PUK = CFrame.new(544.207947, 401.422028, -5309.08887, 0.503866196, -2.06684501e-08, 0.86378175, 1.27917943e-09, 1, 2.31816841e-08, -0.86378175, -1.05755351e-08, 0.503866196)
		elseif MYLEVEL == 1050 or MYLEVEL <= 1099 then
		_G.Mon = "Winter Warrior [Lv. 1050]"
		_G.NAMEQUEST = "SnowMountainQuest"
		_G.QUESTNUM = 2
		_G.NameMon = "Winter Warrior"
		_G.QUESTTEXT = "Reward:\n$12,500\n14,200,000 Exp."
		_G.QUESTMON = CFrame.new(605.670532, 401.422028, -5370.10107, 0.459257662, -9.56824509e-10, -0.888303101, 5.98925964e-10, 1, -7.67489405e-10, 0.888303101, -1.79552401e-10, 0.459257662)
		_G.PUK = CFrame.new(1240.86279, 461.108154, -5191.104, 0.528719008, -7.18234645e-08, 0.848796904, 2.89169716e-10, 1, 8.44378363e-08, -0.848796904, -4.4398444e-08, 0.528719008)
		elseif MYLEVEL == 1100 or MYLEVEL <= 1124 then
		_G.Mon = "Lab Subordinate [Lv. 1100]"
		_G.NAMEQUEST = "IceSideQuest"
		_G.QUESTNUM = 1
		_G.NameMon = "Lab Subordinate"
		_G.QUESTTEXT = "Reward:\n$12,250\n15,500,000 Exp."
		_G.QUESTMON = CFrame.new(-6060.10693, 15.9868021, -4904.7876, -0.411000341, -5.06538868e-07, 0.91163528, 1.26306062e-07, 1, 6.12581289e-07, -0.91163528, 3.66916197e-07, -0.411000341)
		_G.PUK = CFrame.new(-5833.63379, 48.4371948, -4510.4458, 0.0372838341, 5.56001822e-09, -0.999304712, -6.95599089e-09, 1, 5.30436006e-09, 0.999304712, 6.75338763e-09, 0.0372838341)
		elseif MYLEVEL == 1125 or MYLEVEL <= 1174 then
		_G.Mon = "Horned Warrior [Lv. 1125]"
		_G.NAMEQUEST = "IceSideQuest"
		_G.QUESTNUM = 2
		_G.NameMon = "Horned Warrior"
		_G.QUESTTEXT = "Reward:\n$12,500\n16,800,000 Exp."
		_G.QUESTMON = CFrame.new(-6060.10693, 15.9868021, -4904.7876, -0.411000341, -5.06538868e-07, 0.91163528, 1.26306062e-07, 1, 6.12581289e-07, -0.91163528, 3.66916197e-07, -0.411000341)
		_G.PUK = CFrame.new(-6168.15918, 42.7079964, -6020.96826, -0.744210601, 2.41774178e-09, -0.667945027, -2.3336304e-09, 1, 6.21975493e-09, 0.667945027, 6.18754425e-09, -0.744210601)
		elseif MYLEVEL == 1175 or MYLEVEL <= 1199 then
		_G.Mon = "Magma Ninja [Lv. 1175]"
		_G.NAMEQUEST = "FireSideQuest"
		_G.QUESTNUM = 1
		_G.NameMon = "Magma Ninja"
		_G.QUESTTEXT = "Reward:\n$12,250\n18,000,000 Exp."
		_G.QUESTMON = CFrame.new(-5429.68359, 15.9517593, -5296.70215, 0.919959962, -6.00166317e-08, -0.392012328, 2.29238974e-08, 1, -9.93018858e-08, 0.392012328, 8.23673076e-08, 0.919959962)
		_G.PUK = CFrame.new(-5404.85449, 22.8623676, -5896.09033, -0.519595861, 4.74720929e-09, 0.854412138, 1.52255595e-08, 1, 3.70304742e-09, -0.854412138, 1.49329917e-08, -0.519595861)
        if _G.FARM and (_G.QUESTMON.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 500 then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-5466.8896484375, 15.951756477356, -5212.197265625))
        end
        elseif MYLEVEL == 1200 or MYLEVEL <= 1249 then
		_G.Mon = "Lava Pirate [Lv. 1200]"
		_G.NAMEQUEST = "FireSideQuest"
		_G.QUESTNUM = 2
		_G.NameMon = "Lava Pirate"
		_G.QUESTTEXT = "Reward:\n$12,500\n20,000,000 Exp."
		_G.QUESTMON = CFrame.new(-5429.68359, 15.9517593, -5296.70215, 0.919959962, -6.00166317e-08, -0.392012328, 2.29238974e-08, 1, -9.93018858e-08, 0.392012328, 8.23673076e-08, 0.919959962)
		_G.PUK = CFrame.new(-5075.1958, 16.1485081, -4814.36133, -0.800640523, -1.06090866e-07, 0.599145055, -6.59776447e-08, 1, 8.89041587e-08, -0.599145055, 3.16500923e-08, -0.800640523)
		elseif MYLEVEL == 1250 or MYLEVEL <= 1274 then
		_G.Mon = "Ship Deckhand [Lv. 1250]"
		_G.NAMEQUEST = "ShipQuest1" 
		_G.QUESTNUM = 1
		_G.NameMon = "Ship Deckhand"
		_G.QUESTTEXT = "Reward:\n$12,250\n23,000,000 Exp."
		_G.QUESTMON = CFrame.new(1038.67456, 125.057098, 32911.3477, 0.120709591, 5.22710089e-08, -0.992687881, 7.9174507e-09, 1, 5.36187876e-08, 0.992687881, -1.43318593e-08, 0.120709591)
		_G.PUK = CFrame.new(1215.14063, 125.057114, 33050.7188, 0.527230442, 2.61814961e-08, 0.849722326, -5.66963045e-08, 1, 4.36674741e-09, -0.849722326, -5.04783984e-08, 0.527230442)
        if _G.FARM and (_G.QUESTMON.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 20000 then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(923.21252441406, 126.9760055542, 32852.83203125))
        end
        elseif MYLEVEL == 1275 or MYLEVEL <= 1299 then
		_G.Mon = "Ship Engineer [Lv. 1275]"
		_G.NAMEQUEST = "ShipQuest1" 
		_G.QUESTNUM = 2
		_G.NameMon = "Ship Engineer"
		_G.QUESTTEXT = "Reward:\n$12,500\n24,500,000 Exp."
		_G.QUESTMON = CFrame.new(1038.67456, 125.057098, 32911.3477, 0.120709591, 5.22710089e-08, -0.992687881, 7.9174507e-09, 1, 5.36187876e-08, 0.992687881, -1.43318593e-08, 0.120709591)
		_G.PUK = CFrame.new(862.985413, 40.4428635, 32867.9492, -0.847809434, 8.49998827e-08, -0.530301034, 2.99658929e-08, 1, 1.1237865e-07, 0.530301034, 7.93847335e-08, -0.847809434)
        if _G.FARM and (_G.QUESTMON.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 20000 then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(923.21252441406, 126.9760055542, 32852.83203125))
        end
        elseif MYLEVEL == 1300 or MYLEVEL <= 1324 then
		_G.Mon = "Ship Steward [Lv. 1300]"
		_G.NAMEQUEST = "ShipQuest2" 
		_G.QUESTNUM = 1
		_G.NameMon = "Ship Steward"
		_G.QUESTTEXT = "Reward:\n$12,250\n26,500,000 Exp."
		_G.QUESTMON = CFrame.new(969.268311, 125.057121, 33245.2695, -0.85863924, -4.77058464e-08, -0.512580395, -1.49134394e-08, 1, -6.80880134e-08, 0.512580395, -5.08187057e-08, -0.85863924)
		_G.PUK = CFrame.new(923.611511, 129.555984, 33442.3125, 0.997516274, 9.71936913e-08, 0.0704362914, -9.52239958e-08, 1, -3.13219992e-08, -0.0704362914, 2.45369804e-08, 0.997516274)
        if _G.FARM and (_G.QUESTMON.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 20000 then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(923.21252441406, 126.9760055542, 32852.83203125))
        end
        elseif MYLEVEL == 1325 or MYLEVEL <= 1349 then
		_G.Mon = "Ship Officer [Lv. 1325]"
		_G.NAMEQUEST = "ShipQuest2" 
		_G.QUESTNUM = 2
		_G.NameMon = "Ship Officer"
		_G.QUESTTEXT = "Reward:\n$12,500\n28,500,000 Exp."
		_G.QUESTMON = CFrame.new(969.268311, 125.057121, 33245.2695, -0.85863924, -4.77058464e-08, -0.512580395, -1.49134394e-08, 1, -6.80880134e-08, 0.512580395, -5.08187057e-08, -0.85863924)
		_G.PUK = CFrame.new(882.275574, 181.057739, 33354.1797, 0.845816016, -3.71928088e-08, -0.533474684, 1.28583932e-09, 1, -6.7679359e-08, 0.533474684, 5.65583242e-08, 0.845816016)
        if _G.FARM and (_G.QUESTMON.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 20000 then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(923.21252441406, 126.9760055542, 32852.83203125))
        end
        elseif MYLEVEL == 1350 or MYLEVEL <= 1374 then
		_G.Mon = "Arctic Warrior [Lv. 1350]"
		_G.NAMEQUEST = "FrostQuest" 
		_G.QUESTNUM = 1
		_G.NameMon = "Arctic Warrior"
		_G.QUESTTEXT = "Reward:\n$12,250\n30,000,000 Exp."
		_G.QUESTMON = CFrame.new(5669.43506, 28.2117786, -6482.60107, 0.888092756, 1.02705066e-07, 0.459664226, -6.20391774e-08, 1, -1.03572376e-07, -0.459664226, 6.34646895e-08, 0.888092756)
		_G.PUK = CFrame.new(5995.9292, 57.0727844, -6184.98926, 0.706337512, 5.23128296e-09, -0.707875192, -2.2285974e-08, 1, -1.48474424e-08, 0.707875192, 2.62629936e-08, 0.706337512)
        if _G.FARM and (_G.QUESTMON.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 20000 then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-6508.5581054688, 89.034996032715, -132.83953857422))
        end
        elseif MYLEVEL == 1375 or MYLEVEL <= 1424 then
		_G.Mon = "Snow Lurker [Lv. 1375]"
		_G.NAMEQUEST = "FrostQuest" 
		_G.QUESTNUM = 2
		_G.NameMon = "Snow Lurker"
		_G.QUESTTEXT = "Reward:\n$12,500\n32,000,000 Exp."
		_G.QUESTMON = CFrame.new(5669.43506, 28.2117786, -6482.60107, 0.888092756, 1.02705066e-07, 0.459664226, -6.20391774e-08, 1, -1.03572376e-07, -0.459664226, 6.34646895e-08, 0.888092756)
		_G.PUK = CFrame.new(5516.27539, 60.5209846, -6830.82764, 0.219563305, -7.8544824e-09, 0.975598276, 4.69439376e-09, 1, 6.99444236e-09, -0.975598276, 3.04411962e-09, 0.219563305)
	   if _G.FARM and (_G.QUESTMON.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 20000 then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-6508.5581054688, 89.034996032715, -132.83953857422))
        end
	   	elseif MYLEVEL == 1425 or MYLEVEL <= 1449 then
		_G.Mon = "Sea Soldier [Lv. 1425]"
		_G.NAMEQUEST = "ForgottenQuest" 
		_G.QUESTNUM = 1
		_G.NameMon = "Sea Soldier"
		_G.QUESTTEXT = "Reward:\n$12,250\n33,500,000 Exp."
		_G.QUESTMON = CFrame.new(-3053.97339, 236.846283, -10146.1484, -0.999963522, -2.10707256e-08, -0.00854360498, -2.09657198e-08, 1, -1.23802275e-08, 0.00854360498, -1.22006529e-08, -0.999963522)
		_G.PUK = CFrame.new(-3026.54834, 29.5403671, -9758.74316, -0.999909937, 1.71713896e-08, -0.0134194754, 1.68009748e-08, 1, 2.7715517e-08, 0.0134194754, 2.74875607e-08, -0.999909937)
        if _G.FARM and (_G.QUESTMON.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 20000 then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-6508.5581054688, 89.034996032715, -132.83953857422))
        end
        elseif MYLEVEL >= 1450  then
		_G.Mon = "Water Fighter [Lv. 1450]"
		_G.NAMEQUEST = "ForgottenQuest" 
		_G.QUESTNUM = 2
		_G.NameMon = "Water Fighter"
		_G.QUESTTEXT = "Reward:\n$12,500\n35,500,000 Exp."
		_G.QUESTMON = CFrame.new(-3053.97339, 236.846283, -10146.1484, -0.999963522, -2.10707256e-08, -0.00854360498, -2.09657198e-08, 1, -1.23802275e-08, 0.00854360498, -1.22006529e-08, -0.999963522)
		_G.PUK = CFrame.new(-3262.00098, 298.699615, -10553.6943, -0.233570755, -4.57538185e-08, 0.972339869, -5.80986068e-08, 1, 3.30992194e-08, -0.972339869, -4.87605725e-08, -0.233570755)
		end 
		end
		if thirdworld then
		    magbring = 400
		if MYLEVEL == 1500 or MYLEVEL <= 1524 then
		_G.Mon = "Pirate Millionaire [Lv. 1500]"
		_G.NAMEQUEST = "PiratePortQuest" 
		_G.QUESTNUM = 1
		_G.NameMon = "Pirate Millionaire"
		_G.QUESTTEXT = "Reward:\n$13,000\n35,000,000 Exp."
		_G.QUESTMON = CFrame.new(-288.688629, 43.7932091, 5578.0918, -0.980135322, 4.04644034e-08, 0.198329896, 5.16003063e-08, 1, 5.0980109e-08, -0.198329896, 6.02012875e-08, -0.980135322)
		_G.PUK = CFrame.new(-362.372589, 116.311394, 5690.42188, 0.982939184, -1.16153336e-08, -0.183930904, 1.35050096e-08, 1, 9.02115538e-09, 0.183930904, -1.13512355e-08, 0.982939184)
		elseif MYLEVEL == 1525 or MYLEVEL <= 1574 then
		_G.Mon = "Pistol Billionaire [Lv. 1525]"
		_G.NAMEQUEST = "PiratePortQuest" 
		_G.QUESTNUM = 2
		_G.NameMon = "Pistol Billionaire"
		_G.QUESTTEXT = "Reward:\n$15,000\n37,500,000 Exp."
		_G.QUESTMON = CFrame.new(-288.688629, 43.7932091, 5578.0918, -0.980135322, 4.04644034e-08, 0.198329896, 5.16003063e-08, 1, 5.0980109e-08, -0.198329896, 6.02012875e-08, -0.980135322)
		_G.PUK = CFrame.new(-238.026596, 219.645935, 6007.1748, 0.902000248, -1.08513618e-07, -0.431735516, 9.17130407e-08, 1, -5.97320096e-08, 0.431735516, 1.42825076e-08, 0.902000248)
		elseif MYLEVEL == 1575 or MYLEVEL <= 1599 then
		_G.Mon = "Dragon Crew Warrior [Lv. 1575]"
		_G.NAMEQUEST = "AmazonQuest" 
		_G.QUESTNUM = 1
		_G.NameMon = "Dragon Crew Warrior"
		_G.QUESTTEXT = "Reward:\n$13,000\n40,000,000 Exp."
		_G.QUESTMON = CFrame.new(5833.72559, 51.3513527, -1104.3147, -0.958539188, -3.53234562e-08, 0.284960806, -3.93179853e-08, 1, -8.29718783e-09, -0.284960806, -1.91572642e-08, -0.958539188)
		_G.PUK = CFrame.new(6210.00977, 51.4822731, -1187.48975, 0.208473638, 2.79291683e-08, -0.978027999, -6.3442954e-08, 1, 1.50332973e-08, 0.978027999, 5.89149387e-08, 0.208473638)
		elseif MYLEVEL == 1600 or MYLEVEL <= 1624 then
		_G.Mon = "Dragon Crew Archer [Lv. 1600]"
		_G.NAMEQUEST = "AmazonQuest" 
		_G.QUESTNUM = 2
		_G.NameMon = "Dragon Crew Archer"
		_G.QUESTTEXT = "Reward:\n$15,000\n42,500,000 Exp."
		_G.QUESTMON = CFrame.new(5833.72559, 51.3513527, -1104.3147, -0.958539188, -3.53234562e-08, 0.284960806, -3.93179853e-08, 1, -8.29718783e-09, -0.284960806, -1.91572642e-08, -0.958539188)
		_G.PUK = CFrame.new(6672.1167, 386.634491, 102.138634, -0.879578114, 4.99873778e-08, 0.475754529, -1.44054524e-09, 1, -1.07732973e-07, -0.475754529, -9.54449106e-08, -0.879578114)
		elseif MYLEVEL == 1625 or MYLEVEL <= 1649 then
		_G.Mon = "Female Islander [Lv. 1625]"
		_G.NAMEQUEST = "AmazonQuest2" 
		_G.QUESTNUM = 1
		_G.NameMon = "Female Islander"
		_G.QUESTTEXT = "Reward:\n$13,000\n45,500,000 Exp."
		_G.QUESTMON = CFrame.new(5445.99756, 601.603638, 750.611145, -0.0389447734, 1.17245778e-08, -0.999241352, 1.19459349e-08, 1, 1.12678942e-08, 0.999241352, -1.1498047e-08, -0.0389447734)
		_G.PUK = CFrame.new(4660.0293, 793.07666, 771.150757, -0.300044596, 6.91594604e-09, -0.953925192, -9.75659518e-08, 1, 3.79380722e-08, 0.953925192, 1.04453733e-07, -0.300044596)
		elseif MYLEVEL == 1650 or MYLEVEL <= 1699 then
		_G.Mon = "Giant Islander [Lv. 1650]"
		_G.NAMEQUEST = "AmazonQuest2" 
		_G.QUESTNUM = 2
		_G.NameMon = "Giant Islander"
		_G.QUESTTEXT = "Reward:\n$15,000\n48,000,000 Exp."
		_G.QUESTMON = CFrame.new(5445.99756, 601.603638, 750.611145, -0.0389447734, 1.17245778e-08, -0.999241352, 1.19459349e-08, 1, 1.12678942e-08, 0.999241352, -1.1498047e-08, -0.0389447734)
		_G.PUK = CFrame.new(5013.77881, 664.0849, -42.7317543, 0.793121755, 2.98509946e-08, 0.609063148, -3.13217008e-08, 1, -8.22422486e-09, -0.609063148, -1.25540822e-08, 0.793121755)
		elseif MYLEVEL == 1700 or MYLEVEL <= 1724 then
		_G.Mon = "Marine Commodore [Lv. 1700]"
		_G.NAMEQUEST = "MarineTreeIsland" 
		_G.QUESTNUM = 1
		_G.NameMon = "Marine Commodore"
		_G.QUESTTEXT = "Reward:\n$13,000\n51,000,000 Exp."
		_G.QUESTMON = CFrame.new(2179.58447, 28.7054367, -6738.48682, 0.97564882, -2.54533923e-08, -0.219338506, 1.31742075e-08, 1, -5.74454191e-08, 0.219338506, 5.31569455e-08, 0.97564882)
		_G.PUK = CFrame.new(2548.86279, 124.071259, -7774.8999, -0.790427029, -1.174846e-08, -0.612556159, -2.99833545e-08, 1, 1.95103667e-08, 0.612556159, 3.37880124e-08, -0.790427029)
		elseif MYLEVEL == 1725 or MYLEVEL <= 1774 then
		_G.Mon = "Marine Rear Admiral [Lv. 1725]"
		_G.NAMEQUEST = "MarineTreeIsland" 
		_G.QUESTNUM = 2
		_G.NameMon = "Marine Rear Admiral"
		_G.QUESTTEXT = "Reward:\n$15,000\n53,500,000 Exp."
		_G.QUESTMON = CFrame.new(2179.58447, 28.7054367, -6738.48682, 0.97564882, -2.54533923e-08, -0.219338506, 1.31742075e-08, 1, -5.74454191e-08, 0.219338506, 5.31569455e-08, 0.97564882)
		_G.PUK = CFrame.new(3582.24365, 160.524048, -7055.01416, -0.182099551, 6.68982807e-08, -0.983280122, 8.52377937e-08, 1, 5.22501367e-08, 0.983280122, -7.42978941e-08, -0.182099551)
		elseif MYLEVEL == 1775 or MYLEVEL <= 1799 then
		_G.Mon = "Fishman Raider [Lv. 1775]"
		_G.NAMEQUEST = "DeepForestIsland3" 
		_G.QUESTNUM = 1
		_G.NameMon = "Fishman Raider"
		_G.QUESTTEXT = "Reward:\n$13,000\n56,000,000 Exp."
		_G.QUESTMON = CFrame.new(-10582.666, 331.762634, -8758.61035, 0.919332206, 1.69593086e-08, -0.393482327, -3.42409479e-08, 1, -3.68999942e-08, 0.393482327, 4.73965578e-08, 0.919332206)
		_G.PUK = CFrame.new(-10449.9258, 331.762634, -8475.85742, -0.739984214, -8.96819241e-09, 0.67262423, -5.59647688e-08, 1, -4.82362239e-08, -0.67262423, -7.33373042e-08, -0.739984214)
		elseif MYLEVEL == 1800 or MYLEVEL <= 1824 then
		_G.Mon = "Fishman Captain [Lv. 1800]"
		_G.NAMEQUEST = "DeepForestIsland3" 
		_G.QUESTNUM = 2
		_G.NameMon = "Fishman Captain"
		_G.QUESTTEXT = "Reward:\n$15,000\n58,500,000 Exp."
		_G.QUESTMON = CFrame.new(-10582.666, 331.762634, -8758.61035, 0.919332206, 1.69593086e-08, -0.393482327, -3.42409479e-08, 1, -3.68999942e-08, 0.393482327, 4.73965578e-08, 0.919332206)
		_G.PUK = CFrame.new(-11035.9189, 331.762634, -8966.12012, -0.199661195, 8.05780545e-08, -0.979865015, -2.36975328e-08, 1, 8.70625314e-08, 0.979865015, 4.06033926e-08, -0.199661195)
		elseif MYLEVEL == 1825 or MYLEVEL <= 1849 then
		_G.Mon = "Forest Pirate [Lv. 1825]"
		_G.NAMEQUEST = "DeepForestIsland" 
		_G.QUESTNUM = 1
		_G.NameMon = "Forest Pirate"
		_G.QUESTTEXT = "Reward:\n$13,000\n61,000,000 Exp."
		_G.QUESTMON = CFrame.new(-13232.082, 332.378143, -7627.49121, -0.717027605, -4.07509866e-08, 0.69704479, 3.86317822e-08, 1, 9.8201788e-08, -0.69704479, 9.734147e-08, -0.717027605)
		_G.PUK = CFrame.new(-13438.9268, 417.009583, -7767.28467, -0.301585436, -7.02043721e-08, -0.953439176, -4.40521433e-08, 1, -5.96985004e-08, 0.953439176, 2.39968401e-08, -0.301585436)
		elseif MYLEVEL == 1850 or MYLEVEL <= 1899 then
		_G.Mon = "Mythological Pirate [Lv. 1850]"
		_G.NAMEQUEST = "DeepForestIsland" 
		_G.QUESTNUM = 2
		_G.NameMon = "Mythological Pirate"
		_G.QUESTTEXT = "Reward:\n$13,000\n64,000,000 Exp."
		_G.QUESTMON = CFrame.new(-13232.082, 332.378143, -7627.49121, -0.717027605, -4.07509866e-08, 0.69704479, 3.86317822e-08, 1, 9.8201788e-08, -0.69704479, 9.734147e-08, -0.717027605)
		_G.PUK = CFrame.new(-13560.6543, 522.013672, -6733.91113, 0.996960402, -1.61884088e-08, 0.0779099241, 1.91753653e-08, 1, -3.75904605e-08, -0.0779099241, 3.89701533e-08, 0.996960402)
		elseif MYLEVEL == 1900 or MYLEVEL <= 1924 then
		_G.Mon = "Jungle Pirate [Lv. 1900]"
		_G.NAMEQUEST = "DeepForestIsland2" 
		_G.QUESTNUM = 1
		_G.NameMon = "Jungle Pirate"
		_G.QUESTTEXT = "Reward:\n$13,000\n67,000,000 Exp."
		_G.QUESTMON = CFrame.new(-12683.9668, 390.860687, -9901.30176, 0.152271122, 4.28084199e-08, -0.988338768, -4.4882615e-08, 1, 3.63985464e-08, 0.988338768, 3.88167827e-08, 0.152271122)
		_G.PUK = CFrame.new(-11983.4141, 375.940613, -10459.2383, 0.999999106, 1.88226306e-08, 0.00133047614, -1.87607263e-08, 1, -4.65408618e-08, -0.00133047614, 4.65158578e-08, 0.999999106)
	   elseif MYLEVEL == 1925 or MYLEVEL <= 1974 then
		   _G.Mon = "Musketeer Pirate [Lv. 1925]"
		   _G.NAMEQUEST = "DeepForestIsland2" 
		   _G.QUESTNUM = 2
		   _G.NameMon = "Musketeer Pirate"
		   _G.QUESTTEXT = "Reward:\n$15,000\n70,000,000 Exp."
		   _G.QUESTMON = CFrame.new(-12683.9668, 390.860687, -9901.30176, 0.152271122, 4.28084199e-08, -0.988338768, -4.4882615e-08, 1, 3.63985464e-08, 0.988338768, 3.88167827e-08, 0.152271122)
		   _G.PUK = CFrame.new(-13293.082, 520.447632, -9901.99316, -0.758020341, -6.61346249e-08, 0.652230918, -2.15839417e-08, 1, 7.63127872e-08, -0.652230918, 4.37689316e-08, -0.758020341)
		  elseif MYLEVEL == 1975 or MYLEVEL <= 1999 then
			  _G.Mon = "Reborn Skeleton [Lv. 1975]"
			  _G.NAMEQUEST = "HauntedQuest1" 
			  _G.QUESTNUM = 1
			  _G.NameMon = "Reborn Skeleton"
			  _G.QUESTTEXT = "Reward:\n$13,000\n73,000,000 Exp."
			  _G.QUESTMON = CFrame.new(-9481.97754, 142.104843, 5566.03662, 0.00151404156, -4.14115426e-08, -0.999998868, -3.46592838e-10, 1, -4.14121146e-08, 0.999998868, 4.092921e-10, 0.00151404156)
			  _G.PUK = CFrame.new(-8762.2832, 185.188904, 6169.08057, 0.964605391, 2.60655728e-08, 0.263697594, -2.23583552e-08, 1, -1.70596284e-08, -0.263697594, 1.05599645e-08, 0.964605391)
		  elseif MYLEVEL == 2000 or MYLEVEL <= 2024 then
			  _G.Mon = "Living Zombie [Lv. 2000]"
			  _G.NAMEQUEST = "HauntedQuest1" 
			  _G.QUESTNUM = 2
			  _G.NameMon = "Living Zombie"
			  _G.QUESTTEXT = "Reward:\n$13,250\n75,500,000 Exp."
			  _G.QUESTMON = CFrame.new(-9481.97754, 142.104843, 5566.03662, 0.00151404156, -4.14115426e-08, -0.999998868, -3.46592838e-10, 1, -4.14121146e-08, 0.999998868, 4.092921e-10, 0.00151404156)
			  _G.PUK = CFrame.new(-10081.085, 237.834961, 5913.92871, 0.0515871011, 9.59092787e-08, 0.998668492, 4.31864713e-08, 1, -9.82679822e-08, -0.998668492, 4.81983271e-08, 0.0515871011)
		  elseif MYLEVEL == 2025 or MYLEVEL <= 2049 then
			  _G.Mon = "Demonic Soul [Lv. 2025]"
			  _G.NAMEQUEST = "HauntedQuest2" 
			  _G.QUESTNUM = 1
			  _G.NameMon = "Demonic Soul"
			  _G.QUESTTEXT = "Reward:\n$13,500\n78,000,000 Exp."
			  _G.QUESTMON = CFrame.new(-9513.68945, 172.104813, 6078.30811, 0.06916935, 2.37454696e-08, 0.997604907, 1.21678923e-07, 1, -3.22391358e-08, -0.997604907, 1.23617454e-07, 0.06916935)
			  _G.PUK = CFrame.new(-9661.06152, 234.989151, 6208.34473, 0.839007735, 1.00638069e-07, -0.544119537, -9.42643013e-08, 1, 3.9604533e-08, 0.544119537, 1.80625381e-08, 0.839007735)
		  elseif MYLEVEL == 2050 or MYLEVEL <= 2074 then
			  _G.Mon = "Posessed Mummy [Lv. 2050]"
			  _G.NAMEQUEST = "HauntedQuest2" 
			  _G.QUESTNUM = 2
			  _G.NameMon = "Posessed Mummy"
			  _G.QUESTTEXT = "Reward:\n$13,750\n80,500,000 Exp."
			  _G.QUESTMON = CFrame.new(-9513.68945, 172.104813, 6078.30811, 0.06916935, 2.37454696e-08, 0.997604907, 1.21678923e-07, 1, -3.22391358e-08, -0.997604907, 1.23617454e-07, 0.06916935)
			  _G.PUK = CFrame.new(-9555.10254, 66.3880768, 6371.47021, 0.993915081, -2.2833456e-08, 0.110149056, 2.02630606e-08, 1, 2.44549945e-08, -0.110149056, -2.20742304e-08, 0.993915081)
            elseif MYLEVEL == 2075 or MYLEVEL <= 2099 then
                _G.Mon = "Peanut Scout [Lv. 2075]"
                _G.NAMEQUEST = "NutsIslandQuest" 
                _G.QUESTNUM = 1
                _G.NameMon = "Peanut Scout"
                _G.QUESTTEXT = "Reward:\n$14,000\n82,500,000 Exp."
                _G.QUESTMON = CFrame.new(-2103.03442, 38.103981, -10192.5801, 0.779485822, -2.70350977e-08, 0.626419842, -3.08562882e-08, 1, 8.15541483e-08, -0.626419842, -8.2899291e-08, 0.779485822)
                _G.PUK = CFrame.new(-2149.84937, 122.471855, -10359.0498, -0.0922852308, -3.50682292e-08, -0.995732605, 3.04092396e-09, 1, -3.55003564e-08, 0.995732605, -6.30410568e-09, -0.0922852308)
           elseif MYLEVEL == 2100 or MYLEVEL <= 2124 then
                _G.Mon = "Peanut President [Lv. 2100]"
                _G.NAMEQUEST = "NutsIslandQuest" 
                _G.QUESTNUM = 2
                _G.NameMon = "Peanut President"
                _G.QUESTTEXT = "Reward:\n$14,100\n84,500,000 Exp."
                _G.QUESTMON = CFrame.new(-2103.03442, 38.103981, -10192.5801, 0.779485822, -2.70350977e-08, 0.626419842, -3.08562882e-08, 1, 8.15541483e-08, -0.626419842, -8.2899291e-08, 0.779485822)
                _G.PUK = CFrame.new(-2149.84937, 122.471855, -10359.0498, -0.0922852308, -3.50682292e-08, -0.995732605, 3.04092396e-09, 1, -3.55003564e-08, 0.995732605, -6.30410568e-09, -0.0922852308)
            elseif MYLEVEL == 2125 or MYLEVEL <= 2149 then
                _G.Mon = "Ice Cream Chef [Lv. 2125]"
                _G.NAMEQUEST = "IceCreamIslandQuest" 
                _G.QUESTNUM = 1
                _G.NameMon = "Ice Cream Chef"
                _G.QUESTTEXT = "Reward:\n$14,200\n86,500,000 Exp."
                _G.QUESTMON = CFrame.new(-823.195129, 65.8453369, -10963.583, 0.367210746, -2.2831804e-08, -0.930137753, 2.00119876e-09, 1, -2.37566322e-08, 0.930137753, 6.86230051e-09, 0.367210746)
                _G.PUK = CFrame.new(-846.166931, 205.853973, -11006.5137, -0.153710946, 3.34348504e-09, 0.988115847, -4.13023145e-08, 1, -9.80867032e-09, -0.988115847, -4.23191722e-08, -0.153710946)
            elseif MYLEVEL == 2150 or MYLEVEL <= 2199 then
                _G.Mon = "Ice Cream Commander [Lv. 2150]"
                _G.NAMEQUEST = "IceCreamIslandQuest" 
                _G.QUESTNUM = 2
                _G.NameMon = "Ice Cream Commander"
                _G.QUESTTEXT = "Reward:\n$14,300\n89,000,000 Exp."
                _G.QUESTMON = CFrame.new(-823.195129, 65.8453369, -10963.583, 0.367210746, -2.2831804e-08, -0.930137753, 2.00119876e-09, 1, -2.37566322e-08, 0.930137753, 6.86230051e-09, 0.367210746)
                _G.PUK = CFrame.new(-846.166931, 205.853973, -11006.5137, -0.153710946, 3.34348504e-09, 0.988115847, -4.13023145e-08, 1, -9.80867032e-09, -0.988115847, -4.23191722e-08, -0.153710946)
            elseif MYLEVEL == 2200 or MYLEVEL <= 2224 then
                _G.Mon = "Cookie Crafter [Lv. 2200]"
                _G.NAMEQUEST = "CakeQuest1" 
                _G.QUESTNUM = 1
                _G.NameMon = "Cookie Crafter"
                _G.QUESTTEXT = "Reward:\n$14,300\n89,000,000 Exp."
                _G.QUESTMON = CFrame.new(-2019.45923, 37.8659859, -12031.8379, -0.260610402, 3.16478825e-08, 0.965444028, 1.10585326e-07, 1, -2.92942359e-09, -0.965444028, 1.06000506e-07, -0.260610402)
                _G.PUK = CFrame.new(-2288.84717, 93.943161, -12046.7285, 0.0389619507, -8.05070766e-09, 0.999240696, 1.44159458e-08, 1, 7.49472484e-09, -0.999240696, 1.41129908e-08, 0.0389619507)
            elseif MYLEVEL == 2225 or MYLEVEL <= 2249 then
                _G.Mon = "Cake Guard [Lv. 2225]"
                _G.NAMEQUEST = "CakeQuest1" 
                _G.QUESTNUM = 2
                _G.NameMon = "Cake Guard"
                _G.QUESTTEXT = "Reward:\n$14,300\n89,000,000 Exp."
                _G.QUESTMON = CFrame.new(-2019.45923, 37.8659859, -12031.8379, -0.260610402, 3.16478825e-08, 0.965444028, 1.10585326e-07, 1, -2.92942359e-09, -0.965444028, 1.06000506e-07, -0.260610402)
                _G.PUK = CFrame.new(-1600.24854, 195.694992, -12346.0342, -0.9457618, -7.09395209e-08, -0.32486099, -9.57561568e-08, 1, 6.04042683e-08, 0.32486099, 8.82354882e-08, -0.9457618)
            elseif MYLEVEL == 2250 or MYLEVEL <= 2274 then
                _G.Mon = "Baking Staff [Lv. 2250]"
                _G.NAMEQUEST = "CakeQuest2" 
                _G.QUESTNUM = 1
                _G.NameMon = "Baking Staff"
                _G.QUESTTEXT = "Reward:\n$14,300\n89,000,000 Exp."
                _G.QUESTMON = CFrame.new(-1928.67395, 37.8331604, -12842.3936, -0.235107109, -7.40617239e-08, -0.971969485, -7.00571334e-08, 1, -5.92516507e-08, 0.971969485, 5.41629106e-08, -0.235107109)
                _G.PUK = CFrame.new(-1848.26746, 186.937271, -13007.0479, 0.460077673, 6.23081897e-09, -0.887878656, -9.55947232e-09, 1, 2.06415507e-09, 0.887878656, 7.53797913e-09, 0.460077673)
            elseif MYLEVEL >= 2275 then
                _G.Mon = "Head Baker [Lv. 2275]"
                _G.NAMEQUEST = "CakeQuest2" 
                _G.QUESTNUM = 2
                _G.NameMon = "Head Baker"
                _G.QUESTTEXT = "Reward:\n$14,300\n89,000,000 Exp."
                _G.QUESTMON = CFrame.new(-1928.67395, 37.8331604, -12842.3936, -0.235107109, -7.40617239e-08, -0.971969485, -7.00571334e-08, 1, -5.92516507e-08, 0.971969485, 5.41629106e-08, -0.235107109)
                _G.PUK = CFrame.new(-2012.3689, 177.257675, -12839.6357, 0.759093106, 4.20168478e-09, -0.650982082, 1.84710747e-10, 1, 6.66976474e-09, 0.650982082, -5.18321563e-09, 0.759093106)  
	   end
		end
		end


function TP(P)
    _G.VeryNoclip = true
            Distance = (P.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
            if Distance < 10 then
			Speed = 1000
		elseif Distance < 170 then
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = P
			Speed = 350
		elseif Distance < 1000 then
			Speed = 350
		elseif Distance >= 1000 then
			Speed = 250
		end
            game:GetService("TweenService"):Create(
                game.Players.LocalPlayer.Character.HumanoidRootPart,
                TweenInfo.new(Distance/Speed, Enum.EasingStyle.Linear),
                {CFrame = P}
            ):Play()
        _G.VeryNoclip = false
        end



        function TP1(P1)
            Distance = (P1.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
           if Distance < 10 then
                Speed = 1000
            elseif Distance < 170 then
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = P
                Speed = 350
            elseif Distance < 1000 then
                Speed = 350
            elseif Distance >= 1000 then
                Speed = 300
            end
            game:GetService("TweenService"):Create(
                game.Players.LocalPlayer.Character.HumanoidRootPart,
                TweenInfo.new(Distance/Speed, Enum.EasingStyle.Linear),
                {CFrame = P1}
            ):Play()
            _G.VeryNoclip = true
            wait(Distance/Speed)
            _G.VeryNoclip = false
        end


        --[[spawn(function()
            while game:GetService("RunService").RenderStepped:wait() do
                if _G.FARM and _G.BypassFARM == "Bypass" then
                    pcall(function()
                        checklevel()
                        haki()
                        if game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestReward.Title.Text == _G.QUESTTEXT then
                            
                            else
                            local args = {
                                [1] = "AbandonQuest"
                            }
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                        end
                        if game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == true then
        
                            else
                                 repeat game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = _G.QUESTMON wait() until _G.StopTween == true or not _G.FARM or (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - _G.QUESTMON.Position).Magnitude <= 8
         
                                wait(0.5)
                                    local args = {
                                        [1] = "StartQuest",
                                        [2] = _G.NAMEQUEST,
                                        [3] = _G.QUESTNUM
                                    }
                                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                                wait(0.8)
                                game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = _G.PUK
                        end
                        
                        if game:GetService("Workspace").Enemies:FindFirstChild(_G.Mon) then
                            for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                                if v.Name == _G.Mon  then
                                    if v.Humanoid.Health > 0 then
                                        repeat game:GetService("RunService").Heartbeat:wait()
                                            game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = (v.HumanoidRootPart.CFrame * CFrame.new(0,50,0))
                                                    game:GetService("VirtualUser"):CaptureController()
                                                    game:GetService("VirtualUser"):Button1Down(Vector2.new(1280, 670),workspace.CurrentCamera.CFrame)
                                                    PosMon = v.HumanoidRootPart.CFrame
                                                    MagnetActive = true
                                        until not v.Parent or v.Humanoid.Health <= 0 or _G.FARM == false or game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestReward.Title.Text.Visible == false or not game:GetService("Workspace").Enemies:FindFirstChild(v.Name)
                                    end
                                end
                            end
                        end
                    end)
                end
            end
        end)]]
        
        
spawn(function()
    game:GetService('RunService').Stepped:Connect(function()
        if _G.Farm then
            for i, v in pairs(game.Workspace["_WorldOrigin"]:GetChildren()) do
                if v.Name == "CurvedRing" or v.Name == "SlashHit" or v.Name == "SwordSlash" or v.Name == "Sounds" then
                    v:Destroy() 
                end
            end
        end
    end)
end)    
        


			spawn(function()
				while game:GetService("RunService").RenderStepped:wait() do
					if _G.FARM then
						pcall(function()
							for i,v in pairs(game.Workspace.Enemies:GetDescendants()) do
								if v.Name == _G.Mon then
									v.Humanoid:ChangeState(11)
								end
							end
						end)
					end
				end
			end)

			spawn(function()
				while task.wait() do
					pcall(function()
						checklevel()
						for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
							if _G.FARM or _G.FarmLevel and MagnetActive then
								if v.Name == Mon then
									if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
										if (v.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 350 then
											v.HumanoidRootPart.CFrame = PosMon
											v.Humanoid:ChangeState(11)
											v.Humanoid.WalkSpeed = 0
											v.HumanoidRootPart.CanCollide = false
											v.Head.CanCollide = false
											if not v.HumanoidRootPart:FindFirstChild("BodyClip") then
												local Noclip = Instance.new("BodyVelocity")
												Noclip.Name = "BodyClip"
												Noclip.Parent = v.HumanoidRootPart
												Noclip.MaxForce = Vector3.new(100000,100000,100000)
												Noclip.Velocity = Vector3.new(0,0,0)
											end
											sethiddenproperty(game.Players.LocalPlayer,"SimulationRadius",math.huge)
										end
									end
								end
							end
						end
					end)
				end
			end)

		spawn(function()
			while game:GetService("RunService").RenderStepped:wait() do
				if _G.FARM then
					pcall(function()
						for i,v in pairs(game.Workspace.Enemies:GetDescendants()) do
							if v.Name == _G.Mon then
								v.Humanoid:ChangeState(11)
							end
						end
					end)
				end
			end
		end)

		-- Magnet
		spawn(function()
			for i = 1,math.huge do game:GetService("RunService").RenderStepped:Wait()
				if _G.FARM or _G.FarmLevel then
					for k,x in pairs(game.Workspace.Enemies:GetChildren()) do
						if x.Name == _G.Mon and x:FindFirstChild("HumanoidRootPart") and x:FindFirstChild("Humanoid") and x.Humanoid.Health > 0 and (x.HumanoidRootPart.Position-game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= magbring then
							x.HumanoidRootPart.CanCollide = false
							x.Humanoid:ChangeState(11)
							x.Humanoid.WalkSpeed = 0
							x.Humanoid.JumpPower = 0
							x.HumanoidRootPart.Anchored = false
							x.HumanoidRootPart.CFrame = PosMon
							x.HumanoidRootPart.Size = Vector3.new(5,5,5)
							x.HumanoidRootPart.Transparency = 0.80
							x.Humanoid:ChangeState(11)
						end 
					end
				end
			end
		end)



spawn(function()
				while wait() do
					pcall(function()
						for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
								if _G.FarmLevel and MagnetActive and Magnet then
								if v.Name == _G.Mon and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
									if v.Name == "Factory Staff [Lv. 800]" then
										if (v.HumanoidRootPart.Position - PosMon.Position).Magnitude <= 250 then
											v.Head.CanCollide = false
											v.HumanoidRootPart.CanCollide = false
											v.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
											v.HumanoidRootPart.CFrame = PosMon
											sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
										end
									elseif v.Name == _G.Mon then
										if (v.HumanoidRootPart.Position - PosMon.Position).Magnitude <= 400 then
											v.Head.CanCollide = false
											v.HumanoidRootPart.CanCollide = false
											v.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
											v.HumanoidRootPart.CFrame = PosMon
											sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
										end
									end
								end
								elseif _G.FARMBone and Magnetbone and Magnet then
								if (v.Name == "Peanut Scout [Lv. 2075]" or v.Name == "Peanut President [Lv. 2100]" or v.Name == "Ice Cream Chef [Lv. 2125]" or v.Name == "Ice Cream Commander [Lv. 2150]") and (v.HumanoidRootPart.Position - Bone.Position).Magnitude <= 500 then 
									if sethiddenproperty then 
									sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius",  10000)
									end
									v.Head.CanCollide = false
									v.HumanoidRootPart.CanCollide = false
									v.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
									v.HumanoidRootPart.CFrame = Bone
								end
			end
			end
			end)
			end
			end)
	
			spawn(function()
				while wait() do
					pcall(function()
						for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
								if _G.FarmLevel and MagnetActive and Magnet then
								if v.Name == _G.Mon and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
									if v.Name == "Factory Staff [Lv. 800]" then
										if (v.HumanoidRootPart.Position - PosMon.Position).Magnitude <= 250 then
											v.Head.CanCollide = false
											v.HumanoidRootPart.CanCollide = false
											v.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
											v.HumanoidRootPart.CFrame = PosMon
											sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
										end
									elseif v.Name == _G.Mon then
										if (v.HumanoidRootPart.Position - PosMon.Position).Magnitude <= 400 then
											v.Head.CanCollide = false
											v.HumanoidRootPart.CanCollide = false
											v.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
											v.HumanoidRootPart.CFrame = PosMon
											sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
										end
									end
								end
								if _G.AutoNewSword and MagnetDought then
									if (v.Name == "Cookie Crafter [Lv. 2200]" or v.Name == "Cake Guard [Lv. 2225]" or v.Name == "Baking Staff [Lv. 2250]" or v.Name == "Head Baker [Lv. 2275]") and (v.HumanoidRootPart.Position - PosMonDoughtOpenDoor.Position).Magnitude <= 250 and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
										v.HumanoidRootPart.Size = Vector3.new(50,50,50)
										v.Humanoid:ChangeState(14)
										v.HumanoidRootPart.CanCollide = false
										v.Head.CanCollide = false
										v.HumanoidRootPart.CFrame = PosMonDoughtOpenDoor
										if v.Humanoid:FindFirstChild("Animator") then
											v.Humanoid.Animator:Destroy()
										end
										sethiddenproperty(game:GetService("Players").LocalPlayer, "SimulationRadius", math.huge)
									end
								end
								elseif _G.AutoFarmBone and BoneMagnet and Magnet then
								if (v.Name == "Peanut Scout [Lv. 2075]" or v.Name == "Peanut President [Lv. 2100]" or v.Name == "Ice Cream Chef [Lv. 2125]" or v.Name == "Ice Cream Commander [Lv. 2150]") and (v.HumanoidRootPart.Position - BoneMagnet.Position).Magnitude <= 500 then 
									if sethiddenproperty then 
									sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius",  10000)
									end
									v.Head.CanCollide = false
									v.HumanoidRootPart.CanCollide = false
									v.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
									v.HumanoidRootPart.CFrame = Bone
								end
							elseif _G.AutoFarmCandy and CandyMagnet and Magnet then
								if (v.Name == "Peanut Scout [Lv. 2075]" or v.Name == "Peanut President [Lv. 2100]" or v.Name == "Ice Cream Chef [Lv. 2125]" or v.Name == "Ice Cream Commander [Lv. 2150]") and (v.HumanoidRootPart.Position - CandyMagnet.Position).Magnitude <= 500 then 
									if sethiddenproperty then 
									sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius",  10000)
									end
									v.Head.CanCollide = false
									v.HumanoidRootPart.CanCollide = false
									v.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
									v.HumanoidRootPart.CFrame = CandyMagnet
								end
			end
			end
			end)
			end
			end)
	
			spawn(function()
				while wait() do
					pcall(function()
						for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
								if _G.AutoBone and MagnetActive and Magnet then
								if v.Name == _G.Mon and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
									if v.Name == "Factory Staff [Lv. 800]" then
										if (v.HumanoidRootPart.Position - PosMon.Position).Magnitude <= 290 then
											v.Head.CanCollide = false
											v.HumanoidRootPart.CanCollide = false
											v.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
											v.HumanoidRootPart.CFrame = PosMon
											sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
										end
									elseif v.Name == _G.Mon then	
										if (v.HumanoidRootPart.Position - PosMon.Position).Magnitude <= 290 then
											v.Head.CanCollide = false
											v.HumanoidRootPart.CanCollide = false
											v.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
											v.HumanoidRootPart.CFrame = PosMon
											sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
										end
									end
								end
								elseif _G.AutoBone and BoneMagnet and Magnet then
								if (v.Name == "Peanut Scout [Lv. 2075]" or v.Name == "Peanut President [Lv. 2100]" or v.Name == "Ice Cream Chef [Lv. 2125]" or v.Name == "Ice Cream Commander [Lv. 2150]") and (v.HumanoidRootPart.Position - MainMonBone.Position).Magnitude <= 500 then 
									if sethiddenproperty then 
									sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius",  10000)
									end
									v.Head.CanCollide = false
									v.HumanoidRootPart.CanCollide = false
									v.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
									v.HumanoidRootPart.CFrame = MainMonBone
								end
			end
			end
			end)
			end  
			end)
	
			spawn(function()
				while wait() do
					pcall(function()
							for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
								if _G.FARM then
									if v.Name == _G.Mon and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
									if (v.Name == "Bandit [Lv. 5]" or v.Name == "Monkey [Lv. 14]" or v.Name == "Gorilla [Lv. 20]" or v.Name == "Pirate [Lv. 35]" or v.Name == "Brute [Lv. 45]" or v.Name == "Desert Bandit [Lv. 60]" or v.Name == "Desert Officer [Lv. 70]" or v.Name == "Snow Bandit [Lv. 90]" or v.Name == "Snowman [Lv. 100]" or v.Name == "Chief Petty Officer [Lv. 120]" or v.Name == "Sky Bandit [Lv. 150]" or v.Name == "Dark Master [Lv. 175]" or v.Name == "Toga Warrior [Lv. 225]" or v.Name == "Gladiator [Lv. 275]" or v.Name == "Military Soldier [Lv. 300]" or v.Name == "Fishman Warrior [Lv. 375]" or v.Name == "Fishman Commando [Lv. 400]" or v.Name == "God's Guard [Lv. 450]" or v.Name == "Shanda [Lv. 475]" or v.Name == "Royal Squad [Lv. 525]" or v.Name == "Royal Soldier [Lv. 550]" or v.Name == "Galley Pirate [Lv. 625]" or v.Name == "Galley Pirate [Lv. 625]" or v.Name == "Raider [Lv. 700]" or v.Name == "Mercenary [Lv. 725]" or v.Name == "Swan Pirate [Lv. 775]" or v.Name == "Factory Staff [Lv. 800]" or v.Name == "Marine Lieutenant [Lv. 875]" or v.Name == "Marine Captain [Lv. 900]" or v.Name == "Zombie [Lv. 950]" or v.Name == "Vampire [Lv. 975]" or v.Name == "Snow Trooper [Lv. 1000]" or v.Name == "Winter Warrior [Lv. 1050]" or v.Name == "Lab Subordinate [Lv. 1100]" or v.Name == "Horned Warrior [Lv. 1125]" or v.Name == "Magma Ninja [Lv. 1175]" or v.Name == "Lava Pirate [Lv. 1200]" or v.Name == "Ship Deckhand [Lv. 1250]" or v.Name == "Ship Engineer [Lv. 1275]" or v.Name == "Arctic Warrior [Lv. 1350]" or v.Name == "Snow Lurker [Lv. 1375]" or v.Name == "Sea Soldier [Lv. 1425]" or v.Name == "Water Fighter [Lv. 1450]" or v.Name == "Pirate Millionaire [Lv. 1500]" or v.Name == "Pistol Billionaire [Lv. 1525]" or v.Name == "Dragon Crew Warrior [Lv. 1575]" or v.Name == "Dragon Crew Archer [Lv. 1600]" or v.Name == "Female Islander [Lv. 1625]" or v.Name == "Giant Islander [Lv. 1650]" or v.Name == "Marine Commodore [Lv. 1700]" or v.Name == "Marine Rear Admiral [Lv. 1725]" or v.Name == "Fishman Raider [Lv. 1775]" or v.Name == "Fishman Captain [Lv. 1800]" or v.Name == "Forest Pirate [Lv. 1825]" or v.Name == "Mythological Pirate [Lv. 1850]" or v.Name == "Jungle Pirate [Lv. 1900]" or v.Name == "Musketeer Pirate [Lv. 1925]" or v.Name == "Reborn Skeleton [Lv. 1975]" or v.Name == "Living Zombie [Lv. 2000]" or v.Name == "Living Zombie [Lv. 2000]" or v.Name == "Demonic Soul [Lv. 2025]" or v.Name == "Posessed Mummy [Lv. 2050]" or v.Name == "Peanut Scout [Lv. 2075]" or v.Name == "Peanut President [Lv. 2100]" or v.Name == "Ice Cream Chef [Lv. 2125]" or v.Name == "Ice Cream Commander [Lv. 2150]" or v.Name == "Cookie Crafter [Lv. 2200]" or v.Name == "Head Baker [Lv. 2275]" or v.Name == "Baking Staff [Lv. 2250]" or v.Name == "Cake Guard [Lv. 2225]") and (v.HumanoidRootPart.Position - PosMon.Position).Magnitude <= 250 then
										v.Head.CanCollide = false
										v.HumanoidRootPart.CanCollide = false
										v.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
										v.HumanoidRootPart.CFrame = PosMon 
										sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
									end
								end
							end
					end
				end)
			end
		end)
  



spawn(function()
    while game:GetService("RunService").RenderStepped:wait() do
        if _G.FARM then
            pcall(function()
                for i,v in pairs(game.Workspace.Enemies:GetDescendants()) do
                    if v.Name == "Humanoid" then
                        v.PlatformStand = true
                    end
                end
            end)
        end
    end
end)

spawn(function()
    while game:GetService("RunService").RenderStepped:wait() do
        if _G.FARM then
            pcall(function()
                for i,v in pairs(game.Workspace.Enemies:GetDescendants()) do
                    if v.Name == _G.Mon then
                        v.Humanoid:ChangeState(11)
                    end
                end
            end)
        end
    end
end)



spawn(function()
    while game:GetService("RunService").RenderStepped:wait() do
        if _G.FARM then
            pcall(function()
                EquipWeapon(_G.SelectWeapon)
            end)
        end
    end
end)



--[[ Page:Button("Bypass [Only FirstWorld]", function()
    if OldWorld then
        haki()
      TP1(CFrame.new(5704.35400390625, 38.52693176269531, 3923.11181640625))
        game.Players.LocalPlayer.Character.Humanoid:SetStateEnabled(15,false)
        game.Players.LocalPlayer.Character.Humanoid:SetStateEnabled(16,false)
        wait(0.05)
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = (FindNearestMon(position).HumanoidRootPart.CFrame * CFrame.new(0,0,-2.5))
end
end)]]
--[[spawn(function()
	while wait(.1) do
            local args = {[1] = "Candies",[2] = "Check"}
			cdtt = game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
			if _G.CandyTrade then
				if string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Level.Exp.text, "2x") then
				elseif cdtt >= 51 then
					local args = {
					[1] = "Candies",
					[2] = "Buy",
					[3] = 1,
					[4] = 1
					}
					game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
				end
			end
	end
end)]]

   
Page:Button("มือนิ่ง", function()
    local Client = game.Players.LocalPlayer
local STOP = require(Client.PlayerScripts.CombatFramework.Particle)
local STOPRL = require(game:GetService("ReplicatedStorage").CombatFramework.RigLib)
if not shared.orl then shared.orl = STOPRL.wrapAttackAnimationAsync end
if not shared.cpc then shared.cpc = STOP.play end
while task.wait() do
                STOPRL.wrapAttackAnimationAsync = function(a,b,c,d,func)
                    local Hits = STOPRL.getBladeHits(b,c,d)
                    if Hits then
                        STOP.play = function() end
                        a:Play(0.01,0.01,0.01)
                        func(Hits)
                        STOP.play = shared.cpc
                        wait(a.length * 0.5)
                        a:Stop()
                    end
                end
end
end)


   spawn(function()
       game:GetService('RunService').Stepped:Connect(function()
           if _G.Fastatk then
               for i, v in pairs(game.Workspace["_WorldOrigin"]:GetChildren()) do
                   if v.Name == "CurvedRing" or v.Name == "SwordSlash" or v.Name == "Sounds" then--or v.Name == "SlashHit"
                       v:Destroy() 
                   end
               end
           end
       end)
   end)

_G.FARM = false
_G.BypassFARM = "Normal"
--[[local Selectmode = Page:CreateDropdown("Select Method",{"Bypass","Normal"},"Hee",false,function(A)
    _G.BypassFARM = A
end)]]


        spawn(function()
            while game:GetService("RunService").RenderStepped:wait() do
                if _G.FARM and _G.BypassFARM == "Normal" then
                    pcall(function()
                        checklevel()
                        haki()
                        if not string.find(game.Players.LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, _G.NameMon) then
												game.ReplicatedStorage:WaitForChild("Remotes").CommF_:InvokeServer("AbandonQuest");
						end
                        --[[if game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestReward.Title.Text == _G.QUESTTEXT then
                            
                            else
                            local args = {
                                [1] = "AbandonQuest"
                            }
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                        end]]
                        if game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == true then

                            else
                                StopTween()
                                repeat TP(_G.QUESTMON) wait() until _G.StopTween == true or not _G.FARM or (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - _G.QUESTMON.Position).Magnitude <= 8
                                 
         
                                wait(0.5)
                                    local args = {
                                        [1] = "StartQuest",
                                        [2] = _G.NAMEQUEST,
                                        [3] = _G.QUESTNUM
                                    }
                                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                                wait(0.8)
                                TP(_G.PUK)
                        end
                        
                        if game:GetService("Workspace").Enemies:FindFirstChild(_G.Mon) then
                            for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                                if v.Name == _G.Mon  then
                                    if v.Humanoid.Health > 0 then
                                        repeat game:GetService("RunService").Heartbeat:wait()
                                                    TP(v.HumanoidRootPart.CFrame * CFrame.new(0,25,0))
                                                    game:GetService("VirtualUser"):CaptureController()
                                                    game:GetService("VirtualUser"):Button1Down(Vector2.new(1280, 670),workspace.CurrentCamera.CFrame)
                                                    PosMon = v.HumanoidRootPart.CFrame
                                                    MagnetActive = true
                                        until not v.Parent or v.Humanoid.Health <= 0 or _G.FARM == false or game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestReward.Title.Text.Visible == false or not game:GetService("Workspace").Enemies:FindFirstChild(v.Name)
                                    end
                                end
                            end
                        end
                    end)
                end
            end
        end)

spawn(function()
    while wait() do
        if _G.AutoSelectMelee then
            for i,v in pairs(game:GetService("Players").LocalPlayer.Backpack:GetChildren()) do
                if v.ToolTip == "Melee" then
                    _G.SelectWeapon = v.Name
                    end
                end
            end
        end
    end)

Page:Line()
Page:Label("Auto Farm Level")

Page:Toggle("Auto Select Melee", _G.AutoSelectMelee, function(vue)
    _G.AutoSelectMelee = vue
end)

 Page:Toggle("Auto Farm Level", _G.FARM, function(vu)
     if vu then
    _G.FARM = vu
    else
        _G.FARM = vu
        local args = {
                                [1] = "AbandonQuest"
                            }
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
        end
 end)

 Method = CFrame.new(0,35,0)
 spawn(function()
    while wait(3) do
        if Methodnow == 1 then
         Methodnow = 2
         Method = CFrame.new(0,35,0)
         else
         Methodnow = 1
         Method = CFrame.new(0,0,35)
        end
     end
 end)

 

         


         

         
         
         
         
         
         function haki()
         if game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
         --nothing
         else
         local args = {
         [1] = "Buso"
         }
         game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
         end
         end
         
         spawn(function()
            pcall(function()
            while task.wait() do
                 if _G.AutoHaki then
                    if game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
         --nothing
         else
         local args = {
         [1] = "Buso"
         }
         game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
         end
                    end
                end
            end)     
        end)
         
         
         
         function EquipWeapon(ToolSe)
             if game.Players.LocalPlayer.Backpack:FindFirstChild(ToolSe) then
                 local tool = game.Players.LocalPlayer.Backpack:FindFirstChild(ToolSe)
                 wait(.1)
                 game.Players.LocalPlayer.Character.Humanoid:EquipTool(tool)
             end
         end     
         
         
         function bring1()
             for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                 for k,x in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                     if x.Name == _G.Mon then
                         if v.Name == _G.Mon then
                             v.HumanoidRootPart.CFrame = x.HumanoidRootPart.CFrame
                             v.HumanoidRootPart.CanCollide = false
                             sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
                 end 
             end
          end
          end
          end
         
         function bring()
            for i,x in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                    for n,y in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                        if x.Name == _G.Mon then
                            if y.Name == _G.Mon then
                                x.HumanoidRootPart.CFrame = y.HumanoidRootPart.CFrame
                                x.HumanoidRootPart.CanCollide = false
                                y.HumanoidRootPart.CanCollide = false
                                x.Humanoid:ChangeState(11)
                                y.Humanoid:ChangeState(11)
                                sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
                            end
                        end
                    end
                end
            end
         function bring4()
            for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                for i2,v2 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                    if v.Name == _G.Mon and v2.Name == _G.Mon then
                        v2.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame
                        v2.HumanoidRootPart.CanCollide = false
                        v2.Humanoid:ChangeState(11)
                        sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
                    end
                end
            end
        end
         
         
         
         
         


         if newworld then

            spawn(function()
                while wait() do
                    if _G.AutoRengoku then
                        bring2()
                    end
                end
            end)
        end

         function bring2()
            local plr = game.Players.LocalPlayer
            pcall(function()
                sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
            end)
        end




        spawn(function()
            while wait() do
               if _G.EquipMelee then
                  pcall(function()
                     for i,v in pairs(game:GetService("Players").LocalPlayer.Backpack:GetChildren()) do
                        if v.ToolTip == "Melee" then
                       if game.Players.LocalPlayer.Backpack:FindFirstChild(tostring(v.Name)) then
                          local ToolSe = tostring(v.Name)
                         local tool = game.Players.LocalPlayer.Backpack:FindFirstChild(ToolSe)
                         wait(.4)
                         game.Players.LocalPlayer.Character.Humanoid:EquipTool(tool)
                       end
                        end
                     end
                  end)
            end
            end
            end)

            function equip()
                pcall(function()
                    for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                        if v.Name == _G.SelectWeapon then
                            game.Players.LocalPlayer.Character.Humanoid:EquipTool(v)
                        end
                    end
                end)
            end

Magnet = true
Page:Toggle("Bring Mob", Magnet, function(vu)
    Magnet = vu
end)

_G.Fastatk = true
Page:Toggle("Fast Attack", true, function(vu)
    _G.Fastatk = vu
   end)

 --[[  local RigC = require(game:GetService("Players").LocalPlayer.PlayerScripts.CombatFramework) 
   local VirtualUser = game:GetService('VirtualUser')
   local kkii = require(game.ReplicatedStorage.Util.CameraShaker)
   spawn(function()
       while game:GetService("RunService").RenderStepped:wait() do
           if _G.Fastatk and _G.FARM or _G.Fastatk and Auto_Bone then
               pcall(function()
                RigC.activeController.timeToNextAttack = 0
                RigC.activeController.attacking = false
                RigC.activeController.blocking = false
                RigC.activeController.timeToNextAttack = 0
                RigC.activeController.timeToNextBlock = 0
                RigC.activeController.increment = 3
                RigC.activeController.hitboxMagnitude = 100
                game.Players.LocalPlayer.Character.Stun.Value = 0
                game.Players.LocalPlayer.Character.Humanoid.Sit = false
                kkii:Stop()
               end)
           end
       end
   end)]]
   
   local VirtualUser = game:GetService('VirtualUser')      
local Cemara = require(game:GetService("Players").LocalPlayer.PlayerScripts.CombatFramework.CameraShaker)
Cemara.CameraShakeInstance.CameraShakeState = {FadingIn = 3, FadingOut = 2, Sustained = 0, Inactive = 1}
local SuperFastMode = true
local plr = game.Players.LocalPlayer

local CbFw = debug.getupvalues(require(plr.PlayerScripts.CombatFramework))
local CbFw2 = CbFw[2]

function GetCurrentBlade() 
    local p13 = CbFw2.activeController
    local ret = p13.blades[1]
    if not ret then return end
    while ret.Parent~=game.Players.LocalPlayer.Character do ret=ret.Parent end
    return ret
end
function AttackNoCD() 
    local AC = CbFw2.activeController
    for i = 1, 1 do 
        local bladehit = require(game.ReplicatedStorage.CombatFramework.RigLib).getBladeHits(
            plr.Character,
            {plr.Character.HumanoidRootPart},
            60
        )
        local cac = {}
        local hash = {}
        for k, v in pairs(bladehit) do
            if v.Parent:FindFirstChild("HumanoidRootPart") and not hash[v.Parent] then
                table.insert(cac, v.Parent.HumanoidRootPart)
                hash[v.Parent] = true
            end
        end
        bladehit = cac
        if #bladehit > 0 then
            local u8 = debug.getupvalue(AC.attack, 5)
            local u9 = debug.getupvalue(AC.attack, 6)
            local u7 = debug.getupvalue(AC.attack, 4)
            local u10 = debug.getupvalue(AC.attack, 7)
            local u12 = (u8 * 798405 + u7 * 727595) % u9
            local u13 = u7 * 798405
            (function()
                u12 = (u12 * u9 + u13) % 1099511627776
                u8 = math.floor(u12 / u9)
                u7 = u12 - u8 * u9
            end)()
            u10 = u10 + 1
            debug.setupvalue(AC.attack, 5, u8)
            debug.setupvalue(AC.attack, 6, u9)
            debug.setupvalue(AC.attack, 4, u7)
            debug.setupvalue(AC.attack, 7, u10)
            pcall(function()
                for k, v in pairs(AC.animator.anims.basic) do
                    v:Play()
                end
            end)
            if plr.Character:FindFirstChildOfClass("Tool") and AC.blades and AC.blades[1] then 
                game:GetService("ReplicatedStorage").RigControllerEvent:FireServer("weaponChange",tostring(GetCurrentBlade()))
                game.ReplicatedStorage.Remotes.Validator:FireServer(math.floor(u12 / 1099511627776 * 16777215), u10)
                game:GetService("ReplicatedStorage").RigControllerEvent:FireServer("hit", bladehit, i, "") 
            end
        end
    end
end
local cac
if SuperFastMode then 
    cac=wait --เปรี่ยนเป็น task.wait มันจะเร็วขึ้น
end


spawn(function()
            while wait(0.00111111111111111111111111111111111111111) do
                pcall(function()
                    --if _G.Fastatk and _G.FARM or _G.Fastatk and Auto_Bone then
                    for i, v in pairs(game.Workspace.Enemies:GetChildren()) do
                        if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v.HumanoidRootPart.Position).Magnitude <= 45 then
                           AttackNoCD()
                        end
                    end
                    --end
                    end)
            
            end
end)



Page:Line()
Page:Label("Add on function")  
       
       --[[     Page:Toggle("Auto Buy X2 EXP (Candy)", nil, function(vu)
                _G.CandyTrade = vu
        end)]]

     
        Page:Toggle("Auto Set spawn", nil, function(vu)
                _G.SetSpawn = vu
        end)
        
        Page:Toggle("Auto Haki", nil, function(vu)
                _G.AutoHaki = vu
        end)


        spawn(function()
            pcall(function()
                while wait(.1) do
                    if _G.SetSpawn and game.Players.LocalPlayer.Character.Humanoid.Health > 0 then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetSpawnPoint")
                    end
                end
            end)
        end)

        if OldWorld then
            Page:Toggle("Auto Second Sea", nil, function(x)
                _G.AutoNew = x
            end)
        end

        spawn(function()
			while wait(.1) do
				if _G.AutoNew then
					if OldWorld then
						local MyLevel = game.Players.localPlayer.Data.Level.Value
						if MyLevel >= 700 and OldWorld then
							_G.FARM = false
							_G.SelectWeapon = "Key"
							repeat wait()
								TP(CFrame.new(4849.29883, 5.65138149, 719.611877))
							until _G.StopTween == true or not _G.AutoNew or (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - CFrame.new(4849.29883, 5.65138149, 719.611877).Position).Magnitude <= 10
							wait(0.5)
							game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("DressrosaQuestProgress","Detective")
							wait(0.5)
							if game.Players.LocalPlayer.Backpack:FindFirstChild("Key") then
								local tool = game.Players.LocalPlayer.Backpack:FindFirstChild("Key")
								wait(.4)
								game.Players.LocalPlayer.Character.Humanoid:EquipTool(tool)
							end
							repeat wait()
								TP(CFrame.new(1347.7124, 37.3751602, -1325.6488))
							until _G.StopTween == true or not _G.AutoNew or (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - CFrame.new(1347.7124, 37.3751602, -1325.6488).Position).Magnitude <= 10
							wait(0.5)
							attack()
							if game.Workspace.Enemies:FindFirstChild("Ice Admiral [Lv. 700] [Boss]") and game.Workspace.Map.Ice.Door.CanCollide == false and game.Workspace.Map.Ice.Door.Transparency == 1 then
								CheckBoss = true
								_G.SelectWeapon = _G.SelectToolWeaponOld
								EquipWeapon(_G.SelectWeapon)
								if not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
									game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Buso")
								end
								for i,v in pairs(game.Workspace.Enemies:GetChildren()) do
									if CheckBoss and v:IsA("Model") and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 and v.Name == "Ice Admiral [Lv. 700] [Boss]" then
										if not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
											game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Buso")
										end
										repeat wait(.1)
											pcall(function()
												v.HumanoidRootPart.Size = Vector3.new(50, 50, 50)
												v.HumanoidRootPart.BrickColor = BrickColor.new("White")
												v.HumanoidRootPart.CanCollide = false
												TP(v.HumanoidRootPart.CFrame*CFrame.new(0, 10, 10))
												attack()
											end)
										until not CheckBoss or not v.Parent or v.Humanoid.Health <= 0
									end
								end
								CheckBoss = false
								wait(0.5)
								repeat wait()
									TP(CFrame.new(-1166.23743, 7.65220165, 1728.36487))
								until (game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame - CFrame.new(-1166.23743, 7.65220165, 1728.36487).Position).Magnitude <= 10
								wait(0.5)
								game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelDressrosa")
							else
								if game.Players.LocalPlayer.Backpack:FindFirstChild("Key") then
									local tool = game.Players.LocalPlayer.Backpack:FindFirstChild("Key")
									wait(.4)
									game.Players.LocalPlayer.Character.Humanoid:EquipTool(tool)
								end
								TP(CFrame.new(1347.7124, 37.3751602, -1325.6488))
							end
						end
					end
				end
			end
		end)
if newworld then
        Page:Toggle("Auto Third Sea", nil, function(value)
            local args = {
				[1] = "AbandonQuest"
			}
			game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
			Sea3 = value
			Sea33 = value
			Check = true
			Checka = true
        end)
    end



    spawn(function()
		while wait() do
			pcall(function()
				if Sea3 and Checka then
					if newworld then
						local MyLevel = game.Players.localPlayer.Data.Level.Value
						if MyLevel >= 1500 then
							Sea33 = false
							if Check then
								repeat TP(CFrame.new(-1925.56482, 12.8456564, 1737.36609)) wait() until _G.StopTween == true or not Sea3 or Sea33 or (game.Players.LocalPlayer.Character.HumanoidRootPart.Position-Vector3.new(-1925.56482, 12.8456564, 1737.36609)).Magnitude <= 10
							end
							Check = false
							wait(0.5)
							local args = {
								[1] = "ZQuestProgress",
								[2] = "Check"
							}

							game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
							local args = {
								[1] = "ZQuestProgress",
								[2] = "Begin"
							}

							game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
							Checka = false
						end
					end
				end
			end)
		end
	end)

	spawn(function()
		while wait() do
			pcall(function()
				if Sea3 and Checka == false then
					for i, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
						if v.Name == "rip_indra [Lv. 1500] [Boss]" then
							for i, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
								if v.Name == "rip_indra [Lv. 1500] [Boss]" then
									repeat wait()
										v.HumanoidRootPart.CanCollide = false
										v.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                                        TP(v.HumanoidRootPart.CFrame * CFrame.new(0,50,0))										
										attack()
										spawn(function()
											wait(1)
											game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelZou")
										end)
									until v.Humanoid.Health <= 0 or Sea3 == false
								end
							end
							repeat TP(CFrame.new(-26640.7559, 6.94934607, 439.43512)) wait() until _G.StopTween == true or not Sea3 or Sea33 or (game.Players.LocalPlayer.Character.HumanoidRootPart.Position-Vector3.new(-26640.7559, 6.94934607, 439.43512)).Magnitude <= 10
						end
					end
				end
			end)
		end
	end)




    if newworld then
        Page:Toggle("Auto Rengoku", _G.AutoRengoku, function(vu)
            _G.AutoRengoku = vu
            TP(CFrame.new(5516.27539, 60.5209846, -6830.82764, 0.219563305, -7.8544824e-09, 0.975598276, 4.69439376e-09, 1, 6.99444236e-09, -0.975598276, 3.04411962e-09, 0.219563305))
        end)
    end
    spawn(function()
        while wait(.1) do
            if _G.AutoRengoku then
                EquipWeapon(_G.SelectWeapon)
                haki()
                if  game.Players.LocalPlayer.Backpack:FindFirstChild("Hidden Key") or game.Players.LocalPlayer.Character:FindFirstChild("Hidden Key") then
                    _G.SelectWeapon = "Hidden Key"
                    TP(CFrame.new(6572.8081054688, 296.65469360352, -6965.1962890625))
                
                else
                    for i, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                        for i2, v2 in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                        if v.Name == "Snow Lurker [Lv. 1375]" and v2.Name == "Snow Lurker [Lv. 1375]" then
                            v2.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame
                            v.HumanoidRootPart.CanCollide = false
							v.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                            attack()
                            TP(v.HumanoidRootPart.CFrame * CFrame.new(0,50,0))
                            sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
                            
                        end
                    end
                end
            end
        end
    end
    end)
if newworld then
    BareWeapon = ""
    local args = {
        [1] = "getInventoryWeapons"
    }
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
    game:GetService("RunService").Heartbeat:Connect(
        function()
            if _G.AutoBartilo then
                game.Players.LocalPlayer.Character.Humanoid:ChangeState(11)
            end
        end
        )

    Page:Toggle("Auto Quest Bartilo", nil, function(v)
        _G.AutoBartilo = v
    end)
spawn(function()
    while wait() do
        if _G.AutoBartilo then
            haki()
            if game.Players.LocalPlayer.Data.Level.Value >= 850 and game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BartiloQuestProgress","Bartilo") == 0 then
                if string.find(game.Players.LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Swan Pirates") and string.find(game.Players.LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "50") and game.Players.LocalPlayer.PlayerGui.Main.Quest.Visible == true then 
                    if game.Workspace.Enemies:FindFirstChild("Swan Pirate [Lv. 775]") then
                        Ms = "Swan Pirate [Lv. 775]"
                        for i,v in pairs(game.Workspace.Enemies:GetChildren()) do
                            for i2,v2 in pairs(game.Workspace.Enemies:GetChildren()) do
                            if v.Name == Ms and v2.Name == Ms then
                                pcall(function()
                                        v2.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame
                                        if setsimulationradius then 
                                            sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
                                        end
                                        EquipWeapon(BareWeapon)
                                        if not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
                                            local args = {
                                                [1] = "Buso"
                                            }
                                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                                        end
                                        if HideHitBlox then
                                            v.HumanoidRootPart.Transparency = 1
                                        else
                                            v.HumanoidRootPart.Transparency = 70
                                        end
                                        v.HumanoidRootPart.CanCollide = false
                                        v.HumanoidRootPart.Size = Vector3.new(50, 50, 50)
                                        TP(v.HumanoidRootPart.CFrame * CFrame.new(0,50,0))													
                                        PosMonBarto =  v.HumanoidRootPart.CFrame
                                        game:GetService'VirtualUser':CaptureController()
                                        game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))
                                        AutoBartiloBring = true
                                    AutoBartiloBring = false
                                end)
                            end
                        end
                    end
                    else
                        repeat TP(CFrame.new(1057.92761, 137.614319, 1242.08069)) wait() until _G.StopTween == true or not _G.AutoBartilo or (game.Players.LocalPlayer.Character.HumanoidRootPart.Position-Vector3.new(1057.92761, 137.614319, 1242.08069)).Magnitude <= 10
                    end
                else
                    repeat TP(CFrame.new(-456.28952, 73.0200958, 299.895966)) wait() until _G.StopTween == true or not _G.AutoBartilo or (game.Players.LocalPlayer.Character.HumanoidRootPart.Position-Vector3.new(-456.28952, 73.0200958, 299.895966)).Magnitude <= 10
                    wait(1.1)
                    local args = {
                        [1] = "StartQuest",
                        [2] = "BartiloQuest",
                        [3] = 1
                    }
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                end 
            elseif game.Players.LocalPlayer.Data.Level.Value >= 800 and game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BartiloQuestProgress","Bartilo") == 1 then
                if game.Workspace.Enemies:FindFirstChild("Jeremy [Lv. 850] [Boss]") then
                    Ms = "Jeremy [Lv. 850] [Boss]"
                    for i,v in pairs(game.Workspace.Enemies:GetChildren()) do
                        if v.Name == Ms then
                            repeat wait()
                                if setsimulationradius then 
                                    sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
                                end
                                EquipWeapon(BareWeapon)
                                if not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
                                    local args = {
                                        [1] = "Buso"
                                    }
                                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                                end
                                if HideHitBlox then
                                    v.HumanoidRootPart.Transparency = 1
                                else
                                    v.HumanoidRootPart.Transparency = 70
                                end
                                v.HumanoidRootPart.CanCollide = false
                                v.HumanoidRootPart.Size = Vector3.new(50, 50, 50)
                                TP(v.HumanoidRootPart.CFrame * CFrame.new(0,50,0))
                                game:GetService'VirtualUser':CaptureController()
                                game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))
                            until not v.Parent or v.Humanoid.Health <= 0 or _G.AutoBartilo == false
                        end
                    end
                elseif game.ReplicatedStorage:FindFirstChild("Jeremy [Lv. 850] [Boss]") then
                    repeat TP(CFrame.new(-456.28952, 73.0200958, 299.895966)) wait() until _G.StopTween == true or not _G.AutoBartilo or (game.Players.LocalPlayer.Character.HumanoidRootPart.Position-Vector3.new(-456.28952, 73.0200958, 299.895966)).Magnitude <= 10
                    wait(1.1)
                    local args = {
                        [1] = "BartiloQuestProgress",
                        [2] = "Bartilo"
                    }
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                    wait(1)
                    repeat TP(CFrame.new(2099.88159, 448.931, 648.997375)) wait() until _G.StopTween == true or not _G.AutoBartilo or (game.Players.LocalPlayer.Character.HumanoidRootPart.Position-Vector3.new(2099.88159, 448.931, 648.997375)).Magnitude <= 10
                    wait(2)
                else
                    repeat TP(CFrame.new(2099.88159, 448.931, 648.997375)) wait() until _G.StopTween == true or not _G.AutoBartilo or (game.Players.LocalPlayer.Character.HumanoidRootPart.Position-Vector3.new(2099.88159, 448.931, 648.997375)).Magnitude <= 10
                end
            elseif game.Players.LocalPlayer.Data.Level.Value >= 800 and game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BartiloQuestProgress","Bartilo") == 2 then
                TP(game:GetService("Workspace").Map.Dressrosa.BartiloPlates.Plate1.CFrame)
                wait(1)
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Map.Dressrosa.BartiloPlates.Plate2.CFrame
                wait(1)
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Map.Dressrosa.BartiloPlates.Plate3.CFrame
                wait(1)
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Map.Dressrosa.BartiloPlates.Plate4.CFrame
                wait(1)
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Map.Dressrosa.BartiloPlates.Plate5.CFrame
                wait(1)
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Map.Dressrosa.BartiloPlates.Plate6.CFrame
                wait(1)
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Map.Dressrosa.BartiloPlates.Plate7.CFrame
                wait(1)
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Map.Dressrosa.BartiloPlates.Plate8.CFrame           
             end
        end 
    end
end)

spawn(function()
    while game:GetService("RunService").RenderStepped:wait() do
        if _G.AutoBartilo then
            pcall(function()
                for i,v in pairs(game.Workspace.Enemies:GetDescendants()) do
                    if v.Name == "Humanoid" then
                        v.PlatformStand = true
                    end
                end
            end)
        end
    end
end)

WaponBartilo = {}
for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do  
    if v:IsA("Tool") then
        table.insert(WaponBartilo ,v.Name)
    end
end
for i,v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do  
    if v:IsA("Tool") then
        table.insert(WaponBartilo, v.Name)
    end
end


local BareWeapon = Page:Dropdown("Select Weapon Bartilo",WaponBartilo,function(A)
    BareWeapon = A
end)

Page:Button("Refresh Weapon",function()
    WaponBartilo = {}
    for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do  
        if v:IsA("Tool") then
            table.insert(WaponBartilo ,v.Name)
        end
    end
    for i,v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do  
        if v:IsA("Tool") then
            table.insert(WaponBartilo, v.Name)
        end
    end
BareWeapon:Clear(WaponBartilo)
end)
end









if newworld then
    -- Auto Buy Legendary Sword
	Page:Toggle("Auto Buy Legendary Sword", _G.AutoLegendarySword,function(Value)
		Legendary = Value    
	end)
	Page:Toggle("Auto Buy Legendary Sword Hop", _G.AutoLegendarySwordHop,function(Value)
		LegendaryHop = Value    
	end)
	-- Auto Buy Enhancement
	Page:Toggle("Auto Buy Enhancement", _G.BuyEnhancement,function(Value)
		Enhancement = Value    
	end)
	spawn(function()
		while wait() do
			if Legendary then
				local args = {
					[1] = "LegendarySwordDealer",
					[2] = "2"
				}
				game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
			end 
			if LegendaryHop then
				local args = {
					[1] = "LegendarySwordDealer",
					[2] = "2"
				}
				game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
				wait(7)
				local args = {
					[1] = "LegendarySwordDealer",
					[2] = "2"
				}
				game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
				wait()
				local PlaceID = game.PlaceId
				local AllIDs = {}
				local foundAnything = ""
				local actualHour = os.date("!*t").hour
				local Deleted = false
				function TPReturner()
					local Site;
					if foundAnything == "" then
						Site = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. PlaceID .. '/servers/Public?sortOrder=Asc&limit=100'))
					else
						Site = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. PlaceID .. '/servers/Public?sortOrder=Asc&limit=100&cursor=' .. foundAnything))
					end
					local ID = ""
					if Site.nextPageCursor and Site.nextPageCursor ~= "null" and Site.nextPageCursor ~= nil then
						foundAnything = Site.nextPageCursor
					end
					local num = 0;
					for i,v in pairs(Site.data) do
						local Possible = true
						ID = tostring(v.id)
						if tonumber(v.maxPlayers) > tonumber(v.playing) then
							for _,Existing in pairs(AllIDs) do
								if num ~= 0 then
									if ID == tostring(Existing) then
										Possible = false
									end
								else
									if tonumber(actualHour) ~= tonumber(Existing) then
										local delFile = pcall(function()
											-- delfile("NotSameServers.json")
											AllIDs = {}
											table.insert(AllIDs, actualHour)
										end)
									end
								end
								num = num + 1
							end
							if Possible == true then
								table.insert(AllIDs, ID)
								wait()
								pcall(function()
									-- writefile("NotSameServers.json", game:GetService('HttpService'):JSONEncode(AllIDs))
									wait()
									game:GetService("TeleportService"):TeleportToPlaceInstance(PlaceID, ID, game.Players.LocalPlayer)
								end)
								wait(.1)
							end
						end
					end
				end
				function Teleport() 
					while wait() do
						pcall(function()
							TPReturner()
							if foundAnything ~= "" then
								TPReturner()
							end
						end)
					end
				end
				Teleport()
				wait(3)
			end 
			if Enhancement then
				local args = {
					[1] = "ColorsDealer",
					[2] = "2"
				}
				game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
			end 
		end
	end)  
end


function TPReturner()
	local Site;
	if foundAnything == "" then
		Site = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. PlaceID .. '/servers/Public?sortOrder=Asc&limit=100'))
	else
		Site = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. PlaceID .. '/servers/Public?sortOrder=Asc&limit=100&cursor=' .. foundAnything))
	end
	local ID = ""
	if Site.nextPageCursor and Site.nextPageCursor ~= "null" and Site.nextPageCursor ~= nil then
		foundAnything = Site.nextPageCursor
	end
	local num = 0;
	for i,v in pairs(Site.data) do
		local Possible = true
		ID = tostring(v.id)
		if tonumber(v.maxPlayers) > tonumber(v.playing) then
			for _,Existing in pairs(AllIDs) do
				if num ~= 0 then
					if ID == tostring(Existing) then
						Possible = false
					end
				else
				if tonumber(actualHour) ~= tonumber(Existing) then
					local delFile = pcall(function()
						--delfile("NotSameServers.json")
						AllIDs = {}
						table.insert(AllIDs, actualHour)
					end)
				end
			end
			num = num + 1
		end
		if Possible == true then
			table.insert(AllIDs, ID)
			wait()
			pcall(function()
				--writefile("NotSameServers.json", game:GetService('HttpService'):JSONEncode(AllIDs))
				wait()
				game:GetService("TeleportService"):TeleportToPlaceInstance(PlaceID, ID, game.Players.LocalPlayer)
			end)
			end
		end
	end
end


function Teleport()
	while wait() do
		pcall(function()
			TPReturner()
			if foundAnything ~= "" then
				TPReturner()
			end
		end)
	end
end

if thirdworld then
    Page:Toggle("Auto Elite Hunter", nil, function(vu)
        _G.EliteHunt = vu
    end)

    spawn(function()
        while wait() do
            if  _G.EliteHunt then
                if game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false then
                    wait(.5)
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("EliteHunter")
                else
                    if game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text == "Defeat  Diablo (0/1)" then
                        if game:GetService("Workspace").Enemies:FindFirstChild("Diablo [Lv. 1750]") then
                            for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                                if v.Name == "Diablo [Lv. 1750]" then
                                    repeat wait()
                                        if not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
                                            local args = {
                                                [1] = "Buso"
                                            }
                                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                                        end
                                        EquipWeapon(_G.SelectWeapon)
                                        TP(v.HumanoidRootPart.CFrame * CFrame.new(0,50,0))
                                        if setsimulationradius then
                                            sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
                                        end
                                        v.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame
                                        v.HumanoidRootPart.CanCollide = false
                                        v.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                                        game:GetService'VirtualUser':CaptureController()
                                        game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))
                                    until _G.EliteHunt == false or v.Humanoid.Health <= 0
                                end
                            end
                        else
                            spawn(function()
                                TP(game:GetService("ReplicatedStorage")["Diablo [Lv. 1750]"].HumanoidRootPart.CFrame *CFrame.new(0,0,15))
                            end)
                        end
                    elseif game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text == "Defeat  Deandre (0/1)" then
                        if game:GetService("Workspace").Enemies:FindFirstChild("Deandre [Lv. 1750]") then
                            for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                                if v.Name == "Deandre [Lv. 1750]" then
                                    repeat wait()
                                        if not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
                                            local args = {
                                                [1] = "Buso"
                                            }
                                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                                        end
                                        EquipWeapon(_G.SelectWeapon)
                                        TP(v.HumanoidRootPart.CFrame * CFrame.new(0,50,0))
                                        if setsimulationradius then
                                            sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
                                        end
                                        v.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame
                                        v.HumanoidRootPart.CanCollide = false
                                        v.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                                        game:GetService'VirtualUser':CaptureController()
                                        game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))
                                    until _G.EliteHunt == false or v.Humanoid.Health <= 0
                                end
                            end
                        else
                            spawn(function()
                                TP(game:GetService("ReplicatedStorage")["Deandre [Lv. 1750]"].HumanoidRootPart.CFrame *CFrame.new(0,0,15))
                            end)
                        end
                    elseif game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text == "Defeat  Urban (0/1)" then
                        if game:GetService("Workspace").Enemies:FindFirstChild("Urban [Lv. 1750]") then
                            for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                                if v.Name == "Urban [Lv. 1750]" then
                                    repeat wait()
                                        if not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
                                            local args = {
                                                [1] = "Buso"
                                            }
                                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                                        end
                                        EquipWeapon(_G.SelectWeapon)
                                        TP(v.HumanoidRootPart.CFrame * CFrame.new(0,50,0))
                                        if setsimulationradius then
                                            sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
                                        end
                                        v.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame
                                        v.HumanoidRootPart.CanCollide = false
                                        v.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                                        game:GetService'VirtualUser':CaptureController()
                                        game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))
                                    until _G.EliteHunt == false or v.Humanoid.Health <= 0
                                end
                            end
                        else
                            spawn(function()
                                TP(game:GetService("ReplicatedStorage")["Urban [Lv. 1750]"].HumanoidRootPart.CFrame *CFrame.new(0,0,15))
                            end)
                        end
                    end
                end
            end
        end
    end)
end


if thirdworld then
    Page:Toggle("Auto HolyTorch", nil, function(vu)
        _G.HolyTorch = vu
    end)
end
    spawn(function()
        while wait() do
            if _G.HolyTorch then
                wait(1)
                repeat TP(CFrame.new(-10752, 417, -9366)) wait() until _G.StopTween == true or not _G.HolyTorch or (game.Players.LocalPlayer.Character.HumanoidRootPart.Position-Vector3.new(-10752, 417, -9366)).Magnitude <= 10
                wait(1)
                repeat TP(CFrame.new(-11672, 334, -9474)) wait() until _G.StopTween == true or not _G.HolyTorch or (game.Players.LocalPlayer.Character.HumanoidRootPart.Position-Vector3.new(-11672, 334, -9474)).Magnitude <= 10
                wait(1)
                repeat TP(CFrame.new(-12132, 521, -10655)) wait() until _G.StopTween == true or not _G.HolyTorch or (game.Players.LocalPlayer.Character.HumanoidRootPart.Position-Vector3.new(-12132, 521, -10655)).Magnitude <= 10
                wait(1)
                repeat TP(CFrame.new(-13336, 486, -6985)) wait() until _G.StopTween == true or not _G.HolyTorch or (game.Players.LocalPlayer.Character.HumanoidRootPart.Position-Vector3.new(-13336, 486, -6985)).Magnitude <= 10
                wait(1)
                repeat TP(CFrame.new(-13489, 332, -7925)) wait() until _G.StopTween == true or not _G.HolyTorch or (game.Players.LocalPlayer.Character.HumanoidRootPart.Position-Vector3.new(-13489, 332, -7925)).Magnitude <= 10
            end
        end
    end)




    if thirdworld then
        Page:Toggle("Auto Hallow Essence", nil, function(vu)
                _G.Hollow = vu
        end)
    end



    spawn(function()
		while wait() do
			pcall(function()
                if _G.Hollow then
                    if game.Players.LocalPlayer.Backpack:FindFirstChild("Hallow Essence") then    
                        _G.BBone = false                    
                        TP(CFrame.new(-8932.83789, 144.098709, 6059.34229, -0.999290943, 7.95623478e-09, -0.0376505218, 4.4684243e-09, 1, 9.27205832e-08, 0.0376505218, 9.24866086e-08, -0.999290943))  
                    elseif game.Workspace.Enemies:FindFirstChild ("Soul Reaper [Lv. 2100] [Raid Boss]") then
                        _G.BBone = false
                    else
                        _G.BBone = true
                    end
                    if game.Workspace.Enemies:FindFirstChild ("Soul Reaper [Lv. 2100] [Raid Boss]") then
                        _G.BBone = false       
                        for i, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                            if v.Name == "Soul Reaper [Lv. 2100] [Raid Boss]"  then
                                v.HumanoidRootPart.CanCollide = false
                                v.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                                attack()
                                TP(v.HumanoidRootPart.CFrame * CFrame.new(0,50,0))
                            end
                        end
                    end
                end
            end)
        end
    end)                            
if thirdworld then
    Page:Toggle("Auto Yama", nil, function(v)
        _G.Yama = v
    end)
end
	spawn(function()
		while wait() do
			pcall(function()
				if _G.Yama then
					if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("EliteHunter","Progress") >= 30 then
						fireclickdetector(game:GetService("Workspace").Map.Waterfall.SealedKatana.Handle.ClickDetector)
                    end
                end
            end)
        end
    end)


if thirdworld then
    Page:Toggle("Auto farm bone", nil, function(v)
		_G.Auto_Bone = v 
    end)
end
        spawn(function()
            while wait(.1) do
                pcall(function()
                    if _G.Auto_Bone then
                        if game:GetService("Workspace").Enemies:FindFirstChild("Reborn Skeleton [Lv. 1975]") or game:GetService("Workspace").Enemies:FindFirstChild("Living Zombie [Lv. 2000]") or game:GetService("Workspace").Enemies:FindFirstChild("Domenic Soul [Lv. 2025]") or game:GetService("Workspace").Enemies:FindFirstChild("Posessed Mummy [Lv. 2050]") then
                            for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                                if v.Name == "Reborn Skeleton [Lv. 1975]" or v.Name == "Living Zombie [Lv. 2000]" or v.Name == "Demonic Soul [Lv. 2025]" or v.Name == "Posessed Mummy [Lv. 2050]" then
                                    if v:WaitForChild("Humanoid").Health > 0 then
                                        repeat game:GetService("RunService").Heartbeat:wait()
                                            haki()
                                            TP(v.HumanoidRootPart.CFrame * CFrame.new(0,50,0))
                                            v.HumanoidRootPart.CanCollide = false
                                            v.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                                            game:GetService("VirtualUser"):CaptureController()
                                            game:GetService("VirtualUser"):Button1Down(Vector2.new(1280, 670),workspace.CurrentCamera.CFrame)
                                            MainMonBone = v.HumanoidRootPart.CFrame
                                            BoneMagnet = true
                                        until Auto_Bone == false or not v.Parent or v.Humanoid.Health <= 0
                                    end
                                end
                            end
                        else
                            BoneMagnet = false
                            TP(CFrame.new(-9501.64453, 582.052612, 6034.20117))
                        end
                    end
                end)
            end
        end)


        spawn(function()
            while game:GetService("RunService").RenderStepped:wait() do
                if _G.Auto_Bone then
                    pcall(function()
                        EquipWeapon(_G.SelectWeapon)
                    end)
                end
            end
        end)
        


        spawn(function()
            while game:GetService("RunService").RenderStepped:wait() do
                if _G.Auto_Bone then
                    pcall(function()
                        for i,v in pairs(game.Workspace.Enemies:GetDescendants()) do
                            if v.Name == "Humanoid" then
                                v.PlatformStand = true
                            end
                        end
                    end)
                end
            end
        end)
        
        spawn(function()
            while game:GetService("RunService").RenderStepped:wait() do
                if _G.Auto_Bone then
                    pcall(function()
                        for i,v in pairs(game.Workspace.Enemies:GetDescendants()) do
                            if v.Name == "Reborn Skeleton [Lv. 1975]" or v.Name == "Living Zombie [Lv. 2000]" or v.Name == "Demonic Soul [Lv. 2025]" or v.Name == "Posessed Mummy [Lv. 2050]" then
                                v.Humanoid:ChangeState(11)
                            end
                        end
                    end)
                end
            end
        end)

    



spawn(function()
    game:GetService("RunService").Heartbeat:Connect(function()
        if _G.VeryNoclip or _G.FARM or _G.Chest or _G.AutoNew or Sea3 or _G.HolyTorch or _G.Hollow or _G.AutoRengoku or _G.AutoBartilo or _G.EliteHunt or _G.Auto_Bone or _G.NextIsland then
        if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Humanoid") then
            setfflag("HumanoidParallelRemoveNoPhysics", "False")
            setfflag("HumanoidParallelRemoveNoPhysicsNoSimulate2", "False")
            
        end
        end
    end)
end)

spawn(function()
    pcall(function()
        while task.wait() do
            if _G.TpNoclip or _G.VeryNoclip or _G.FARM or _G.Chest or _G.AutoNew or Sea3 or _G.HolyTorch or _G.Hollow or _G.AutoRengoku or _G.AutoBartilo or _G.EliteHunt or _G.Auto_Bone or _G.NextIsland then
                if not game.Players.LocalPlayer.Character.HumanoidRootPart:FindFirstChild("BodyClip") then
                    local Noclip = Instance.new("BodyVelocity")
                    Noclip.Name = "BodyClip"
                    Noclip.Parent = game.Players.LocalPlayer.Character.HumanoidRootPart
                    Noclip.MaxForce = Vector3.new(100000,100000,100000)
                    Noclip.Velocity = Vector3.new(0,0,0)
                end
            else
                if game.Players.LocalPlayer.Character.HumanoidRootPart:FindFirstChild("BodyClip") then
                    game.Players.LocalPlayer.Character.HumanoidRootPart:FindFirstChild("BodyClip"):Destroy()
                end
            end
        end
    end)
end)


spawn(function()
		while wait(.25) do
			if _G.Superhuman or _G.FullSuperhuman and game.Players.LocalPlayer:FindFirstChild("WeaponAssetCache") then 
				if game.Players.LocalPlayer.Backpack:FindFirstChild("Combat") or game.Players.LocalPlayer.Character:FindFirstChild("Combat") then
					local args = {
						[1] = "BuyElectro"
					}
					game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
				end   
				if game.Players.LocalPlayer.Character:FindFirstChild("Superhuman") or game.Players.LocalPlayer.Backpack:FindFirstChild("Superhuman") then
					SelectToolWeapon = "Superhuman"
				end  
				if game.Players.LocalPlayer.Backpack:FindFirstChild("Black Leg") and game.Players.LocalPlayer.Backpack:FindFirstChild("Black Leg").Level.Value <= 299  then
					SelectToolWeapon = "Black Leg"
				end
				if game.Players.LocalPlayer.Backpack:FindFirstChild("Electro") and game.Players.LocalPlayer.Backpack:FindFirstChild("Electro").Level.Value <= 299  then
					SelectToolWeapon = "Electro"
				end
				if game.Players.LocalPlayer.Backpack:FindFirstChild("Fishman Karate") and game.Players.LocalPlayer.Backpack:FindFirstChild("Fishman Karate").Level.Value <= 299  then
					SelectToolWeapon = "Fishman Karate"
				end
				if game.Players.LocalPlayer.Backpack:FindFirstChild("Dragon Claw") and game.Players.LocalPlayer.Backpack:FindFirstChild("Dragon Claw").Level.Value <= 299  then
					SelectToolWeapon = "Dragon Claw"
				end
				if game.Players.LocalPlayer.Backpack:FindFirstChild("Black Leg") and game.Players.LocalPlayer.Backpack:FindFirstChild("Black Leg").Level.Value >= 300  then
					local args = {
						[1] = "BuyFishmanKarate"
					}
					game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
				end
				if game.Players.LocalPlayer.Character:FindFirstChild("Black Leg") and game.Players.LocalPlayer.Character:FindFirstChild("Black Leg").Level.Value >= 300  then
					local args = {
						[1] = "BuyFishmanKarate"
					}
					game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
				end
				if game.Players.LocalPlayer.Backpack:FindFirstChild("Electro") and game.Players.LocalPlayer.Backpack:FindFirstChild("Electro").Level.Value >= 100  then
					local args = {
						[1] = "BuyBlackLeg"
					}
					game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
				end
				if game.Players.LocalPlayer.Character:FindFirstChild("Electro") and game.Players.LocalPlayer.Character:FindFirstChild("Electro").Level.Value >= 300  then
					local args = {
						[1] = "BuyBlackLeg"
					}
					game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
				end
				if game.Players.LocalPlayer.Backpack:FindFirstChild("Fishman Karate") and game.Players.LocalPlayer.Backpack:FindFirstChild("Fishman Karate").Level.Value >= 300  then
					if _G.FullSuperhuman and game.Players.LocalPlayer.Data.Fragments.Value < 1500 then
						if game.Players.LocalPlayer.Data.Level.Value > 1100 then
							RaidsSelected = "Flame"
							_G.AutoRaids = true
							_G.RaidsArua = true
						end
					else
						_G.AutoRaids = false
						_G.RaidsArua = false
						local args = {
							[1] = "BlackbeardReward",
							[2] = "DragonClaw",
							[3] = "2"
						}
						game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
					end
				end
				if game.Players.LocalPlayer.Character:FindFirstChild("Fishman Karate") and game.Players.LocalPlayer.Character:FindFirstChild("Fishman Karate").Level.Value >= 300  then
					if _G.FullSuperhuman and game.Players.LocalPlayer.Data.Fragments.Value < 1500 then
						if game.Players.LocalPlayer.Data.Level.Value > 1100 then
							RaidsSelected = "Flame"
							_G.AutoRaids = true
							_G.RaidsArua = true
						end
					else
						_G.AutoRaids = false
						_G.RaidsArua = false
						local args = {
							[1] = "BlackbeardReward",
							[2] = "DragonClaw",
							[3] = "2"
						}
						game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
					end
				end
				if game.Players.LocalPlayer.Backpack:FindFirstChild("Dragon Claw") and game.Players.LocalPlayer.Backpack:FindFirstChild("Dragon Claw").Level.Value >= 300  then
					local args = {
						[1] = "BuySuperhuman"
					}
					game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
				end
				if game.Players.LocalPlayer.Character:FindFirstChild("Dragon Claw") and game.Players.LocalPlayer.Character:FindFirstChild("Dragon Claw").Level.Value >= 300  then
					local args = {
						[1] = "BuySuperhuman"
					}
					game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
				end 
			end
			if DeathStep and game.Players.LocalPlayer:FindFirstChild("WeaponAssetCache") then
				if game.Players.LocalPlayer.Backpack:FindFirstChild("Black Leg") and game.Players.LocalPlayer.Backpack:FindFirstChild("Black Leg").Level.Value >= 400 then
					local args = {
						[1] = "BuyDeathStep"
					}
					game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
					SelectToolWeapon = "Death Step"
				end  
				if game.Players.LocalPlayer.Character:FindFirstChild("Black Leg") and game.Players.LocalPlayer.Character:FindFirstChild("Black Leg").Level.Value >= 400 then
					local args = {
						[1] = "BuyDeathStep"
					}
					game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
					
					SelectToolWeapon = "Death Step"
				end  
				if game.Players.LocalPlayer.Backpack:FindFirstChild("Black Leg") and game.Players.LocalPlayer.Backpack:FindFirstChild("Black Leg").Level.Value < 400 then
					SelectToolWeapon = "Black Leg"
				end 
			end
			if DargonTalon and game.Players.LocalPlayer:FindFirstChild("WeaponAssetCache") then
				if game.Players.LocalPlayer.Backpack:FindFirstChild("Dragon Claw") and game.Players.LocalPlayer.Backpack:FindFirstChild("Dragon Claw").Level.Value <= 399 and game.Players.LocalPlayer.Character.Humanoid.Health > 0 then
					SelectToolWeapon = "Dragon Claw"
				end
				if game.Players.LocalPlayer.Character:FindFirstChild("Dragon Claw") and game.Players.LocalPlayer.Character:FindFirstChild("Dragon Claw").Level.Value <= 399 and game.Players.LocalPlayer.Character.Humanoid.Health > 0 then
					SelectToolWeapon = "Dragon Claw"
				end
	
				if game.Players.LocalPlayer.Character:FindFirstChild("Dragon Claw") and game.Players.LocalPlayer.Character:FindFirstChild("Dragon Claw").Level.Value >= 400 and game.Players.LocalPlayer.Character.Humanoid.Health > 0 then
					SelectToolWeapon = "Dragon Claw"
					if game.ReplicatedStorage.Remotes.CommF_:InvokeServer("BuyDragonTalon", true) == 3 then
						local string_1 = "Bones";
						local string_2 = "Buy";
						local number_1 = 1;
						local number_2 = 1;
						local Target = game:GetService("ReplicatedStorage").Remotes["CommF_"];
						Target:InvokeServer(string_1, string_2, number_1, number_2);
	
						local string_1 = "BuyDragonTalon";
						local bool_1 = true;
						local Target = game:GetService("ReplicatedStorage").Remotes["CommF_"];
						Target:InvokeServer(string_1, bool_1);
					elseif game.ReplicatedStorage.Remotes.CommF_:InvokeServer("BuyDragonTalon", true) == 1 then
						game.ReplicatedStorage.Remotes.CommF_:InvokeServer("BuyDragonTalon")
					else
						local string_1 = "BuyDragonTalon";
						local bool_1 = true;
						local Target = game:GetService("ReplicatedStorage").Remotes["CommF_"];
						Target:InvokeServer(string_1, bool_1);
						local string_1 = "BuyDragonTalon";
						local Target = game:GetService("ReplicatedStorage").Remotes["CommF_"];
						Target:InvokeServer(string_1);
					end 
				end
			end
			if Electricclow and game.Players.LocalPlayer:FindFirstChild("WeaponAssetCache") then
				if game.Players.LocalPlayer.Backpack:FindFirstChild("Electro") and game.Players.LocalPlayer.Backpack:FindFirstChild("Electro").Level.Value < 400 then
					SelectToolWeapon = "Electro"
				end  
				if game.Players.LocalPlayer.Character:FindFirstChild("Electro") and game.Players.LocalPlayer.Character:FindFirstChild("Electro").Level.Value < 400 then
					SelectToolWeapon = "Electro"
				end  
				if game.Players.LocalPlayer.Backpack:FindFirstChild("Electro") and game.Players.LocalPlayer.Backpack:FindFirstChild("Electro").Level.Value >= 400 then
					local v175 = game.ReplicatedStorage.Remotes.CommF_:InvokeServer("BuyElectricClaw", true);
					if v175 == 4 then
						local v176 = game.ReplicatedStorage.Remotes.CommF_:InvokeServer("BuyElectricClaw", "Start");
						if v176 == nil then
							game.Players.localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-12548, 337, -7481)
						end
					else
						local string_1 = "BuyElectricClaw";
						local Target = game:GetService("ReplicatedStorage").Remotes["CommF_"];
						Target:InvokeServer(string_1);
					end
				end
				if game.Players.LocalPlayer.Character:FindFirstChild("Electro") and game.Players.LocalPlayer.Character:FindFirstChild("Electro").Level.Value >= 400 then
					local v175 = game.ReplicatedStorage.Remotes.CommF_:InvokeServer("BuyElectricClaw", true);
					if v175 == 4 then
						local v176 = game.ReplicatedStorage.Remotes.CommF_:InvokeServer("BuyElectricClaw", "Start");
						if v176 == nil then
							game.Players.localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-12548, 337, -7481)
						end
					else
						local string_1 = "BuyElectricClaw";
						local Target = game:GetService("ReplicatedStorage").Remotes["CommF_"];
						Target:InvokeServer(string_1);
					end
				end
			end
		end
	end)
        
        Page:Toggle("Auto Superhuman", nil, function(sp)
            _G.Superhuman = sp
        end)
        
         Page:Toggle("Auto FullSuperhuman", nil, function(sps)
            _G.FullSuperhuman = sps
            end)
        
        
            spawn(function()
                while wait(.1) do
                if _G.Superhuman then
                if game.Players.LocalPlayer.Backpack:FindFirstChild("Combat") or game.Players.LocalPlayer.Character:FindFirstChild("Combat") then
                local args = {
                [1] = "BuyBlackLeg"
                }
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                end   
                if game.Players.LocalPlayer.Backpack:FindFirstChild("Black Leg") or game.Players.LocalPlayer.Character:FindFirstChild("Black Leg") or game.Players.LocalPlayer.Backpack:FindFirstChild("Electro") or game.Players.LocalPlayer.Character:FindFirstChild("Electro") or game.Players.LocalPlayer.Backpack:FindFirstChild("Fishman Karate") or game.Players.LocalPlayer.Character:FindFirstChild("Fishman Karate") or game.Players.LocalPlayer.Backpack:FindFirstChild("Dragon Claw") or game.Players.LocalPlayer.Character:FindFirstChild("Dragon Claw")  then
                if game.Players.LocalPlayer.Backpack:FindFirstChild("Black Leg") and game.Players.LocalPlayer.Backpack:FindFirstChild("Black Leg").Level.Value <= 299 then
                   _G.SelectWeapon = "Black Leg"
                end
                if game.Players.LocalPlayer.Backpack:FindFirstChild("Electro") and game.Players.LocalPlayer.Backpack:FindFirstChild("Electro").Level.Value <= 299 then
                   _G.SelectWeapon = "Electro"
                end
                if game.Players.LocalPlayer.Backpack:FindFirstChild("Fishman Karate") and game.Players.LocalPlayer.Backpack:FindFirstChild("Fishman Karate").Level.Value <= 299 then
                   _G.SelectWeapon = "Fishman Karate"
                end
                if game.Players.LocalPlayer.Backpack:FindFirstChild("Dragon Claw") and game.Players.LocalPlayer.Backpack:FindFirstChild("Dragon Claw").Level.Value <= 299 then
                   _G.SelectWeapon = "Dragon Claw"
                end
                if game.Players.LocalPlayer.Backpack:FindFirstChild("Superhuman") or game:GetService("Players").LocalPlayer.Character:FindFirstChild("Superhuman") then
                    _G.SelectWeapon = "Superhuman"
                end
                if game.Players.LocalPlayer.Backpack:FindFirstChild("Black Leg") and game.Players.LocalPlayer.Backpack:FindFirstChild("Black Leg").Level.Value >= 300 then
                local args = {
                [1] = "BuyElectro"
                }
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                end
                if game.Players.LocalPlayer.Character:FindFirstChild("Black Leg") and game.Players.LocalPlayer.Character:FindFirstChild("Black Leg").Level.Value >= 300 then
                local args = {
                [1] = "BuyElectro"
                }
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                end
                if game.Players.LocalPlayer.Backpack:FindFirstChild("Electro") and game.Players.LocalPlayer.Backpack:FindFirstChild("Electro").Level.Value >= 300 then
                local args = {
                [1] = "BuyFishmanKarate"
                }
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                end
                if game.Players.LocalPlayer.Character:FindFirstChild("Electro") and game.Players.LocalPlayer.Character:FindFirstChild("Electro").Level.Value >= 300 then
                local args = {
                [1] = "BuyFishmanKarate"
                }
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                end
                if game.Players.LocalPlayer.Backpack:FindFirstChild("Fishman Karate") and game.Players.LocalPlayer.Backpack:FindFirstChild("Fishman Karate").Level.Value >= 300 then
                local args = {
                [1] = "BlackbeardReward",
                [2] = "DragonClaw",
                [3] = "1"
                }
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                local args = {
                [1] = "BlackbeardReward",
                [2] = "DragonClaw",
                [3] = "2"
                }
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args)) 
                end
                if game.Players.LocalPlayer.Character:FindFirstChild("Fishman Karate") and game.Players.LocalPlayer.Character:FindFirstChild("Fishman Karate").Level.Value >= 300 then
                local args = {
                [1] = "BlackbeardReward",
                [2] = "DragonClaw",
                [3] = "1"
                }
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                local args = {
                [1] = "BlackbeardReward",
                [2] = "DragonClaw",
                [3] = "2"
                }
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args)) 
                end
                if game.Players.LocalPlayer.Backpack:FindFirstChild("Dragon Claw") and game.Players.LocalPlayer.Backpack:FindFirstChild("Dragon Claw").Level.Value >= 300 then
                local args = {
                [1] = "BuySuperhuman"
                }
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                end
                if game.Players.LocalPlayer.Character:FindFirstChild("Dragon Claw") and game.Players.LocalPlayer.Character:FindFirstChild("Dragon Claw").Level.Value >= 300 then
                local args = {
                [1] = "BuySuperhuman"
                }
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                end
                end
                end
                end
                end)

Wapon = {}
for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do  
    if v:IsA("Tool") then
        table.insert(Wapon ,v.Name)
    end
end
for i,v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do  
    if v:IsA("Tool") then
        table.insert(Wapon, v.Name)
    end
end
local SelectWeapona = Page:Dropdown("Select Weapon",Wapon,function(Value)
    _G.SelectWeapon = Value
    _G.SelectToolWeaponOld = Value
end)

Page:Button("refresh weapon", function()
    Wapon = {}
    for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do  
        if v:IsA("Tool") then
            table.insert(Wapon ,v.Name)
        end
    end
    for i,v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do  
        if v:IsA("Tool") then
            table.insert(Wapon, v.Name)
        end
    end
    SelectWeapona:Clear(Wapon)
end)



Page2:Toggle("Melee",_G.M, function(x)
_G.M = x
end)

Page2:Toggle("Defense",_G.D, function(x)
_G.D = x
end)

Page2:Toggle("Sword",_G.S, function(x)
 _G.S = x
end)

Page2:Toggle("Gun",_G.G, function(x)
_G.G = x
end)

Page2:Toggle("Blox Fruit",_G.BF, function(x)
_G.BF = x
end)

spawn(function()
    pcall(function()
        while task.wait() do
            if _G.M then
            local args = {
            [1] = "AddPoint",
            [2] = "Melee",
            [3] = _G.Point
            }
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
            elseif _G.M then
                
            end
            if _G.D then
            local args = {
            [1] = "AddPoint",
            [2] = "Defense",
            [3] = _G.Point
            }
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
            elseif _G.D then        
            end
            if _G.S then
            local args = {
            [1] = "AddPoint",
            [2] = "Sword",
            [3] = _G.Point
            }   
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
            elseif _G.S then
            end
            if _G.G then
            local args = {
            [1] = "AddPoint",
            [2] = "Gun",
            [3] = _G.Point
            }
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
            elseif _G.G then 
                
            end
            if _G.BF then
            local args = {
            [1] = "AddPoint",
            [2] = "Demon Fruit",
            [3] = _G.Point
            }
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
            elseif _G.BF then
                
            end
        end
    end)
end)



Page2:Slider("Point",false,1,10,1,function(P)
	_G.Point = P
end)

if OldWorld then 
    Page3:Button("New World", function()
        local args = {
            [1] = "TravelDressrosa" -- NEW WORLD to OLD WORLD
            }
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
    end)
    Page3:Button("Thirld World", function()
        local args = {
            [1] = "TravelZou" -- NEW WORLD to Third WORLD
            }
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
    end)
end

if newworld then
    Page3:Button("Old World", function()
        local args = {
            [1] = "TravelMain" -- OLD WORLD to NEW WORLD
            }
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
    end)

    Page3:Button("Third World", function()
        local args = {
            [1] = "TravelZou" -- NEW WORLD to Third WORLD
            }
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
    end)
end

if thirdworld then 
    Page3:Button("Old World", function()
        local args = {
            [1] = "TravelMain" -- OLD WORLD to NEW WORLD
            }
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
    end)

    Page3:Button("New World", function()
        local args = {
            [1] = "TravelMain" -- OLD WORLD to NEW WORLD
            }
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
    end)
end

TeleportTable = {}

if OldWorld then 
    TeleportTable = {
        "Start Island",
        "Marine Start",
        "Middle Town",
        "Jungle",
        "Pirate Village",
        "Desert",
        "Frozen Village",
        "MarineFord",
        "Colosseum",
        "Sky 1st Floor",
        "Sky 2st Floor",
        "Sky 3st Floor",
        "Prison",
        "Magma Village",
        "UndeyWater City",
        "Fountain City",
        "House Cyborg's",
        "Shank's Room",
        "Mob Island"
    }
end

if newworld then
    TeleportTable = {
        "First Spot",
        "Kingdom of Rose",
        "Dark Ares",
        "Flamingo Mansion",
        "Flamingo Room",
        "Green bit",
        "Cafe",
        "Factroy",
        "Colosseum",
        "Ghost Island",
        "Ghost Island 2nd",
        "Snow Mountain",
        "Hot and Cold",
        "Magma Side",
        "Cursed Ship",
        "Frosted Island",
        "Forgotten Island",
        "Usoapp Island",
        "Minisky Island"
    }
end
if thirdworld then
    TeleportTable = {
        "Port Town",
        "Hydra Island",
        "Castle on the sea",
        "Mansion",
        "Floating Turtle",
        "IceCream",
        "Peanut butter"
    }
end

local TeleportDropDown = Page3:Dropdown("Select Island",TeleportTable,function(A)
    SelectIsland = A
end)

Page3:Toggle("Teleport", false, function(Tping)
    _G.TpNoclip = Tping
    if Tping then
    if OldWorld then 
    if SelectIsland == "Start Island" then
        TP(CFrame.new(1071.2832, 16.3085976, 1426.86792))
        end
        if SelectIsland == "Marine Start" then
            TP(CFrame.new(-2573.3374, 6.88881969, 2046.99817))
        end
        if SelectIsland == "Middle Town" then
            TP(CFrame.new(-655.824158, 7.88708115, 1436.67908))
        end
        if SelectIsland == "Jungle" then
            TP(CFrame.new(-1249.77222, 11.8870859, 341.356476))
        end
        if SelectIsland == "Pirate Village" then
            TP(CFrame.new(-1122.34998, 4.78708982, 3855.91992))
        end
        if SelectIsland == "Desert" then
            TP(CFrame.new(1094.14587, 6.47350502, 4192.88721))
        end
        if SelectIsland == "Frozen Village" then
            TP(CFrame.new(1198.00928, 27.0074959, -1211.73376))
        end
        if SelectIsland == "MarineFord" then
            TP(CFrame.new(-4505.375, 20.687294, 4260.55908))
        end
        if SelectIsland == "Colosseum" then
            TP(CFrame.new(-1428.35474, 7.38933945, -3014.37305))
        end
        if SelectIsland == "Sky 1st Floor" then
            TP(CFrame.new(-4970.21875, 717.707275, -2622.35449))
        end
        if SelectIsland == "Sky 2st Floor" then
            TP(CFrame.new(-4813.0249, 903.708557, -1912.69055))
        end
        if SelectIsland == "Sky 3st Floor" then
            TP(CFrame.new(-7952.31006, 5545.52832, -320.704956))
        end
        if SelectIsland == "Prison" then
            TP(CFrame.new(4854.16455, 5.68742752, 740.194641))
        end
        if SelectIsland == "Magma Village" then
            TP(CFrame.new(-5231.75879, 8.61593437, 8467.87695))
        end
        if SelectIsland == "UndeyWater City" then
            TP(CFrame.new(61163.8516, 11.7796879, 1819.78418))
        end
        if SelectIsland == "Fountain City" then
            TP(CFrame.new(5132.7124, 4.53632832, 4037.8562))
        end
        if SelectIsland == "House Cyborg's" then
            TP(CFrame.new(6262.72559, 71.3003616, 3998.23047))
        end
        if SelectIsland == "Shank's Room" then
            TP(CFrame.new(-1442.16553, 29.8788261, -28.3547478))
        end
        if SelectIsland == "Mob Island" then
            TP(CFrame.new(-2850.20068, 7.39224768, 5354.99268))
        end
elseif newworld then
        if SelectIsland == "First Spot" then
        TP(CFrame.new(82.9490662, 18.0710983, 2834.98779))
        end
        if SelectIsland == "Kingdom of Rose" then
            TP(game.Workspace["_WorldOrigin"].Locations["Kingdom of Rose"].CFrame)
        end
        if SelectIsland == "Dark Ares" then
            TP(game.Workspace["_WorldOrigin"].Locations["Dark Arena"].CFrame)
        end
        if SelectIsland == "Flamingo Mansion" then
            TP(CFrame.new(-390.096313, 331.886475, 673.464966))
        end
        if SelectIsland == "Flamingo Room" then
            TP(CFrame.new(2302.19019, 15.1778421, 663.811035))
        end
        if SelectIsland == "Green bit" then
            TP(CFrame.new(-2372.14697, 72.9919434, -3166.51416))
        end
        if SelectIsland == "Cafe" then
            TP(CFrame.new(-385.250916, 73.0458984, 297.388397))
        end
        if SelectIsland == "Factroy" then
            TP(CFrame.new(430.42569, 210.019623, -432.504791))
        end
        if SelectIsland == "Colosseum" then
            TP(CFrame.new(-1836.58191, 44.5890656, 1360.30652))
        end
        if SelectIsland == "Ghost Island" then
            TP(CFrame.new(-5571.84424, 195.182297, -795.432922))
        end
        if SelectIsland == "Ghost Island 2nd" then
            TP(CFrame.new(-5931.77979, 5.19706631, -1189.6908))
        end
        if SelectIsland == "Snow Mountain" then
            TP(CFrame.new(1384.68298, 453.569031, -4990.09766))
        end
        if SelectIsland == "Hot and Cold" then
            TP(CFrame.new(-6026.96484, 14.7461271, -5071.96338))
        end
        if SelectIsland == "Magma Side" then
            TP(CFrame.new(-5478.39209, 15.9775667, -5246.9126))
        end
        if SelectIsland == "Cursed Ship" then
            TP(CFrame.new(902.059143, 124.752518, 33071.8125))
        end
        if SelectIsland == "Frosted Island" then
            TP(CFrame.new(5400.40381, 28.21698, -6236.99219))
        end
        if SelectIsland == "Forgotten Island" then
            TP(CFrame.new(-3043.31543, 238.881271, -10191.5791))
        end
        if SelectIsland == "Usoapp Island" then
            TP(CFrame.new(4748.78857, 8.35370827, 2849.57959))
        end
        if SelectIsland == "Minisky Island" then
         TP(CFrame.new(-260.358917, 49325.7031, -35259.3008))     
        end
    elseif thirdworld then
        if SelectIsland == "Port Town" then
            TP(CFrame.new(-287, 29.4128036, 5388, 1, 0, 0, 0, 1, 0, 0, 0, 1))
            end
            
            if SelectIsland == "Hydra Island" then
                TP(CFrame.new(3399.32227, 72.3884888, 1572.99963, -0.809679806, -4.48284467e-08, 0.586871922, 2.42332163e-08, 1, 1.09818842e-07, -0.586871922, 1.0313989e-07, -0.809679806))
            end
            
            if SelectIsland == "Castle on the sea" then
                TP(CFrame.new(-5500, 313.768921, -2855, 1, 0, 0, 0, 1, 0, 0, 0, 1))
            end
            
            if SelectIsland == "Mansion" then
                TP(CFrame.new(-12548, 337.168274, -7481, 1, 0, 0, 0, 1, 0, 0, 0, 1))
            end
            
            if SelectIsland == "Floating Turtle" then
                TP(CFrame.new(-10016, 331.762634, -8326, 1, 0, 0, 0, 1, 0, 0, 0, 1))
            end
    
            if SelectIsland == "IceCream" then
                TP(CFrame.new(-880.894531, 118.245354, -11030.7607, -0.867174983, 1.48501234e-09, 0.498003572, 2.70457789e-08, 1, 4.41129586e-08, -0.498003572, 5.1722548e-08, -0.867174983))
            end
    
            if SelectIsland == "Peanut butter" then
                TP(CFrame.new(-880.894531, 118.245354, -11030.7607, -0.867174983, 1.48501234e-09, 0.498003572, 2.70457789e-08, 1, 4.41129586e-08, -0.498003572, 5.1722548e-08, -0.867174983))
            end
            if SelectIsland == "CakeLoaf" then
                TP(CFrame.new(-1890.27271, 13.8249273, -11578.5898, 0.554632127, -2.0467688e-08, 0.832095683, 1.95285601e-08, 1, 1.15810268e-08, -0.832095683, 9.82642145e-09, 0.554632127))
            end
    end
else
    TP(CFrame.new(game.Players.LocalPlayer.Character.HumanoidRootPart.Position))
end
end)

Page6:Line()
Page6:Label("Auto Random")

Page6:Toggle("Random Bone", nil, function(vu)
    _G.BBone = vu
end)
spawn(function()
    while wait(.1) do
        if _G.BBone then
local args = {
    [1] = "Bones",
    [2] = "Buy",
    [3] = 1,
    [4] = 1
}

game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
end
end
end)

Page6:Line()
Page6:Label("Shop")

Page6:Button("Devil Fruit Shop", function()
    local args = {
        [1] = "GetFruits"
    }
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
    game.Players.localPlayer.PlayerGui.Main.FruitShop.Visible = true
end)

Page6:Button("Devil Fruit Inventory", function()
	local args = {
		[1] = "getInventoryFruits"
	}
	
	game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("getInventoryFruits")
	game:GetService("Players").LocalPlayer.PlayerGui.Main.FruitInventory.Visible = true
end)

Page6:Button("Inventory", function()
	game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("getInventoryWeapons")
    game.Players.localPlayer.PlayerGui.Main.Inventory.Visible = true
end)

Page6:Button("Color Haki", function()
    game.Players.localPlayer.PlayerGui.Main.Colors.Visible = true
end)

Page6:Button("Title Name", function()
    local args = {
        [1] = "getTitles"
    }
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
    game.Players.localPlayer.PlayerGui.Main.Titles.Visible = true
end)

Page6:Line()
Page6:Label("Buy")

Page6:Button("Buso haki", function()
    local args = {
    [1] = "BuyHaki",
    [2] = "Buso"
    }
    
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
    
    end)
    
    Page6:Button("Sky jump", function()
    local args = {
    [1] = "BuyHaki",
    [2] = "Geppo"
    }
    
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
    
    end)
    
    Page6:Button("Flash Step", function()
    local args = {
    [1] = "BuyHaki",
    [2] = "Soru"
    }
    
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
    
    end)
    Page6:Button("Ken Haki", function()
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("KenTalk","Buy")
    end)

   Page5:Line()
Page5:Label("Melee")
   
    Page5:Button("Black Leg", function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyBlackLeg")
 end)
 
 Page5:Button("Electro", function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyElectro")
 end)
 
 Page5:Button("FishmanKarate", function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyFishmanKarate")
 end)
 
 Page5:Button("DragonClaw", function()
     game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward","DragonClaw","1")
     game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward","DragonClaw","2")
 end)
 
 Page5:Button("Superhuman", function()
     game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySuperhuman")
 end)
 Page5:Button("DeathStep", function()
     game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyDeathStep")
 end)
 Page5:Button("SharkmanKarate", function()
     game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySharkmanKarate",true)
     game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySharkmanKarate")
 end)
 Page5:Button("ElectricClaw", function()
     game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyElectricClaw",true)
     game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyElectricClaw")
 end)
 
 Page5:Button("DragonTalon", function()
     game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyDragonTalon",true)
     game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyDragonTalon")
 end)

-----------------Raid

local Dropdown1 = Page4:Dropdown("Select Dungeon", {"Flame", "Ice", "Quake", "Light","Dark","String","Rumble","Magma","Human: Buddha","Sand"},function(value)
    _G.Dun = value
end)

Page4:Toggle("Auto Buy Chips", false, function(value)   
    _G.BuyRaids = value
end)


spawn(function()
    while wait(.1) do
    if _G.BuyRaids then
    local args = {
    [1] = "RaidsNpc",
    [2] = "Select",
    [3] = _G.Dun
    }
    
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
    end
    end
    end)

Page4:Toggle("Auto Start Dungeon", nil, function(value) 
    _G.AutoRaids = value
end)

spawn(function()
    while wait() do
    if _G.AutoRaids then
    if newworld then
    if game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 1") then
    ----not
    elseif game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 2") then
    ---not
    elseif game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 3") then
    ---not
    elseif game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 4") then
    ---not
    elseif game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 5") then
    ---not
    elseif  game.Players.LocalPlayer.Backpack:FindFirstChild("Special Microchip") then
    fireclickdetector(game.Workspace.Map.CircleIsland.RaidSummon2.Button.Main.ClickDetector)
    end
    end
    if thirdworld then
    if game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 1") then
    ----not
    elseif game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 2") then
    ---not
    elseif game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 3") then
    ---not
    elseif game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 4") then
    ---not
    elseif game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 5") then
    ---not
    elseif  game.Players.LocalPlayer.Backpack:FindFirstChild("Special Microchip") then
    fireclickdetector(game.Workspace.Map["Boat Castle"].RaidSummon2.Button.Main.ClickDetector)
    end
    end
    end
    end
    end)


Page4:Toggle("kill Aura", false, function(value)
    _G.RaidsArua = value
end)
spawn(function()
    while wait(0.5) do
        if _G.RaidsArua then
            while _G.RaidsArua do wait(1)
                for i,v in pairs(game.Workspace.Enemies:GetDescendants()) do   
                    if _G.RaidsArua and v:FindFirstChild("Humanoid") then
                        v.Humanoid.Health = 0
                        v.Humanoid:ChangeState(11)
                    end 
                end
            end
        end
    end
end)

Page4:Toggle("Auto Next Island", false, function(value)
    _G.NextIsland = value                  
end)

spawn(function()
    while wait(.1) do
        if _G.NextIsland then
            while _G.NextIsland do wait()
                if game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 5") then
                    TP(game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 5").CFrame*CFrame.new(0,70,0))
                elseif game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 4") then
                    TP(game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 4").CFrame*CFrame.new(0,70,0))
                elseif game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 3") then
                    TP(game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 3").CFrame*CFrame.new(0,70,0))
                elseif game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 2") then
                    TP(game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 2").CFrame*CFrame.new(0,70,0))
                elseif game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 1") then
                    TP(game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 1").CFrame*CFrame.new(0,70,0))
                elseif newworld then
                    TP(CFrame.new(-6438.73535, 250.645355, -4501.50684))
                elseif thirdworld then
                    TP(CFrame.new(-5013.99512, 314.818085, -2817.25391, -0.918243527, -1.38205791e-09, -0.396016151, -4.45223378e-08, 1, 9.97441418e-08, 0.396016151, 1.09220977e-07, -0.918243527))
                end
            end
        end
    end
end)

Page4:Toggle("Auto Awakener", false, function(value)
    _G.Awake = value
end)


spawn(function()
    while wait(.1) do
        if _G.Awake then
            while _G.Awake do wait()
local args = {
    [1] = "Awakener",
    [2] = "Check"
}

game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))

local args = {
    [1] = "Awakener",
    [2] = "Awaken"
}

game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
end
end
end
end)

   Page6:Line()
Page6:Label("Game")


Page6:Button("Soru No CoolDown", function()
Sorunocool = true

	for i, v in pairs(getgc()) do
			if type(v) == "function" and getfenv(v).script == game.Players.LocalPlayer.Character:WaitForChild("Soru") then
				for i2,v2 in pairs(debug.getupvalues(v)) do
					if type(v2) == 'table' then
						if v2.LastUse then
							repeat wait()
								setupvalue(v, i2, {LastAfter = 0,LastUse = 0})
							until not Sorunocool
						end
					end
				end
			end
	end
	
end)

Page6:Button("Fastmode", function()
    if not game:IsLoaded() then repeat wait() until game:IsLoaded() end
if hookfunction and setreadonly then
    local mt = getrawmetatable(game)
    local old = mt.__newindex
    setreadonly(mt, false)
    local sda
    sda = hookfunction(old, function(t, k, v)
        if k == "Material" then
            if v ~= Enum.Material.Neon and v ~= Enum.Material.Plastic and v ~= Enum.Material.ForceField then v = Enum.Material.Plastic end
        elseif k == "TopSurface" then v = "Smooth"
        elseif k == "Reflectance" or k == "WaterWaveSize" or k == "WaterWaveSpeed" or k == "WaterReflectance" then v = 0
        elseif k == "WaterTransparency" then v = 1
        elseif k == "GlobalShadows" then v = false end
        return sda(t, k, v)
    end)
    setreadonly(mt, true)
end
local g = game
local w = g.Workspace
local l = g:GetService"Lighting"
local t = w:WaitForChild"Terrain"
t.WaterWaveSize = 0
t.WaterWaveSpeed = 0
t.WaterReflectance = 0
t.WaterTransparency = 1
l.GlobalShadows = false

function change(v)
    pcall(function()
        if v.Material ~= Enum.Material.Neon and v.Material ~= Enum.Material.Plastic and v.Material ~= Enum.Material.ForceField then
            pcall(function() v.Reflectance = 0 end)
            pcall(function() v.Material = Enum.Material.Plastic end)
            pcall(function() v.TopSurface = "Smooth" end)
        end
    end)
end

game.DescendantAdded:Connect(function(v)
    pcall(function()
        if v:IsA"Part" then change(v)
        elseif v:IsA"MeshPart" then change(v)
        elseif v:IsA"TrussPart" then change(v)
        elseif v:IsA"UnionOperation" then change(v)
        elseif v:IsA"CornerWedgePart" then change(v)
        elseif v:IsA"WedgePart" then change(v) end
    end)
end)
for i, v in pairs(game:GetDescendants()) do
    pcall(function()
        if v:IsA"Part" then change(v)
        elseif v:IsA"MeshPart" then change(v)
        elseif v:IsA"TrussPart" then change(v)
        elseif v:IsA"UnionOperation" then change(v)
        elseif v:IsA"CornerWedgePart" then change(v)
        elseif v:IsA"WedgePart" then change(v) end
    end)
end
    end)

    function FindNearestMon(position)
        local lowest = math.huge -- infinity
        local NearestPlayer = nil
        for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
            if v ~= game.Players.LocalPlayer then
                local distance = (v.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
                if distance < lowest then
                    lowest = distance
                    NearestPlayer = v
                end
            end
            end
        return NearestPlayer
    end

Page6:Button("Remove Effect", function()
    game:GetService("ReplicatedStorage").Effect.Container:Destroy()
    game:GetService("ReplicatedStorage").Assets.SlashHit:Destroy()
    game:GetService("ReplicatedStorage").Assets.GUI:Destroy()
    game:GetService("ReplicatedStorage").Util.Sound.Storage.Swing:Destroy()
    end)




Page6:Button("Redeam all code", function()
    local args = {
        [1] = "Sub2OfficialNoobie"
        }
        
        game:GetService("ReplicatedStorage").Remotes.Redeem:InvokeServer(unpack(args))
        wait()
        local args = {
        [1] = "FUDD10"
        }
        
        game:GetService("ReplicatedStorage").Remotes.Redeem:InvokeServer(unpack(args))
        wait()
        local args = {
        [1] = "BIGNEWS"
        }
        
        game:GetService("ReplicatedStorage").Remotes.Redeem:InvokeServer(unpack(args))
        wait()
        local args = {
        [1] = "THEGREATACE"
        }
        
        game:GetService("ReplicatedStorage").Remotes.Redeem:InvokeServer(unpack(args))
        wait()
        local args = {
        [1] = "SUB2NOOBMASTER123"
        }
        
        game:GetService("ReplicatedStorage").Remotes.Redeem:InvokeServer(unpack(args))
        wait()
        local args = {
        [1] = "SUB2GAMERROBOT_EXP1"
        }
        
        game:GetService("ReplicatedStorage").Remotes.Redeem:InvokeServer(unpack(args))
        wait()
        local args = {
        [1] = "Sub2Daigrock"
        }
        
        game:GetService("ReplicatedStorage").Remotes.Redeem:InvokeServer(unpack(args))
        wait()
        local args = {
        [1] = "Axiore"
        }
        
        game:GetService("ReplicatedStorage").Remotes.Redeem:InvokeServer(unpack(args))
        wait()
        local args = {
        [1] = "TantaiGaming"
        }
        
        game:GetService("ReplicatedStorage").Remotes.Redeem:InvokeServer(unpack(args))
        wait()
        local args = {
        [1] = "STRAWHATMAINE"
        }
        
        game:GetService("ReplicatedStorage").Remotes.Redeem:InvokeServer(unpack(args))
        wait()
        local args = {
        [1] = "UPD15"
        }
        
        game:GetService("ReplicatedStorage").Remotes.Redeem:InvokeServer(unpack(args))
        wait()
end)



Checknearest = true

local lp = game:GetService('Players').LocalPlayer
	local mouse = lp:GetMouse()
	spawn(function()
		while wait() do
			if Checknearest then
				pcall(function()
					local MaxDist, Closest = math.huge
					for i,v in pairs(game:GetService("Players"):GetChildren()) do 
						local Head = v.Character:FindFirstChild("HumanoidRootPart")
						local Pos, Vis = game.Workspace.CurrentCamera.WorldToScreenPoint(game.Workspace.CurrentCamera, Head.Position)
						local MousePos, TheirPos = Vector2.new(mouse.X, mouse.Y), Vector2.new(Pos.X, Pos.Y)
						local Dist = (TheirPos - MousePos).Magnitude
						if Dist < MaxDist and Dist <= _G.FOVSize and v.Name ~= game.Players.LocalPlayer.Name then
							MaxDist = Dist
							_G.CharacterAimBot = v
						end
					end
				end)
			end
		end
	end)

spawn(function()
		local gg = getrawmetatable(game)
		local old = gg.__namecall
		setreadonly(gg,false)
		gg.__namecall = newcclosure(function(...)
			local method = getnamecallmethod()
			local args = {...}
			if tostring(method) == "FireServer" then
				if tostring(args[1]) == "RemoteEvent" then
					if tostring(args[2]) ~= "true" and tostring(args[2]) ~= "false" then
						if AimbotSkill then
							args[2] = _G.CharacterAimBot.Character.HumanoidRootPart.Position
							return old(unpack(args))
						end
					end
				end
			end
			return old(...)
		end)
	end)
	spawn(function()
		while wait() do
			for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do  
				if v:IsA("Tool") then
					if v:FindFirstChild("RemoteFunctionShoot") then 
						SelectToolWeaponGun = v.Name
					end
				end
			end
			for i,v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do  
				if v:IsA("Tool") then
					if v:FindFirstChild("RemoteFunctionShoot") then 
						SelectToolWeaponGun = v.Name
					end
				end
			end
		end
	end)
	
	spawn(function()
		mouse.Button1Down:Connect(function()
			if SelectToolWeaponGun ~= nil then
				if AimbotGun and game.Players.LocalPlayer.Character:FindFirstChild(SelectToolWeaponGun) and game:GetService("Players"):FindFirstChild(_G.CharacterAimBot.Name) then
					tool = game:GetService("Players").LocalPlayer.Character[SelectToolWeaponGun]
					v17 = workspace:FindPartOnRayWithIgnoreList(Ray.new(tool.Handle.CFrame.p, (game:GetService("Players"):FindFirstChild(_G.CharacterAimBot.Name).Character.HumanoidRootPart.Position - tool.Handle.CFrame.p).unit * 100), { game.Players.LocalPlayer.Character, workspace._WorldOrigin });
					game:GetService("Players").LocalPlayer.Character[SelectToolWeaponGun].RemoteFunctionShoot:InvokeServer(game:GetService("Players"):FindFirstChild(_G.CharacterAimBot.Name).Character.HumanoidRootPart.Position, (require(game.ReplicatedStorage.Util).Other.hrpFromPart(v17)));
				end 
			end
		end)
	end)

_G.FOVSize = 200

local FOVCircle = Drawing.new("Circle")
	FOVCircle.Thickness = 2
	FOVCircle.NumSides = 460
	FOVCircle.Filled = false
	FOVCircle.Transparency = 0.5
	FOVCircle.Radius = 200
	FOVCircle.Color = Color3.fromRGB(255, 0, 0)
	
	game:GetService("RunService").Stepped:Connect(function()
		FOVCircle.Radius = _G.FOVSize
		FOVCircle.Thickness = 1
		FOVCircle.NumSides = 11
		FOVCircle.Position = game:GetService('UserInputService'):GetMouseLocation()
		if ShowFov then
			FOVCircle.Visible = true
		else
			FOVCircle.Visible = false
		end
	end)

--AimbotTab---




Page7:Slider("FOV",false,1,1000,_G.FOVSize,function(v)
	_G.FOVSize = v
end)

Page7:Toggle("ShowFov", false, function(ve)
    ShowFov = ve
end)

Page7:Toggle("Aimbot Skill", false, function(vee)
    AimbotSkill = vee
end)

Page7:Toggle("Aimbot Gun", false, function(vee)
    AimbotGun = vee
end)

local sound1 = Instance.new("Sound", game.Workspace)
sound1.Name = "Attack - HAWKCRY"
sound1.SoundId = "rbxassetid://7076159096" 
sound1.EmitterSize = 5 -- decrease the emitter size (for earlier volume drop off)
sound1.Looped = true
sound1.Volume = 10

local sound2 = Instance.new("Sound", game.Workspace)
sound2.Name = "YoungDumb"
sound2.SoundId = "rbxassetid://2883972710" 
sound2.EmitterSize = 5 -- decrease the emitter size (for earlier volume drop off)
sound2.Looped = true
sound2.Volume = 10

local sound3 = Instance.new("Sound", game.Workspace)
sound3.Name = "ห้วงแห่งความรัก"
sound3.SoundId = "rbxassetid://6813482232" 
sound3.EmitterSize = 5 -- decrease the emitter size (for earlier volume drop off)
sound3.Looped = true
sound3.Volume = 10

local sound4 = Instance.new("Sound", game.Workspace)
sound4.Name = "KALUM"
sound4.SoundId = "rbxassetid://8517028478" 
sound4.EmitterSize = 5 -- decrease the emitter size (for earlier volume drop off)
sound4.Looped = true
sound4.Volume = 10

local sound5 = Instance.new("Sound", game.Workspace)
sound5.Name = "เกาะสวาทหาดสวรรค์"
sound5.SoundId = "rbxassetid://2201117500" 
sound5.EmitterSize = 5 -- decrease the emitter size (for earlier volume drop off)
sound5.Looped = true
sound5.Volume = 10

local sound6 = Instance.new("Sound", game.Workspace)
sound6.Name = "ชุดโกโกวา"
sound6.SoundId = "rbxassetid://8708705034" 
sound6.EmitterSize = 5 -- decrease the emitter size (for earlier volume drop off)
sound6.Looped = true
sound6.Volume = 10


MusicTable = {
    "Attack - HAWKCRY",
    "ห้วงแห่งความรัก",
    "YoungDumb",
    "ชุดโกโกวา",
    "KALUM"
}

local Music = Page8:Dropdown("Select Music",MusicTable,function(A)
   _G.Music = A
end)

Page8:Toggle("Play Music", nil ,function(a)
    _G.PlayMusic = a
    if _G.PlayMusic then
        if _G.Music == "Attack - HAWKCRY" then
        sound1:Play()
        elseif _G.Music == "YoungDumb" then
            sound2:Play()
        elseif _G.Music == "ห้วงแห่งความรัก" then
            sound3:Play()
        elseif _G.Music == "KALUM" then
            sound4:Play()
        elseif _G.Music == "เกาะสวาทหาดสวรรค์" then
            sound5:Play()
        elseif _G.Music == "ชุดโกโกวา" then
            sound6:Play()
        elseif _G.Music == "" then
            sound7:Play()
        elseif _G.Music == "" then
            sound8:Play()
        elseif _G.Music == "" then
            sound9:Play()
        elseif _G.Music == "" then
            sound10:Play()
        end
    else
        for i,v in pairs(game.workspace:GetChildren()) do
        if v.ClassName == "Sound" then
            v:Stop()
            end
        end
    end
    end)

LunaUI:Notification("Blox Fruits Takab Premium","Takab Hub is Loaded!!! Enjoy",5)