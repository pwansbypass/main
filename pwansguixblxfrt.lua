repeat wait() until game:IsLoaded()

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

wait(1)

local library = loadstring(game.HttpGet(game, 'https://raw.githubusercontent.com/pwansbypass/main/main/0x37%20UI%20Lib'))()

local w1 = library:Window('PWANS GUI')


w1:Toggle('Fruit ESP', 'fruit', false, function(Value)
    DevilESP = Value
	while DevilESP do wait()
		UpdateDevilFruit()
	end
end)

Number = math.random(1,1000000)

function UpdateDevilFruit()
	for i,v in pairs(game:GetService("Workspace"):GetChildren()) do
		pcall(function()
			if string.find(v.Name, "Fruit") then
				if DevilESP then
					if string.find(v.Name, "Fruit") then
						if not v.Handle:FindFirstChild("DevilESP"..Number) then
							local Bb = Instance.new("BillboardGui", v.Handle)
							Bb.Name = "DevilESP"..Number
							Bb.ExtentsOffset = Vector3.new(0, 1, 0)
							Bb.Size = UDim2.new(1, 200, 1, 30)
							Bb.Adornee = v.Handle
							Bb.AlwaysOnTop = true
							local Textlb = Instance.new("TextLabel", Bb)
							Textlb.Font = "GothamBold"
							Textlb.FontSize = "Size14"
							Textlb.Size = UDim2.new(1,0,1,0)
							Textlb.BackgroundTransparency = 1
							Textlb.TextStrokeTransparency = 0.5
							Textlb.Text = v.Name.."\n"..math.round((v.Handle.Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude/3).." km"
							Textlb.TextColor3 = Color3.new(255, 255, 255)
						else
							v.Handle["DevilESP"..Number].TextLabel.Text = v.Name.."\n"..math.round((v.Handle.Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude/3).." km"
						end
					end
				else
					if v.Handle:FindFirstChild("DevilESP"..Number) then
						v.Handle:FindFirstChild("DevilESP"..Number):Destroy()
					end
				end
			end
		end)
	end
end

w1:Toggle('Kill Aura', 'KellAwra', false, function(vu)
    Killaura = vu
end)

spawn(function()
    while wait() do
        if Killaura then
            for i,v in pairs(game.Workspace.Enemies:GetDescendants()) do
                if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                    pcall(function()
                        repeat wait(.1)
                            sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
                            v.Humanoid.Health = 0
                            v.HumanoidRootPart.CanCollide = false
                            v.HumanoidRootPart.Size = Vector3.new(50,50,50)
                            v.HumanoidRootPart.Transparency = 0.8
                        until not Killaura or not v.Parent or v.Humanoid.Health <= 0
                    end)
                end
            end
        end
    end
end)




w1:Toggle('Auto Click', 'autoclick', false, function(Value)
    AutoClick = Value 
end)

game:GetService("RunService").Heartbeat:Connect(function()
    if AutoClick then
        game:GetService'VirtualUser':Button1Down(Vector2.new(0.9,0.9))
        game:GetService'VirtualUser':Button1Up(Vector2.new(0.9,0.9))
    end
end)


w1:Button('Buy Color Buso', function()
    local args = {
		[1] = "ColorsDealer",
		[2] = "2"
		}
	game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
end)

w1:Button('Fruit Inventory', function()
   local args = {
		[1] = "getInventoryFruits"
	}
	
	game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("getInventoryFruits")
	game:GetService("Players").LocalPlayer.PlayerGui.Main.FruitInventory.Visible = true
end)

w1:Button('Fruit Shop', function()
   local args = {
        [1] = "GetFruits"
    }
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
    game.Players.localPlayer.PlayerGui.Main.FruitShop.Visible = true
end)

w1:Button('Buy Random Fruit', function()
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Cousin","Buy")
end)

w1:Button('Bring Fruit', function()
	for i,v in pairs(game:GetService("Workspace"):GetChildren()) do
                    if string.find(v.Name, "Fruit") then
                    if v:IsA("Tool") then
                    v.Handle.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0, 50, 0)
                    wait(.2)
                 firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart,v.Handle,0)
              end
         end
     end
end)

w1:Button('Destroy GUI', function()
    for i,v in pairs(game.CoreGui:GetChildren()) do
        if v:FindFirstChild('Top') then
            v:Destroy()    
        end
    end
end)

w1:Label('MARUKO HUB')
