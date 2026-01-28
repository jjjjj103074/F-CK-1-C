-- F-CK-1C.lua
-- 以 F-16C 範本為參考，建立 F-CK-1C 機體設定範本
-- 本檔案目的：提供完整但可修改的機體欄位 (可用於 AI/伺服器測試)
-- 註：某些 helper（pylon, gun_mount, makeAirplaneCanopyGeometry 等）與常數
-- (WSTYPE_PLACEHOLDER, MODULATION_AM 等) 由 DCS 執行環境提供，載入時需在 mod 環境下執行。


-- ===================== 基本說明區 (Identification) =====================
-- Name / DisplayName / shape_table_data 必要用於引擎辨識與載入
local F_CK_1C = {
    -- 機種內部識別名稱
    Name = 'F-CK-1C',
    -- 顯示名稱（可本地化）
    DisplayName = _('F-CK-1C'),

    Rate = 40, -- RewardPoint in Multiplayer

    Shape = "F-CK-1C",
    -- shape_table_data: 告訴引擎要載入的 3D 模型與毀損模型
    -- shape_table_data = {{
    --     file = "f-ck-1c", -- 3D 模型檔名（需放在 Shapes 資料夾）
    --     username = "F-CK-1C",
    --     index = WSTYPE_PLACEHOLDER,
    --     life = 20, -- 機體生命值（耐久/HP，整數，數值越高越難被摧毀）
    --     vis = 3, -- 可見性等級（LOD/視覺等級，整數）
    --     desrt = 'Fighter-2-crush'; -- Name of destroyed object file name Alphajet-destr. This is a placeholder.
    --     fire = {300, 2}, -- 火焰效果設定：{持續時間秒, 強度}（秒, unitless）
    --     classname = "lLandPlane",
    --     positioning = "BYNORMAL"
    -- }, 
    -- -- {
    -- --     name = "F-CK-1C_destr",
    -- --     file = "f-ck-1c-oblomok",
    -- --     fire = {0, 1}
    -- -- }
    -- },

    -- 國家
    Countries = {
        "Abkhazia",
        "Algeria",
        "Argentina",
        "Australia",
        "Austria",
        "Belarus",
        "Belgium",
        "Brazil",
        "Bulgaria",
        "Canada",
        "China",
        "Chile",
        "Croatia",
        "Cuba",
        "Czech Republic",
        "Cyprus",
        "Denmark",
        "Egypt",
        "Finland",
        "France",
        "Georgia",
        "Germany",
        "Ghana",
        "Greece",
        "Honduras",
        "Hungary",
        "India",
        "Indonesia",
        "Insurgents",
        "Iran",
        "Iraq",
        "Israel",
        "Italy",
        "Japan",
        "Jordan",
        "Kazakhstan",
        "Lebanon",
        "Libya",
        "Malaysia",
        "Mexico",
        "Morocco",
        "The Netherlands",
        "Nigeria",
        "North Korea",
        "Norway",
        "Oman",
        "Pakistan",
        "Peru",
        "Phllipines",
        "Poland",
        "Qatar",
        "Romania",
        "Russia",
        "Saudi Arabia",
        "Serbia",
        "Slovakia",
        "Slovenia",
        "South Africa",
        "South Korea",
        "South Ossetia",
        "Spain",
        "Sudan",
        "Sweden",
        "Switzerland",
        "Syria",
        "Thailand",
        "Tunisia",
        "Turkey",
        "UK",
        "Ukraine",
        "United Arab Emirates",
        "United Nations Peacekeepers",
        "USA",
        "USAF Aggressors",
        "Venezuela",
        "Vietnam",
        "Yemen"
    },

    -- UI 與分類
    -- UI 顯示相關（可選，影響選單顯示） [OPTIONAL]
    Picture = "F-CK-1C.png", -- [OPTIONAL]
    mapclasskey = "P0091000024",
    WorldID = WSTYPE_PLACEHOLDER,
    attribute = {wsType_Air, wsType_Airplane, wsType_Fighter, WSTYPE_PLACEHOLDER, "Multirole fighters", "Refuelable"},
    Categories = {"{78EFB7A2-FD52-4b57-A6A6-3BF0E1D6555F}", "Interceptor"},

    -- ===================== 操控/機組資訊區 (Crew & Cockpit) =====================
    -- 若為 AI-only，可把 HumanCockpit 設為 false 以避免引擎嘗試載入 cockpit resource
    -- 操控/機組（分類：F-16/A-4E 風格）
    HumanCockpit = false, -- AI-only 建議 false  [AI]
    HumanCockpitPath = current_mod_path .. '/Cockpit/', -- 如啟用需放 cockpit 檔案  [OPTIONAL]

    crew_size = 1, -- 機組人數（AI 會依此分配任務） [AI]
    crew_members = {
        [1] = {
            ejection_seat_name = "pilot_generic_seat",
            pilot_name = "pilot_generic",
            drop_canopy_name = "F-CK-1C_canopy",
            canopy_pos = {0, 0, 0},
            pos = {3.2, 0.27, 0}, -- 駕駛座在機體座標的 (x, y, z)，單位：公尺 (m)
            g_suit = 1.02 -- G-suit 補償係數（unitless，通常 1.0 = 無補償）
        }
    },

    -- ===================== 性能參數區 (Mass, Geometry, Performance) =====================
    -- 質量（千克）與燃油
    M_empty = 9026, -- 空機重量 (kg)
    M_nominal = 11000, -- 作戰或典型質量 (kg)
    M_max = 19187, -- 最大起飛重量 (kg)
    M_fuel_max = 3249, -- 最大內部燃油質量 (kg)
    -- 以下為 AI 相關性能參數（標註為 [AI]），部分取自 A-4E 範例
    CAS_min = 25.7, -- 最低校正空速 (Calibrated Airspeed)，AI 最低飛行速度 (m/s) [AI] (參考 A-4E)

    -- 幾何尺寸（公尺）
    length = 14.5, -- 機身總長 (m)
    height = 5.0, -- 機高 (m)
    wing_area = 28, -- 翼面積 (m^2)
    wing_span = 9.45, -- 翼展 (m)
    wing_tip_pos = {-2.7, 0.31, 4.65}, -- 翼尖相對座標 (x,y,z) (m)

    -- 飛行性能
    V_opt = 220, -- 最適巡航速度 (m/s)
    V_take_off = 87, -- 起飛速度 (m/s)
    V_land = 72, -- 著陸速度 (m/s)
    V_max_sea_level = 408, -- 海平面最大持續速度 (m/s)
    V_max_h = 588.9, -- 高空最大速度 (m/s)
    Mach_max = 2.0, -- 最大馬赫數 (Mach)
    Vy_max = 250, -- 最大爬升率 (m/s)
    Ny_min = -3, -- 最小瞬時容許過載 (-G)
    Ny_max = 8, -- 最大瞬時容許過載 (+G)
    bank_angle_max = 60, -- 最大滾轉/橫滾角度 (度)
    range = 1500, -- 航程 (公里) [AI]

    -- 推力
    thrust_sum_max = 8054, -- 常規最大推力 (通常單位為 kgf 或 N，依專案慣例)
    thrust_sum_ab = 13160, -- 加力時最大推力 (kgf 或 N)
    has_afterburner = true, -- 是否配備加力燃燒器（布林）

    -- 阻力/雷達/紅外
    RCS = 4, -- 雷達散射截面 (m^2)
    radar_can_see_ground = true, -- 雷達是否能偵測地面/海面目標（布林）
    detection_range_max = 160, -- 感測或雷達最大探測距離 (km)
    IR_emission_coeff = 0.6, -- 紅外發射係數（常態，無單位）
    IR_emission_coeff_ab = 3.0, -- 紅外發射係數（加力時，無單位）

    -- 空中加油
    air_refuel_receptacle_pos = {-0.051, 0.911, 0.0}, -- 空中加油接收器位置 (x,y,z) (m)
    tanker_type = 1, -- 空中加油機分類（整數，DCS 定義）

    -- ===================== 起落架區 (Landing Gear) =====================
    tand_gear_max = 0.62487, -- 前輪轉向最大弧度 (rad)
    nose_gear_pos = {2.268, -2.021, 0}, -- 前輪位置 (x,y,z) (m)
    nose_gear_amortizer_direct_stroke = 0.0, -- 減震器伸展量 (m)
    nose_gear_amortizer_reversal_stroke = -0.244, -- 減震器收縮量 (m)
    nose_gear_amortizer_normal_weight_stroke = -0.146, -- 常重位置位移 (m)
    nose_gear_wheel_diameter = 0.4572, -- 前輪直徑 (m)

    main_gear_pos = {-1.803, -1.990, 1.094}, -- 主輪位置 (x,y,z) (m)
    main_gear_amortizer_direct_stroke = 0.0, -- 主輪減震伸展量 (m)
    main_gear_amortizer_reversal_stroke = -0.240, -- 主輪減震收縮量 (m)
    main_gear_amortizer_normal_weight_stroke = -0.144, -- 主輪正常負重位移 (m)
    main_gear_wheel_diameter = 0.70485, -- 主輪直徑 (m)

    nose_gear_door_close_after_retract = false,
    main_gear_door_close_after_retract = false,

    -- ===================== 引擎區 (Engine) =====================
    engines_count = 1, -- 引擎數量（整數）
    engines_nozzles = {
        [1] = {
            pos = {-6.003, 0.261, 0}, -- 噴嘴相對機體座標 (x,y,z) (m)
            elevation = 0, -- 噴嘴仰角 (度)
            diameter = 1.1, -- 噴嘴直徑 (m)
            exhaust_length_ab = 12, -- 加力噴焰視覺長度 (m)
            exhaust_length_ab_K = 0.76, -- 加力視覺縮放係數（無單位）
            smokiness_level = 0.05, -- 噴口冒煙程度（0-1 無單位）
            afterburner_circles_count = 11, -- 加力環的數量（整數）
            afterburner_circles_pos = {0.2, 0.8}, -- 加力環位置比例（相對座標或比例值）
            afterburner_circles_scale = 1.0, -- 加力環縮放係數（無單位）
            afterburner_effect_texture = "afterburner_generic"
        }
    },

    -- ===================== 武裝區 (Guns & Pylons) =====================
    -- 武裝區（分類說明）
    -- - 參考 F-16 的程式化 pylon 定義方式，適合大量武裝選項與共用清單。此處保留簡化版。
    -- - 若要 AI 能正確掛載任務武器，Pylons 與 ammo_type/Stores 應完整，否則 AI 可能不會在任務中使用武裝。 [AI]
    -- 這裡採程式化定義，參考 F-16C 的 pylon 整理；可視需求縮減或展平為單純 CLSID 清單
    -- 以下範例保留基本 Gun 與示意 Pylons（若不需要武裝可把 Pylons 設為 {} 或只保留 <CLEAN>）
    Guns = {gun_mount("M_61", {
        mixes = {{1}, {2}, {3}},
        count = 510
    }, {
        supply_position = {0.4, 0.55, 0.0},
        effects = {gatling_effect(351, 6), fire_effect(350), smoke_effect()}
    })},
    ammo_type_default = 1, -- 機砲彈藥類型預設索引（整數，對應 ammo_type 列表）
    ammo_type = {_("HEI-T High Explosive Incendiary-Tracer"), _("HEI High Explosive Incendiary"), _("AP Armor Piercing")},

    -- Pylons 範例（精簡版） [OPTIONAL]
    Pylons = { -- 每個 pylon 使用 pylon(index, ... ) helper，以下為示意
    -- 左外側
    pylon(1, 0, -2.2, 0.002, -4.739, -- pylon(index, ???, x, y, z)；位置單位為公尺 (m)
    {
        arg = 308,
        arg_value = 0,
        use_full_connector_position = true,
        connector = "Pylon1"
        -- arg = 控制參數編號 (整數)，arg_value 為初始數值（無單位）
    }, {
        -- 掛載
    }, 1), -- pylon 1 結束
    pylon(5, 0, -0.704, -1.173, 0.0, {
        arg = 312,
        arg_value = 0,
        use_full_connector_position = true,
        connector = "Pylon5",
        mass = 78.9
        -- mass = 掛載物對機體總質量的增量 (kg)
    }, {
        -- 掛載
    }, 6)},

    -- ===================== Countermeasures / Sensors 區 =====================
    passivCounterm = {
        CMDS_Edit = true, -- 是否允許在界面編輯 CMDS（布林）
        SingleChargeTotal = 120, -- 總彈藥量（chaff + flare 總和）(整數)
        chaff = {
            default = 60,
            increment = 30,
            chargeSz = 1
        }, -- chaff: 預設數量、增量、單次釋放數
        flare = {
            default = 60,
            increment = 30,
            chargeSz = 1
        } -- flare: 預設數量、增量、單次釋放數
    },

    Sensors = {
        RADAR = "AN/APG-68",
        RWR = "Abstract RWR"
    },

    -- ===================== 損傷 (Damage) - AI/遊戲邏輯重要 =====================
    -- Damage 定義告訴模擬器各區塊被擊中時的行為與臨界傷害，對 AI 生存與傷害判定影響甚大。 [AI]

    -- ===================== 任務與分類 (AI Tasks) =====================
    Tasks = {aircraft_task(CAP), aircraft_task(Escort), aircraft_task(FighterSweep), aircraft_task(Intercept),
             aircraft_task(CAS)},
    DefaultTask = aircraft_task(CAP),

    -- ===================== 損傷 (Damage) =====================
    Damage = verbose_to_dmg_properties({ -- 傷害分區配置（mapping 名稱->args/critical_damage）
        ["NOSE_CENTER"] = {
            args = {146},
            critical_damage = 3
        },
        ["COCKPIT"] = {
            args = {65},
            critical_damage = 6
        },
        ["WING_L_IN"] = {
            args = {225},
            critical_damage = 5
        },
        ["WING_R_IN"] = {
            args = {215},
            critical_damage = 5
        },
        ["ENGINE_C"] = {
            args = {160},
            critical_damage = 2
        },
        ["HOOK"] = {
            critical_damage = 2
        }
    }),

    DamageParts = {
        [1] = "F-CK-1C_oblomok_wing_R",
        [2] = "F-CK-1C_oblomok_wing_L"
    },

    -- ===================== 飛行模型 (SFM_Data) - 簡化版 =====================
    -- 注意：完整 SFM_Data 很敏感，如要穩定飛行建議複製或微調現成機種數值
    SFM_Data = {
        aerodynamics = {
            -- 基本氣動係數
            Cy0 = 0, -- 零升力迎角時的升力係數 (unitless)
            Mzalfa = 4.355, -- 迎角導數相關係數 (unitless)
            Mzalfadt = 0.8, -- 迎角率導數調整 (unitless)
            kjx = 2.75, -- 翼展/慣性調整係數 (unitless)
            kjz = 0.00125, -- 阻力/升力耦合係數 (unitless)
            Czbe = -0.016, -- 基線縱向力係數 (unitless)
            cx_gear = 0.0268, -- 起落架造成之阻力增量 (unitless)
            cx_flap = 0.05, -- 襟翼造成阻力 (unitless)
            cy_flap = 0.52, -- 襟翼升力增益 (unitless)
            cx_brk = 0.06, -- 煞車阻力 (unitless)
            -- table_data 為分段/速度表，陣列內每列常見欄位 (依 DCS 版本略有差異)：
            -- [Mach, Cx0? or Cx, Cy?, Cz?, some coefficients..., Refs]
            -- 下面數值採用 F-16/G16 參考值作為起始點（僅供 SFM 基準使用，實際欄位請根據目標 DCS 版本確認順序）
            table_data = {
                -- 範例行說明 (可能的欄位): {Mach, Cx, Cy, Cz, param4, param5, param6, param7}
                [1] = {0, 0.0165, 0.07, 0.132, 0.025, 0.5, 30, 1.45}, -- 低速（Mach 0） G-16 參考
                [8] = {1, 0.0707, 0.085, 0.1634, 0.1, 3.5, 24.6666, 1.12}, -- 亞音速接近音速（Mach 1） G-16 參考
                [20] = {3.9, 0.035, 0.033, 0.35, 6, 0.7, 9, 0.4} -- 高速（超音速區） G-16 參考
            }
        },
        engine = {
            type = "TurboFan", -- 引擎類型（字串）
            Nmg = 67.5, -- 轉速或扭矩相關參數 (unitless)
            Nominal_RPM = 14710.0, -- 額定轉速 (RPM)
            Nominal_Fan_RPM = 8215.0, -- 風扇額定轉速 (RPM)
            Startup_Prework = 10.0, -- 引擎啟動預作時間 (s)
            Startup_Duration = 35.0, -- 引擎啟動持續時間 (s)
            Shutdown_Duration = 19.0, -- 引擎關閉時長 (s)
            MinRUD = 0, -- 推力桿最小值 (fraction 0-1)
            MaxRUD = 1, -- 推力桿最大值 (fraction 0-1)
            MaksRUD = 0.85, -- 最大安全 RUD（fraction）
            ForsRUD = 0.91, -- 加力開啟比值（fraction）
            hMaxEng = 19, -- 引擎操作最大高度 (km)
            dcx_eng = 0.0144, -- 引擎造成之阻力係數 (unitless)
            cemax = 1.24, -- 引擎效率最大值 (unitless)
            cefor = 2.56, -- 加力效率係數 (unitless)
            dpdh_m = 6200, -- 引擎壓力參數 m (Pa? project-specific)
            dpdh_f = 13000, -- 引擎壓力參數 f
            -- table_data 為推力或功率表：常見欄位範例 {RUD_fraction, thrust_n? , power?}
            -- 以下數值以 F-16/G16 參考作為起始值（請根據實際 DCS 引擎表格欄位對應調整）
            table_data = {
                [1] = {0, 77000, 108313.6}, -- 低推力（Idle）
                [8] = {1, 109000, 218000}, -- 最大推力（乾/非加力）
                [17] = {3.9, 25000, 120636.4} -- 其他點，保留作為參考
            }
        }
    },

    -- ===================== 燈光、效果、網路同步等 (Visual & Net) =====================
    lights_data = {
        typename = "collection",
        lights = {
            [WOLALIGHT_STROBES] = {
                typename = "collection",
                lights = {}
            },
            [WOLALIGHT_LANDING_LIGHTS] = {
                typename = "collection",
                lights = {}
            }
        }
    },

    net_animation = {25, 78, 274, 275, 799, 39, 99, 533, 459},

    fires_pos = {
        [1] = {-0.707, 0.553, -0.213},
        [2] = {-0.037, 0.285, 1.391},
        [3] = {-0.037, 0.285, -1.391},
        [8] = {-5.003, 0.261, 0}
    },

    -- effects_presets = {{
    --     effect = "OVERWING_VAPOR",
    --     file = current_mod_path .. "/Effects/F-CK-1C_overwingVapor.lua"
    -- }},

    chaff_flare_dispenser = {
        [1] = {
            dir = {0, -1, 0},
            pos = {-3.65, -0.5, -0.93}
        },
        [2] = {
            dir = {0, -1, 0},
            pos = {-3.91, -0.5, -0.93}
        }
    },

    -- 以下為從 A-4E 參考來的可選欄位，對 AI 或伺服器測試常有用：
    -- 若不需要可刪除或註解。
    stores_number = 5, -- 掛載點數量 (整數，供 AI/配置介面參考)
    average_fuel_consumption = 0.86, -- 平均油耗 (TSFC 或專案約定單位，unitless)
    is_tanker = false, -- 是否為加油機 (布林)
    launch_bar_connected_arg_value = 0.87, -- 發射吊架連接顯示參數 (arg value，用於載具 UI)
    sounderName = "Aircraft/Planes/F-CK-1C", -- 聲音資源路徑/名稱（字串，非必需但常見）
    -- 機艙視角限制 (AI 使用或視角約束)
    CanopyGeometry = {
        elevation = {-50.0, 90.0}
    },
    -- 通訊設定（常用常數 MODULATION_AM 由環境提供）
    HumanRadio = {
        modulation = MODULATION_AM
    },
    panelRadio = {}, -- 面板/無線電設定佔位 (可填具體表格)
    -- 跑道分類/起降分類 (可由地圖/AI 使用)
    LandRWCategories = {},
    TakeOffRWCategories = {},
    -- Failures 與簡單的 Countermeasures / ECM 入口
    Failures = {},
    Countermeasures = {
        ECM = "AN/ALQ-126"
    }, -- 簡單 ECM 欄位參考（字串）

    -- ===================== 其他可選屬性（UI、玩家專屬） =====================
    AddPropAircraft = {{
        id = "HelmetMountedDevice",
        control = 'comboList',
        label = _('Helmet Mounted Device'),
        values = {{
            id = 0,
            dispName = _('Not installed'),
            value = 0.5
        }, {
            id = 1,
            dispName = _('JHMCS'),
            value = 0.0
        }, {
            id = 2,
            dispName = _('NVG'),
            value = 1.0
        }},
        defValue = 1,
        wCtrl = 150,
        playerOnly = true,
        arg = 509
    }}

    -- 如需 datalink，填寫 connectDatalinks / datalinks
    -- 本機版本未包含 datalinks，先註解以避免載入錯誤；若要啟用，請把下面兩行取消註解並確保檔案存在。
    -- connectDatalinks = {"Link16"},
    -- datalinks = { Link16 = "CoreMods\\aircraft\\F-CK-1C\\Datalinks\\Link16.lua" }

}

-- 註：add_aircraft 為 DCS 提供之函數，用於註冊機體
add_aircraft(F_CK_1C)

