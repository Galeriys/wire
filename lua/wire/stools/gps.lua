WireToolSetup.setCategory( "Detection" )
WireToolSetup.open( "gps", "GPS", "gmod_wire_gps", nil, "GPSs" )

if CLIENT then
	language.Add( "Tool.wire_gps.name", "GPS Tool (Wire)" )
	language.Add( "Tool.wire_gps.desc", "Spawns a GPS for use with the wire system." )
	language.Add( "Tool.wire_gps.0", "Primary: Create/Update GPS" )
end
WireToolSetup.BaseLang()
WireToolSetup.SetupMax( 10, TOOL.Mode.."s" , "You've hit the Wire "..TOOL.PluralName.." limit!" )

if SERVER then
	ModelPlug_Register("GPS")
	
	function TOOL:GetConVars() end

	function TOOL:MakeEnt( ply, model, Ang, trace )
		return MakeWireGPS( ply, trace.HitPos, Ang, model, self:GetConVars() )
	end
end

TOOL.Model = "models/beer/wiremod/gps.mdl"
TOOL.ClientConVar = {
	model = TOOL.Model,
	modelsize = "",
}

function TOOL.BuildCPanel(panel)
	panel:Help("#Tool.wire_gps.desc")
	WireToolHelpers.MakeModelSizer(panel, "wire_gps_modelsize")
	ModelPlug_AddToCPanel(panel, "GPS", "wire_gps")
end