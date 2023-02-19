
local Succ,Err = pcall(function()

local LoaderInterface = game:GetObjects("rbxassetid://11787775916")[1]
local TweenService = game:GetService("TweenService")
task.wait(2)
local SupportedGamesJSON = game:GetService("HttpService"):JSONDecode(game:HttpGet('https://raw.githubusercontent.com/HexerMaster1929/HexHub-V7/main/Games/SupportedGames',true))
local GitHubBase = 'https://raw.githubusercontent.com/HexerMaster1929/HexHub-V7/main/Games/'

function CheckSupport(id)
	for i,v in pairs(SupportedGamesJSON) do
		if v == id then
			return true    
		end
	end
	return false
end

function LoadHexHubIntoGame()
	if CheckSupport(game.PlaceId) then
		for i,v in pairs(SupportedGamesJSON) do
			if v == game.PlaceId then
				loadstring(game:HttpGet(GitHubBase..i,true))()
				return
			end
		end
	else
		print("Not Supported")
	end

end

function CueUI(Dir,Obj)
	print(Dir,Obj)
end

wait(2) 


local CoreGui = game:GetService("CoreGui")
if gethui then
LoaderInterface.Parent = gethui()
elseif syn.protect_gui then 
syn.protect_gui(LoaderInterface)
LoaderInterface.Parent = CoreGui
elseif CoreGui:FindFirstChild("RobloxGui") then
LoaderInterface.Parent = CoreGui:FindFirstChild("RobloxGui")
else
LoaderInterface.Parent = CoreGui
end

LoaderInterface.Start:Play()

TweenService:Create(LoaderInterface.Loading,TweenInfo.new(0.75, Enum.EasingStyle.Quart, Enum.EasingDirection.Out),{

	Position = UDim2.new(0.5,0,0,0)

}):Play()

task.wait(5.7)

local LoadNotifTitle = LoaderInterface.Loading.Title
local LoadNotifDesc = LoaderInterface.Loading.Des
local LoadNotifIcon = LoaderInterface.Loading.Icns

TweenService:Create(LoadNotifTitle,TweenInfo.new(0.55, Enum.EasingStyle.Quart, Enum.EasingDirection.Out),{

	TextTransparency = 1

}):Play()

TweenService:Create(LoadNotifDesc,TweenInfo.new(0.55, Enum.EasingStyle.Quart, Enum.EasingDirection.Out),{

	TextTransparency = 1

}):Play()

TweenService:Create(LoadNotifIcon,TweenInfo.new(0.55, Enum.EasingStyle.Quart, Enum.EasingDirection.Out),{

	ImageTransparency = 1

}):Play()

task.wait(0.55)

--if syn and syn.protect then
LoadNotifDesc.Text = "Protecting UI From Injection Detection Engines."
--end
LoadNotifIcon.Image = "http://www.roblox.com/asset/?id=7352804392"

LoaderInterface.Notify1:Play()



TweenService:Create(LoadNotifTitle,TweenInfo.new(0.55, Enum.EasingStyle.Quart, Enum.EasingDirection.Out),{

	TextTransparency = 0

}):Play()

TweenService:Create(LoadNotifDesc,TweenInfo.new(0.55, Enum.EasingStyle.Quart, Enum.EasingDirection.Out),{

	TextTransparency = 0

}):Play()

TweenService:Create(LoadNotifIcon,TweenInfo.new(0.55, Enum.EasingStyle.Quart, Enum.EasingDirection.Out),{

	ImageTransparency = 0

}):Play()

task.wait(7)

TweenService:Create(LoadNotifTitle,TweenInfo.new(0.55, Enum.EasingStyle.Quart, Enum.EasingDirection.Out),{

	TextTransparency = 1

}):Play()

TweenService:Create(LoadNotifDesc,TweenInfo.new(0.55, Enum.EasingStyle.Quart, Enum.EasingDirection.Out),{

	TextTransparency = 1

}):Play()

TweenService:Create(LoadNotifIcon,TweenInfo.new(0.55, Enum.EasingStyle.Quart, Enum.EasingDirection.Out),{

	ImageTransparency = 1

}):Play()

task.wait(0.55)


LoadNotifDesc.Text = "Detecting Running Game & Checking For Support"



LoaderInterface.Notify1:Play()



TweenService:Create(LoadNotifTitle,TweenInfo.new(0.55, Enum.EasingStyle.Quart, Enum.EasingDirection.Out),{

	TextTransparency = 0

}):Play()

TweenService:Create(LoadNotifDesc,TweenInfo.new(0.55, Enum.EasingStyle.Quart, Enum.EasingDirection.Out),{

	TextTransparency = 0

}):Play()

TweenService:Create(LoadNotifIcon,TweenInfo.new(0.55, Enum.EasingStyle.Quart, Enum.EasingDirection.Out),{

	ImageTransparency = 0

}):Play()

wait(3.43)

TweenService:Create(LoaderInterface.Loading,TweenInfo.new(0.75, Enum.EasingStyle.Quart, Enum.EasingDirection.Out),{

	Position = UDim2.new(0.5,0,-0.1,0)

}):Play()

if CheckSupport(game.PlaceId) == true then
	LoaderInterface.Success:Play()
	LoaderInterface.Supported.Visible = true
elseif CheckSupport(game.PlaceId) == false then
	LoaderInterface.Fail:Play()
	LoaderInterface.Unsupported.Visible = true
else
	error("Error Checking Game Support")
end


LoaderInterface.Supported.Layer.Execute.MouseButton1Down:Connect(function()
	LoaderInterface.KeySystem.Visible = true
	LoaderInterface.Supported.Visible = false
end)

function KeySysWarn(T)
	LoaderInterface.KeySystem.Warn.Text = T
	LoaderInterface.KeySystem.Warn.Visible = true
	task.wait(3)
	LoaderInterface.KeySystem.Warn.Visible = false
end

LoaderInterface.KeySystem.Sub.MouseButton1Down:Connect(function()
	
	local request = (syn and syn.request) or (http and http.request) or request

	local response = request({
		Url = "https://hexhubv6key.000webhostapp.com/check.php?key="..tostring(LoaderInterface.KeySystem.BoxFrame.TextBox.Text).."&hwid=cum",
		Method = "GET"
	})
	
	if not request then
		game.Players.LocalPlayer:Kick("EXECUTOR ERROR: Executor Does Not Have A HTTP Request Function!")
	end
	
	local data = game:GetService("HttpService"):JSONDecode(response.Body)
	if data.Success then
		if data.Valid == true then
			LoaderInterface:Destroy()
			LoadHexHubIntoGame()
			elseif data.AdminKey == true then
			LoadHexHubIntoGame()
			LoaderInterface:Destroy()
		elseif data.Valid == false then
			print("Invalid")
			KeySysWarn("INVALID KEY")
		elseif data.Valid == false and data.Used == true then
			print("Invalid")
			KeySysWarn("KEY USED PREVIOUSLY")
		end
	elseif not data.Success then
		KeySysWarn("error checking key.")
		print(data)
	end
end)

LoaderInterface.KeySystem.Get.MouseButton1Down:Connect(function()
	LoaderInterface.KeySystem.Get.Text = "Copied"
		setclipboard("https://hexhubv6key.000webhostapp.com")
	task.wait(4)
	LoaderInterface.KeySystem.Get.Text = "Get Key"
end)

LoaderInterface.KeySystem.Close.MouseButton1Down:Connect(function()
	LoaderInterface:Destroy()
end)

LoaderInterface.Unsupported.Layer.Exit.MouseButton1Down:Connect(function()
	LoaderInterface:Destroy()
end)

LoaderInterface.Supported.Layer.Exit.MouseButton1Down:Connect(function()
	LoaderInterface:Destroy()
end)

end)

if Err then warn(Err) end
