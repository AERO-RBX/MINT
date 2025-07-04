local lib = {tbCt = 0}
local _New_ = Instance.new;

local ui = _New_("ScreenGui", game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui"));
ui.Name = "ui";
ui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling;

local RunService = game:GetService("RunService")
local HttpService = game:GetService("HttpService")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")

local function MakeDraggable(ClickObject, Object)
	local Dragging = nil
	local DragInput = nil
	local DragStart = nil
	local StartPosition = nil

	ClickObject.InputBegan:Connect(function(Input)
		if Input.UserInputType == Enum.UserInputType.MouseButton1 or Input.UserInputType == Enum.UserInputType.Touch then
			Dragging = true
			DragStart = Input.Position
			StartPosition = Object.Position

			Input.Changed:Connect(function()
				if Input.UserInputState == Enum.UserInputState.End then
					Dragging = false
				end
			end)
		end
	end)

	ClickObject.InputChanged:Connect(function(Input)
		if Input.UserInputType == Enum.UserInputType.MouseMovement or Input.UserInputType == Enum.UserInputType.Touch then
			DragInput = Input
		end
	end)

	UserInputService.InputChanged:Connect(function(Input)
		if Input == DragInput and Dragging then
			local Delta = Input.Position - DragStart
			Object.Position = UDim2.new(StartPosition.X.Scale, StartPosition.X.Offset + Delta.X, StartPosition.Y.Scale, StartPosition.Y.Offset + Delta.Y)
		end
	end)
end


function lib:Make(e)
	e = e or {}

	local Main = _New_("Frame", ui);
	Main.AnchorPoint = Vector2.new(0.5, 0.5);
	Main.BackgroundColor3 = Color3.fromRGB(16.000000946223736, 16.000000946223736, 16.000000946223736);
	Main.BackgroundTransparency = 0.15000000596046448;
	Main.BorderColor3 = Color3.fromRGB(0, 0, 0);
	Main.BorderMode = Enum.BorderMode.Middle;
	Main.BorderSizePixel = 0;
	Main.Name = "Main";
	Main.Position = UDim2.new(0.5, 0, 0.5, 0);
	Main.Size = UDim2.new(0, 514, 0, 339);
	MakeDraggable(Main,Main)
	local UICorner = _New_("UICorner", Main);

	local Build = _New_("Frame", Main);
	Build.AutomaticSize = Enum.AutomaticSize.X;
	Build.BackgroundColor3 = Color3.fromRGB(14.000001065433025, 214.00001764297485, 81.00000277161598);
	Build.BackgroundTransparency = 0.8999999761581421;
	Build.BorderColor3 = Color3.fromRGB(0, 0, 0);
	Build.BorderSizePixel = 0;
	Build.Name = "Build";
	Build.Position = UDim2.new(0, 397, 0, 315);
	Build.Size = UDim2.new(0, 50, 0, 19);
	Build.ZIndex = 2;

	local UICorner_0 = _New_("UICorner", Build);
	UICorner_0.CornerRadius = UDim.new(0, 3);

	local ChannelType = _New_("TextLabel", Build);
	ChannelType.AnchorPoint = Vector2.new(0.5, 0.5);
	ChannelType.AutomaticSize = Enum.AutomaticSize.X;
	ChannelType.BackgroundColor3 = Color3.fromRGB(255, 255, 255);
	ChannelType.BackgroundTransparency = 1;
	ChannelType.BorderColor3 = Color3.fromRGB(0, 0, 0);
	ChannelType.BorderSizePixel = 0;
	ChannelType.Name = "ChannelType";
	ChannelType.Position = UDim2.new(0.5, 0, 0.5, 0);
	ChannelType.Size = UDim2.new(1, 0, 1, 0);
	ChannelType.ZIndex = 2;
	ChannelType.Font = Enum.Font.Unknown;
	ChannelType.FontFace = Font.new("rbxassetid://12187365364", Enum.FontWeight.Bold, Enum.FontStyle.Normal);
	ChannelType.Text = "Live";
	ChannelType.TextColor3 = Color3.fromRGB(28.00000213086605, 167.00000524520874, 114.00000840425491);
	ChannelType.TextSize = 10;

	local Divider = _New_("Frame", Main);
	Divider.AnchorPoint = Vector2.new(0.5, 0.5);
	Divider.BackgroundColor3 = Color3.fromRGB(60.00000022351742, 60.00000022351742, 60.00000022351742);
	Divider.BorderColor3 = Color3.fromRGB(0, 0, 0);
	Divider.BorderSizePixel = 0;
	Divider.Name = "Divider";
	Divider.Position = UDim2.new(0.5550000071525574, 0, 0, 32);
	Divider.Size = UDim2.new(0, 460, 0, 1);

	local Divider_0 = _New_("Frame", Main);
	Divider_0.AnchorPoint = Vector2.new(0.5, 0.5);
	Divider_0.BackgroundColor3 = Color3.fromRGB(60.00000022351742, 60.00000022351742, 60.00000022351742);
	Divider_0.BorderColor3 = Color3.fromRGB(0, 0, 0);
	Divider_0.BorderSizePixel = 0;
	Divider_0.Name = "Divider";
	Divider_0.Position = UDim2.new(0.5550000071525574, 0, 0, 310);
	Divider_0.Size = UDim2.new(0, 460, 0, 1);

	local Notify = _New_("Frame", Main);
	Notify.BackgroundColor3 = Color3.fromRGB(0, 0, 0);
	Notify.BackgroundTransparency = 0.20000000298023224;
	Notify.BorderColor3 = Color3.fromRGB(0, 0, 0);
	Notify.BorderSizePixel = 0;
	Notify.Name = "Notify";
	Notify.Size = UDim2.new(1, 0, 1, 0);
	Notify.Visible = false;
	Notify.ZIndex = 99;

	local UIStroke = _New_("UIStroke", Notify);
	UIStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border;
	UIStroke.Color = Color3.fromRGB(60.00000402331352, 60.00000402331352, 60.00000402331352);
	UIStroke.Thickness = 1.25;

	local Template = _New_("Frame", Notify);
	Template.AnchorPoint = Vector2.new(0.5, 0.5);
	Template.BackgroundColor3 = Color3.fromRGB(16.000000946223736, 16.000000946223736, 16.000000946223736);
	Template.BackgroundTransparency = 0.5;
	Template.BorderColor3 = Color3.fromRGB(0, 0, 0);
	Template.BorderSizePixel = 0;
	Template.Name = "Template";
	Template.Position = UDim2.new(0.5, 0, 0.5, 0);
	Template.Size = UDim2.new(0, 288, 0, 166);

	local Actions = _New_("ScrollingFrame", Template);
	Actions.Active = true;
	Actions.BackgroundColor3 = Color3.fromRGB(255, 255, 255);
	Actions.BackgroundTransparency = 1;
	Actions.BorderColor3 = Color3.fromRGB(27.000002190470695, 42.000001296401024, 53.000004440546036);
	Actions.BorderSizePixel = 0;
	Actions.Name = "Actions";
	Actions.Position = UDim2.new(0.029694663360714912, 0, 0.7637817859649658, 0);
	Actions.Size = UDim2.new(0, 268, 0, 22);
	Actions.ZIndex = 105;
	Actions.AutomaticCanvasSize = Enum.AutomaticSize.X;
	Actions.CanvasSize = UDim2.new(0, 0, 0, 0);
	Actions.ScrollBarImageColor3 = Color3.fromRGB(0, 0, 0);
	Actions.ScrollBarImageTransparency = 1;
	Actions.ScrollBarThickness = 0;
	Actions.ScrollingDirection = Enum.ScrollingDirection.X;

	local ButtonTemplate = _New_("TextButton", Actions);
	ButtonTemplate.AutoButtonColor = false;
	ButtonTemplate.BackgroundColor3 = Color3.fromRGB(230.00000149011612, 230.00000149011612, 230.00000149011612);
	ButtonTemplate.BackgroundTransparency = 0.20000000298023224;
	ButtonTemplate.BorderColor3 = Color3.fromRGB(8.000000473111868, 12.000001184642315, 15.00000100582838);
	ButtonTemplate.BorderSizePixel = 0;
	ButtonTemplate.Name = "ButtonTemplate";
	ButtonTemplate.Position = UDim2.new(0, 0, -0.1428571492433548, 0);
	ButtonTemplate.Size = UDim2.new(0, 80, 1, 0);
	ButtonTemplate.ZIndex = 106;
	ButtonTemplate.Font = Enum.Font.Unknown;
	ButtonTemplate.FontFace = Font.new("rbxassetid://12187365364", Enum.FontWeight.Medium, Enum.FontStyle.Normal);
	ButtonTemplate.RichText = true;
	ButtonTemplate.Text = "Contact";
	ButtonTemplate.TextColor3 = Color3.fromRGB(0, 0, 0);
	ButtonTemplate.TextSize = 14;
	ButtonTemplate.TextWrapped = true;

	local UICorner_1 = _New_("UICorner", ButtonTemplate);
	UICorner_1.CornerRadius = UDim.new(0, 6);

	local UIListLayout = _New_("UIListLayout", Actions);
	UIListLayout.Padding = UDim.new(0, 5);
	UIListLayout.FillDirection = Enum.FillDirection.Horizontal;
	UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center;
	UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder;

	local Title = _New_("TextLabel", Template);
	Title.AnchorPoint = Vector2.new(0.5, 0.5);
	Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255);
	Title.BackgroundTransparency = 1;
	Title.BorderColor3 = Color3.fromRGB(27.000002190470695, 42.000001296401024, 53.000004440546036);
	Title.BorderSizePixel = 0;
	Title.Name = "Title";
	Title.Position = UDim2.new(0, 144, 0, 27);
	Title.Size = UDim2.new(0, 238, 0, 15);
	Title.ZIndex = 105;
	Title.Font = Enum.Font.Unknown;
	Title.FontFace = Font.new("rbxassetid://12187365364", Enum.FontWeight.Medium, Enum.FontStyle.Normal);
	Title.RichText = true;
	Title.Text = "This Feature Is W.I.P";
	Title.TextColor3 = Color3.fromRGB(240.00000089406967, 240.00000089406967, 240.00000089406967);
	Title.TextScaled = true;
	Title.TextSize = 14;
	Title.TextWrapped = true;

	local UICorner_2 = _New_("UICorner", Template);

	local UIStroke_0 = _New_("UIStroke", Template);
	UIStroke_0.ApplyStrokeMode = Enum.ApplyStrokeMode.Border;
	UIStroke_0.Color = Color3.fromRGB(60.00000402331352, 60.00000402331352, 60.00000402331352);
	UIStroke_0.Thickness = 1.25;

	local Description = _New_("TextLabel", Template);
	Description.AnchorPoint = Vector2.new(0.5, 0.5);
	Description.BackgroundColor3 = Color3.fromRGB(255, 255, 255);
	Description.BackgroundTransparency = 1;
	Description.BorderColor3 = Color3.fromRGB(27.000002190470695, 42.000001296401024, 53.000004440546036);
	Description.BorderSizePixel = 0;
	Description.Name = "Description";
	Description.Position = UDim2.new(0, 144, 0, 78);
	Description.Size = UDim2.new(0, 244, 0, 70);
	Description.ZIndex = 105;
	Description.Font = Enum.Font.Unknown;
	Description.FontFace = Font.new("rbxassetid://12187365364", Enum.FontWeight.Medium, Enum.FontStyle.Normal);
	Description.RichText = true;
	Description.Text = "This feature is still in progress do you wish to continue";
	Description.TextColor3 = Color3.fromRGB(240.00000089406967, 240.00000089406967, 240.00000089406967);
	Description.TextSize = 14;
	Description.TextTransparency = 0.20000000298023224;
	Description.TextWrapped = true;
	Description.TextYAlignment = Enum.TextYAlignment.Top;

	local Duration = _New_("TextLabel", Template);
	Duration.AnchorPoint = Vector2.new(0.5, 0.5);
	Duration.BackgroundColor3 = Color3.fromRGB(255, 255, 255);
	Duration.BackgroundTransparency = 1;
	Duration.BorderColor3 = Color3.fromRGB(27.000002190470695, 42.000001296401024, 53.000004440546036);
	Duration.BorderSizePixel = 0;
	Duration.Name = "Duration";
	Duration.Position = UDim2.new(0, 270, 0, 17);
	Duration.Size = UDim2.new(0, 21, 0, 15);
	Duration.ZIndex = 105;
	Duration.Font = Enum.Font.Unknown;
	Duration.FontFace = Font.new("rbxassetid://12187365364", Enum.FontWeight.Medium, Enum.FontStyle.Normal);
	Duration.RichText = true;
	Duration.Text = "5";
	Duration.TextColor3 = Color3.fromRGB(240.00000089406967, 240.00000089406967, 240.00000089406967);
	Duration.TextSize = 14;
	Duration.TextWrapped = true;

	local UICorner_3 = _New_("UICorner", Notify);

	local TabContainer = _New_("Frame", Main);
	TabContainer.BackgroundColor3 = Color3.fromRGB(255, 255, 255);
	TabContainer.BackgroundTransparency = 1;
	TabContainer.BorderColor3 = Color3.fromRGB(0, 0, 0);
	TabContainer.BorderSizePixel = 0;
	TabContainer.Name = "TabContainer";
	TabContainer.Position = UDim2.new(0.12062256783246994, 0, 0.10064598172903061, 0);
	TabContainer.Size = UDim2.new(0.8743773102760315, 0, 0.8166077136993408, 0);
	TabContainer.ClipsDescendants = true;

	local UISizeConstraint = _New_("UISizeConstraint", TabContainer);
	UISizeConstraint.MaxSize = Vector2.new(800, 600);
	UISizeConstraint.MinSize = Vector2.new(200, 150);



	local Version = _New_("Frame", Main);
	Version.AutomaticSize = Enum.AutomaticSize.X;
	Version.BackgroundColor3 = Color3.fromRGB(107.00000882148743, 107.00000882148743, 107.00000882148743);
	Version.BackgroundTransparency = 0.8999999761581421;
	Version.BorderColor3 = Color3.fromRGB(0, 0, 0);
	Version.BorderSizePixel = 0;
	Version.Name = "Version";
	Version.Position = UDim2.new(0, 456, 0, 315);
	Version.Size = UDim2.new(0, 49, 0, 19);
	Version.ZIndex = 2;

	local UICorner_4 = _New_("UICorner", Version);
	UICorner_4.CornerRadius = UDim.new(0, 3);

	local ChannelType_0 = _New_("TextLabel", Version);
	ChannelType_0.AnchorPoint = Vector2.new(0.5, 0.5);
	ChannelType_0.AutomaticSize = Enum.AutomaticSize.X;
	ChannelType_0.BackgroundColor3 = Color3.fromRGB(0, 123.00000786781311, 255);
	ChannelType_0.BackgroundTransparency = 1;
	ChannelType_0.BorderColor3 = Color3.fromRGB(0, 0, 0);
	ChannelType_0.BorderSizePixel = 0;
	ChannelType_0.Name = "ChannelType";
	ChannelType_0.Position = UDim2.new(0.5, 0, 0.5, 0);
	ChannelType_0.Size = UDim2.new(1, 0, 1, 0);
	ChannelType_0.ZIndex = 2;
	ChannelType_0.Font = Enum.Font.Unknown;
	ChannelType_0.FontFace = Font.new("rbxassetid://12187365364", Enum.FontWeight.Bold, Enum.FontStyle.Normal);
	ChannelType_0.Text = e.Ver or "1.0.6";
	ChannelType_0.TextColor3 = Color3.fromRGB(130.0000074505806, 130.0000074505806, 130.0000074505806);
	ChannelType_0.TextSize = 10;

	local AtBottomTitle = _New_("TextLabel", Main);
	AtBottomTitle.BackgroundColor3 = Color3.fromRGB(70.00000342726707, 70.00000342726707, 70.00000342726707);
	AtBottomTitle.BackgroundTransparency = 1;
	AtBottomTitle.BorderColor3 = Color3.fromRGB(0, 0, 0);
	AtBottomTitle.BorderSizePixel = 0;
	AtBottomTitle.Name = "AtBottomTitle";
	AtBottomTitle.Position = UDim2.new(0.1300000101327896, 0, -0.009741499088704586, 310);
	AtBottomTitle.Size = UDim2.new(0, 437, 0, 34);
	AtBottomTitle.Font = Enum.Font.Unknown;
	AtBottomTitle.FontFace = Font.new("rbxassetid://12187365364", Enum.FontWeight.Medium, Enum.FontStyle.Normal);
	AtBottomTitle.RichText = true;
	AtBottomTitle.Text = e.Game or "Game Name";
	AtBottomTitle.TextColor3 = Color3.fromRGB(95.00000193715096, 95.00000193715096, 95.00000193715096);
	AtBottomTitle.TextSize = 14;
	AtBottomTitle.TextXAlignment = Enum.TextXAlignment.Left;

	local Title_0 = _New_("TextLabel", Main);
	Title_0.BackgroundColor3 = Color3.fromRGB(70.00000342726707, 70.00000342726707, 70.00000342726707);
	Title_0.BackgroundTransparency = 1;
	Title_0.BorderColor3 = Color3.fromRGB(0, 0, 0);
	Title_0.BorderSizePixel = 0;
	Title_0.Name = "Title";
	Title_0.Position = UDim2.new(0, 66, 0, 0);
	Title_0.Size = UDim2.new(0, 437, 0, 31);
	Title_0.Font = Enum.Font.Unknown;
	Title_0.FontFace = Font.new("rbxassetid://12187365364", Enum.FontWeight.Bold, Enum.FontStyle.Normal);
	Title_0.RichText = true;
	Title_0.Text = "MINT";
	Title_0.TextColor3 = Color3.fromRGB(255, 255, 255);
	Title_0.TextSize = 14;
	Title_0.TextXAlignment = Enum.TextXAlignment.Left;

	local UIStroke_1 = _New_("UIStroke", Main);
	UIStroke_1.Color = Color3.fromRGB(60.00000402331352, 60.00000402331352, 60.00000402331352);
	UIStroke_1.Thickness = 1.25;

	local Sidebar = _New_("Frame", Main);
	Sidebar.BackgroundColor3 = Color3.fromRGB(22.000000588595867, 22.000000588595867, 22.000000588595867);
	Sidebar.BackgroundTransparency = 0.8999999761581421;
	Sidebar.BorderColor3 = Color3.fromRGB(0, 0, 0);
	Sidebar.BorderSizePixel = 0;
	Sidebar.Name = "Sidebar";
	Sidebar.Position = UDim2.new(-1.187454401474497e-07, 0, 0, 0);
	Sidebar.Size = UDim2.new(0, 55, 1, 0);
	Sidebar.ClipsDescendants = true;




	local Icon = _New_("ImageLabel", Sidebar);
	Icon.BackgroundColor3 = Color3.fromRGB(255, 255, 255);
	Icon.BackgroundTransparency = 1;
	Icon.BorderColor3 = Color3.fromRGB(0, 0, 0);
	Icon.BorderSizePixel = 0;
	Icon.Name = "Icon";
	Icon.Position = UDim2.new(0, 4, 0, 4);
	Icon.Rotation = 35;
	Icon.Size = UDim2.new(0, 46, 0, 45);
	Icon.Image = "rbxassetid://83980496960536";

	local Divider_1 = _New_("Frame", Sidebar);
	Divider_1.BackgroundColor3 = Color3.fromRGB(60.00000022351742, 60.00000022351742, 60.00000022351742);
	Divider_1.BorderColor3 = Color3.fromRGB(0, 0, 0);
	Divider_1.BorderSizePixel = 0;
	Divider_1.Name = "Divider";
	Divider_1.Position = UDim2.new(0, 0, 0.16500000655651093, 0);
	Divider_1.Size = UDim2.new(0, 58, 0, 1);

	local Buttons = _New_("ScrollingFrame", Sidebar);
	Buttons.BackgroundColor3 = Color3.fromRGB(255, 255, 255);
	Buttons.BackgroundTransparency = 1;
	Buttons.BorderColor3 = Color3.fromRGB(0, 0, 0);
	Buttons.BorderSizePixel = 0;
	Buttons.Name = "Buttons";
	Buttons.Position = UDim2.new(0.0000010899135531872162, 0, 0.1828908622264862, 0);
	Buttons.Selectable = false;
	Buttons.Size = UDim2.new(1, 0, 0, 216);
	Buttons.AutomaticCanvasSize = Enum.AutomaticSize.Y;
	Buttons.CanvasSize = UDim2.new(0, 0, 0, 0);
	Buttons.ScrollBarThickness = 0;

	local UIPadding = _New_("UIPadding", Buttons);
	UIPadding.PaddingLeft = UDim.new(0, 12);

	local UIListLayout_0 = _New_("UIListLayout", Buttons);
	UIListLayout_0.Padding = UDim.new(0, 15);
	UIListLayout_0.SortOrder = Enum.SortOrder.LayoutOrder;

	local UIStroke_2 = _New_("UIStroke", Sidebar);
	UIStroke_2.Color = Color3.fromRGB(60.00000402331352, 60.00000402331352, 60.00000402331352);
	UIStroke_2.Thickness = 1.25;
	
	local t = {}
	function t:Tab(e)
		e = e or {}
		
		local icons = {
			["aim"] = "rbxassetid://72783199740836",
			["auto"] = "rbxassetid://127951680865394",
			["esp"] = "rbxassetid://125163371999984",
			["player"] = "rbxassetid://115000590422103",
			["colors"] = "rbxassetid://96594597742013",
			["plrSet"] = "rbxassetid://11432831839",
		}

		local function IconFromName(name)
			return icons[name] or "rbxassetid://default_icon" -- Returns default if not found
		end
		
		local TabBtn = _New_("TextButton",Buttons);
		TabBtn.Active = false;
		TabBtn.BackgroundColor3 = Color3.fromRGB(22.000000588595867, 22.000000588595867, 22.000000588595867);
		TabBtn.BorderColor3 = Color3.fromRGB(0, 0, 0);
		TabBtn.BorderSizePixel = 0;
		TabBtn.Name = "TabBtn";
		TabBtn.Position = UDim2.new(0.2857142984867096, 0, 0.4159291982650757, 0);
		TabBtn.Selectable = false;
		TabBtn.Size = UDim2.new(0, 30, 0, 30);
		TabBtn.Font = Enum.Font.Unknown;
		TabBtn.FontFace = Font.new("rbxassetid://12187365364", Enum.FontWeight.Medium, Enum.FontStyle.Normal);
		TabBtn.RichText = true;
		TabBtn.TextTransparency = 1;

		local img = _New_("ImageLabel", TabBtn);
		img.AnchorPoint = Vector2.new(0.5, 0.5);
		img.BackgroundColor3 = Color3.fromRGB(255, 255, 255);
		img.BackgroundTransparency = 1;
		img.BorderColor3 = Color3.fromRGB(0, 0, 0);
		img.BorderSizePixel = 0;
		img.Name = "img";
		img.Position = UDim2.new(0.5, 0, 0.5, 0);
		img.Size = UDim2.new(0, 23, 0, 23);
		img.Image = IconFromName(e.Icon) or e.Custom or "rbxassetid://11432831839";

		local UICorner = _New_("UICorner", TabBtn);
		UICorner.CornerRadius = UDim.new(0, 5);
		

		local Tab = _New_("ScrollingFrame", TabContainer);
		Tab.Active = true;
		Tab.AnchorPoint = Vector2.new(0.5, 0.5);
		Tab.BackgroundColor3 = Color3.fromRGB(255, 255, 255);
		Tab.BackgroundTransparency = 1;
		Tab.BorderColor3 = Color3.fromRGB(27.000002190470695, 42.000001296401024, 53.000004440546036);
		Tab.BorderSizePixel = 0;
		Tab.Name = "Tab";
		Tab.Position = UDim2.new(0.5, 0, 0.519852340221405, 0);
		Tab.Size = UDim2.new(1, 0, 1, 0);
		Tab.Visible = false;
		Tab.AutomaticCanvasSize = Enum.AutomaticSize.Y;
		Tab.CanvasSize = UDim2.new(0, 0, 0, 0);
		Tab.ScrollBarImageColor3 = Color3.fromRGB(148.000006377697, 148.000006377697, 148.000006377697);
		Tab.ScrollBarImageTransparency = 0.25;
		Tab.ScrollBarThickness = 1;

		local UIListLayout = _New_("UIListLayout", Tab);
		UIListLayout.Padding = UDim.new(0, 6);
		UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center;
		UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder;

		local UIPadding = _New_("UIPadding", Tab);
		UIPadding.PaddingBottom = UDim.new(0, 8);
		UIPadding.PaddingLeft = UDim.new(0, 5);
		UIPadding.PaddingRight = UDim.new(0, 5);
		UIPadding.PaddingTop = UDim.new(0, 8);
		
		lib.tbCt = lib.tbCt +1

		if lib.tbCt == 1 then
			Tab.Visible = true	
		end

		TabBtn.MouseButton1Click:Connect(function()
			for i,v in next, TabContainer:GetChildren() do
				if v.Name == "Tab" then
					v.Visible = false
				end

			end 
			Tab.Visible = true
		end)
		
	
	
	local f = {}
	
	function f:Label(e)
		e = e or {}
		

		local Label = _New_("Frame", Tab);
		Label.BackgroundColor3 = Color3.fromRGB(22.000000588595867, 22.000000588595867, 22.000000588595867);
		Label.BackgroundTransparency = 0.5;
		Label.BorderColor3 = Color3.fromRGB(27.000002190470695, 42.000001296401024, 53.000004440546036);
		Label.BorderSizePixel = 0;
		Label.Name = "Label";
		Label.Size = UDim2.new(1, 0, 0, 35);

		local UICorner = _New_("UICorner", Label);
		UICorner.CornerRadius = UDim.new(0, 4);

		local UIStroke = _New_("UIStroke", Label);
		UIStroke.Color = Color3.fromRGB(40.00000141561031, 40.00000141561031, 40.00000141561031);

		local Title = _New_("TextLabel", Label);
		Title.AnchorPoint = Vector2.new(0.5, 0.5);
		Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255);
		Title.BackgroundTransparency = 1;
		Title.BorderColor3 = Color3.fromRGB(27.000002190470695, 42.000001296401024, 53.000004440546036);
		Title.BorderSizePixel = 0;
		Title.Name = "Title";
		Title.Position = UDim2.new(0.5249999761581421, 0, 0.5, 0);
		Title.Size = UDim2.new(0.8755000233650208, 0, 1.0499999523162842, 0);
		Title.Font = Enum.Font.Unknown;
		Title.FontFace = Font.new("rbxassetid://12187365364", Enum.FontWeight.Medium, Enum.FontStyle.Normal);
		Title.RichText = true;
		Title.Text = e.Text or "This is yes";
		Title.TextColor3 = Color3.fromRGB(240.00000089406967, 240.00000089406967, 240.00000089406967);
		Title.TextScaled = true;
		Title.TextSize = 14;
		Title.TextWrapped = true;
		Title.TextXAlignment = Enum.TextXAlignment.Left;

		local UITextSizeConstraint = _New_("UITextSizeConstraint", Title);
		UITextSizeConstraint.MaxTextSize = 14;

		local ElementIndicator = _New_("ImageLabel", Label);
		ElementIndicator.AnchorPoint = Vector2.new(1, 0.5);
		ElementIndicator.BackgroundColor3 = Color3.fromRGB(255, 255, 255);
		ElementIndicator.BackgroundTransparency = 1;
		ElementIndicator.BorderColor3 = Color3.fromRGB(27.000002190470695, 42.000001296401024, 53.000004440546036);
		ElementIndicator.BorderSizePixel = 0;
		ElementIndicator.Name = "ElementIndicator";
		ElementIndicator.Position = UDim2.new(0.06700000166893005, 0, 0.5, 0);
		ElementIndicator.Size = UDim2.new(0, 20, 0, 20);
		ElementIndicator.Image = "rbxassetid://12974281519";
		ElementIndicator.ImageTransparency = 0.6000000238418579;
		ElementIndicator.ScaleType = Enum.ScaleType.Fit;
			
	end
		
	function f:Button(e)
			e = e or {}
			
			
			e.Callback = e.Callback or function()end
			local Button = _New_("Frame", Tab);
			Button.BackgroundColor3 = Color3.fromRGB(22.000000588595867, 22.000000588595867, 22.000000588595867);
			Button.BackgroundTransparency = 0.5;
			Button.BorderColor3 = Color3.fromRGB(27.000002190470695, 42.000001296401024, 53.000004440546036);
			Button.BorderSizePixel = 0;
			Button.Name = "Button";
			Button.Position = UDim2.new(0.015601642429828644, 0, 0.644859790802002, 0);
			Button.Size = UDim2.new(1, 0, 0, 35);

			local UICorner = _New_("UICorner", Button);
			UICorner.CornerRadius = UDim.new(0, 4);

			local UIStroke = _New_("UIStroke", Button);
			UIStroke.Color = Color3.fromRGB(50.000000819563866, 50.000000819563866, 50.000000819563866);

			local Icon = _New_("ImageLabel", Button);
			Icon.AnchorPoint = Vector2.new(1, 0.5);
			Icon.BackgroundColor3 = Color3.fromRGB(255, 255, 255);
			Icon.BackgroundTransparency = 1;
			Icon.BorderColor3 = Color3.fromRGB(27.000002190470695, 42.000001296401024, 53.000004440546036);
			Icon.BorderSizePixel = 0;
			Icon.Name = "Icon";
			Icon.Position = UDim2.new(0.9791181087493896, 0, 0.5, 0);
			Icon.Size = UDim2.new(0.05336426943540573, 0, 0.6571428775787354, 0);
			Icon.Image = "rbxassetid://11432848110";
			Icon.ImageTransparency = 0.6000000238418579;
			Icon.ScaleType = Enum.ScaleType.Fit;

			local Interact = _New_("TextButton", Button);
			Interact.AnchorPoint = Vector2.new(0.5, 0.5);
			Interact.BackgroundColor3 = Color3.fromRGB(255, 255, 255);
			Interact.BackgroundTransparency = 1;
			Interact.BorderColor3 = Color3.fromRGB(27.000002190470695, 42.000001296401024, 53.000004440546036);
			Interact.BorderSizePixel = 0;
			Interact.Name = "Interact";
			Interact.Position = UDim2.new(0.5, 0, 0.5, 0);
			Interact.Size = UDim2.new(1, 0, 1, 0);
			Interact.ZIndex = 5;
			Interact.Font = Enum.Font.Unknown;
			Interact.FontFace = Font.new("rbxassetid://12187365364", Enum.FontWeight.Medium, Enum.FontStyle.Normal);
			Interact.RichText = true;
			Interact.Text = "";
			Interact.TextColor3 = Color3.fromRGB(0, 0, 0);
			Interact.TextScaled = true;
			Interact.TextSize = 14;
			Interact.TextTransparency = 1;
			Interact.TextWrapped = true;

			local UITextSizeConstraint = _New_("UITextSizeConstraint", Interact);
			UITextSizeConstraint.MaxTextSize = 14;

			local Title = _New_("TextLabel", Button);
			Title.AnchorPoint = Vector2.new(0.5, 0.5);
			Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255);
			Title.BackgroundTransparency = 1;
			Title.BorderColor3 = Color3.fromRGB(27.000002190470695, 42.000001296401024, 53.000004440546036);
			Title.BorderSizePixel = 0;
			Title.Name = "Title";
			Title.Position = UDim2.new(0.4014981687068939, 0, 0.5, 0);
			Title.Size = UDim2.new(0.7308584451675415, 0, 0.4000000059604645, 0);
			Title.Font = Enum.Font.Unknown;
			Title.FontFace = Font.new("rbxassetid://12187365364", Enum.FontWeight.Medium, Enum.FontStyle.Normal);
			Title.RichText = true;
			Title.Text = e.Title or "Button";
			Title.TextColor3 = Color3.fromRGB(240.00000089406967, 240.00000089406967, 240.00000089406967);
			Title.TextScaled = true;
			Title.TextSize = 14;
			Title.TextWrapped = true;
			Title.TextXAlignment = Enum.TextXAlignment.Left;

			local UITextSizeConstraint_0 = _New_("UITextSizeConstraint", Title);
			UITextSizeConstraint_0.MaxTextSize = 14;
			
			Interact.MouseEnter:Connect(function()
				TweenService:Create(Title, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = Color3.fromRGB(26, 100, 65)}):Play()
			end)
			Interact.MouseLeave:Connect(function()
				TweenService:Create(Title, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = Color3.fromRGB(240, 240, 240)}):Play()
			end)
			
			Interact.MouseButton1Down:Connect(function()
				e.Callback()
			end)
			
	end
		
	function f:Divider()
		local Divider = _New_("Frame", Tab);
		Divider.BackgroundColor3 = Color3.fromRGB(60.00000022351742, 60.00000022351742, 60.00000022351742);
		Divider.BorderColor3 = Color3.fromRGB(0, 0, 0);
		Divider.BorderSizePixel = 0;
		Divider.Name = "Divider";
		Divider.Position = UDim2.new(0.1607142835855484, 0, 0.1622418910264969, 0);
		Divider.Size = UDim2.new(1, 0, 0.006000000052154064, 0);
	end
		
		function f:Input(e)
			e = e or {}
e.Callback = e.Callback or function()end
			local Input = _New_("Frame", Tab);
			Input.BackgroundColor3 = Color3.fromRGB(22.000000588595867, 22.000000588595867, 22.000000588595867);
			Input.BackgroundTransparency = 0.5;
			Input.BorderColor3 = Color3.fromRGB(27.000002190470695, 42.000001296401024, 53.000004440546036);
			Input.BorderSizePixel = 0;
			Input.Name = "Input";
			Input.Position = UDim2.new(0.010526316240429878, 0, 0.669211208820343, 0);
			Input.Size = UDim2.new(1, 0, 0, 40);

			local UIStroke = _New_("UIStroke", Input);
			UIStroke.Color = Color3.fromRGB(50.00000461935997, 50.00000461935997, 50.00000461935997);

			local UICorner = _New_("UICorner", Input);
			UICorner.CornerRadius = UDim.new(0, 4);

			local InputFrame = _New_("Frame", Input);
			InputFrame.AnchorPoint = Vector2.new(1, 0.5);
			InputFrame.BackgroundColor3 = Color3.fromRGB(30.00000011175871, 30.00000011175871, 30.00000011175871);
			InputFrame.BackgroundTransparency = 1;
			InputFrame.BorderColor3 = Color3.fromRGB(27.000002190470695, 42.000001296401024, 53.000004440546036);
			InputFrame.BorderSizePixel = 0;
			InputFrame.Name = "InputFrame";
			InputFrame.Position = UDim2.new(0.9744778275489807, 0, 0.5, 0);
			InputFrame.Size = UDim2.new(0.21577726304531097, 0, 0.6499999761581421, 0);

			local UICorner_0 = _New_("UICorner", InputFrame);
			UICorner_0.CornerRadius = UDim.new(0, 5);

			local UIStroke_0 = _New_("UIStroke", InputFrame);
			UIStroke_0.Color = Color3.fromRGB(65.0000037252903, 65.0000037252903, 65.0000037252903);

			local InputBox = _New_("TextBox", InputFrame);
			InputBox.AnchorPoint = Vector2.new(0.5, 0.5);
			InputBox.BackgroundColor3 = Color3.fromRGB(255, 255, 255);
			InputBox.BackgroundTransparency = 1;
			InputBox.BorderColor3 = Color3.fromRGB(27.000002190470695, 42.000001296401024, 53.000004440546036);
			InputBox.BorderSizePixel = 0;
			InputBox.ClearTextOnFocus = false;
			InputBox.Name = "InputBox";
			InputBox.Position = UDim2.new(0.5, 0, 0.5, 0);
			InputBox.Size = UDim2.new(0.8387096524238586, 0, 0.5384615659713745, 0);
			InputBox.Font = Enum.Font.Unknown;
			InputBox.FontFace = Font.new("rbxassetid://12187365364", Enum.FontWeight.Medium, Enum.FontStyle.Normal);
			InputBox.PlaceholderColor3 = Color3.fromRGB(178.00000458955765, 178.00000458955765, 178.00000458955765);
			InputBox.PlaceholderText = "Input";
			InputBox.RichText = true;
			InputBox.Text = "";
			InputBox.TextColor3 = Color3.fromRGB(240.00000089406967, 240.00000089406967, 240.00000089406967);
			InputBox.TextScaled = true;
			InputBox.TextSize = 14;
			InputBox.TextWrapped = true;

			local UITextSizeConstraint = _New_("UITextSizeConstraint", InputBox);
			UITextSizeConstraint.MaxTextSize = 14;

			local Title = _New_("TextLabel", Input);
			Title.AnchorPoint = Vector2.new(0.5, 0.5);
			Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255);
			Title.BackgroundTransparency = 1;
			Title.BorderColor3 = Color3.fromRGB(27.000002190470695, 42.000001296401024, 53.000004440546036);
			Title.BorderSizePixel = 0;
			Title.Name = "Title";
			Title.Position = UDim2.new(0.4014981687068939, 0, 0.5, 0);
			Title.Size = UDim2.new(0.7308584451675415, 0, 0.3499999940395355, 0);
			Title.Font = Enum.Font.Unknown;
			Title.FontFace = Font.new("rbxassetid://12187365364", Enum.FontWeight.Medium, Enum.FontStyle.Normal);
			Title.RichText = true;
			Title.Text = e.Title or "Input (Text, Number, Idk)";
			Title.TextColor3 = Color3.fromRGB(240.00000089406967, 240.00000089406967, 240.00000089406967);
			Title.TextScaled = true;
			Title.TextSize = 14;
			Title.TextWrapped = true;
			Title.TextXAlignment = Enum.TextXAlignment.Left;

			local UITextSizeConstraint_0 = _New_("UITextSizeConstraint", Title);
			UITextSizeConstraint_0.MaxTextSize = 14;
			
			InputBox.FocusLost:Connect(function()
				e.Callback(InputBox.Text)
			end)
			
		end
		
		function f:SectionName(e)
			e = e or {}

			local SectionTitle = _New_("Frame", Tab);
			SectionTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255);
			SectionTitle.BackgroundTransparency = 1;
			SectionTitle.BorderColor3 = Color3.fromRGB(27.000002190470695, 42.000001296401024, 53.000004440546036);
			SectionTitle.BorderSizePixel = 0;
			SectionTitle.Name = "SectionTitle";
			SectionTitle.Size = UDim2.new(1, 0, 0, 20);

			local UIListLayout = _New_("UIListLayout", SectionTitle);
			UIListLayout.Padding = UDim.new(0, 6);
			UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center;
			UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder;
			UIListLayout.VerticalAlignment = Enum.VerticalAlignment.Center;

			local UIPadding = _New_("UIPadding", SectionTitle);
			UIPadding.PaddingBottom = UDim.new(0, 5);

			local Title = _New_("TextLabel", SectionTitle);
			Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255);
			Title.BackgroundTransparency = 1;
			Title.BorderColor3 = Color3.fromRGB(27.000002190470695, 42.000001296401024, 53.000004440546036);
			Title.BorderSizePixel = 0;
			Title.Name = "Title";
			Title.Position = UDim2.new(0, 5, 0, 0);
			Title.Size = UDim2.new(1, 0, 0, 14);
			Title.Font = Enum.Font.Unknown;
			Title.FontFace = Font.new("rbxassetid://12187365364", Enum.FontWeight.Bold, Enum.FontStyle.Normal);
			Title.RichText = true;
			Title.Text = e.Title or "Elements";
			Title.TextColor3 = Color3.fromRGB(109.00000870227814, 109.00000870227814, 109.00000870227814);
			Title.TextScaled = true;
			Title.TextSize = 14;
			Title.TextWrapped = true;
			Title.TextXAlignment = Enum.TextXAlignment.Left;

			local TextButton = _New_("TextButton", Title);
			TextButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255);
			TextButton.BackgroundTransparency = 1;
			TextButton.BorderColor3 = Color3.fromRGB(0, 0, 0);
			TextButton.BorderSizePixel = 0;
			TextButton.Size = UDim2.new(1, 0, 1, 0);
			TextButton.Font = Enum.Font.Unknown;
			TextButton.FontFace = Font.new("rbxassetid://12187365364", Enum.FontWeight.Medium, Enum.FontStyle.Normal);
			TextButton.RichText = true;
			TextButton.TextColor3 = Color3.fromRGB(0, 0, 0);
			TextButton.TextScaled = true;
			TextButton.TextSize = 14;
			TextButton.TextTransparency = 1;
			TextButton.TextWrapped = true;

			local UITextSizeConstraint = _New_("UITextSizeConstraint", TextButton);
			UITextSizeConstraint.MaxTextSize = 14;

			local UITextSizeConstraint_0 = _New_("UITextSizeConstraint", Title);
			UITextSizeConstraint_0.MaxTextSize = 13;
		end
		
		function f:Slider(e)
			e = e or {}
			
			e.Callback = e.Callback or function()end

			local Slider = _New_("Frame", Tab);
			Slider.BackgroundColor3 = Color3.fromRGB(22.000000588595867, 22.000000588595867, 22.000000588595867);
			Slider.BackgroundTransparency = 0.5;
			Slider.BorderColor3 = Color3.fromRGB(27.000002190470695, 42.000001296401024, 53.000004440546036);
			Slider.BorderSizePixel = 0;
			Slider.Name = "Slider";
			Slider.Position = UDim2.new(0, 0, 0.6197943687438965, 0);
			Slider.Size = UDim2.new(1, 0, 0.03722435235977173, 35);

			local UIStroke = _New_("UIStroke", Slider);
			UIStroke.Color = Color3.fromRGB(50.00000461935997, 50.00000461935997, 50.00000461935997);

			local UICorner = _New_("UICorner", Slider);
			UICorner.CornerRadius = UDim.new(0, 4);

			local Title = _New_("TextLabel", Slider);
			Title.AnchorPoint = Vector2.new(0.5, 0.5);
			Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255);
			Title.BackgroundTransparency = 1;
			Title.BorderColor3 = Color3.fromRGB(27.000002190470695, 42.000001296401024, 53.000004440546036);
			Title.BorderSizePixel = 0;
			Title.Name = "Title";
			Title.Position = UDim2.new(0.40149807929992676, 0, 0.3013457953929901, 0);
			Title.Size = UDim2.new(0.7308584451675415, 0, 0.2560487687587738, 0);
			Title.Font = Enum.Font.Unknown;
			Title.FontFace = Font.new("rbxassetid://12187365364", Enum.FontWeight.Medium, Enum.FontStyle.Normal);
			Title.RichText = true;
			Title.Text = e.Title or "Slider";
			Title.TextColor3 = Color3.fromRGB(240.00000089406967, 240.00000089406967, 240.00000089406967);
			Title.TextSize = 14;
			Title.TextWrapped = true;
			Title.TextXAlignment = Enum.TextXAlignment.Left;

			local UITextSizeConstraint = _New_("UITextSizeConstraint", Title);
			UITextSizeConstraint.MaxTextSize = 14;

			local Main = _New_("Frame", Slider);
			Main.AnchorPoint = Vector2.new(0.5, 0.5);
			Main.BackgroundColor3 = Color3.fromRGB(184.00000423192978, 184.00000423192978, 184.00000423192978);
			Main.BackgroundTransparency = 0.800000011920929;
			Main.BorderColor3 = Color3.fromRGB(27.000002190470695, 42.000001296401024, 53.000004440546036);
			Main.BorderSizePixel = 0;
			Main.Name = "Main";
			Main.Position = UDim2.new(0.5059999823570251, 0, 0.628000020980835, 4);
			Main.Size = UDim2.new(0.9401594996452332, 0, 0.2560487687587738, 0);

			local UICorner_0 = _New_("UICorner", Main);
			UICorner_0.CornerRadius = UDim.new(0, 6);

			local Interact = _New_("TextButton", Main);
			Interact.BackgroundColor3 = Color3.fromRGB(255, 255, 255);
			Interact.BackgroundTransparency = 1;
			Interact.BorderColor3 = Color3.fromRGB(27.000002190470695, 42.000001296401024, 53.000004440546036);
			Interact.BorderSizePixel = 0;
			Interact.Name = "Interact";
			Interact.Size = UDim2.new(1, 0, 1, 0);
			Interact.ZIndex = 10;
			Interact.Font = Enum.Font.Unknown;
			Interact.FontFace = Font.new("rbxassetid://12187365364", Enum.FontWeight.Medium, Enum.FontStyle.Normal);
			Interact.RichText = true;
			Interact.Text = "";
			Interact.TextColor3 = Color3.fromRGB(0, 0, 0);
			Interact.TextScaled = true;
			Interact.TextSize = 14;
			Interact.TextWrapped = true;

			local UITextSizeConstraint_0 = _New_("UITextSizeConstraint", Interact);
			UITextSizeConstraint_0.MaxTextSize = 14;

			local Progress = _New_("Frame", Interact);
			Progress.BackgroundColor3 = Color3.fromRGB(26, 113, 73);
			Progress.BorderColor3 = Color3.fromRGB(27.000002190470695, 42.000001296401024, 53.000004440546036);
			Progress.BorderSizePixel = 0;
			Progress.Name = "Progress";
			Progress.Size = UDim2.new(0.8009684681892395, 0, 1, 0);

			local UICorner_1 = _New_("UICorner", Progress);
			UICorner_1.CornerRadius = UDim.new(0, 6);

			local Information = _New_("TextLabel", Main);
			Information.AnchorPoint = Vector2.new(0.5, 0.5);
			Information.BackgroundColor3 = Color3.fromRGB(255, 255, 255);
			Information.BackgroundTransparency = 1;
			Information.BorderColor3 = Color3.fromRGB(27.000002190470695, 42.000001296401024, 53.000004440546036);
			Information.BorderSizePixel = 0;
			Information.Name = "Information";
			Information.Position = UDim2.new(0.6031308770179749, 0, -0.7857142686843872, 0);
			Information.Size = UDim2.new(0.7850467562675476, 0, 1.0714285373687744, 0);
			Information.ZIndex = 5;
			Information.Font = Enum.Font.Unknown;
			Information.FontFace = Font.new("rbxassetid://12187365364", Enum.FontWeight.Medium, Enum.FontStyle.Normal);
			Information.RichText = true;
			Information.Text = e.def or "70";
			Information.TextColor3 = Color3.fromRGB(240.00000089406967, 240.00000089406967, 240.00000089406967);
			Information.TextScaled = true;
			Information.TextSize = 14;
			Information.TextTransparency = 0.4000000059604645;
			Information.TextWrapped = true;
			Information.TextXAlignment = Enum.TextXAlignment.Right;

			local UITextSizeConstraint_1 = _New_("UITextSizeConstraint", Information);
			UITextSizeConstraint_1.MaxTextSize = 15;
			
			local UserInputService = game:GetService("UserInputService")
			local RunService = game:GetService("RunService")
			local TweenService = game:GetService("TweenService")

			-- Make sure the fill grows from the left
			Progress.AnchorPoint = Vector2.new(0, 0)
			Progress.Position = UDim2.new(0, 0, 0, 0)

			local down = false

			local function setSliderValue(value)
				local clamped = math.clamp(value, e.min, e.max)
				local percentage = (clamped - e.min) / (e.max - e.min)

				Information.Text = tostring(math.floor(clamped))
				TweenService:Create(Progress, TweenInfo.new(0.06), {
					Size = UDim2.fromScale(percentage, 1)
				}):Play()

				e.Callback(math.floor(clamped))
			end

			local function updateSliderFromMouse(mouseX)
				local barStart = Progress.Parent.AbsolutePosition.X
				local barWidth = Progress.Parent.AbsoluteSize.X
				local percentage = math.clamp((mouseX - barStart) / barWidth, 0, 1)
				local value = ((e.max - e.min) * percentage) + e.min

				setSliderValue(value)
			end

			-- Initialize with default value
			if e.def then
				setSliderValue(e.def)
			end

			-- Handle clicking and dragging
			Interact.MouseButton1Down:Connect(function()
				down = true

				-- Set value from click immediately
				updateSliderFromMouse(UserInputService:GetMouseLocation().X)

				-- Stop when mouse released
				local releaseConnection
				releaseConnection = UserInputService.InputEnded:Connect(function(input)
					if input.UserInputType == Enum.UserInputType.MouseButton1 then
						down = false
						releaseConnection:Disconnect()
					end
				end)

				-- Continue dragging
				while down do
					updateSliderFromMouse(UserInputService:GetMouseLocation().X)
					RunService.RenderStepped:Wait()
				end
			end)


			
		end
		
		function f:Toggle(e)
			e = e or {}

			local Toggle = _New_("Frame", Tab);
			Toggle.BackgroundColor3 = Color3.fromRGB(22.000000588595867, 22.000000588595867, 22.000000588595867);
			Toggle.BackgroundTransparency = 0.5;
			Toggle.BorderColor3 = Color3.fromRGB(27.000002190470695, 42.000001296401024, 53.000004440546036);
			Toggle.BorderSizePixel = 0;
			Toggle.Name = "Toggle";
			Toggle.Size = UDim2.new(1, 0, 0, 40);

			local UICorner = _New_("UICorner", Toggle);
			UICorner.CornerRadius = UDim.new(0, 4);

			local UIStroke = _New_("UIStroke", Toggle);
			UIStroke.Color = Color3.fromRGB(50.00000461935997, 50.00000461935997, 50.00000461935997);

			local Switch = _New_("Frame", Toggle);
			Switch.AnchorPoint = Vector2.new(1, 0.5);
			Switch.BackgroundColor3 = Color3.fromRGB(30.00000011175871, 30.00000011175871, 30.00000011175871);
			Switch.BorderColor3 = Color3.fromRGB(27.000002190470695, 42.000001296401024, 53.000004440546036);
			Switch.BorderSizePixel = 0;
			Switch.Name = "Switch";
			Switch.Position = UDim2.new(0.9767981171607971, 0, 0.5, 0);
			Switch.Size = UDim2.new(0.09976798295974731, 0, 0.5249999761581421, 0);

			local UIStroke_0 = _New_("UIStroke", Switch);
			UIStroke_0.Color = Color3.fromRGB(65.0000037252903, 65.0000037252903, 65.0000037252903);

			local UICorner_0 = _New_("UICorner", Switch);
			UICorner_0.CornerRadius = UDim.new(0, 15);

			local Indicator = _New_("Frame", Switch);
			Indicator.AnchorPoint = Vector2.new(0, 0.5);
			Indicator.BackgroundColor3 = Color3.fromRGB(139.0000069141388, 139.0000069141388, 139.0000069141388);
			Indicator.BorderColor3 = Color3.fromRGB(27.000002190470695, 42.000001296401024, 53.000004440546036);
			Indicator.BorderSizePixel = 0;
			Indicator.Name = "Indicator";
			Indicator.Position = UDim2.new(0.06976744532585144, 0, 0.5, 0);
			Indicator.Size = UDim2.new(0.39534884691238403, 0, 0.8095238208770752, 0);

			local UICorner_1 = _New_("UICorner", Indicator);
			UICorner_1.CornerRadius = UDim.new(1, 0);

			local Title = _New_("TextLabel", Toggle);
			Title.AnchorPoint = Vector2.new(0.5, 0.5);
			Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255);
			Title.BackgroundTransparency = 1;
			Title.BorderColor3 = Color3.fromRGB(27.000002190470695, 42.000001296401024, 53.000004440546036);
			Title.BorderSizePixel = 0;
			Title.Name = "Title";
			Title.Position = UDim2.new(0.4014981687068939, 0, 0.5, 0);
			Title.Size = UDim2.new(0.7308584451675415, 0, 0.3499999940395355, 0);
			Title.Font = Enum.Font.Unknown;
			Title.FontFace = Font.new("rbxassetid://12187365364", Enum.FontWeight.Medium, Enum.FontStyle.Normal);
			Title.RichText = true;
			Title.Text = e.Title or "Toggle";
			Title.TextColor3 = Color3.fromRGB(240.00000089406967, 240.00000089406967, 240.00000089406967);
			Title.TextScaled = true;
			Title.TextSize = 14;
			Title.TextWrapped = true;
			Title.TextXAlignment = Enum.TextXAlignment.Left;

			local UITextSizeConstraint = _New_("UITextSizeConstraint", Title);
			UITextSizeConstraint.MaxTextSize = 14;

			local Interact = _New_("TextButton", Toggle);
			Interact.AnchorPoint = Vector2.new(0.5, 0.5);
			Interact.BackgroundColor3 = Color3.fromRGB(255, 255, 255);
			Interact.BackgroundTransparency = 1;
			Interact.BorderColor3 = Color3.fromRGB(27.000002190470695, 42.000001296401024, 53.000004440546036);
			Interact.BorderSizePixel = 0;
			Interact.Name = "Interact";
			Interact.Position = UDim2.new(0.49980059266090393, 0, 0.5, 0);
			Interact.Size = UDim2.new(1.0003985166549683, 0, 1, 0);
			Interact.ZIndex = 5;
			Interact.Font = Enum.Font.Unknown;
			Interact.FontFace = Font.new("rbxassetid://12187365364", Enum.FontWeight.Medium, Enum.FontStyle.Normal);
			Interact.RichText = true;
			Interact.Text = "";
			Interact.TextColor3 = Color3.fromRGB(0, 0, 0);
			Interact.TextScaled = true;
			Interact.TextSize = 14;
			Interact.TextTransparency = 1;
			Interact.TextWrapped = true;

			local UITextSizeConstraint_0 = _New_("UITextSizeConstraint", Interact);
			UITextSizeConstraint_0.MaxTextSize = 14;
			

			local TI = TweenInfo.new(0.5, Enum.EasingStyle.Quint)
			local TweenService = game:GetService("TweenService")

			local UserInputService = game:GetService("UserInputService")

			e.Callback = e.Callback or function() end
			local debounce = e.Value or false
			local currentKeyCode = e.Key or Enum.KeyCode.F -- Set the actual Enum.KeyCode
			local currentKeyName = typeof(currentKeyCode) == "EnumItem" and currentKeyCode.Name or tostring(currentKeyCode)

			-- Toggle function (shared)
			local function toggle()
				local success = pcall(function()
					e.Callback(debounce)
				end)

				if debounce then
					debounce = false
					TweenService:Create(Switch, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {
						BackgroundColor3 = Color3.fromRGB(30, 30, 30)
					}):Play()
					TweenService:Create(Indicator, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {
						Position = UDim2.new(0.07, 0, 0.5, 0)
					}):Play()
				else
					debounce = true
					TweenService:Create(Switch, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {
						BackgroundColor3 = Color3.fromRGB(26, 113, 73)
					}):Play()
					TweenService:Create(Indicator, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {
						Position = UDim2.new(0.537, 0, 0.5, 0)
					}):Play()
				end
			end

			-- Initial visuals
			if debounce then
				TweenService:Create(Switch, TweenInfo.new(0, Enum.EasingStyle.Linear), {
					BackgroundColor3 = Color3.fromRGB(26, 113, 73)
				}):Play()
				TweenService:Create(Indicator, TweenInfo.new(0, Enum.EasingStyle.Linear), {
					Position = UDim2.new(0.537, 0, 0.5, 0)
				}):Play()
			else
				TweenService:Create(Switch, TweenInfo.new(0, Enum.EasingStyle.Linear), {
					BackgroundColor3 = Color3.fromRGB(30, 30, 30)
				}):Play()
				TweenService:Create(Indicator, TweenInfo.new(0, Enum.EasingStyle.Linear), {
					Position = UDim2.new(0.07, 0, 0.5, 0)
				}):Play()
			end

			-- Click toggles
			Interact.MouseButton1Click:Connect(toggle)

			-- Keybind handler table
			local k = {}
			
			function k:Bind()
				local KeybindFrame = _New_("Frame", Toggle)
				KeybindFrame.AnchorPoint = Vector2.new(1, 0.5)
				KeybindFrame.AutomaticSize = Enum.AutomaticSize.XY
				KeybindFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
				KeybindFrame.BorderColor3 = Color3.fromRGB(27, 42, 53)
				KeybindFrame.BorderSizePixel = 0
				KeybindFrame.Name = "KeybindFrame"
				KeybindFrame.Position = UDim2.new(0.847, 0, 0.5, 0)
				KeybindFrame.Size = UDim2.new(0.078, 0, 0.65, 0)
				KeybindFrame.ZIndex = 6

				local UICorner = _New_("UICorner", KeybindFrame)
				UICorner.CornerRadius = UDim.new(0, 5)

				local UIStroke = _New_("UIStroke", KeybindFrame)
				UIStroke.Color = Color3.fromRGB(65, 65, 65)

				local KeybindBox = _New_("TextButton", KeybindFrame)
				KeybindBox.AnchorPoint = Vector2.new(0.5, 0.5)
				KeybindBox.AutomaticSize = Enum.AutomaticSize.XY
				KeybindBox.BackgroundTransparency = 1
				KeybindBox.BorderSizePixel = 0
				KeybindBox.Name = "KeybindBox"
				KeybindBox.Position = UDim2.new(0.5, 0, 0.5, 0)
				KeybindBox.TextColor3 = Color3.fromRGB(240, 240, 240)
				KeybindBox.TextScaled = true
				KeybindBox.TextSize = 14
				KeybindBox.TextWrapped = true
				KeybindBox.ZIndex = 6
				_New_("UITextSizeConstraint", KeybindBox).MaxTextSize = 14

				-- Read from e.Key (from toggle)
				local currentKeyCode = e.Key or Enum.KeyCode.F
				local currentKeyName = typeof(currentKeyCode) == "EnumItem" and currentKeyCode.Name or tostring(currentKeyCode)
				KeybindBox.Text = currentKeyName

				-- Click to rebind
				KeybindBox.MouseButton1Click:Connect(function()
					KeybindBox.Text = "..."
					local connection
					connection = UserInputService.InputBegan:Connect(function(input, gameProcessed)
						if not gameProcessed and input.UserInputType == Enum.UserInputType.Keyboard then
							currentKeyCode = input.KeyCode
							currentKeyName = input.KeyCode.Name
							KeybindBox.Text = currentKeyName
							e.Key = currentKeyCode
							connection:Disconnect()
						end
					end)
				end)

				-- Press key to toggle
				UserInputService.InputBegan:Connect(function(input, gameProcessed)
					if not gameProcessed and input.UserInputType == Enum.UserInputType.Keyboard and input.KeyCode == currentKeyCode then
						toggle()
					end
				end)
			end
			return k;




			
		end
		
		function f:DropDown(e)
			e = e or {}
			e.Callback = e.Callback or function()end
			e.List = e.List or {}

			local Dropdown = _New_("Frame", Tab);
			Dropdown.BackgroundColor3 = Color3.fromRGB(22.000000588595867, 22.000000588595867, 22.000000588595867);
			Dropdown.BackgroundTransparency = 0.5;
			Dropdown.BorderColor3 = Color3.fromRGB(27.000002190470695, 42.000001296401024, 53.000004440546036);
			Dropdown.BorderSizePixel = 0;
			Dropdown.Name = "Dropdown";
			Dropdown.Position = UDim2.new(0, 0, 0.3125469982624054, 0);
			Dropdown.Size = UDim2.new(1, 0,-0.503, 180);

			local UICorner = _New_("UICorner", Dropdown);
			UICorner.CornerRadius = UDim.new(0, 4);

			local UIStroke = _New_("UIStroke", Dropdown);
			UIStroke.Color = Color3.fromRGB(50.000000819563866, 50.000000819563866, 50.000000819563866);

			local Interact = _New_("TextButton", Dropdown);
			
			Interact.BackgroundColor3 = Color3.fromRGB(255, 255, 255);
			Interact.BackgroundTransparency = 1;
			Interact.BorderColor3 = Color3.fromRGB(27.000002190470695, 42.000001296401024, 53.000004440546036);
			Interact.BorderSizePixel = 0;
			Interact.Name = "Interact";
			Interact.Position = UDim2.new(0,0,0,0);
			Interact.Size = UDim2.new(1, 0,0, 38);
			Interact.ZIndex = 5;
			Interact.Font = Enum.Font.Unknown;
			Interact.FontFace = Font.new("rbxassetid://12187365364", Enum.FontWeight.Medium, Enum.FontStyle.Normal);
			Interact.RichText = true;
			Interact.Text = "";
			Interact.TextColor3 = Color3.fromRGB(0, 0, 0);
			Interact.TextScaled = true;
			Interact.TextSize = 14;
			Interact.TextTransparency = 1;
			Interact.TextWrapped = true;

			local UITextSizeConstraint = _New_("UITextSizeConstraint", Interact);
			UITextSizeConstraint.MaxTextSize = 14;

			local List = _New_("ScrollingFrame", Dropdown);
			List.Active = true;
			List.BackgroundColor3 = Color3.fromRGB(255, 255, 255);
			List.BackgroundTransparency = 1;
			List.BorderColor3 = Color3.fromRGB(27.000002190470695, 42.000001296401024, 53.000004440546036);
			List.BorderSizePixel = 0;
			List.Name = "List";
			List.Position = UDim2.new(0, 0, 0.21111111342906952, 0);
			List.Size = UDim2.new(1, 0, 0.699999988079071, 0);
			List.Visible = false;
			List.AutomaticCanvasSize = Enum.AutomaticSize.Y;
			List.CanvasSize = UDim2.new(0, 0, 0, 0);
			List.ScrollBarImageColor3 = Color3.fromRGB(240.00000089406967, 240.00000089406967, 240.00000089406967);
			List.ScrollBarImageTransparency = 0.699999988079071;
			List.ScrollBarThickness = 3;
			List.ZIndex = 4

			local UIListLayout = _New_("UIListLayout", List);
			UIListLayout.Padding = UDim.new(0, 5);
			UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center;
			UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder;



			local Placeholder = _New_("Frame", List);
			Placeholder.BackgroundColor3 = Color3.fromRGB(30.00000011175871, 30.00000011175871, 30.00000011175871);
			Placeholder.BorderColor3 = Color3.fromRGB(27.000002190470695, 42.000001296401024, 53.000004440546036);
			Placeholder.BorderSizePixel = 0;
			Placeholder.LayoutOrder = -100;
			Placeholder.Name = "Placeholder";
			Placeholder.Position = UDim2.new(0.39247313141822815, 0, 0, 0);

			local Toggle = _New_("ImageButton", Dropdown);
			Toggle.AnchorPoint = Vector2.new(1, 0.5);
			Toggle.BackgroundTransparency = 1;
			Toggle.BorderColor3 = Color3.fromRGB(27.000002190470695, 42.000001296401024, 53.000004440546036);
			Toggle.BorderSizePixel = 0;
			Toggle.LayoutOrder = 9;
			Toggle.Name = "Toggle";
			Toggle.Position = UDim2.new(0, 423, 0, 22);
			Toggle.Selectable = false;
			Toggle.Size = UDim2.new(0, 31, 0, 28);
			Toggle.ZIndex = 0;
			Toggle.Image = "rbxassetid://3926305904";
			Toggle.ImageColor3 = Color3.fromRGB(150.0000062584877, 150.0000062584877, 150.0000062584877);
			Toggle.ImageRectOffset = Vector2.new(564, 284);
			Toggle.ImageRectSize = Vector2.new(36, 36);

			local Title_0 = _New_("TextLabel", Dropdown);
			Title_0.AnchorPoint = Vector2.new(0, 0.5);
			Title_0.BackgroundColor3 = Color3.fromRGB(255, 255, 255);
			Title_0.BackgroundTransparency = 1;
			Title_0.BorderColor3 = Color3.fromRGB(27.000002190470695, 42.000001296401024, 53.000004440546036);
			Title_0.BorderSizePixel = 0;
			Title_0.Name = "Title";
			Title_0.Position = UDim2.new(0, 14, 0, 22);
			Title_0.Size = UDim2.new(0, 234, 0, 14);
			Title_0.ZIndex = 3;
			Title_0.Font = Enum.Font.Unknown;
			Title_0.FontFace = Font.new("rbxassetid://12187365364", Enum.FontWeight.Medium, Enum.FontStyle.Normal);
			Title_0.RichText = true;
			Title_0.Text = e.Title or "Dropdown";
			Title_0.TextColor3 = Color3.fromRGB(240.00000089406967, 240.00000089406967, 240.00000089406967);
			Title_0.TextScaled = true;
			Title_0.TextSize = 14;
			Title_0.TextWrapped = true;
			Title_0.TextXAlignment = Enum.TextXAlignment.Left;

			local UITextSizeConstraint_2 = _New_("UITextSizeConstraint", Title_0);
			UITextSizeConstraint_2.MaxTextSize = 14;
			
			
			local slect = e.Value
			
			local Selected = _New_("TextLabel", Dropdown);
			Selected.AnchorPoint = Vector2.new(0.5, 0.5);
			Selected.BackgroundColor3 = Color3.fromRGB(255, 255, 255);
			Selected.BackgroundTransparency = 1;
			Selected.BorderColor3 = Color3.fromRGB(27.000002190470695, 42.000001296401024, 53.000004440546036);
			Selected.BorderSizePixel = 0;
			Selected.Name = "Selected";
			Selected.Position = UDim2.new(0, 306, 0, 22);
			Selected.Size = UDim2.new(0, 167, 0, 14);
			Selected.Font = Enum.Font.Unknown;
			Selected.FontFace = Font.new("rbxassetid://12187365364", Enum.FontWeight.Medium, Enum.FontStyle.Normal);
			Selected.RichText = true;
			Selected.Text = slect or "Option #1";
			Selected.TextColor3 = Color3.fromRGB(150.0000062584877, 150.0000062584877, 150.0000062584877);
			Selected.TextScaled = true;
			Selected.TextSize = 14;
			Selected.TextWrapped = true;
			Selected.TextXAlignment = Enum.TextXAlignment.Right;

			local UITextSizeConstraint_3 = _New_("UITextSizeConstraint", Selected);
			UITextSizeConstraint_3.MaxTextSize = 14;
			
			local TweenService = game:GetService("TweenService")

			local o = false  -- toggle state (open/closed)

			
			
			for i,v in next,e.List do


				local Template = _New_("Frame", List);
				Template.BackgroundColor3 = Color3.fromRGB(30, 30, 30);
				Template.BackgroundTransparency = 0.8;
				Template.BorderColor3 = Color3.fromRGB(27, 42, 53);
				Template.BorderSizePixel = 0;
				Template.Name = "Template";
				Template.Size = UDim2.new(0.9, 0, 0, 38);
				Template.LayoutOrder = i -- Make sure ordering matches list
				Template.ZIndex = 4

				local UIStroke_0 = _New_("UIStroke", Template);
				UIStroke_0.Color = Color3.fromRGB(50, 50, 50);

				local UICorner_0 = _New_("UICorner", Template);
				UICorner_0.CornerRadius = UDim.new(0, 5);

				local Interact_0 = _New_("TextButton", Template);
				Interact_0.BackgroundTransparency = 1;
				Interact_0.Size = UDim2.new(1, 0, 1, 0);
				Interact_0.Name = "Interact";
				Interact_0.ZIndex = 5;
				Interact_0.Font = Enum.Font.Unknown;
				Interact_0.FontFace = Font.new("rbxassetid://12187365364", Enum.FontWeight.Medium, Enum.FontStyle.Normal);
				Interact_0.RichText = true;
				Interact_0.Text = "";
				Interact_0.TextScaled = true;
				Interact_0.TextWrapped = true;
				Interact_0.ZIndex = 4

				local UITextSizeConstraint_0 = _New_("UITextSizeConstraint", Interact_0);
				UITextSizeConstraint_0.MaxTextSize = 1;

				local Title = _New_("TextLabel", Template);
				Title.AnchorPoint = Vector2.new(0.5, 0.5);
				Title.BackgroundTransparency = 1;
				Title.Size = UDim2.new(0.8, 0, 0.35, 0);
				Title.Position = UDim2.new(0.45, 0, 0.5, 0);
				Title.Name = "Title";
				Title.Font = Enum.Font.Unknown;
				Title.FontFace = Font.new("rbxassetid://12187365364", Enum.FontWeight.Medium, Enum.FontStyle.Normal);
				Title.RichText = true;
				Title.Text = v or "Option";
				Title.TextColor3 = Color3.fromRGB(240, 240, 240);
				Title.TextScaled = true;
				Title.TextSize = 14;
				Title.TextWrapped = true;
				Title.TextXAlignment = Enum.TextXAlignment.Left;

				local UITextSizeConstraint_1 = _New_("UITextSizeConstraint", Title);
				UITextSizeConstraint_1.MaxTextSize = 14;


				Interact_0.MouseButton1Down:Connect(function()
					Selected.Text = ""..v
					e.Callback(v)

					TweenService:Create(Dropdown, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {
						Size = UDim2.new(1, 0, -0.503, 180)
					}):Play()
					List.Visible = false
				
					o = false
				end)
				
				
			end
			
			
			
			
			
			
		

			-- Toggle dropdown open/close on Interact button click
			Interact.MouseButton1Click:Connect(function()
				if o == false then
					o = true
					List.Visible = true
					TweenService:Create(Dropdown, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {
						Size = UDim2.new(1, 0, 0.01, 180)
					}):Play()
				else
					o = false
					List.Visible = false
					TweenService:Create(Dropdown, TweenInfo.new(0.6, Enum.EasingStyle.Quint), {
						Size = UDim2.new(1, 0, -0.503, 180)
					}):Play()
				end
			end)



			
			
			
		end
		
		function f:ColorPicker(e)
			
			e = e or {}
			e.Callback = e.Callback or function()end
			local ColorPicker = _New_("Frame", Tab);
			ColorPicker.BackgroundColor3 = Color3.fromRGB(22.000000588595867, 22.000000588595867, 22.000000588595867);
			ColorPicker.BackgroundTransparency = 0.5;
			ColorPicker.BorderColor3 = Color3.fromRGB(27.000002190470695, 42.000001296401024, 53.000004440546036);
			ColorPicker.BorderSizePixel = 0;
			ColorPicker.Name = "ColorPicker";
			ColorPicker.Position = UDim2.new(0.010526316240429878, 0, 0.5737704634666443, 0);
			ColorPicker.Size = UDim2.new(1, 0, 0, 120);

			local UIStroke = _New_("UIStroke", ColorPicker);
			UIStroke.Color = Color3.fromRGB(50.00000461935997, 50.00000461935997, 50.00000461935997);

			local UICorner = _New_("UICorner", ColorPicker);
			UICorner.CornerRadius = UDim.new(0, 4);

			local RGB = _New_("Frame", ColorPicker);
			RGB.BackgroundColor3 = Color3.fromRGB(255, 255, 255);
			RGB.BackgroundTransparency = 1;
			RGB.BorderColor3 = Color3.fromRGB(27.000002190470695, 42.000001296401024, 53.000004440546036);
			RGB.Name = "RGB";
			RGB.Position = UDim2.new(0.02806481532752514, 0, 0.44999998807907104, 0);
			RGB.Size = UDim2.new(0.5382830500602722, 0, 0.24166665971279144, 0);

			local UIListLayout = _New_("UIListLayout", RGB);
			UIListLayout.Padding = UDim.new(0, 5);
			UIListLayout.FillDirection = Enum.FillDirection.Horizontal;
			UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder;

			local BInput = _New_("Frame", RGB);
			BInput.AnchorPoint = Vector2.new(1, 0.5);
			BInput.BackgroundColor3 = Color3.fromRGB(30.00000011175871, 30.00000011175871, 30.00000011175871);
			BInput.BorderColor3 = Color3.fromRGB(27.000002190470695, 42.000001296401024, 53.000004440546036);
			BInput.BorderSizePixel = 0;
			BInput.LayoutOrder = 2;
			BInput.Name = "BInput";
			BInput.Position = UDim2.new(0.90625, 0, 0.4655172526836395, 0);
			BInput.Size = UDim2.new(0.23275862634181976, 0, 0.931034505367279, 0);
			BInput.ZIndex = 10;

			local UIStroke_0 = _New_("UIStroke", BInput);
			UIStroke_0.Color = Color3.fromRGB(60.00000022351742, 60.00000022351742, 60.00000022351742);

			local UICorner_0 = _New_("UICorner", BInput);
			UICorner_0.CornerRadius = UDim.new(0, 5);

			local InputBox = _New_("TextBox", BInput);
			InputBox.AnchorPoint = Vector2.new(0.5, 0.5);
			InputBox.BackgroundColor3 = Color3.fromRGB(255, 255, 255);
			InputBox.BackgroundTransparency = 1;
			InputBox.BorderColor3 = Color3.fromRGB(27.000002190470695, 42.000001296401024, 53.000004440546036);
			InputBox.BorderSizePixel = 0;
			InputBox.ClearTextOnFocus = false;
			InputBox.Name = "InputBox";
			InputBox.Position = UDim2.new(0.5, 0, 0.5, 0);
			InputBox.Size = UDim2.new(0.5962222218513489, 0, 0.5185185074806213, 0);
			InputBox.ZIndex = 10;
			InputBox.Font = Enum.Font.Unknown;
			InputBox.FontFace = Font.new("rbxassetid://12187365364", Enum.FontWeight.Medium, Enum.FontStyle.Normal);
			InputBox.PlaceholderText = "B";
			InputBox.RichText = true;
			InputBox.Text = "";
			InputBox.TextColor3 = Color3.fromRGB(200.00000327825546, 200.00000327825546, 200.00000327825546);
			InputBox.TextScaled = true;
			InputBox.TextSize = 12;
			InputBox.TextWrapped = true;
			InputBox.TextXAlignment = Enum.TextXAlignment.Left;

			local UITextSizeConstraint = _New_("UITextSizeConstraint", InputBox);
			UITextSizeConstraint.MaxTextSize = 12;

			local GInput = _New_("Frame", RGB);
			GInput.AnchorPoint = Vector2.new(1, 0.5);
			GInput.BackgroundColor3 = Color3.fromRGB(30.00000011175871, 30.00000011175871, 30.00000011175871);
			GInput.BorderColor3 = Color3.fromRGB(27.000002190470695, 42.000001296401024, 53.000004440546036);
			GInput.BorderSizePixel = 0;
			GInput.LayoutOrder = 1;
			GInput.Name = "GInput";
			GInput.Position = UDim2.new(0.3296017348766327, 0, 0.4958333373069763, 0);
			GInput.Size = UDim2.new(0.23275862634181976, 0, 0.931034505367279, 0);
			GInput.ZIndex = 10;

			local UICorner_1 = _New_("UICorner", GInput);
			UICorner_1.CornerRadius = UDim.new(0, 5);

			local UIStroke_1 = _New_("UIStroke", GInput);
			UIStroke_1.Color = Color3.fromRGB(60.00000022351742, 60.00000022351742, 60.00000022351742);

			local InputBox_0 = _New_("TextBox", GInput);
			InputBox_0.AnchorPoint = Vector2.new(0.5, 0.5);
			InputBox_0.BackgroundColor3 = Color3.fromRGB(255, 255, 255);
			InputBox_0.BackgroundTransparency = 1;
			InputBox_0.BorderColor3 = Color3.fromRGB(27.000002190470695, 42.000001296401024, 53.000004440546036);
			InputBox_0.BorderSizePixel = 0;
			InputBox_0.ClearTextOnFocus = false;
			InputBox_0.Name = "InputBox";
			InputBox_0.Position = UDim2.new(0.5, 0, 0.5, 0);
			InputBox_0.Size = UDim2.new(0.5962222218513489, 0, 0.5185185074806213, 0);
			InputBox_0.ZIndex = 10;
			InputBox_0.Font = Enum.Font.Unknown;
			InputBox_0.FontFace = Font.new("rbxassetid://12187365364", Enum.FontWeight.Medium, Enum.FontStyle.Normal);
			InputBox_0.PlaceholderText = "G";
			InputBox_0.RichText = true;
			InputBox_0.Text = "";
			InputBox_0.TextColor3 = Color3.fromRGB(200.00000327825546, 200.00000327825546, 200.00000327825546);
			InputBox_0.TextScaled = true;
			InputBox_0.TextSize = 12;
			InputBox_0.TextWrapped = true;
			InputBox_0.TextXAlignment = Enum.TextXAlignment.Left;

			local UITextSizeConstraint_0 = _New_("UITextSizeConstraint", InputBox_0);
			UITextSizeConstraint_0.MaxTextSize = 12;

			local RInput = _New_("Frame", RGB);
			RInput.AnchorPoint = Vector2.new(1, 0.5);
			RInput.BackgroundColor3 = Color3.fromRGB(30.00000011175871, 30.00000011175871, 30.00000011175871);
			RInput.BorderColor3 = Color3.fromRGB(27.000002190470695, 42.000001296401024, 53.000004440546036);
			RInput.BorderSizePixel = 0;
			RInput.Name = "RInput";
			RInput.Position = UDim2.new(0.159964457154274, 0, 0.4958333373069763, 0);
			RInput.Size = UDim2.new(0.23275862634181976, 0, 0.931034505367279, 0);
			RInput.ZIndex = 10;

			local UIStroke_2 = _New_("UIStroke", RInput);
			UIStroke_2.Color = Color3.fromRGB(60.00000022351742, 60.00000022351742, 60.00000022351742);

			local UICorner_2 = _New_("UICorner", RInput);
			UICorner_2.CornerRadius = UDim.new(0, 5);

			local InputBox_1 = _New_("TextBox", RInput);
			InputBox_1.AnchorPoint = Vector2.new(0.5, 0.5);
			InputBox_1.BackgroundColor3 = Color3.fromRGB(255, 255, 255);
			InputBox_1.BackgroundTransparency = 1;
			InputBox_1.BorderColor3 = Color3.fromRGB(27.000002190470695, 42.000001296401024, 53.000004440546036);
			InputBox_1.BorderSizePixel = 0;
			InputBox_1.ClearTextOnFocus = false;
			InputBox_1.Name = "InputBox";
			InputBox_1.Position = UDim2.new(0.5, 0, 0.5, 0);
			InputBox_1.Size = UDim2.new(0.5959380269050598, 0, 0.5185185074806213, 0);
			InputBox_1.ZIndex = 11;
			InputBox_1.Font = Enum.Font.Unknown;
			InputBox_1.FontFace = Font.new("rbxassetid://12187365364", Enum.FontWeight.Medium, Enum.FontStyle.Normal);
			InputBox_1.PlaceholderText = "R";
			InputBox_1.RichText = true;
			InputBox_1.Text = "";
			InputBox_1.TextColor3 = Color3.fromRGB(200.00000327825546, 200.00000327825546, 200.00000327825546);
			InputBox_1.TextScaled = true;
			InputBox_1.TextSize = 12;
			InputBox_1.TextWrapped = true;
			InputBox_1.TextXAlignment = Enum.TextXAlignment.Left;

			local UITextSizeConstraint_1 = _New_("UITextSizeConstraint", InputBox_1);
			UITextSizeConstraint_1.MaxTextSize = 12;

			local Darkness = _New_("ImageButton", ColorPicker);
			Darkness.AnchorPoint = Vector2.new(1, 1);
			Darkness.BackgroundColor3 = Color3.fromRGB(255, 255, 255);
			Darkness.BackgroundTransparency = 1;
			Darkness.BorderColor3 = Color3.fromRGB(27.000002190470695, 42.000001296401024, 53.000004440546036);
			Darkness.Name = "Darkness";
			Darkness.Position = UDim2.new(0.9767979979515076, 0, 0.925000011920929, 0);
			Darkness.Selectable = false;
			Darkness.Size = UDim2.new(0.03030303120613098, 0, 0.8583333492279053, 0);
			Darkness.ClipsDescendants = true;
			Darkness.Image = "http://www.roblox.com/asset/?id=6523291212";

			local UIStroke_3 = _New_("UIStroke", Darkness);
			UIStroke_3.Color = Color3.fromRGB(50.00000461935997, 50.00000461935997, 50.00000461935997);

			local UICorner_3 = _New_("UICorner", Darkness);
			UICorner_3.CornerRadius = UDim.new(0, 6);

			local SliderPoint = _New_("ImageButton", Darkness);
			SliderPoint.AnchorPoint = Vector2.new(0.5, 0.5);
			SliderPoint.BackgroundColor3 = Color3.fromRGB(255, 255, 255);
			SliderPoint.BackgroundTransparency = 1;
			SliderPoint.BorderColor3 = Color3.fromRGB(27.000002190470695, 42.000001296401024, 53.000004440546036);
			SliderPoint.Name = "SliderPoint";
			SliderPoint.Position = UDim2.new(0.5, 0, 0.5, 0);
			SliderPoint.Selectable = false;
			SliderPoint.Size = UDim2.new(0.7692307829856873, 0, 0.09708737581968307, 0);
			SliderPoint.Image = "rbxassetid://3926309567";
			SliderPoint.ImageColor3 = Color3.fromRGB(0, 0, 0);
			SliderPoint.ImageRectOffset = Vector2.new(628, 420);
			SliderPoint.ImageRectSize = Vector2.new(48, 48);

			local TintAdder = _New_("TextLabel", Darkness);
			TintAdder.BackgroundColor3 = Color3.fromRGB(0, 0, 0);
			TintAdder.BackgroundTransparency = 0.800000011920929;
			TintAdder.BorderColor3 = Color3.fromRGB(27.000002190470695, 42.000001296401024, 53.000004440546036);
			TintAdder.Name = "TintAdder";
			TintAdder.Size = UDim2.new(1, 0, 1, 0);
			TintAdder.Font = Enum.Font.Unknown;
			TintAdder.FontFace = Font.new("rbxassetid://12187365364", Enum.FontWeight.Medium, Enum.FontStyle.Normal);
			TintAdder.RichText = true;
			TintAdder.Text = "";
			TintAdder.TextColor3 = Color3.fromRGB(0, 0, 0);
			TintAdder.TextScaled = true;
			TintAdder.TextSize = 14;
			TintAdder.TextWrapped = true;

			local UICorner_4 = _New_("UICorner", TintAdder);
			UICorner_4.CornerRadius = UDim.new(0, 6);

			local UITextSizeConstraint_2 = _New_("UITextSizeConstraint", TintAdder);
			UITextSizeConstraint_2.MaxTextSize = 14;

			local Color = _New_("ImageButton", ColorPicker);
			Color.Active = false;
			Color.AnchorPoint = Vector2.new(1, 0.5);
			Color.BackgroundColor3 = Color3.fromRGB(98.00000175833702, 255, 0);
			Color.BackgroundTransparency = 1;
			Color.BorderColor3 = Color3.fromRGB(27.000002190470695, 42.000001296401024, 53.000004440546036);
			Color.BorderSizePixel = 0;
			Color.Name = "Color";
			Color.Position = UDim2.new(0.9234337210655212, 0, 0.4958333373069763, 0);
			Color.Selectable = false;
			Color.Size = UDim2.new(0.3473193347454071, 0, 0.8583333492279053, 0);
			Color.Image = "http://www.roblox.com/asset/?id=6523286724";

			local UIStroke_4 = _New_("UIStroke", Color);
			UIStroke_4.Color = Color3.fromRGB(50.00000461935997, 50.00000461935997, 50.00000461935997);

			local UICorner_5 = _New_("UICorner", Color);
			UICorner_5.CornerRadius = UDim.new(0, 6);

			local SliderPoint_0 = _New_("ImageButton", Color);
			SliderPoint_0.AnchorPoint = Vector2.new(0.5, 0.5);
			SliderPoint_0.BackgroundColor3 = Color3.fromRGB(255, 255, 255);
			SliderPoint_0.BackgroundTransparency = 1;
			SliderPoint_0.BorderColor3 = Color3.fromRGB(27.000002190470695, 42.000001296401024, 53.000004440546036);
			SliderPoint_0.Name = "SliderPoint";
			SliderPoint_0.Position = UDim2.new(0.5, 0, 0.5, 0);
			SliderPoint_0.Selectable = false;
			SliderPoint_0.Size = UDim2.new(0.06711409240961075, 0, 0.09708737581968307, 0);
			SliderPoint_0.Image = "rbxassetid://3926309567";
			SliderPoint_0.ImageColor3 = Color3.fromRGB(0, 0, 0);
			SliderPoint_0.ImageRectOffset = Vector2.new(628, 420);
			SliderPoint_0.ImageRectSize = Vector2.new(48, 48);

			local TintAdder_0 = _New_("TextLabel", Color);
			TintAdder_0.BackgroundColor3 = Color3.fromRGB(0, 0, 0);
			TintAdder_0.BackgroundTransparency = 0.800000011920929;
			TintAdder_0.BorderColor3 = Color3.fromRGB(27.000002190470695, 42.000001296401024, 53.000004440546036);
			TintAdder_0.Name = "TintAdder";
			TintAdder_0.Size = UDim2.new(1, 0, 1, 0);
			TintAdder_0.Font = Enum.Font.Unknown;
			TintAdder_0.FontFace = Font.new("rbxassetid://12187365364", Enum.FontWeight.Medium, Enum.FontStyle.Normal);
			TintAdder_0.RichText = true;
			TintAdder_0.Text = "";
			TintAdder_0.TextColor3 = Color3.fromRGB(0, 0, 0);
			TintAdder_0.TextScaled = true;
			TintAdder_0.TextSize = 14;
			TintAdder_0.TextWrapped = true;

			local UICorner_6 = _New_("UICorner", TintAdder_0);
			UICorner_6.CornerRadius = UDim.new(0, 6);

			local UITextSizeConstraint_3 = _New_("UITextSizeConstraint", TintAdder_0);
			UITextSizeConstraint_3.MaxTextSize = 14;

			local Title = _New_("TextLabel", ColorPicker);
			Title.AnchorPoint = Vector2.new(0.5, 0.5);
			Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255);
			Title.BackgroundTransparency = 1;
			Title.BorderColor3 = Color3.fromRGB(27.000002190470695, 42.000001296401024, 53.000004440546036);
			Title.BorderSizePixel = 0;
			Title.Name = "Title";
			Title.Position = UDim2.new(0.31322506070137024, 0, 0.18333333730697632, 0);
			Title.Size = UDim2.new(0.5498839616775513, 0, 0.11666666716337204, 0);
			Title.ZIndex = 3;
			Title.Font = Enum.Font.Unknown;
			Title.FontFace = Font.new("rbxassetid://12187365364", Enum.FontWeight.Medium, Enum.FontStyle.Normal);
			Title.RichText = true;
			Title.Text = e.Title or "Color Picker";
			Title.TextColor3 = Color3.fromRGB(240.00000089406967, 240.00000089406967, 240.00000089406967);
			Title.TextScaled = true;
			Title.TextSize = 14;
			Title.TextWrapped = true;
			Title.TextXAlignment = Enum.TextXAlignment.Left;

			local UITextSizeConstraint_4 = _New_("UITextSizeConstraint", Title);
			UITextSizeConstraint_4.MaxTextSize = 14;
			
			
			
			local UserInputService = game:GetService("UserInputService")

			-- Elements
			local colorSlider = SliderPoint_0
			local colorImage = Color
			local brightnessSlider = SliderPoint
			local brightnessImage = Darkness

			local RBox = RInput:FindFirstChild("InputBox")
			local GBox = GInput:FindFirstChild("InputBox")
			local BBox = BInput:FindFirstChild("InputBox")

			local draggingColor = false
			local draggingBrightness = false
			local brightness = 1 -- Value between 0 (dark) and 1 (bright)

			-- Update the final selected color
			local function UpdateColor()
				local hue = colorSlider.Position.X.Scale
				local sat = 1 - colorSlider.Position.Y.Scale
				local val = brightness

				local color = Color3.fromHSV(hue, sat, val)

				if RBox then RBox.Text = tostring(math.floor(color.R * 255)) end
				if GBox then GBox.Text = tostring(math.floor(color.G * 255)) end
				if BBox then BBox.Text = tostring(math.floor(color.B * 255)) end

				e.Callback(color)
			end

			-- Move slider and update position
			local function SetSliderPosition(slider, image, input)
				local absPos = image.AbsolutePosition
				local absSize = image.AbsoluteSize
				local mouse = input.Position

				local x = math.clamp((mouse.X - absPos.X) / absSize.X, 0, 1)
				local y = math.clamp((mouse.Y - absPos.Y) / absSize.Y, 0, 1)

				slider.Position = UDim2.new(x, 0, y, 0)

				return x, y
			end

			-- Color Gradient Interaction
			colorImage.InputBegan:Connect(function(input)
				if input.UserInputType == Enum.UserInputType.MouseButton1 then
					draggingColor = true
					SetSliderPosition(colorSlider, colorImage, input)
					UpdateColor()
				end
			end)

			-- Brightness Bar Interaction
			brightnessImage.InputBegan:Connect(function(input)
				if input.UserInputType == Enum.UserInputType.MouseButton1 then
					draggingBrightness = true
					local _, y = SetSliderPosition(brightnessSlider, brightnessImage, input)
					brightness = 1 - y
					UpdateColor()
				end
			end)

			-- Mouse Up
			UserInputService.InputEnded:Connect(function(input)
				if input.UserInputType == Enum.UserInputType.MouseButton1 then
					draggingColor = false
					draggingBrightness = false
				end
			end)

			-- Mouse Movement for dragging
			UserInputService.InputChanged:Connect(function(input)
				if input.UserInputType == Enum.UserInputType.MouseMovement then
					if draggingColor then
						SetSliderPosition(colorSlider, colorImage, input)
						UpdateColor()
					elseif draggingBrightness then
						local _, y = SetSliderPosition(brightnessSlider, brightnessImage, input)
						brightness = 1 - y
						UpdateColor()
					end
				end
			end)


			
			
			
			
		end
		
	return f;
	end
return t;
end -- tab ends

return lib;






-- images
--[[
		local icons = {
			["aim"] = "rbxassetid://72783199740836",
			["auto"] = "rbxassetid://127951680865394",
			["esp"] = "rbxassetid://125163371999984",
			["player"] = "rbxassetid://115000590422103",
			["colors"] = "rbxassetid://96594597742013",
			["plrSet"] = "rbxassetid://11432831839",
		}
	OR e.Custom = "RBX ASSET"


-- Documents for Objects

local config = {
	Game = "Assassin!",
	Ver = "1.0.6"
}

local main = lib:Make(config)

local tab = main:Tab({
	Icon = "aim"
})

tab:Label({
	Text = "ASDGDSGSDGDSGD"
})

tab:SectionName({
	Title = "New Stuff!"
})
tab:Divider()

tab:Button({
	Title = "Click Me!",
	Callback = function()
		print("Clicked!!")
	end,
})

tab:Input({
	Title = "Input Box",
	Callback = function(e)
		print(e)
	end,
})

local e = tab:Toggle({
	Title = "True",
	Value = true,
	Key = Enum.KeyCode.Z,
	Callback = function(e)
		print(e)
	end,
})

e:Bind()

tab:Toggle({
	Title = "False",
	Value = false,
	Callback = function(e)
		print(e)
	end,
})



tab:Button({
	Title = "Click Me!e",
	Callback = function()
		print("Clicked!!")
	end,
})

tab:Slider({
	Title = "Slider",
	min = 0,
	max = 100,
	def = 12,
	Callback = function(e)
		print(e)
	end,
})

tab:DropDown({
	Title = "Drop",
	List = {"1","2","3"},
	Callback = function(e)
		print(e)
	end
})

tab:ColorPicker({
	Title = "CACA",
	Callback = function(e)
		print(e)
	end,
})


]]--
