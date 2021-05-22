-- // Constants \\ --

-- [ Services ] --
local Services = {}
Services.RunService = game:GetService("RunService")

-- [ Custom Functions ] --
local IsExploit = not Services.RunService:IsStudio()

local CustomFunctions = {}
CustomFunctions.SetHidden = sethiddenproperty or set_hidden_property or set_hidden_prop

-- [ GraphicX ] --
local GraphicX = {}

-- Create --
function GraphicX.new(Class, Properties)
	-- Creates the Instance --
	local NewInstance = Instance.new(Class)

	-- Sets the Properties --
	for i,v in pairs(Properties) do
		if NewInstance[i] ~= nil and i ~= "Parent" then
			NewInstance[i] = v
		end
	end

	-- Sets Parent --
	if Properties.Parent then
		NewInstance.Parent = Properties.Parent
	end

	return NewInstance
end

function GraphicX.SetProperty(Object, Properties)
	-- Sets the Properties --
	for i,v in pairs(Properties) do
		if Object[i] ~= nil and i ~= "Parent" then
			Object[i] = v
		end
	end

	-- Sets Parent --
	if Properties.Parent then
		Object.Parent = Properties.Parent
	end
end

-- [ Instances ] --
local Lighting = game:GetService("Lighting")
local Terrain = workspace.Terrain

local LightingSaves = GraphicX.new("Folder", {Name = "LightingSaves", Parent = nil})


-- // Main \\ --
function GraphicX.Enhance(Settings)
	local GraphicSettings = Settings or {
		FogEnabled = true,
		WaterEnabled = true
	}
	
	-- [ Clears Lighting ] --
	for i,v in ipairs(Lighting:GetChildren()) do
		if v:IsA("PostEffect") and not string.find(v.Name, "GraphicX") then
			v.Parent = LightingSaves
		end
	end

	-- [ Sets Properties ] --

	-- Lighting --
	if GraphicSettings.FogEnabled then
		GraphicX.SetProperty(Lighting, {
			FogEnd = 500,
			FogStart = 25
		})
	end

	if IsExploit then
		CustomFunctions.SetHidden(Lighting, "Technology", Enum.Technology.Future)
		settings().Rendering.QualityLevel = 21
	end

	-- Terrain --
	if GraphicSettings.WaterEnabled then
		GraphicX.SetProperty(Terrain, {
			WaterColor = Color3.fromRGB(131, 165, 164),
			WaterReflectance = 0.05,
			WaterTransparency = 1,
			WaterWaveSize = 0.05,
			WaterWaveSpeed = 25
		})
	end

	-- [ Creates Effects ] --
	GraphicX.LightingEffects = {
		GraphicX.new("BloomEffect", {
			Name = "GraphicXBloom",
			Parent = Lighting,
			Intensity = 0.75,
			Size = 15,
			Threshold = 0.95
		}),
		GraphicX.new("BlurEffect", {
			Name = "GraphicXBlur",
			Parent = Lighting,
			Size = 5
		}),
		GraphicX.new("DepthOfFieldEffect", {
			Name = "GraphicXDepth",
			Parent = Lighting,
			FarIntensity = 0.15,
			FocusDistance = 0.05,
			InFocusRadius = 20,
			NearIntensity = 0.75
		}),
		GraphicX.new("SunRaysEffect", {
			Name = "GraphicXRays",
			Parent = Lighting,
			Intensity = 0.25,
			Spread = 0.5
		})
	}
end

GraphicX.Enhance({
	FogEnabled = true,
	WaterEnabled = true
})

return GraphicX