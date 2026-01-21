-- 將此段程式碼貼在 dofile 之前
-- 用於檢查 F-CK-1C.lua 中使用到的「環境變數」是否存在

local required_globals = {
    "WSTYPE_PLACEHOLDER",
    "wsType_Air",
    "wsType_Airplane",
    "wsType_Fighter",
    "MODULATION_AM",
}

local missing_globals = ""
for _, key in ipairs(required_globals) do
    if _G[key] == nil then
        missing_globals = missing_globals .. "\n[MISSING] " .. key
    end
end

if missing_globals ~= "" then
    -- 這裡我們直接定義它們，防止後面載入失敗 (Monkey Patch)
    -- 注意：這些數值是 DCS 的標準 Enum，若環境沒有，我們手動補上
    print("[F-CK-1C] 發現缺失的環境變數，正在補全..." .. missing_globals)
    
    WSTYPE_PLACEHOLDER = 0
    wsType_Air = 1
    wsType_Airplane = 1
    wsType_Fighter = 1
    wsType_Corsair = 1 -- 有些舊代碼會用
    MODULATION_AM = 0
    
    -- 再次確認
    print("[F-CK-1C] 環境變數補全完成，嘗試載入...")
else
    print("[F-CK-1C] 環境變數檢查通過")
end
