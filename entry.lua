local self_ID="F-CK-1-C"
-- M.write_log("開始載入模組")
declare_plugin(self_ID,
{
installed 	 = true,
dirName	  	 = current_mod_path,
displayName  = _("F-CK-1-C"),

fileMenuName = _("F-CK-1-C"),
update_id        = "F-CK-1-C",
version		 = "0.1.0",
state		 = "installed",
info		 = _("F-CK-1-C test mod"),
encyclopedia_path = current_mod_path..'/Encyclopedia',
-- binaries	 = bin,

Skins	=
	{
		{
			name	= _("F-CK-1-C"),
			dir		= "Skins/1"
		},
	},
Missions =
	{
		{
			name		= _("F-CK-1-C"),
			dir			= "Missions",
			--CLSID		= "{CLSID5456456346CLSID}",
		},
	},
LogBook =
	{
		{
			name		= _("F-CK-1-C"),
			type		= "F-CK-1-C",
		},
	},
InputProfiles =
	{
		["F-CK-1-C"]     = current_mod_path .. '/Input',
	},
Options =
    {
        {
            name		= _("F-CK-1-C"),
            nameId		= "F-CK-1-C",
            dir			= "Options",
            CLSID		= "{F-CK-1-C options}"
        },
    },

})
---------------------------------------------------------------------------------------

plugin_done()-- finish declaration , clear temporal data