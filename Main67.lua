 -- yo looking for ai made scripts? get a job bro...
local p=game.Players.LocalPlayer
local rs=game:GetService("ReplicatedStorage")
local re=rs:WaitForChild("RemoteEvents"):WaitForChild("EquipOrUnequipTool")
local sg=Instance.new("ScreenGui")
sg.Name="BowlingBallSelector"
sg.ResetOnSpawn=false
sg.DisplayOrder=100
sg.IgnoreGuiInset=true
sg.Parent=p:WaitForChild("PlayerGui")
local mf=Instance.new("Frame")
mf.Name="MainFrame"
mf.Size=UDim2.new(0,550,0,400)
mf.Position=UDim2.new(0.5,-275,0.5,-200)
mf.BackgroundColor3=Color3.fromRGB(20,20,25)
mf.BorderSizePixel=0
mf.Active=true
mf.Draggable=true
mf.Parent=sg
local uc=Instance.new("UICorner")
uc.CornerRadius=UDim.new(0,12)
uc.Parent=mf
local tb=Instance.new("Frame")
tb.Name="TopBar"
tb.Size=UDim2.new(1,0,0,45)
tb.BackgroundColor3=Color3.fromRGB(25,25,30)
tb.BorderSizePixel=0
tb.Parent=mf
local tbc=Instance.new("UICorner")
tbc.CornerRadius=UDim.new(0,12)
tbc.Parent=tb
local t=Instance.new("TextLabel")
t.Name="Title"
t.Size=UDim2.new(1,-50,1,0)
t.Position=UDim2.new(0,15,0,0)
t.BackgroundTransparency=1
t.Text="Bowling Ball Equipper"
t.TextColor3=Color3.fromRGB(255,255,255)
t.TextSize=18
t.Font=Enum.Font.GothamSemibold
t.TextXAlignment=Enum.TextXAlignment.Left
t.Parent=tb
local cb=Instance.new("TextButton")
cb.Name="CloseButton"
cb.Size=UDim2.new(0,30,0,30)
cb.Position=UDim2.new(1,-40,0.5,-15)
cb.BackgroundColor3=Color3.fromRGB(255,80,80)
cb.BorderSizePixel=0
cb.Text="X"
cb.TextColor3=Color3.fromRGB(255,255,255)
cb.TextSize=18
cb.Font=Enum.Font.GothamBold
cb.AutoButtonColor=true
cb.Parent=tb
local cbc=Instance.new("UICorner")
cbc.CornerRadius=UDim.new(0,6)
cbc.Parent=cb
local lp=Instance.new("Frame")
lp.Name="LeftPanel"
lp.Size=UDim2.new(0,180,1,-60)
lp.Position=UDim2.new(0,15,0,60)
lp.BackgroundColor3=Color3.fromRGB(25,25,30)
lp.BorderSizePixel=0
lp.Parent=mf
local lpc=Instance.new("UICorner")
lpc.CornerRadius=UDim.new(0,10)
lpc.Parent=lp
local sb=Instance.new("TextBox")
sb.Name="SearchBox"
sb.Size=UDim2.new(1,-20,0,40)
sb.Position=UDim2.new(0,10,0,15)
sb.BackgroundColor3=Color3.fromRGB(35,35,40)
sb.BorderSizePixel=0
sb.PlaceholderText="🔍 Search balls..."
sb.PlaceholderColor3=Color3.fromRGB(120,120,120)
sb.Text=""
sb.TextColor3=Color3.fromRGB(255,255,255)
sb.TextSize=14
sb.Font=Enum.Font.Gotham
sb.ClearTextOnFocus=false
sb.Parent=lp
local sbc=Instance.new("UICorner")
sbc.CornerRadius=UDim.new(0,6)
sbc.Parent=sb
local sc=Instance.new("Frame")
sc.Name="SelectedContainer"
sc.Size=UDim2.new(1,-20,0,50)
sc.Position=UDim2.new(0,10,0,70)
sc.BackgroundColor3=Color3.fromRGB(35,35,40)
sc.BorderSizePixel=0
sc.Parent=lp
local scc=Instance.new("UICorner")
scc.CornerRadius=UDim.new(0,8)
scc.Parent=sc
local sl=Instance.new("TextLabel")
sl.Name="SelectedLabel"
sl.Size=UDim2.new(1,-10,1,-10)
sl.Position=UDim2.new(0,5,0,5)
sl.BackgroundTransparency=1
sl.Text="Selected: None"
sl.TextColor3=Color3.fromRGB(200,200,200)
sl.TextSize=14
sl.Font=Enum.Font.Gotham
sl.TextWrapped=true
sl.TextXAlignment=Enum.TextXAlignment.Center
sl.TextYAlignment=Enum.TextYAlignment.Center
sl.Parent=sc
local tog=Instance.new("TextButton")
tog.Name="ToggleButton"
tog.Size=UDim2.new(1,-20,0,45)
tog.Position=UDim2.new(0,10,0,135)
tog.BackgroundColor3=Color3.fromRGB(70,130,180)
tog.BorderSizePixel=0
tog.Text="Equip"
tog.TextColor3=Color3.fromRGB(255,255,255)
tog.TextSize=15
tog.Font=Enum.Font.GothamBold
tog.AutoButtonColor=true
tog.Parent=lp
local tog_c=Instance.new("UICorner")
tog_c.CornerRadius=UDim.new(0,8)
tog_c.Parent=tog
local fb=Instance.new("TextButton")
fb.Name="FireButton"
fb.Size=UDim2.new(1,-20,0,50)
fb.Position=UDim2.new(0,10,0,195)
fb.BackgroundColor3=Color3.fromRGB(50,150,50)
fb.BorderSizePixel=0
fb.Text="FIRE REMOTE"
fb.TextColor3=Color3.fromRGB(255,255,255)
fb.TextSize=16
fb.Font=Enum.Font.GothamBold
fb.AutoButtonColor=true
fb.Parent=lp
local fbc=Instance.new("UICorner")
fbc.CornerRadius=UDim.new(0,8)
fbc.Parent=fb
local rp=Instance.new("Frame")
rp.Name="RightPanel"
rp.Size=UDim2.new(0,310,1,-60)
rp.Position=UDim2.new(0,210,0,60)
rp.BackgroundColor3=Color3.fromRGB(25,25,30)
rp.BorderSizePixel=0
rp.Parent=mf
local rpc=Instance.new("UICorner")
rpc.CornerRadius=UDim.new(0,10)
rpc.Parent=rp
local rpt=Instance.new("TextLabel")
rpt.Name="RightPanelTitle"
rpt.Size=UDim2.new(1,-20,0,30)
rpt.Position=UDim2.new(0,10,0,10)
rpt.BackgroundTransparency=1
rpt.Text="BOWLING BALLS"
rpt.TextColor3=Color3.fromRGB(150,150,150)
rpt.TextSize=12
rpt.Font=Enum.Font.GothamBold
rpt.TextXAlignment=Enum.TextXAlignment.Left
rpt.Parent=rp
local bf=Instance.new("ScrollingFrame")
bf.Name="BallsFrame"
bf.Size=UDim2.new(1,-20,1,-50)
bf.Position=UDim2.new(0,10,0,45)
bf.BackgroundColor3=Color3.fromRGB(35,35,40)
bf.BorderSizePixel=0
bf.CanvasSize=UDim2.new(0,0,0,0)
bf.ScrollBarThickness=6
bf.ScrollBarImageColor3=Color3.fromRGB(100,100,100)
bf.AutomaticCanvasSize=Enum.AutomaticSize.Y
bf.Parent=rp
local bfc=Instance.new("UICorner")
bfc.CornerRadius=UDim.new(0,8)
bfc.Parent=bf
local bl=Instance.new("UIListLayout")
bl.Padding=UDim.new(0,6)
bl.HorizontalAlignment=Enum.HorizontalAlignment.Center
bl.SortOrder=Enum.SortOrder.Name
bl.Parent=bf
local pad=Instance.new("UIPadding")
pad.PaddingTop=UDim.new(0,10)
pad.PaddingBottom=UDim.new(0,10)
pad.Parent=bf
local sBall="BowlingBoulder"
local eState=true
sl.Text="Selected: "..sBall
tog.Text=eState and"Equip"or"Unequip"
tog.BackgroundColor3=eState and Color3.fromRGB(70,130,180)or Color3.fromRGB(180,70,70)
local function cbb()
	for _,v in ipairs(bf:GetChildren())do if v:IsA"TextButton"then v:Destroy()end end
	local bb=rs:WaitForChild("BowlingBalls")
	local st=sb.Text:lower()
	for _,ball in ipairs(bb:GetChildren())do
		if st==""or ball.Name:lower():find(st)then
			local btn=Instance.new("TextButton")
			btn.Name=ball.Name
			btn.Size=UDim2.new(1,-20,0,38)
			btn.BackgroundColor3=Color3.fromRGB(45,45,50)
			btn.BorderSizePixel=0
			btn.Text=ball.Name
			btn.TextColor3=Color3.fromRGB(220,220,220)
			btn.TextSize=14
			btn.Font=Enum.Font.Gotham
			btn.AutoButtonColor=true
			btn.Parent=bf
			local btnc=Instance.new("UICorner")
			btnc.CornerRadius=UDim.new(0,6)
			btnc.Parent=btn
			if ball.Name==sBall then
				btn.BackgroundColor3=Color3.fromRGB(100,100,220)
				btn.TextColor3=Color3.fromRGB(255,255,255)
			end
			btn.MouseButton1Click:Connect(function()
				sBall=ball.Name
				sl.Text="Selected: "..sBall
				for _,b in ipairs(bf:GetChildren())do
					if b:IsA"TextButton"then
						b.BackgroundColor3=Color3.fromRGB(45,45,50)
						b.TextColor3=Color3.fromRGB(220,220,220)
					end
				end
				btn.BackgroundColor3=Color3.fromRGB(100,100,220)
				btn.TextColor3=Color3.fromRGB(255,255,255)
			end)
		end
	end
end
cbb()
sb.Changed:Connect(function(p)if p=="Text"then cbb()end end)
tog.MouseButton1Click:Connect(function()
	eState=not eState
	tog.Text=eState and"Equip"or"Unequip"
	tog.BackgroundColor3=eState and Color3.fromRGB(70,130,180)or Color3.fromRGB(180,70,70)
end)
fb.MouseButton1Click:Connect(function()
	local args={sBall,eState}
	re:FireServer(unpack(args))
end)
cb.MouseButton1Click:Connect(function()
	sg:Destroy()
end)