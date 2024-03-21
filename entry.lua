-- entry.lua
require("test_function")
-- 定義F-CK-1-C飛機模組
FCK1C = {
    displayName     = _("F-CK-1-C"),
    developerName   = "jjjjj103074",
    version         = "0.1.0",
    info            = _("我懶得想"),
    state           = "installed",
    dirName         = current_mod_path,
    InputProfiles   = {
        ["f-ck-1-c"] = current_mod_path .. '/Input/f-ck-1-c',
    },
    Skins           = {
        { name = _("Default"), dir = "Skins/Default" },
        { name = _("Custom"), dir = "Skins/Custom" }
    },
    Missions        = {
        { name = _("Training"), dir = "Missions/Training" },
        { name = _("Combat"), dir = "Missions/Combat" }
    },
    LogBook         = {
        { name = _("F-CK-1-C"), type = "FCK1C" }
    },
    Options         = {
        { name = _("F-CK-1-C Options"), dir = "Options", CLSID = "{FCK1C options}" }
    }
}

-- 定義模組完成
plugin_done()
