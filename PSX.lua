local library = loadstring(game.HttpGet(game, 'https://raw.githubusercontent.com/pwansbypass/main/main/0x37%20UI%20Lib'))()

local w1 = library:Window('PSX')


w1:Toggle('Auto Collect Lootbags', 'autolotbag', false, function(Value)
    AutoLootBag = Value
	
end)

w1:Toggle('Auto Collect Orbs', 'autorbs', false, function(Value)
    AutOrbs = Value
	
end)


spawn(function()
	while wait () do
		if AutOrbs then
			for i,v in pairs(game.Workspace["__THINGS"].Orbs:GetChildren()) do
				if v:IsA("Part") then
					v.Position = game.Players.LocalPlayer.Character.HumanoidRootPart.Position
					end 
				end 
			end
		end    
	end)

spawn(function()
	while wait () do
		if AutoLootBag then
			for i,v in pairs(game.Workspace["__THINGS"].Lootbags:GetChildren()) do
				if v:IsA("MeshPart") then
					v.Position = game.Players.LocalPlayer.Character.HumanoidRootPart.Position
					end 
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

w1:Label('KOMI SHOUKO HUB')