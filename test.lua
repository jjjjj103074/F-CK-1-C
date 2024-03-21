-- test.lua

-- 加載F-CK-1-C模組
require("entry")

-- 測試顯示名稱是否正確
print("Display Name: " .. FCK1C.displayName)

-- 測試開發者名稱是否正確
print("Developer Name: " .. FCK1C.developerName)

-- 測試版本信息是否正確
print("Version: " .. FCK1C.version)

-- 測試描述信息是否正確
print("Description: " .. FCK1C.info)

-- 測試輸入配置文件是否正確
for profile, path in pairs(FCK1C.InputProfiles) do
    print("Input Profile: " .. profile .. ", Path: " .. path)
end

-- 測試外觀是否正確
for _, skin in ipairs(FCK1C.Skins) do
    print("Skin Name: " .. skin.name .. ", Directory: " .. skin.dir)
end

-- 測試任務是否正確
for _, mission in ipairs(FCK1C.Missions) do
    print("Mission Name: " .. mission.name .. ", Directory: " .. mission.dir)
end

-- 測試日誌是否正確
for _, logbook in ipairs(FCK1C.LogBook) do
    print("Logbook Name: " .. logbook.name .. ", Type: " .. logbook.type)
end

-- 測試選項是否正確
for _, option in ipairs(FCK1C.Options) do
    print("Option Name: " .. option.name .. ", Directory: " .. option.dir .. ", CLSID: " .. option.CLSID)
end
