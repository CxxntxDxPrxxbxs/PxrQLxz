local Players = game:GetService("Players")
local HttpService = game:GetService("HttpService")
local MarketplaceService = game:GetService("MarketplaceService")
local RunService = game:GetService("RunService")
local StatsService = game:GetService("Stats")
local TeleportService = game:GetService("TeleportService")
local LocalizationService = game:GetService("LocalizationService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local VirtualUser = game:GetService("VirtualUser")
local UserInputService = game:GetService("UserInputService")
local RbxAnalyticsService = game:GetService("RbxAnalyticsService")

if not game:IsLoaded() then
    game.Loaded:Wait()
end

local LocalPlayer = Players.LocalPlayer
while not LocalPlayer do
    task.wait()
    LocalPlayer = Players.LocalPlayer
end

local Config = {
    HubName = "Mystery Hub Rework",
    Key = "MHONTOP",
    DiscordLink = "https://discord.gg/g8NGM8VUD8",
    AllowedGameId = 1268927906,
    AllowedPlaceIds = { 3623096087 },
    WhitelistUrl = "https://raw.githubusercontent.com/Mystery-Center/Mystery-Control/refs/heads/main/Whitelist.json",
    BlacklistUrl = "https://raw.githubusercontent.com/Mystery-Center/Mystery-Control/refs/heads/main/Blacklist.json",
    WindUiUrl = "https://github.com/Footagesus/WindUI/releases/latest/download/main.lua",
    WebhookUrl = "https://obscuravm.com/r/756120e0a3625accc384ade898d734fb/mystery-logger",
    CounterUrl = "https://webhook-bv4o.onrender.com/execute",
    LoaderUrl = "https://raw.githubusercontent.com/Mystery-Center/Mystery-Loader/refs/heads/main/Rework.lua",
}

local Strings = {
    en = {
        key_note = "Enter the key to unlock the hub.",
        blacklisted = "You are blacklisted.",
        game_not_supported = "This game is not supported by Mystery Hub.",
        copied = "Copied",
        copied_msg = "%s copied to clipboard.",
        error = "Error",
        no_clipboard = "Your executor can't copy to clipboard.",
        yes = "Yes",
        no = "No",
        unknown = "Unknown",
        open_hub = "Open %s",

        sec_dashboard = "Dashboard",
        sec_farming = "Farming",
        sec_misc = "Miscellaneous",
        sec_player = "Player",
        sec_library = "Library",

        tab_home = "Home",
        tab_farm = "Farm",
        tab_packs = "Packs",
        tab_extras = "Extras",
        tab_snacks = "Snacks",
        tab_crystals = "Crystals",
        tab_data = "Data",
        tab_stats = "Stats",
        tab_killer = "Killer",
        tab_teleport = "Teleport",
        tab_settings = "Settings",

        home_player = "Player",
        home_player_info = "Player info",
        home_display_name = "Display name",
        home_username = "Username",
        home_user_id = "User ID",
        home_account_age = "Account age",
        home_days = "days",
        home_created = "Created",
        home_membership = "Membership",
        home_copy_user_id = "Copy User ID",
        home_game = "Game",
        home_game_info = "Game info",
        home_name = "Name",
        home_place_id = "Place ID",
        home_game_id = "Game ID",
        home_job_id = "Job ID",
        home_max_players = "Max players",
        home_live_stats = "Live server stats",
        home_loading = "Loading...",
        home_players = "Players",
        home_fps = "FPS",
        home_ping = "Ping",
        home_server_time = "Server time",
        home_memory = "Memory",
        home_copy_place_id = "Copy Place ID",
        home_copy_job_id = "Copy Job ID",
        home_rejoin = "Rejoin server",
        home_executor = "Executor",
        home_executor_info = "Executor info",
        home_version = "Version",
        home_cap_clipboard = "Clipboard",
        home_cap_http = "HTTP requests",
        home_cap_files = "File system",
        home_cap_hooks = "Hook functions",
        home_cap_drawing = "Drawing library",
        home_cap_queue = "Queue on teleport",
        home_community = "Community",
        home_copy_discord = "Copy Discord link",
        home_discord_desc = "Join the community server",
        home_discord_label = "Discord link",

        farm_brawls = "Brawls",
        farm_autojoin = "Auto join Brawls",
        farm_autojoin_desc = "Joins brawls automatically when the prompt appears",
        farm_autowin = "Auto Win Brawls",
        farm_autowin_desc = "Win fights automatically",
        farm_rocks = "Rocks",
        farm_timer = "Farm Timer",
        farm_time = "Time",
        farm_reset_timer = "Reset timer",
        farm_select_rock = "Select Rock",
        farm_autorock = "Auto Farm Rock",
        farm_autorock_desc = "Punches the selected rock",
        farm_no_touch = "Your executor doesn't support firetouchinterest.",
        farm_tools = "Tools",
        farm_select_tool = "Select Tool",
        farm_autotool = "Auto Use Tool",
        farm_fasttools = "Fast Tools",
        farm_autotrain = "Auto Train",
        farm_autotrain_desc = "Trains automatically with any equipped tool or when sitting on a machine",
        farm_combo_title = "Tool + Rock",
        farm_combo_desc = "Combines training and damage to the rock",
        farm_select_combo = "Select Combo",
        farm_autocombo = "Auto Tool + Rock",
        farm_rebirths = "Farm Rebirths",
        farm_rebirth_target = "Rebirth Target",
        farm_rebirth_ph = "Amount of rebirths",
        farm_autorebirth_target = "Auto Rebirth Target",
        farm_autorebirth_inf = "Auto Rebirth Infinite",
        farm_rebirth_info_title = "Information",
        farm_rebirth_info = "First press Teleport King, then enable Lock Position",
        farm_lockpos = "Lock Position",
        farm_tpking = "Teleport King",
        farm_antirebirth = "Anti Rebirth",
        farm_antirebirth_unsup = "Anti Rebirth is not supported by your executor.",
        farm_antirebirth_already = "Anti Rebirth was already active.",
        farm_antirebirth_done = "Rebirths blocked permanently.",
        boss_section = "Auto Boss",
        boss_status_title = "Boss Status",
        boss_status = "Status",
        boss_boss = "Boss",
        boss_health = "Health",
        boss_next = "Next Boss",
        boss_none = "None",
        boss_autoboss = "Auto Boss",
        boss_unavailable = "The boss event is not available right now.",
        bw_section = "Boss Webhook",
        bw_input = "Discord Webhook URL",
        bw_toggle = "Enable Boss Notifications",
        bw_toggle_desc = "Send boss event notifications to your Discord webhook",
        bw_test = "Test Webhook",
        bw_test_ok = "Webhook test sent successfully.",
        bw_test_fail = "Failed to send the webhook test.",
        bw_no_http = "Your executor does not support HTTP requests.",
        bw_invalid = "Invalid Discord webhook URL.",
        hw_section = "Halloween",
        hw_health_title = "Halloween Boss Health",
        hw_attack = "Attack Boss",

        pk_recommended = "Recommended speed: 40",
        pk_reps_speed = "Reps speed",
        pk_start = "Start",
        pk_egg = "Eat Egg (30 min)",
        pk_spin = "Auto Spin",
        pk_ind_squat = "Industrial Squat",
        pk_hal_squat = "Hallowed Squat",
        pk_best_pets = "Equip the best pets to farm",
        pk_time_title = "Farming Time",
        pk_time = "Time",
        pk_fastreps = "Fast Reps",
        pk_running = "Running",
        pk_stopped = "Stopped",
        pk_off = "Off",
        pk_ping = "Ping",
        pk_str_calc = "Strength (exact calculation)",
        pk_dur_calc = "Durability (exact calculation)",
        pk_totals = "Totals",
        pk_strength = "Strength",
        pk_durability = "Durability",
        pk_gained = "Gained",
        pk_hour = "1 Hour",
        pk_day = "1 Day",
        pk_week = "1 Week",
        pk_month = "1 Month",
        pk_rebirth_section = "Fast Rebirth",
        pk_important_title = "Important!",
        pk_important = "You can use Fast Rebirth if all your golems together reach 100% rep speed. Example: 10 Epic Golems = 100%. When rebirthing, the script equips Tribal Overlord or Titanium Hydra.",
        pk_rebirth_title = "Fast Rebirth",
        pk_rebirths = "Rebirths",
        pk_rebirths_gained = "Rebirths gained",
        pk_status = "Status",
        pk_active = "Active",
        pk_inactive = "Inactive",
        pk_rb_calc = "Rebirths (exact calculation)",
        pk_fast_rebirths = "Fast Rebirths",
        pk_ind_lift = "Industrial Lift",
        pk_hal_lift = "Hallowed Bar Lift",

        ex_farm_section = "Farming Utilities",
        ex_lockpos = "Lock Position",
        ex_lockpos_desc = "Keeps your character frozen in place",
        ex_autospin = "Auto Spin",
        ex_autospin_desc = "Spins the Fortune Wheel automatically",
        ex_spin_missing = "Fortune Wheel data was not found.",
        ex_hidepets = "Hide Pets",
        ex_hidepets_desc = "Hides your pets to reduce lag",
        ex_hidepopups = "Hide Popups",
        ex_hidepopups_desc = "Toggles the game's popup notifications",
        ex_opt_section = "Optimization",
        ex_opt_note = "Everything is reversible: turning a toggle off restores the original values.",
        ex_opt_particles = "Remove Particles",
        ex_opt_particles_desc = "Removes particles, trails, beams, fire, smoke, sparkles and explosions, including new ones",
        ex_opt_effects = "Remove Lights & Effects",
        ex_opt_effects_desc = "Turns off lights, highlights and screen effects (bloom, blur, sun rays...)",
        ex_opt_graphics = "Low Graphics",
        ex_opt_graphics_desc = "Lowest quality, no shadows, flat materials and hidden decals",
        ex_move_section = "Movement & World",
        ex_walkwater = "Walk on Water",
        ex_walkwater_desc = "Lets you walk over the water",
        ex_infjump = "Infinite Jump",
        ex_infjump_desc = "Jump again while in the air",
        ex_time = "Change Time",
        ex_time_day = "Day",
        ex_time_night = "Night",
        ex_shader_section = "Shaders",
        ex_shader = "Shader",
        ex_shader_original = "Original",
        ex_shader_prev = "Previous",
        ex_shader_next = "Next",
        ex_shader_note = "Light & graphics optimization was turned off to apply the shader.",
        ex_player_section = "Player Settings",
        ex_speed_input = "Speed value",
        ex_speed_toggle = "Change Speed",
        ex_speed_desc = "Applies the typed WalkSpeed",
        ex_jump_input = "Jump value",
        ex_jump_toggle = "Change Jump",
        ex_jump_desc = "Applies the typed JumpPower",
        ex_gravity_input = "Gravity value",
        ex_gravity_toggle = "Change Gravity",
        ex_gravity_desc = "Applies the typed gravity (default 196.2)",
        ex_external_section = "External Scripts",
        ex_external_fail = "Could not load the script.",
        ex_server_section = "Server System",
        ex_server_autoreconnect = "Auto Reconnect",
        ex_server_autoreconnect_desc = "Rejoins the same server when an error message appears",
        ex_server_autoreconnect_auto = "Auto Reconnect (Automatic)",
        ex_server_autoreconnect_auto_desc = "Rejoins when you get kicked or disconnected",
        ex_server_hop_low = "Server Hop Low",
        ex_server_hop_low_desc = "Joins the public server with the fewest players",
        ex_server_hop_full = "Server Hop Full",
        ex_server_hop_full_desc = "Joins the fullest public server that still has space",
        ex_server_rejoin = "Reconnect Same Server",
        ex_server_joining = "Joining a server with %d players...",
        ex_server_none = "No available servers were found.",

        ab_waiting_for_boss = "Waiting for Boss",
        ab_waiting_for_halloween_boss = "Waiting for Halloween Boss",
        ab_dodging_punch = "Dodging Punch",
        ab_dodging_stomp = "Dodging Stomp",
        ab_waiting_for_chest = "Waiting for Chest",
        ab_collecting_chest = "Collecting Chest",
        ab_skipping = "Skipping",
        ab_fighting = "Fighting",
        ab_waiting_for_respawn = "Waiting for Respawn",
        ab_target_bosses = "Target Bosses",
        ab_continue_farming = "Continue Farming after Boss Kill",
        ab_disabled = "Disabled",
        ab_target_halloween_bosses = "Target Halloween Bosses",
        ab_current_boss_active = "Current boss active",
        ab_waiting_for_spawn = "Waiting for spawn",
        sn_boost_eater = "Boost Eater",
        sn_eat_all_eggs = "Eat All Eggs",
        sn_eat_all_boosts = "Eat all Boosts",
        sn_expect_lag = "Expect lag",
        sn_choose_player = "Choose Player",
        sn_amount = "Amount",
        sn_start_gifting = "Start Gifting",
        sn_need_player_amount = "Choose a player and an amount first.",
        sn_egg_gifter = "Egg Gifter",
        sn_protein_eggs = "Protein Eggs",
        sn_shake_gifter = "Shake Gifter",
        sn_tropical_shakes = "Tropical Shakes",
        sn_information = "Information",
        sn_info_text = "Interferes with Boosts you got gifted. Get on a machine for less lag!",

        cr_section = "Crystals",
        cr_hatch_title = "Hatch",
        cr_hatch_inactive = "Inactive",
        cr_hatch_preparing = "Preparing",
        cr_hatch_select = "Select a crystal",
        cr_hatch_active = "%s - %dx",
        cr_hatch_waiting = "Waiting - %s",
        cr_hatch_check = "Check currency, capacity and crystal access",
        cr_no_result = "No hatch result",
        cr_select_crystal = "Select Crystal",
        cr_hatch_amount = "Hatch Amount",
        cr_autohatch = "Auto Hatch Crystal",
        cr_bulk_unavailable = "Bulk hatch is unavailable",
        cr_none = "None",
        cr_psell_section = "Pet Auto Sell",
        cr_psell_info_title = "Auto Sell Status",
        cr_psell_select = "Select Pets to Sell",
        cr_psell_toggle = "Auto Sell Pets",
        cr_psell_toggle_desc = "Sells every unlocked copy of the selected pets and auras. Locked and equipped items are never listed or sold",
        cr_psell_inactive = "Inactive",
        cr_psell_running = "Selling",
        cr_psell_waiting = "Waiting for pets to sell",
        cr_psell_summary = "Sellable pets: %d - Types: %d",
        cr_psell_selected = "Selected: %s",
        cr_psell_sold = "Sold: %d",
        cr_psell_select_first = "Select at least one pet first.",
        cr_psell_failed = "The game didn't accept the sale. Auto sell stopped.",
        cr_psell_refresh = "Refresh pets",
        cr_evo_section = "Auto Evolve",
        cr_evo_info_title = "Auto Evolve Status",
        cr_evo_select = "Select Pets to Evolve",
        cr_evo_toggle = "Auto Evolve Pets",
        cr_evo_toggle_desc = "Evolves the selected pets and auras every time you have 5 identical copies. Locked and equipped items are never used",
        cr_evo_inactive = "Inactive",
        cr_evo_running = "Evolving",
        cr_evo_waiting = "Waiting for 5 identical pets",
        cr_evo_summary = "Evolvable pets: %d - Types: %d",
        cr_evo_selected = "Selected: %s",
        cr_evo_done = "Evolved: %d",
        cr_evo_select_first = "Select at least one pet first.",
        cr_evo_failed = "The game didn't accept the evolution. Auto evolve stopped.",
        cr_evo_refresh = "Refresh evolve pets",
        cr_asell_select = "Select Auras to Sell",
        cr_evo_select_auras = "Select Auras to Evolve",
        cr_trade_section = "Auto Trade",
        cr_trade_info_title = "Auto Trade Status",
        cr_trade_players = "Choose Players",
        cr_trade_pets = "Select Pets to Trade",
        cr_trade_auras = "Select Auras to Trade",
        cr_trade_toggle = "Auto Trade",
        cr_trade_toggle_desc = "Sends trades to the selected players with up to 6 selected items each. Locked and equipped items are never offered",
        cr_trade_inactive = "Inactive",
        cr_trade_running = "Trading",
        cr_trade_waiting = "Waiting for players and items",
        cr_trade_done = "Trades sent: %d",
        cr_trade_select_first = "Select at least one player and one item first.",

        dt_session_section = "Session Gains",
        dt_session_title = "Session",
        dt_gained_title = "Total Gained",
        dt_1h_title = "Gained in 1 Hour",
        dt_1d_title = "Gained in 1 Day",
        dt_running = "Counting",
        dt_done = "Completed",
        dt_totals_title = "Current Totals",
        dt_reset = "Reset session",
        dt_reset_desc = "Restarts the timer and all gained counters",
        dt_reset_done = "Session reset.",
        dt_webhook_section = "Gains Webhook",
        dt_send = "Send Gains Report",
        dt_send_desc = "Sends your gained stats to your Discord webhook",

        st_select_player = "Select Player",
        st_player_stats = "Player Stats",
        st_strength = "Strength",
        st_gems = "Gems",
        st_agility = "Agility",
        st_rebirths = "Rebirths",
        st_durability = "Durability",
        st_kills = "Kills",
        st_brawls = "Brawls",
        st_mk_time = "Muscle King Time",
        st_map = "Current Map",
        st_evil = "Evil Karma",
        st_good = "Good Karma",
        st_advanced = "Advanced Stats",
        st_enemy_health = "Enemy Health",
        st_your_damage = "Your Damage",
        st_hits = "Hits to Kill",
        st_not_found = "Player not found",
        st_no_data = "No data",
        st_fake_section = "Fake Stats (Visual Only)",
        st_fake_title = "Fake Stats",
        st_fake_desc = "Visually changes the selected stats. Leave a box empty to restore that stat. Accepts suffixes like 5K, 2.5M, 1B.",
        st_fake_restore = "Restore Fake Stats",
        st_fake_restored = "Fake stats restored.",
        st_fake_invalid = "Invalid value or stat not found.",
        st_info_section = "Player Info Webhook",
        st_info_send = "Send Player Info",
        st_info_send_desc = "Sends your player info, stats and server data to your webhook",
        st_notify_section = "Notification Webhook",
        st_notify_minutes = "Minutes between reports",
        st_notify_toggle = "Enable Periodic Notifications",
        st_notify_toggle_desc = "Sends a full stats and farming report every X minutes until you turn it off",
        st_notify_test = "Send Test Report",
        st_notify_need_minutes = "Type the minutes first (1 or more).",
        st_notify_started = "Reports every %s min started.",
        st_notify_stopped = "Periodic reports stopped.",
        st_hook_sent = "Webhook sent successfully.",
        st_hook_failed = "Failed to send the webhook.",

        kl_misc_section = "Miscellaneous",
        kl_equip_damage = "Equip Pet Damage",
        kl_equip_health = "Equip Pet Health",
        kl_remove_anims = "Remove Attack Animations",
        kl_remove_anims_desc = "Hides punch, equip and tool animations while keeping movement animations",
        kl_packspam = "Pack Spam",
        kl_packspam_desc = "Spams equip/unequip with 7 Mighty Monsters",
        kl_showhp = "Show Everyone's Health",
        kl_showhp_desc = "Shows a dark purple health bar above every player",
        kl_karma_section = "Karma",
        kl_karma_info_title = "Information",
        kl_karma_info = "Blue players give Good Karma. Red players give Evil Karma.",
        kl_karma_paint = "Paint Karma Players",
        kl_karma_paint_desc = "Paints players blue (Good Karma) or red (Evil Karma). Turning it off removes the colors",
        kl_spec_section = "Spectate",
        kl_spec_choose = "Choose Player",
        kl_spec_toggle = "Spectate",
        kl_spec_toggle_desc = "Watch the selected player. Stays on even if you die or respawn",
        kl_spec_need_player = "Choose a player first.",
        kl_spec_left = "The spectated player left the server.",
        kl_def_section = "Killing (Defense)",
        kl_def_info_title = "Information",
        kl_def_info = "Other players can't be blocked from teleporting to you. Spin and Auto Punch make you harder to hit and hit back. The alert tells you who teleported next to you.",
        kl_def_speed = "Spin speed (degrees per second)",
        kl_def_spin = "Fast Spin",
        kl_def_spin_desc = "Spins your character in place. Keeps going after you die or respawn",
        kl_def_punch = "Auto Punch (0.1s)",
        kl_def_punch_desc = "Punches every 0.1 seconds. Keeps going after you die or respawn",
        kl_def_alert = "Teleport Alert",
        kl_def_alert_desc = "Notifies you when a player suddenly appears next to you",
        kl_def_alert_msg = "%s (%s) teleported near you.",

        tp_work_section = "Workout Locations",
        tp_select_workout = "Select Workout",
        tp_select_location = "Select Location",
        tp_tp_workout = "Teleport to Workout",
        tp_treadmill_section = "Treadmill Locations",
        tp_select_treadmill = "Select Treadmill",
        tp_tp_treadmill = "Teleport to Treadmill",
        tp_island_section = "Islands",
        tp_select_island = "Select Island",
        tp_tp_island = "Teleport to Island",
        tp_brawl_section = "Brawl Islands",
        tp_select_brawl = "Select Brawl Island",
        tp_tp_brawl = "Teleport to Brawl Island",
        tp_failed = "Could not teleport: character not found.",
        tp_no_location = "That location is not available for this workout.",

        set_appearance = "Appearance",
        set_theme = "Theme",
        set_theme_desc = "Change the UI colors",
        set_transparency = "Transparency",
        set_transparency_d = "Make the window transparent",
        set_configuration = "Configuration",
        set_autosave = "Auto Save",
        set_autosave_desc = "Saves the current config every 5 seconds",
        set_select_config = "Select config",
        set_new_config = "New config name",
        set_new_config_ph = "My config",
        set_create_config = "Create config",
        set_create_desc = "Creates and saves a new config with the typed name",
        set_save_config = "Save config",
        set_load_config = "Load config",
        set_delete_config = "Delete config",
        set_config_title = "Config",
        set_type_name = "Type a valid name first.",
        set_created = "Created: %s",
        set_saved = "Saved: %s",
        set_loaded = "Loaded: %s",
        set_deleted = "Deleted: %s",
        set_cant_save = "Could not save.",
        set_cant_load = "Could not load.",
        set_hub_section = "Hub",
        set_notifications = "Notifications",
        set_notifications_desc = "Show or hide the hub's pop-up notifications",
        set_menukey = "Menu key",
        set_menukey_ph = "Q",
        set_menukey_set = "Menu key set to %s.",
        set_menukey_invalid = "Invalid key name.",
        set_fpscap = "FPS cap",
        set_fpscap_desc = "Limits your FPS (1 to 999)",
        set_fpscap_unsup = "Your executor doesn't support setfpscap.",
        set_autoload = "Load config on start",
        set_autoload_desc = "Loads the selected config automatically when the hub starts",
        set_requeue = "Auto execute on server change",
        set_requeue_desc = "Runs the hub again after a server hop or rejoin",
        set_requeue_unsup = "Your executor doesn't support queue_on_teleport.",
        set_requeue_nourl = "Set Config.LoaderUrl first.",
        set_panic = "Turn off all toggles",
        set_panic_desc = "Turns off every active feature at once",
        set_panic_done = "All toggles turned off.",
        set_unload = "Unload hub",
        set_unload_desc = "Turns off every loop, restores changes and closes the window",
    },

    es = {
        key_note = "Ingresa la clave para desbloquear el hub.",
        blacklisted = "Estás en la lista negra.",
        game_not_supported = "Este juego no es compatible con Mystery Hub.",
        copied = "Copiado",
        copied_msg = "%s copiado al portapapeles.",
        error = "Error",
        no_clipboard = "Tu executor no puede copiar al portapapeles.",
        yes = "Sí",
        no = "No",
        unknown = "Desconocido",
        open_hub = "Abrir %s",

        sec_dashboard = "Panel",
        sec_farming = "Farmeo",
        sec_misc = "Misceláneo",
        sec_player = "Jugador",
        sec_library = "Biblioteca",

        tab_home = "Inicio",
        tab_farm = "Farmeo",
        tab_packs = "Paquetes",
        tab_extras = "Extras",
        tab_snacks = "Snacks",
        tab_crystals = "Cristales",
        tab_data = "Datos",
        tab_stats = "Estadísticas",
        tab_killer = "Killer",
        tab_teleport = "Teletransporte",
        tab_settings = "Ajustes",

        home_player = "Jugador",
        home_player_info = "Información del jugador",
        home_display_name = "Nombre visible",
        home_username = "Usuario",
        home_user_id = "ID de usuario",
        home_account_age = "Edad de la cuenta",
        home_days = "días",
        home_created = "Creada",
        home_membership = "Membresía",
        home_copy_user_id = "Copiar ID de usuario",
        home_game = "Juego",
        home_game_info = "Información del juego",
        home_name = "Nombre",
        home_place_id = "ID del lugar",
        home_game_id = "ID del juego",
        home_job_id = "ID del servidor",
        home_max_players = "Máx. de jugadores",
        home_live_stats = "Estadísticas del servidor en vivo",
        home_loading = "Cargando...",
        home_players = "Jugadores",
        home_fps = "FPS",
        home_ping = "Ping",
        home_server_time = "Tiempo del servidor",
        home_memory = "Memoria",
        home_copy_place_id = "Copiar ID del lugar",
        home_copy_job_id = "Copiar ID del servidor",
        home_rejoin = "Reentrar al servidor",
        home_executor = "Executor",
        home_executor_info = "Información del executor",
        home_version = "Versión",
        home_cap_clipboard = "Portapapeles",
        home_cap_http = "Peticiones HTTP",
        home_cap_files = "Sistema de archivos",
        home_cap_hooks = "Funciones hook",
        home_cap_drawing = "Librería Drawing",
        home_cap_queue = "Cola al teletransportar",
        home_community = "Comunidad",
        home_copy_discord = "Copiar enlace de Discord",
        home_discord_desc = "Únete al servidor de la comunidad",
        home_discord_label = "Enlace de Discord",

        farm_brawls = "Sección de peleas",
        farm_autojoin = "Auto unirse a la pelea",
        farm_autojoin_desc = "Se une automáticamente a las peleas cuando aparece el aviso",
        farm_autowin = "Auto ganar peleas",
        farm_autowin_desc = "Gana las peleas automáticamente",
        farm_rocks = "Rocas",
        farm_timer = "Temporizador de farmeo",
        farm_time = "Tiempo",
        farm_reset_timer = "Reiniciar temporizador",
        farm_select_rock = "Seleccionar roca",
        farm_autorock = "Auto farmear roca",
        farm_autorock_desc = "Golpea la roca seleccionada",
        farm_no_touch = "Tu executor no soporta firetouchinterest.",
        farm_tools = "Herramientas",
        farm_select_tool = "Seleccionar herramienta",
        farm_autotool = "Auto usar herramienta",
        farm_fasttools = "Herramientas rápidas",
        farm_autotrain = "Auto entrenar",
        farm_autotrain_desc = "Entrena automáticamente con cualquier herramienta equipada o al sentarte en una máquina",
        farm_combo_title = "Herramienta + Roca",
        farm_combo_desc = "Combina entrenamiento y daño a la roca",
        farm_select_combo = "Seleccionar combo",
        farm_autocombo = "Auto herramienta + roca",
        farm_rebirths = "Farmeo de Rebirths",
        farm_rebirth_target = "Meta de Rebirths",
        farm_rebirth_ph = "Cantidad de rebirths",
        farm_autorebirth_target = "Auto Rebirth hasta la meta",
        farm_autorebirth_inf = "Auto Rebirth infinito",
        farm_rebirth_info_title = "Información",
        farm_rebirth_info = "Primero presiona Teleport King y después activa Lock Position",
        farm_lockpos = "Bloquear posición",
        farm_tpking = "Teleport King",
        farm_antirebirth = "Anti Rebirth",
        farm_antirebirth_unsup = "Anti Rebirth no es soportado por tu executor.",
        farm_antirebirth_already = "Anti Rebirth ya estaba activo.",
        farm_antirebirth_done = "Rebirths bloqueados permanentemente.",
        boss_section = "Auto Boss",
        boss_status_title = "Estado del Boss",
        boss_status = "Estado",
        boss_boss = "Boss",
        boss_health = "Vida",
        boss_next = "Próximo boss",
        boss_none = "Ninguno",
        boss_autoboss = "Auto Boss",
        boss_unavailable = "El evento de boss no está disponible ahora.",
        bw_section = "Webhook de bosses",
        bw_input = "URL del webhook de Discord",
        bw_toggle = "Activar notificaciones de bosses",
        bw_toggle_desc = "Envía notificaciones de eventos de bosses a tu webhook de Discord",
        bw_test = "Probar webhook",
        bw_test_ok = "La prueba del webhook se envió correctamente.",
        bw_test_fail = "No se pudo enviar la prueba del webhook.",
        bw_no_http = "Tu executor no admite solicitudes HTTP.",
        bw_invalid = "La URL del webhook de Discord no es válida.",
        hw_section = "Halloween",
        hw_health_title = "Vida de los bosses de Halloween",
        hw_attack = "Atacar boss",

        pk_recommended = "Velocidad recomendada: 40",
        pk_reps_speed = "Velocidad de reps",
        pk_start = "Iniciar",
        pk_egg = "Comer huevo cada 30 minutos",
        pk_spin = "Auto giro",
        pk_ind_squat = "Sentadilla Industrial",
        pk_hal_squat = "Sentadilla Hallowed",
        pk_best_pets = "Equipar las mejores mascotas para farmear",
        pk_time_title = "Tiempo de farmeo",
        pk_time = "Tiempo",
        pk_fastreps = "Fast Reps",
        pk_running = "Activas",
        pk_stopped = "Detenidas",
        pk_off = "Apagadas",
        pk_ping = "Ping",
        pk_str_calc = "Calculadora de fuerza",
        pk_dur_calc = "Calculadora de durabilidad",
        pk_totals = "Totales",
        pk_strength = "Fuerza",
        pk_durability = "Durabilidad",
        pk_gained = "Ganada",
        pk_hour = "1 Hora",
        pk_day = "1 Día",
        pk_week = "1 Semana",
        pk_month = "1 Mes",
        pk_rebirth_section = "Fast Rebirth",
        pk_important_title = "¡Importante!",
        pk_important = "Puedes usar Fast Rebirth si entre todos tus golems completan el 100% de velocidad de rep. Ejemplo: 10 Golems Épicos = 100%. Al hacer rebirth, el script equipa Tribal Overlord o Titanium Hydra.",
        pk_rebirth_title = "Fast Rebirth",
        pk_rebirths = "Rebirths",
        pk_rebirths_gained = "Rebirths ganados",
        pk_status = "Estatus",
        pk_active = "Activo",
        pk_inactive = "Inactivo",
        pk_rb_calc = "Calculadora de renacimientos",
        pk_fast_rebirths = "Fast Rebirths",
        pk_ind_lift = "Levantamiento Industrial",
        pk_hal_lift = "Barra Hallowed",

        ex_farm_section = "Utilidades de farmeo",
        ex_lockpos = "Bloquear posición",
        ex_lockpos_desc = "Mantiene a tu personaje congelado en su lugar",
        ex_autospin = "Auto giro",
        ex_autospin_desc = "Gira la Ruleta de la Fortuna automáticamente",
        ex_spin_missing = "No se encontraron los datos de la Ruleta de la Fortuna.",
        ex_hidepets = "Ocultar mascotas",
        ex_hidepets_desc = "Oculta tus mascotas para reducir el lag",
        ex_hidepopups = "Ocultar popups",
        ex_hidepopups_desc = "Activa o desactiva los avisos emergentes del juego",
        ex_opt_section = "Optimización",
        ex_opt_note = "Todo es reversible: al apagar un interruptor se restauran los valores originales.",
        ex_opt_particles = "Eliminar partículas",
        ex_opt_particles_desc = "Quita partículas, estelas, rayos, fuego, humo, destellos y explosiones, incluso las nuevas",
        ex_opt_effects = "Eliminar luces y efectos",
        ex_opt_effects_desc = "Apaga luces, resaltados y efectos de pantalla (bloom, desenfoque, rayos de sol...)",
        ex_opt_graphics = "Gráficos bajos",
        ex_opt_graphics_desc = "Calidad mínima, sin sombras, materiales lisos y calcomanías ocultas",
        ex_move_section = "Movimiento y mundo",
        ex_walkwater = "Caminar sobre el agua",
        ex_walkwater_desc = "Te permite caminar sobre el agua",
        ex_infjump = "Salto infinito",
        ex_infjump_desc = "Salta de nuevo estando en el aire",
        ex_time = "Cambiar hora",
        ex_time_day = "Día",
        ex_time_night = "Noche",
        ex_shader_section = "Shaders",
        ex_shader = "Shader",
        ex_shader_original = "Original",
        ex_shader_prev = "Anterior",
        ex_shader_next = "Siguiente",
        ex_shader_note = "Se apagó la optimización de luces y gráficos para aplicar el shader.",
        ex_player_section = "Configuración de jugador",
        ex_speed_input = "Valor de velocidad",
        ex_speed_toggle = "Cambiar velocidad",
        ex_speed_desc = "Aplica el WalkSpeed que escribiste",
        ex_jump_input = "Valor de salto",
        ex_jump_toggle = "Cambiar salto",
        ex_jump_desc = "Aplica el JumpPower que escribiste",
        ex_gravity_input = "Valor de gravedad",
        ex_gravity_toggle = "Cambiar gravedad",
        ex_gravity_desc = "Aplica la gravedad que escribiste (normal: 196.2)",
        ex_external_section = "Scripts externos",
        ex_external_fail = "No se pudo cargar el script.",
        ex_server_section = "Sistema de servidores",
        ex_server_autoreconnect = "Auto reconectar",
        ex_server_autoreconnect_desc = "Reentra al mismo servidor cuando aparece un mensaje de error",
        ex_server_autoreconnect_auto = "Auto reconectar (Automático)",
        ex_server_autoreconnect_auto_desc = "Reentra cuando te sacan o te desconectas",
        ex_server_hop_low = "Server Hop Low",
        ex_server_hop_low_desc = "Entra al servidor público con menos jugadores",
        ex_server_hop_full = "Server Hop Full",
        ex_server_hop_full_desc = "Entra al servidor público más lleno que todavía tenga espacio",
        ex_server_rejoin = "Reconectar al mismo servidor",
        ex_server_joining = "Entrando a un servidor con %d jugadores...",
        ex_server_none = "No se encontraron servidores disponibles.",

        ab_waiting_for_boss = "Esperando boss",
        ab_waiting_for_halloween_boss = "Esperando boss de Halloween",
        ab_dodging_punch = "Esquivando punch",
        ab_dodging_stomp = "Esquivando stomp",
        ab_waiting_for_chest = "Esperando cofre",
        ab_collecting_chest = "Recogiendo cofre",
        ab_skipping = "Saltando",
        ab_fighting = "Peleando",
        ab_waiting_for_respawn = "Esperando respawn",
        ab_target_bosses = "Bosses objetivo",
        ab_continue_farming = "Seguir farmeando tras matar al boss",
        ab_disabled = "Desactivado",
        ab_target_halloween_bosses = "Bosses de Halloween objetivo",
        ab_current_boss_active = "Boss actual activo",
        ab_waiting_for_spawn = "Esperando aparición",
        sn_boost_eater = "Comedor de boosts",
        sn_eat_all_eggs = "Comer todos los huevos",
        sn_eat_all_boosts = "Comer todos los boosts",
        sn_expect_lag = "Puede causar lag",
        sn_choose_player = "Elegir jugador",
        sn_amount = "Cantidad",
        sn_start_gifting = "Empezar a regalar",
        sn_need_player_amount = "Elige primero un jugador y una cantidad.",
        sn_egg_gifter = "Regalar huevos",
        sn_protein_eggs = "Huevos de proteína",
        sn_shake_gifter = "Regalar batidos",
        sn_tropical_shakes = "Batidos tropicales",
        sn_information = "Información",
        sn_info_text = "Interfiere con los boosts que te regalaron. ¡Siéntate en una máquina para tener menos lag!",

        cr_section = "Cristales",
        cr_hatch_title = "Apertura",
        cr_hatch_inactive = "Inactivo",
        cr_hatch_preparing = "Preparando",
        cr_hatch_select = "Selecciona un cristal",
        cr_hatch_active = "%s - %dx",
        cr_hatch_waiting = "Esperando - %s",
        cr_hatch_check = "Revisa tu moneda, capacidad y acceso al cristal",
        cr_no_result = "Sin resultado de apertura",
        cr_select_crystal = "Seleccionar cristal",
        cr_hatch_amount = "Cantidad por apertura",
        cr_autohatch = "Auto abrir cristal",
        cr_bulk_unavailable = "La apertura múltiple no está disponible",
        cr_none = "Ninguno",
        cr_psell_section = "Auto venta de mascotas",
        cr_psell_info_title = "Estado de la auto venta",
        cr_psell_select = "Seleccionar mascotas a vender",
        cr_psell_toggle = "Auto vender mascotas",
        cr_psell_toggle_desc = "Vende todas las copias desbloqueadas de las mascotas y auras elegidas. Las bloqueadas y equipadas nunca aparecen ni se venden",
        cr_psell_inactive = "Inactivo",
        cr_psell_running = "Vendiendo",
        cr_psell_waiting = "Esperando mascotas para vender",
        cr_psell_summary = "Mascotas vendibles: %d - Tipos: %d",
        cr_psell_selected = "Elegidas: %s",
        cr_psell_sold = "Vendidas: %d",
        cr_psell_select_first = "Elige al menos una mascota primero.",
        cr_psell_failed = "El juego no aceptó la venta. Auto venta detenida.",
        cr_psell_refresh = "Actualizar mascotas",
        cr_evo_section = "Auto evolucionar",
        cr_evo_info_title = "Estado del auto evolucionar",
        cr_evo_select = "Seleccionar mascotas a evolucionar",
        cr_evo_toggle = "Auto evolucionar mascotas",
        cr_evo_toggle_desc = "Evoluciona las mascotas y auras elegidas cada vez que tengas 5 copias iguales. Las bloqueadas y equipadas nunca se usan",
        cr_evo_inactive = "Inactivo",
        cr_evo_running = "Evolucionando",
        cr_evo_waiting = "Esperando 5 mascotas iguales",
        cr_evo_summary = "Mascotas evolucionables: %d - Tipos: %d",
        cr_evo_selected = "Elegidas: %s",
        cr_evo_done = "Evolucionadas: %d",
        cr_evo_select_first = "Elige al menos una mascota primero.",
        cr_evo_failed = "El juego no aceptó la evolución. Auto evolucionar detenido.",
        cr_evo_refresh = "Actualizar mascotas a evolucionar",
        cr_asell_select = "Seleccionar auras a vender",
        cr_evo_select_auras = "Seleccionar auras a evolucionar",
        cr_trade_section = "Auto Trade",
        cr_trade_info_title = "Estado del Auto Trade",
        cr_trade_players = "Elegir jugadores",
        cr_trade_pets = "Seleccionar mascotas a tradear",
        cr_trade_auras = "Seleccionar auras a tradear",
        cr_trade_toggle = "Auto Trade",
        cr_trade_toggle_desc = "Envía trades a los jugadores elegidos con hasta 6 items cada uno. Los bloqueados y equipados nunca se ofrecen",
        cr_trade_inactive = "Inactivo",
        cr_trade_running = "Tradeando",
        cr_trade_waiting = "Esperando jugadores e items",
        cr_trade_done = "Trades enviados: %d",
        cr_trade_select_first = "Elige al menos un jugador y un item primero.",

        dt_session_section = "Ganancias de la sesión",
        dt_session_title = "Sesión",
        dt_gained_title = "Ganado en total",
        dt_1h_title = "Ganado en 1 hora",
        dt_1d_title = "Ganado en 1 día",
        dt_running = "Contando",
        dt_done = "Completado",
        dt_totals_title = "Totales actuales",
        dt_reset = "Reiniciar sesión",
        dt_reset_desc = "Reinicia el temporizador y todos los contadores de ganancias",
        dt_reset_done = "Sesión reiniciada.",
        dt_webhook_section = "Webhook de ganancias",
        dt_send = "Enviar reporte de ganancias",
        dt_send_desc = "Envía tus ganancias a tu webhook de Discord",

        st_select_player = "Seleccionar jugador",
        st_player_stats = "Estadísticas del jugador",
        st_strength = "Fuerza",
        st_gems = "Gemas",
        st_agility = "Agilidad",
        st_rebirths = "Rebirths",
        st_durability = "Durabilidad",
        st_kills = "Kills",
        st_brawls = "Brawls",
        st_mk_time = "Tiempo de Muscle King",
        st_map = "Mapa actual",
        st_evil = "Karma malo",
        st_good = "Karma bueno",
        st_advanced = "Estadísticas avanzadas",
        st_enemy_health = "Vida del enemigo",
        st_your_damage = "Tu daño",
        st_hits = "Golpes para matar",
        st_not_found = "Jugador no encontrado",
        st_no_data = "Sin datos",
        st_fake_section = "Fake Stats (Solo visuales)",
        st_fake_title = "Fake Stats",
        st_fake_desc = "Cambia visualmente las estadísticas elegidas. Deja una casilla vacía para restaurar esa estadística. Acepta sufijos como 5K, 2.5M, 1B.",
        st_fake_restore = "Restaurar Fake Stats",
        st_fake_restored = "Fake stats restauradas.",
        st_fake_invalid = "Valor inválido o estadística no encontrada.",
        st_info_section = "Webhook de información del jugador",
        st_info_send = "Enviar info del jugador",
        st_info_send_desc = "Envía tu info, stats y datos del servidor a tu webhook",
        st_notify_section = "Webhook de notificaciones",
        st_notify_minutes = "Minutos entre reportes",
        st_notify_toggle = "Activar notificaciones periódicas",
        st_notify_toggle_desc = "Envía un reporte completo de stats y farmeo cada X minutos hasta que lo apagues",
        st_notify_test = "Enviar reporte de prueba",
        st_notify_need_minutes = "Escribe primero los minutos (1 o más).",
        st_notify_started = "Reportes cada %s min iniciados.",
        st_notify_stopped = "Reportes periódicos detenidos.",
        st_hook_sent = "Webhook enviado correctamente.",
        st_hook_failed = "No se pudo enviar el webhook.",

        kl_misc_section = "Misceláneo",
        kl_equip_damage = "Equipar pets de daño",
        kl_equip_health = "Equipar pets de vida",
        kl_remove_anims = "Quitar animaciones de ataque",
        kl_remove_anims_desc = "Oculta las animaciones de punch, equipar y herramienta, manteniendo las de movimiento",
        kl_packspam = "Pack Spam",
        kl_packspam_desc = "Equipa y desequipa 7 Mighty Monsters en bucle",
        kl_showhp = "Ver vida de todos",
        kl_showhp_desc = "Muestra una barra de vida morado oscuro sobre cada jugador",
        kl_karma_section = "Karma",
        kl_karma_info_title = "Información",
        kl_karma_info = "Los jugadores azules dan Good Karma. Los jugadores rojos dan Evil Karma.",
        kl_karma_paint = "Pintar jugadores de karma",
        kl_karma_paint_desc = "Pinta a los jugadores de azul (Good Karma) o rojo (Evil Karma). Al desactivarlo se quitan los colores",
        kl_spec_section = "Espectear",
        kl_spec_choose = "Elegir jugador",
        kl_spec_toggle = "Espectear",
        kl_spec_toggle_desc = "Observa al jugador elegido. Sigue activo aunque mueras o reaparezcas",
        kl_spec_need_player = "Elige primero un jugador.",
        kl_spec_left = "El jugador que espectabas salió del servidor.",
        kl_def_section = "Killing (Defensa)",
        kl_def_info_title = "Información",
        kl_def_info = "No se puede impedir que otros jugadores se teletransporten a ti. El giro y el Auto Punch te hacen más difícil de golpear y te defienden. La alerta te avisa quién se teletransportó a tu lado.",
        kl_def_speed = "Velocidad de giro (grados por segundo)",
        kl_def_spin = "Giro rápido",
        kl_def_spin_desc = "Gira tu personaje en su lugar. Sigue activo aunque mueras o reaparezcas",
        kl_def_punch = "Auto Punch (0.1s)",
        kl_def_punch_desc = "Golpea cada 0.1 segundos. Sigue activo aunque mueras o reaparezcas",
        kl_def_alert = "Alerta de teletransporte",
        kl_def_alert_desc = "Te avisa cuando un jugador aparece de golpe junto a ti",
        kl_def_alert_msg = "%s (%s) se teletransportó cerca de ti.",

        tp_work_section = "Ubicaciones de ejercicio",
        tp_select_workout = "Seleccionar ejercicio",
        tp_select_location = "Seleccionar ubicación",
        tp_tp_workout = "Teletransportar al ejercicio",
        tp_treadmill_section = "Ubicaciones de cinta",
        tp_select_treadmill = "Seleccionar cinta",
        tp_tp_treadmill = "Teletransportar a la cinta",
        tp_island_section = "Islas",
        tp_select_island = "Seleccionar isla",
        tp_tp_island = "Teletransportar a la isla",
        tp_brawl_section = "Islas de peleas",
        tp_select_brawl = "Seleccionar isla de peleas",
        tp_tp_brawl = "Teletransportar a la isla de peleas",
        tp_failed = "No se pudo teletransportar: no se encontró el personaje.",
        tp_no_location = "Esa ubicación no está disponible para este ejercicio.",

        set_appearance = "Apariencia",
        set_theme = "Tema",
        set_theme_desc = "Cambia los colores de la interfaz",
        set_transparency = "Transparencia",
        set_transparency_d = "Hace la ventana transparente",
        set_configuration = "Configuración",
        set_autosave = "Autoguardado",
        set_autosave_desc = "Guarda la config actual cada 5 segundos",
        set_select_config = "Seleccionar config",
        set_new_config = "Nombre de la nueva config",
        set_new_config_ph = "Mi config",
        set_create_config = "Crear config",
        set_create_desc = "Crea y guarda una nueva config con el nombre escrito",
        set_save_config = "Guardar config",
        set_load_config = "Cargar config",
        set_delete_config = "Eliminar config",
        set_config_title = "Config",
        set_type_name = "Escribe un nombre válido primero.",
        set_created = "Creada: %s",
        set_saved = "Guardada: %s",
        set_loaded = "Cargada: %s",
        set_deleted = "Eliminada: %s",
        set_cant_save = "No se pudo guardar.",
        set_cant_load = "No se pudo cargar.",
        set_hub_section = "Hub",
        set_notifications = "Notificaciones",
        set_notifications_desc = "Muestra u oculta las notificaciones emergentes del hub",
        set_menukey = "Tecla del menú",
        set_menukey_ph = "Q",
        set_menukey_set = "Tecla del menú cambiada a %s.",
        set_menukey_invalid = "Nombre de tecla inválido.",
        set_fpscap = "Límite de FPS",
        set_fpscap_desc = "Limita tus FPS (de 1 a 999)",
        set_fpscap_unsup = "Tu executor no soporta setfpscap.",
        set_autoload = "Cargar config al iniciar",
        set_autoload_desc = "Carga la config seleccionada automáticamente al iniciar el hub",
        set_requeue = "Auto ejecutar al cambiar de servidor",
        set_requeue_desc = "Vuelve a ejecutar el hub después de un server hop o rejoin",
        set_requeue_unsup = "Tu executor no soporta queue_on_teleport.",
        set_requeue_nourl = "Primero define Config.LoaderUrl.",
        set_panic = "Apagar todos los toggles",
        set_panic_desc = "Apaga todas las funciones activas de un solo golpe",
        set_panic_done = "Todos los toggles apagados.",
        set_unload = "Descargar hub",
        set_unload_desc = "Apaga todos los loops, restaura los cambios y cierra la ventana",
    },
}

local function detectLanguage()
    local codes = {}

    pcall(function()
        table.insert(codes, LocalizationService.RobloxLocaleId)
    end)
    pcall(function()
        table.insert(codes, LocalPlayer.LocaleId)
    end)

    for _, code in ipairs(codes) do
        local prefix = string.lower(tostring(code)):sub(1, 2)
        if prefix == "es" then
            return "es"
        elseif prefix == "en" then
            return "en"
        end
    end

    return "en"
end

local Language = detectLanguage()

local function L(key, ...)
    local text = (Strings[Language] and Strings[Language][key])
        or Strings.en[key]
        or key
    if select("#", ...) > 0 then
        return string.format(text, ...)
    end
    return text
end

local Util = {}
local Registry = {}
local Sections = {}
local Tabs = {}
local WindUI

function Util.register(flag, element)
    Registry[flag] = element
end

Util.notificationsEnabled = true

function Util.notify(title, content, icon)
    if not Util.notificationsEnabled then
        return
    end
    pcall(function()
        WindUI:Notify({
            Title = title,
            Content = content,
            Duration = 3,
            Icon = icon or "check",
        })
    end)
end

function Util.makeSetter(paragraph)
    local last
    return function(text)
        if text == last then return end
        last = text
        pcall(paragraph.SetDesc, paragraph, text)
    end
end

function Util.copyText(text)
    local fn = setclipboard or toclipboard or (syn and syn.write_clipboard) or (Clipboard and Clipboard.set)
    if fn then
        return (pcall(fn, text))
    end
    return false
end

function Util.copyWithNotice(label, text)
    if Util.copyText(text) then
        Util.notify(L("copied"), L("copied_msg", label), "copy")
    else
        Util.notify(L("error"), L("no_clipboard"), "triangle-alert")
    end
end

function Util.formatTime(total)
    total = math.floor(total)
    return string.format(
        "%02d:%02d:%02d",
        math.floor(total / 3600),
        math.floor(total % 3600 / 60),
        total % 60
    )
end

function Util.yesNo(value)
    return value and L("yes") or L("no")
end

function Util.getExecutor(fallback)
    fallback = fallback or L("unknown")
    local ok, name, version = pcall(function()
        if identifyexecutor then
            return identifyexecutor()
        end
        if getexecutorname then
            return getexecutorname()
        end
        return nil
    end)
    if ok and name then
        return tostring(name), version and tostring(version) or fallback
    end
    return fallback, fallback
end

function Util.getGameName(fallback)
    if Util._gameName then return Util._gameName end
    local ok, info = pcall(function()
        return MarketplaceService:GetProductInfo(game.PlaceId)
    end)
    if ok and type(info) == "table" and info.Name then
        Util._gameName = tostring(info.Name)
        return Util._gameName
    end
    return fallback or L("unknown")
end

function Util.getPing()
    local ok, value = pcall(function()
        return StatsService.Network.ServerStatsItem["Data Ping"]:GetValue()
    end)
    if ok and type(value) == "number" then
        return math.floor(value)
    end
    return 0
end

function Util.sanitizeName(name)
    local clean = tostring(name or ""):gsub("[^%w_%- ]", "")
    clean = clean:gsub("^%s+", ""):gsub("%s+$", "")
    return clean:sub(1, 32)
end

local Logger = {}

Logger.Colors = {
    Default = 0x3B0764,
    Blacklisted = 0xDC2626,
    Whitelisted = 0x22C55E,
}

function Logger.getRequest()
    return (syn and syn.request) or http_request or request
end

function Logger.getHwid()
    local ok, value = pcall(function()
        if gethwid then
            return gethwid()
        end
        if get_hwid then
            return get_hwid()
        end
        return nil
    end)
    if ok and value and tostring(value) ~= "" then
        return tostring(value)
    end

    local okClient, clientId = pcall(function()
        return RbxAnalyticsService:GetClientId()
    end)
    if okClient and clientId and tostring(clientId) ~= "" then
        return tostring(clientId)
    end

    return "Unknown"
end

function Logger.getPlatform()
    if UserInputService.TouchEnabled and not UserInputService.KeyboardEnabled then
        return "Mobile"
    end
    if UserInputService.GamepadEnabled then
        return "Console"
    end
    return "PC"
end

function Logger.formatAge(days)
    local years = math.floor(days / 365)
    local remaining = days - years * 365
    if years > 0 then
        return years .. "y " .. remaining .. "d"
    end
    return days .. "d"
end

function Logger.getExecutions()
    local request = Logger.getRequest()
    if not request then
        return 0
    end

    local ok, response = pcall(function()
        return request({
            Url = Config.CounterUrl,
            Method = "POST",
            Headers = { ["Content-Type"] = "application/json" },
            Body = "{}",
        })
    end)
    if not ok or type(response) ~= "table" then
        return 0
    end

    local body = response.Body or response.body
    if not body then
        return 0
    end

    local decodeOk, data = pcall(function()
        return HttpService:JSONDecode(body)
    end)
    if not decodeOk or type(data) ~= "table" then
        return 0
    end

    return tonumber(data.executions) or 0
end

function Logger.getAvatar(userId)
    local avatar = "https://www.roblox.com/headshot-thumbnail/image?userId="
        .. userId
        .. "&width=420&height=420&format=png"

    pcall(function()
        local data = HttpService:JSONDecode(game:HttpGet(
            "https://thumbnails.roblox.com/v1/users/avatar-headshot?userIds="
            .. userId
            .. "&size=420x420&format=Png"
        ))
        if data and data.data and data.data[1]
            and data.data[1].imageUrl and data.data[1].imageUrl ~= "" then
            avatar = data.data[1].imageUrl
        end
    end)

    return avatar
end

function Logger.send(title, status, color, reason)
    local executor, executorVersion = Util.getExecutor("Unknown")
    local userId = tostring(LocalPlayer.UserId)
    local jobId = tostring(game.JobId)
    local placeId = tostring(game.PlaceId)
    local membership = LocalPlayer.MembershipType == Enum.MembershipType.Premium and "Premium" or "No Premium"
    local profileUrl = "https://www.roblox.com/users/" .. userId .. "/profile"
    local gameUrl = "https://www.roblox.com/games/" .. placeId

    local lines = {
        "**Player Info**",
        "Username: [`" .. LocalPlayer.Name .. "`](" .. profileUrl .. ")",
        "User ID: `" .. userId .. "`",
        "Display Name: " .. LocalPlayer.DisplayName,
        "Account Age: " .. Logger.formatAge(LocalPlayer.AccountAge),
        "Membership: " .. membership,
        "Platform: " .. Logger.getPlatform(),
        "HWID: `" .. Logger.getHwid() .. "`",
        "",
        "**Executor**",
        "Name: " .. executor,
        "Version: " .. executorVersion,
        "",
        "**Game Info**",
        "Game: [" .. Util.getGameName("Unknown") .. "](" .. gameUrl .. ")",
        "Game ID: " .. tostring(game.GameId),
        "Place ID: " .. placeId,
        "Server ID: " .. (jobId ~= "" and jobId or "Studio"),
        "Players: " .. #Players:GetPlayers() .. " / " .. Players.MaxPlayers,
        "",
        "**Access**",
        "Status: " .. tostring(status),
    }
    if reason then
        table.insert(lines, "Reason: " .. tostring(reason))
    end

    local payload = {
        username = Config.HubName,
        embeds = {
            {
                title = title,
                description = table.concat(lines, "\n"),
                color = color or Logger.Colors.Default,
                image = {
                    url = "https://raw.githubusercontent.com/Mystery-Center/Mystery-Media/main/Mystery%20Registros%20Imagen.png"
                },
                thumbnail = { url = Logger.getAvatar(userId) },
                footer = {
                    text = "Mystery Hub Logger • Total Executions: " .. Logger.getExecutions()
                },
                timestamp = os.date("!%Y-%m-%dT%H:%M:%SZ"),
            },
        },
    }

    local encodeOk, body = pcall(function()
        return HttpService:JSONEncode(payload)
    end)
    if not encodeOk then
        return false
    end

    local request = Logger.getRequest()
    if request then
        local ok, response = pcall(function()
            return request({
                Url = Config.WebhookUrl,
                Method = "POST",
                Headers = { ["Content-Type"] = "application/json" },
                Body = body,
            })
        end)
        if not ok then
            return false
        end
        if type(response) == "table" then
            local code = tonumber(response.StatusCode or response.Status)
            return code ~= nil and code >= 200 and code < 300
        end
        return true
    end

    return (pcall(function()
        HttpService:PostAsync(Config.WebhookUrl, body, Enum.HttpContentType.ApplicationJson)
    end))
end

local function fetchUsers(url)
    local ok, result = pcall(function()
        return HttpService:JSONDecode(game:HttpGet(url))
    end)
    if ok and type(result) == "table" and type(result.users) == "table" then
        return result.users
    end
    return {}
end

local function findUser(list, userId)
    for _, entry in ipairs(list) do
        if type(entry) == "table" and tonumber(entry.UserId) == userId then
            return entry
        end
    end
    return nil
end

local function isAllowedGame()
    if game.GameId ~= Config.AllowedGameId then
        return false
    end
    for _, placeId in ipairs(Config.AllowedPlaceIds) do
        if placeId == game.PlaceId then
            return true
        end
    end
    return false
end

local blacklistUsers, whitelistUsers
local pending = 2
task.spawn(function()
    blacklistUsers = fetchUsers(Config.BlacklistUrl)
    pending = pending - 1
end)
task.spawn(function()
    whitelistUsers = fetchUsers(Config.WhitelistUrl)
    pending = pending - 1
end)

local waitStart = os.clock()
while pending > 0 and os.clock() - waitStart < 10 do
    task.wait()
end

blacklistUsers = blacklistUsers or {}
whitelistUsers = whitelistUsers or {}

local blacklistEntry = findUser(blacklistUsers, LocalPlayer.UserId)
local isWhitelisted = findUser(whitelistUsers, LocalPlayer.UserId) ~= nil

local accessStatus, accessColor, accessTitle
if blacklistEntry then
    accessStatus = "Blacklisted"
    accessColor = Logger.Colors.Blacklisted
    accessTitle = "Blacklisted User Attempt"
elseif isWhitelisted then
    accessStatus = "Whitelisted"
    accessColor = Logger.Colors.Whitelisted
    accessTitle = "Whitelisted User Executed"
else
    accessStatus = "Executed"
    accessColor = Logger.Colors.Default
    accessTitle = "Mystery Hub Executed"
end

if not isAllowedGame() then
    Logger.send(
        "Unsupported Game Attempt",
        accessStatus,
        accessColor,
        "Unsupported game (Place ID " .. tostring(game.PlaceId) .. ")"
    )
    LocalPlayer:Kick(L("game_not_supported"))
    return
end

if blacklistEntry then
    local reason = tostring(blacklistEntry.Reason or L("blacklisted"))
    Logger.send(accessTitle, accessStatus, accessColor, reason)
    LocalPlayer:Kick(reason)
    return
end

task.spawn(Logger.send, accessTitle, accessStatus, accessColor)

local env = (getgenv and getgenv()) or _G
local runId = tostring(os.clock()) .. tostring(math.random(1000, 9999))

if env.MysteryHubWindow then
    pcall(function()
        env.MysteryHubWindow:Destroy()
    end)
end
env.MysteryHubRun = runId

local function isAlive()
    return env.MysteryHubRun == runId
end

do
    local VirtualInputManager = game:GetService("VirtualInputManager")

    local function antiAfkPulse()
        pcall(function()
            VirtualUser:CaptureController()
            VirtualUser:ClickButton2(Vector2.new(0, 0))
        end)
        pcall(function()
            VirtualInputManager:SendMouseMoveEvent(5, 5, game)
            VirtualInputManager:SendMouseButtonEvent(5, 5, 1, true, game, 0)
            VirtualInputManager:SendMouseButtonEvent(5, 5, 1, false, game, 0)
        end)
    end

    pcall(function()
        if getconnections then
            for _, c in ipairs(getconnections(LocalPlayer.Idled)) do
                pcall(function() c:Disable() end)
            end
        end
    end)

    local idleConnection
    idleConnection = LocalPlayer.Idled:Connect(function()
        if not isAlive() then
            idleConnection:Disconnect()
            return
        end
        antiAfkPulse()
    end)

    task.spawn(function()
        while isAlive() do
            task.wait(60)
            antiAfkPulse()
        end
    end)
end

local loaded, windUiResult = pcall(function()
    return loadstring(game:HttpGet(Config.WindUiUrl))()
end)
if not loaded or type(windUiResult) ~= "table" then
    return
end
WindUI = windUiResult

local themeName = "Sherya"
local themeOk = pcall(function()
    WindUI:AddTheme({
        Name = "Sherya",

        Accent = WindUI:Gradient({
            ["0"] = { Color = Color3.fromHex("#2e1065"), Transparency = 0 },
            ["100"] = { Color = Color3.fromHex("#1e0a3c"), Transparency = 0 },
        }, {
            Rotation = 45,
        }),
        Background = Color3.fromHex("#0d0816"),
        BackgroundTransparency = 0,
        Outline = Color3.fromHex("#7c3aed"),
        Text = Color3.fromHex("#FFFFFF"),
        Placeholder = Color3.fromHex("#8b7aa8"),
        Button = Color3.fromHex("#4c1d95"),
        Icon = Color3.fromHex("#a78bfa"),
        Hover = Color3.fromHex("#6d28d9"),

        WindowBackground = Color3.fromHex("#0d0816"),
        WindowShadow = Color3.fromHex("#000000"),

        WindowTopbarButtonIcon = Color3.fromHex("#a78bfa"),
        WindowTopbarTitle = Color3.fromHex("#FFFFFF"),
        WindowTopbarAuthor = Color3.fromHex("#c4b5fd"),
        WindowTopbarIcon = Color3.fromHex("#FFFFFF"),

        TabBackground = Color3.fromHex("#7c3aed"),
        TabTitle = Color3.fromHex("#FFFFFF"),
        TabIcon = Color3.fromHex("#a78bfa"),

        ElementBackground = Color3.fromHex("#a78bfa"),
        ElementTitle = Color3.fromHex("#FFFFFF"),
        ElementDesc = Color3.fromHex("#c4b5fd"),
        ElementIcon = Color3.fromHex("#a78bfa"),

        PopupBackground = Color3.fromHex("#0d0816"),
        PopupBackgroundTransparency = 0,
        PopupTitle = Color3.fromHex("#FFFFFF"),
        PopupContent = Color3.fromHex("#FFFFFF"),
        PopupIcon = Color3.fromHex("#a78bfa"),

        DialogBackground = Color3.fromHex("#0d0816"),
        DialogBackgroundTransparency = 0,
        DialogTitle = Color3.fromHex("#FFFFFF"),
        DialogContent = Color3.fromHex("#FFFFFF"),
        DialogIcon = Color3.fromHex("#a78bfa"),

        Toggle = Color3.fromHex("#4c1d95"),
        ToggleBar = Color3.fromHex("#FFFFFF"),

        Checkbox = Color3.fromHex("#4c1d95"),
        CheckboxIcon = Color3.fromHex("#FFFFFF"),

        Slider = Color3.fromHex("#4c1d95"),
        SliderThumb = Color3.fromHex("#FFFFFF"),
    })
    WindUI:SetTheme("Sherya")
end)
if not themeOk then
    themeName = "Dark"
end

local windowConfig = {
    Title = Config.HubName,
    Icon = "layout-dashboard",
    Author = "Muscle Legends Version",
    Folder = "MySuperHub",
    Size = UDim2.fromOffset(580, 460),
    MinSize = Vector2.new(560, 350),
    MaxSize = Vector2.new(850, 560),
    ToggleKey = Enum.KeyCode.Q,
    Transparent = true,
    Theme = themeName,
    Resizable = true,
    SideBarWidth = 200,
    BackgroundImageTransparency = 0.42,
    HideSearchBar = true,
    ScrollBarEnabled = false,
    User = {
        Enabled = true,
        Anonymous = false,
    },
}

if not isWhitelisted then
    windowConfig.KeySystem = {
        Key = { Config.Key },
        Note = L("key_note"),
        SaveKey = false,
    }
end

local Window = WindUI:CreateWindow(windowConfig)
env.MysteryHubWindow = Window

pcall(function()
    Window:EditOpenButton({
        Title = L("open_hub", Config.HubName),
        Icon = "layout-dashboard",
        CornerRadius = UDim.new(0, 16),
        StrokeThickness = 2,
        Color = ColorSequence.new(
            Color3.fromHex("#4c1d95"),
            Color3.fromHex("#7c3aed")
        ),
        OnlyMobile = false,
        Enabled = true,
        Draggable = true,
    })
end)

local layout = {
    {
        Title = L("sec_dashboard"),
        Tabs = {
            { Key = "Home", Title = L("tab_home"), Icon = "house" },
        },
    },
    {
        Title = L("sec_farming"),
        Tabs = {
            { Key = "Farm", Title = L("tab_farm"), Icon = "pickaxe" },
            { Key = "Packs", Title = L("tab_packs"), Icon = "package" },
        },
    },
    {
        Title = L("sec_misc"),
        Tabs = {
            { Key = "Extras", Title = L("tab_extras"), Icon = "folders" },
            { Key = "Snacks", Title = L("tab_snacks"), Icon = "popcorn" },
            { Key = "Crystals", Title = L("tab_crystals"), Icon = "store" },
            { Key = "Data", Title = L("tab_data"), Icon = "calculator" },
        },
    },
    {
        Title = L("sec_player"),
        Tabs = {
            { Key = "Stats", Title = L("tab_stats"), Icon = "users" },
            { Key = "Killer", Title = L("tab_killer"), Icon = "skull", },
            { Key = "Teleport", Title = L("tab_teleport"), Icon = "map-pin" },
        },
    },
    {
        Title = L("sec_library"),
        Tabs = {
            { Key = "Settings", Title = L("tab_settings"), Icon = "settings" },
        },
    },
}

for _, sectionData in ipairs(layout) do
    local section = Window:Section({
        Title = sectionData.Title,
        Opened = true,
    })
    Sections[sectionData.Title] = section

    for _, tabData in ipairs(sectionData.Tabs) do
        Tabs[tabData.Key] = section:Tab({
            Title = tabData.Title,
            Icon = tabData.Icon,
            Locked = false,
        })
    end
end

local pacedCount = 0
function Util.pace(tab)
    for _, name in ipairs({ "Section", "Paragraph", "Button", "Toggle", "Dropdown", "Input", "Divider" }) do
        local original = tab[name]
        if original then
            pcall(function()
                tab[name] = function(self, ...)
                    local result = original(self, ...)
                    pacedCount = pacedCount + 1
                    if pacedCount % 4 == 0 then
                        task.wait()
                        if not isAlive() then
                            error("hub reloaded", 0)
                        end
                    end
                    return result
                end
            end)
        end
    end
end

for _, tab in pairs(Tabs) do
    Util.pace(tab)
end

do
    local Home = Tabs.Home

    local fps, frames, lastCheck = 0, 0, os.clock()
    local fpsConnection = RunService.RenderStepped:Connect(function()
        frames = frames + 1
        local now = os.clock()
        if now - lastCheck >= 1 then
            fps = math.floor(frames / (now - lastCheck) + 0.5)
            frames = 0
            lastCheck = now
        end
    end)

    local createdAt = os.date("%Y-%m-%d", os.time() - LocalPlayer.AccountAge * 86400)

    Home:Section({ Title = L("home_player") })

    Home:Paragraph({
        Title = L("home_player_info"),
        Desc = table.concat({
            L("home_display_name") .. ": " .. LocalPlayer.DisplayName,
            L("home_username") .. ": " .. LocalPlayer.Name,
            L("home_user_id") .. ": " .. LocalPlayer.UserId,
            L("home_account_age") .. ": " .. LocalPlayer.AccountAge .. " " .. L("home_days"),
            L("home_created") .. ": " .. createdAt,
            L("home_membership") .. ": " .. LocalPlayer.MembershipType.Name,
        }, "\n"),
    })

    Home:Button({
        Title = L("home_copy_user_id"),
        Icon = "copy",
        Callback = function()
            Util.copyWithNotice(L("home_user_id"), tostring(LocalPlayer.UserId))
        end,
    })

    Home:Section({ Title = L("home_game") })

    Home:Paragraph({
        Title = L("home_game_info"),
        Desc = table.concat({
            L("home_name") .. ": " .. Util.getGameName(),
            L("home_place_id") .. ": " .. game.PlaceId,
            L("home_game_id") .. ": " .. game.GameId,
            L("home_job_id") .. ": " .. game.JobId,
            L("home_max_players") .. ": " .. Players.MaxPlayers,
        }, "\n"),
    })

    local ServerParagraph = Home:Paragraph({
        Title = L("home_live_stats"),
        Desc = L("home_loading"),
    })

    Home:Button({
        Title = L("home_copy_place_id"),
        Icon = "copy",
        Callback = function()
            Util.copyWithNotice(L("home_place_id"), tostring(game.PlaceId))
        end,
    })

    Home:Button({
        Title = L("home_copy_job_id"),
        Icon = "copy",
        Callback = function()
            Util.copyWithNotice(L("home_job_id"), tostring(game.JobId))
        end,
    })

    Home:Button({
        Title = L("home_rejoin"),
        Icon = "refresh-cw",
        Callback = function()
            local ok = pcall(function()
                TeleportService:TeleportToPlaceInstance(game.PlaceId, game.JobId, LocalPlayer)
            end)
            if not ok then
                pcall(function()
                    TeleportService:Teleport(game.PlaceId, LocalPlayer)
                end)
            end
        end,
    })

    Home:Section({ Title = L("home_executor") })

    local executorName, executorVersion = Util.getExecutor()

    local capabilities = {
        { L("home_cap_clipboard"), (setclipboard or toclipboard) ~= nil },
        { L("home_cap_http"), (request or http_request or (syn and syn.request)) ~= nil },
        { L("home_cap_files"), (writefile and readfile) ~= nil },
        { L("home_cap_hooks"), hookfunction ~= nil },
        { L("home_cap_drawing"), Drawing ~= nil },
        { L("home_cap_queue"), (queue_on_teleport or (syn and syn.queue_on_teleport)) ~= nil },
    }

    local executorLines = {
        L("home_name") .. ": " .. executorName,
        L("home_version") .. ": " .. executorVersion,
    }
    for _, item in ipairs(capabilities) do
        table.insert(executorLines, item[1] .. ": " .. Util.yesNo(item[2]))
    end

    Home:Paragraph({
        Title = L("home_executor_info"),
        Desc = table.concat(executorLines, "\n"),
    })

    Home:Section({ Title = L("home_community") })

    Home:Button({
        Title = L("home_copy_discord"),
        Desc = L("home_discord_desc"),
        Icon = "message-circle",
        Callback = function()
            Util.copyWithNotice(L("home_discord_label"), Config.DiscordLink)
        end,
    })

    task.spawn(function()
        while task.wait(1) and isAlive() do
            pcall(function()
                ServerParagraph:SetDesc(table.concat({
                    L("home_players") .. ": " .. #Players:GetPlayers() .. "/" .. Players.MaxPlayers,
                    L("home_fps") .. ": " .. fps,
                    L("home_ping") .. ": " .. Util.getPing() .. " ms",
                    L("home_server_time") .. ": " .. Util.formatTime(workspace.DistributedGameTime),
                    L("home_memory") .. ": " .. math.floor(StatsService:GetTotalMemoryUsageMb()) .. " MB",
                }, "\n"))
            end)
        end
        fpsConnection:Disconnect()
    end)
end

pcall(function() Tabs.Home:Select() end)

do
    local Farm = Tabs.Farm

    local Brawl = nil
    pcall(function()
        local node = ReplicatedStorage
        for _, name in ipairs({ "shared", "state", "Brawl" }) do
            node = node:WaitForChild(name, 1)
            if not node then
                return
            end
        end
        Brawl = node
    end)

    local autoFarmBrawls = false
    local autoJoinBrawls = false
    local lastJoinAttempt = 0
    local promptShownAt = nil

    local function getCharacter(player)
        local character = player.Character
        if not character or not character.Parent then
            return nil
        end
        local humanoid = character:FindFirstChildOfClass("Humanoid")
        local root = character:FindFirstChild("HumanoidRootPart")
        if not humanoid or not root or humanoid.Health <= 0 then
            return nil
        end
        return character, humanoid, root
    end

    local function getPunch()
        local character = LocalPlayer.Character
        return character and character:FindFirstChild("Punch") or LocalPlayer.Backpack:FindFirstChild("Punch")
    end

    local function equipPunch()
        local character, humanoid = getCharacter(LocalPlayer)
        if not character then
            return nil
        end
        local punch = getPunch()
        if punch and punch.Parent ~= character then
            pcall(function()
                humanoid:EquipTool(punch)
            end)
        end
        return punch
    end

    local function isBrawler(player)
        local character, humanoid, root = getCharacter(player)
        if not character
            or character:GetAttribute("LastMapCFrame") == nil
            or character:GetAttribute("InBattle") ~= true then
            return false
        end
        return true, character, humanoid, root
    end

    local function clickBrawlYes()
        local gameGui = LocalPlayer.PlayerGui:FindFirstChild("gameGui")
        if not gameGui then
            return false
        end

        local choiceMenu = gameGui:FindFirstChild("baseChoiceMenu")
        local choiceText = choiceMenu and choiceMenu:FindFirstChild("Text", true)
        local choiceButtons = choiceMenu and choiceMenu:FindFirstChild("Buttons", true)
        local choiceYes = choiceButtons and choiceButtons:FindFirstChild("yesButton")

        if choiceMenu and choiceMenu.Visible
            and choiceText
            and string.find(string.lower(choiceText.Text), "brawl", 1, true)
            and choiceYes
            and choiceYes:IsA("GuiButton") then
            pcall(function()
                firesignal(choiceYes.Activated)
            end)
            return true
        end

        local legacyPrompt = gameGui:FindFirstChild("brawlJoinLabel")
        local legacyYes = legacyPrompt and legacyPrompt:FindFirstChild("yesButton")

        if legacyPrompt and legacyPrompt.Visible
            and legacyYes
            and legacyYes:IsA("GuiButton") then
            pcall(function()
                firesignal(legacyYes.Activated)
            end)
            return true
        end

        return false
    end

    local function isBrawlPromptVisible()
        local gameGui = LocalPlayer.PlayerGui:FindFirstChild("gameGui")
        if not gameGui then
            return false
        end

        local choiceMenu = gameGui:FindFirstChild("baseChoiceMenu")
        local choiceText = choiceMenu and choiceMenu:FindFirstChild("Text", true)
        if choiceMenu and choiceMenu.Visible
            and choiceText
            and string.find(string.lower(choiceText.Text), "brawl", 1, true) then
            return true
        end

        local legacyPrompt = gameGui:FindFirstChild("brawlJoinLabel")
        return legacyPrompt ~= nil and legacyPrompt.Visible
    end

    local function tryJoinBrawl()
        local character = LocalPlayer.Character
        local inProgress = Brawl:GetAttribute("BrawlInProgress") == true
        local started = Brawl:GetAttribute("BrawlStarted") == true
        local joined = character and character:GetAttribute("LastMapCFrame") ~= nil

        if inProgress and not started and not joined then
            if isBrawlPromptVisible() then
                promptShownAt = promptShownAt or os.clock()
                if os.clock() - promptShownAt >= 0.75 and os.clock() - lastJoinAttempt >= 0.75 then
                    lastJoinAttempt = os.clock()
                    clickBrawlYes()
                end
            else
                promptShownAt = nil
            end
        else
            promptShownAt = nil
        end
    end

    local function attackPlayer(player)
        local started = os.clock()
        local nextAttack = 0

        while autoFarmBrawls and isAlive() and os.clock() - started < 8 do
            local localCharacter, localHumanoid, localRoot = getCharacter(LocalPlayer)
            local valid, targetCharacter, targetHumanoid, targetRoot = isBrawler(player)

            if not localCharacter or not valid or Brawl:GetAttribute("BrawlStarted") ~= true then
                break
            end
            if localCharacter:GetAttribute("InBattle") ~= true then
                break
            end

            pcall(function()
                localRoot.AssemblyLinearVelocity = targetRoot.AssemblyLinearVelocity
                localRoot.AssemblyAngularVelocity = Vector3.zero
                localRoot.CFrame = targetRoot.CFrame * CFrame.new(0, 0, 0.35)
            end)

            local now = os.clock()
            if now >= nextAttack then
                local punch = equipPunch()
                if punch then
                    local attackTime = punch:FindFirstChild("attackTime")
                    nextAttack = now + (attackTime and math.max(0.1, attackTime.Value) or 0.35)
                    pcall(function()
                        punch:Activate()
                    end)
                else
                    nextAttack = now + 0.35
                end
            end
            RunService.Heartbeat:Wait()
        end
    end

    Farm:Section({ Title = L("farm_brawls") })

    local AutoJoinBrawlsToggle = Farm:Toggle({
        Title = L("farm_autojoin"),
        Desc = L("farm_autojoin_desc"),
        Value = false,
        Callback = function(state)
            autoJoinBrawls = state
        end,
    })
    Util.register("autojoin_brawls", AutoJoinBrawlsToggle)

    local AutoFarmBrawlsToggle = Farm:Toggle({
        Title = L("farm_autowin"),
        Desc = L("farm_autowin_desc"),
        Value = false,
        Callback = function(state)
            autoFarmBrawls = state
        end,
    })
    Util.register("autofarm_brawls", AutoFarmBrawlsToggle)

    task.spawn(function()
        while task.wait(0.2) and isAlive() and Brawl do
            if autoJoinBrawls or autoFarmBrawls then
                pcall(tryJoinBrawl)
            else
                promptShownAt = nil
            end
        end
    end)

    task.spawn(function()
        while task.wait(0.2) and isAlive() and Brawl do
            if autoFarmBrawls then
                local character = LocalPlayer.Character
                local inProgress = Brawl:GetAttribute("BrawlInProgress") == true
                local started = Brawl:GetAttribute("BrawlStarted") == true
                local joined = character and character:GetAttribute("LastMapCFrame") ~= nil

                if inProgress and started and joined and character:GetAttribute("InBattle") == true then
                    equipPunch()

                    local targets = {}
                    for _, player in ipairs(Players:GetPlayers()) do
                        if player ~= LocalPlayer and isBrawler(player) then
                            table.insert(targets, player)
                        end
                    end

                    table.sort(targets, function(a, b)
                        local aCharacter = a.Character
                        local bCharacter = b.Character
                        return aCharacter and aCharacter:GetAttribute("InBattle") == true
                            and not (bCharacter and bCharacter:GetAttribute("InBattle") == true)
                    end)

                    for _, player in ipairs(targets) do
                        if not autoFarmBrawls then
                            break
                        end
                        attackPlayer(player)
                    end
                end
            end
        end
    end)

    local rockList = {
        { name = "Tiny Island Rock", durability = 0 },
        { name = "Starter Island Rock", durability = 100 },
        { name = "Legend Beach Rock", durability = 5000 },
        { name = "Frost Gym Rock", durability = 150000 },
        { name = "Mythical Gym Rock", durability = 400000 },
        { name = "Eternal Gym Rock", durability = 750000 },
        { name = "Legend Gym Rock", durability = 1000000 },
        { name = "Muscle King Gym Rock", durability = 5000000 },
        { name = "Ancient Jungle Rock", durability = 10000000 },
        { name = "Industrial Rock", durability = 25000000 },
    }

    local rockNames = {}
    for _, rock in ipairs(rockList) do
        table.insert(rockNames, rock.name)
    end

    local selectedRock = ""
    local autoRock = false
    local rockTime = 0
    local rockSession = 0
    local rockParts = {}
    local scannedRock = nil
    local lastRockScan = 0

    local function getRockDurability(name)
        for _, rock in ipairs(rockList) do
            if rock.name == name then
                return rock.durability
            end
        end
        return nil
    end

    local function safeTouch(rockPart, hand)
        if not firetouchinterest then
            return
        end
        pcall(function()
            firetouchinterest(hand, rockPart, 0)
            firetouchinterest(hand, rockPart, 1)
        end)
    end

    local function scanRocks(durability)
        local found = {}
        local machines = workspace:FindFirstChild("machinesFolder")
        if not machines then
            return found
        end
        for _, object in ipairs(machines:GetDescendants()) do
            if object.Name == "neededDurability" and object:IsA("ValueBase") and object.Value == durability then
                local rockPart = object.Parent and object.Parent:FindFirstChild("Rock")
                if rockPart then
                    table.insert(found, rockPart)
                end
            end
        end
        return found
    end

    local function rockStep()
        local character = getCharacter(LocalPlayer)
        if not character or character:GetAttribute("InBattle") == true then
            return
        end

        local punch = equipPunch()
        if punch then
            local attackTime = punch:FindFirstChild("attackTime")
            if attackTime then
                attackTime.Value = 0
            end
            punch:Activate()
        end

        local leftHand = character:FindFirstChild("LeftHand")
        local rightHand = character:FindFirstChild("RightHand")
        if not leftHand or not rightHand then
            return
        end

        local durability = getRockDurability(selectedRock)
        if not durability then
            return
        end

        local okDur, durValue = pcall(function()
            return LocalPlayer.Durability.Value
        end)
        if not okDur or type(durValue) ~= "number" or durValue < durability then
            return
        end

        local now = os.clock()
        if scannedRock ~= selectedRock or now - lastRockScan >= 5 then
            rockParts = scanRocks(durability)
            scannedRock = selectedRock
            lastRockScan = now
        end

        for _, rockPart in ipairs(rockParts) do
            if rockPart.Parent then
                safeTouch(rockPart, rightHand)
                safeTouch(rockPart, leftHand)
            end
        end
    end

    Farm:Section({ Title = L("farm_rocks") })

    local RockTimerParagraph = Farm:Paragraph({
        Title = L("farm_timer"),
        Desc = L("farm_time") .. ": 00:00:00",
    })

    Farm:Button({
        Title = L("farm_reset_timer"),
        Icon = "rotate-ccw",
        Callback = function()
            rockTime = 0
            pcall(function()
                RockTimerParagraph:SetDesc(L("farm_time") .. ": " .. Util.formatTime(rockTime))
            end)
        end,
    })

    local RockDropdown = Farm:Dropdown({
        Title = L("farm_select_rock"),
        Values = rockNames,
        Value = nil,
        AllowNone = true,
        Callback = function(option)
            selectedRock = type(option) == "string" and option or ""
        end,
    })
    Util.register("selected_rock", RockDropdown)

    local AutoRockToggle = Farm:Toggle({
        Title = L("farm_autorock"),
        Desc = L("farm_autorock_desc"),
        Value = false,
        Callback = function(state)
            autoRock = state
            rockSession = rockSession + 1
            if not state then
                return
            end

            if not firetouchinterest then
                Util.notify(L("farm_rocks"), L("farm_no_touch"), "triangle-alert")
            end

            local session = rockSession
            rockParts = {}
            scannedRock = nil

            task.spawn(function()
                while autoRock and isAlive() and rockSession == session do
                    pcall(rockStep)
                    task.wait()
                end
            end)
        end,
    })
    Util.register("autofarm_rock", AutoRockToggle)

    task.spawn(function()
        while task.wait(1) and isAlive() do
            if autoRock then
                rockTime = rockTime + 1
                pcall(function()
                    RockTimerParagraph:SetDesc(L("farm_time") .. ": " .. Util.formatTime(rockTime))
                end)
            end
        end
    end)
    local loopGen = { tool = 0, train = 0, combo = 0, rebirth = 0 }

    local toolList = {
        { "Weight", "repTime", 1 },
        { "Pushups", "repTime", 1 },
        { "Situps", "repTime", 1 },
        { "Handstands", "repTime", 1 },
        { "Punch", "attackTime", 0.35 },
    }
    local toolNames = {}
    for _, t in ipairs(toolList) do
        table.insert(toolNames, t[1])
    end

    local selectedTool = ""
    local autoTool = false
    local fastTools = false
    local autoTrain = false

    local function fireMuscle(action, hand)
        pcall(function()
            if hand then
                LocalPlayer.muscleEvent:FireServer(action, hand)
            else
                LocalPlayer.muscleEvent:FireServer(action)
            end
        end)
    end

    local function toolEquip(toolName)
        local character, humanoid = getCharacter(LocalPlayer)
        local backpack = LocalPlayer:FindFirstChild("Backpack")
        if not character or not backpack or not toolName or toolName == "" then
            return
        end
        local tool = backpack:FindFirstChild(toolName)
        if tool and not character:FindFirstChild(toolName) then
            pcall(function()
                humanoid:EquipTool(tool)
            end)
        end
    end

    local function toolUnequip(toolName)
        local character = LocalPlayer.Character
        if not character or not toolName or toolName == "" then
            return
        end
        local tool = character:FindFirstChild(toolName)
        if tool then
            tool.Parent = LocalPlayer.Backpack
        end
    end

    local function punchLoop(condition)
        task.spawn(function()
            while condition() and isAlive() do
                local punch = equipPunch()
                if punch then
                    local attackTime = punch:FindFirstChild("attackTime")
                    if attackTime then
                        attackTime.Value = 0
                    end
                    pcall(function()
                        punch:Activate()
                    end)
                end
                task.wait()
            end
        end)
    end

    local function touchRock(rockPart, hand, delay)
        if not firetouchinterest then
            return
        end
        pcall(function()
            firetouchinterest(hand, rockPart, 0)
            if delay and delay > 0 then
                task.wait(delay)
            end
            firetouchinterest(hand, rockPart, 1)
        end)
    end

    Farm:Section({ Title = L("farm_tools") })

    local ToolDropdown = Farm:Dropdown({
        Title = L("farm_select_tool"),
        Values = toolNames,
        Value = nil,
        SearchBarEnabled = true,
        AllowNone = true,
        Callback = function(option)
            selectedTool = type(option) == "string" and option or ""
        end,
    })
    Util.register("selected_tool", ToolDropdown)

    local AutoToolToggle = Farm:Toggle({
        Title = L("farm_autotool"),
        Value = false,
        Callback = function(state)
            autoTool = state
            loopGen.tool = loopGen.tool + 1
            local gen = loopGen.tool

            if not state then
                toolUnequip(selectedTool)
                return
            end
            if selectedTool == "" then
                return
            end

            if selectedTool == "Punch" then
                punchLoop(function()
                    return autoTool and selectedTool == "Punch" and loopGen.tool == gen
                end)
            else
                toolEquip(selectedTool)
                task.spawn(function()
                    while autoTool and isAlive() and loopGen.tool == gen do
                        local character = LocalPlayer.Character
                        if character and selectedTool ~= "" and not character:FindFirstChild(selectedTool) then
                            toolEquip(selectedTool)
                        end
                        fireMuscle("rep")
                        task.wait(0.1)
                    end
                end)
            end
        end,
    })
    Util.register("auto_tool", AutoToolToggle)

    local fastToolsConn = nil

    local function applyFastTools(state)
        for _, t in ipairs(toolList) do
            local speed = state and 0 or t[3]
            for _, container in ipairs({ LocalPlayer.Backpack, LocalPlayer.Character }) do
                local tool = container and container:FindFirstChild(t[1])
                local value = tool and tool:FindFirstChild(t[2])
                if value then
                    value.Value = speed
                end
            end
        end
    end

    local FastToolsToggle = Farm:Toggle({
        Title = L("farm_fasttools"),
        Value = false,
        Callback = function(state)
            fastTools = state
            if fastToolsConn then
                fastToolsConn:Disconnect()
                fastToolsConn = nil
            end
            applyFastTools(state)
            if state then
                fastToolsConn = LocalPlayer.CharacterAdded:Connect(function()
                    task.wait(1)
                    if fastTools and isAlive() then
                        applyFastTools(true)
                    end
                end)
            end
        end,
    })
    Util.register("fast_tools", FastToolsToggle)

    local AutoTrainToggle = Farm:Toggle({
        Title = L("farm_autotrain"),
        Desc = L("farm_autotrain_desc"),
        Value = false,
        Callback = function(state)
            autoTrain = state
            loopGen.train = loopGen.train + 1
            local gen = loopGen.train
            if not state then
                return
            end
            task.spawn(function()
                while autoTrain and isAlive() and loopGen.train == gen do
                    local character, humanoid = getCharacter(LocalPlayer)
                    if character then
                        local trained = false

                        for _, name in ipairs(toolNames) do
                            local tool = character:FindFirstChild(name)
                            if tool and tool:IsA("Tool") then
                                if name == "Punch" then
                                    local attackTime = tool:FindFirstChild("attackTime")
                                    if attackTime and fastTools then
                                        attackTime.Value = 0
                                    end
                                    pcall(function()
                                        tool:Activate()
                                    end)
                                else
                                    fireMuscle("rep")
                                end
                                trained = true
                                break
                            end
                        end

                        if not trained and humanoid and (humanoid.SeatPart or humanoid.Sit) then
                            fireMuscle("rep")
                        end
                    end
                    task.wait(0.1)
                end
            end)
        end,
    })
    Util.register("auto_train", AutoTrainToggle)

    local comboList = {
        { "Auto Pushup + Punch Rock", "Pushups", "Industrial Rock", 0.0001 },
        { "Auto Situp + Punch Rock", "Situps", "Industrial Rock", 0.0001 },
        { "Auto Handstands + Punch Rock", "Handstands", "Industrial Rock", 0.0001 },
        { "Auto Weight + Punch Rock", "Weight", "Industrial Rock", 0.0001 },
    }
    local comboNames = {}
    for _, c in ipairs(comboList) do
        table.insert(comboNames, c[1])
    end

    local selectedCombo = ""
    local autoCombo = false

    local function runCombo(toolName, rockName, delay)
        local character = LocalPlayer.Character
        if not character or not character.Parent then
            return
        end
        fireMuscle("rep")
        local machines = workspace:FindFirstChild("machinesFolder")
        local rock = machines and machines:FindFirstChild(rockName)
        local leftHand = character:FindFirstChild("LeftHand")
        if rock and leftHand and rock:FindFirstChild("Rock") then
            touchRock(rock.Rock, leftHand, delay)
        end
        toolEquip(toolName)
    end

    Farm:Paragraph({
        Title = L("farm_combo_title"),
        Desc = L("farm_combo_desc"),
    })

    local ComboDropdown = Farm:Dropdown({
        Title = L("farm_select_combo"),
        Values = comboNames,
        Value = nil,
        SearchBarEnabled = true,
        AllowNone = true,
        Callback = function(option)
            selectedCombo = type(option) == "string" and option or ""
        end,
    })
    Util.register("selected_combo", ComboDropdown)

    local AutoComboToggle = Farm:Toggle({
        Title = L("farm_autocombo"),
        Value = false,
        Callback = function(state)
            autoCombo = state
            loopGen.combo = loopGen.combo + 1
            local gen = loopGen.combo

            if not state then
                for _, c in ipairs(comboList) do
                    if c[1] == selectedCombo then
                        toolUnequip(c[2])
                        break
                    end
                end
                return
            end
            if selectedCombo == "" then
                return
            end

            punchLoop(function()
                return autoCombo and loopGen.combo == gen
            end)

            task.spawn(function()
                while autoCombo and isAlive() and loopGen.combo == gen do
                    local character = LocalPlayer.Character
                    if character and character.Parent then
                        for _, c in ipairs(comboList) do
                            if c[1] == selectedCombo then
                                runCombo(c[2], c[3], c[4])
                                break
                            end
                        end
                    end
                    task.wait()
                end
            end)
        end,
    })
    Util.register("auto_combo", AutoComboToggle)

    local rebirthTarget = 0
    local autoRebirthTarget = false
    local autoRebirthInfinite = false
    local rebirthLock = false
    local rebirthLockConn = nil
    local rebirthLockCharConn = nil
    local antiRebirthHooked = false
    local rebirthLockSaved = nil
    local AutoRebirthTargetToggle, AutoRebirthInfiniteToggle

    local function rebirthUnequip()
        pcall(function()
            local character = LocalPlayer.Character
            local humanoid = character and character:FindFirstChildOfClass("Humanoid")
            if humanoid then
                humanoid:UnequipTools()
            end
        end)
    end

    local function rebirthLoop(isRunning)
        task.spawn(function()
            while isRunning() and isAlive() do
                pcall(function()
                    local character = LocalPlayer.Character
                    local backpack = LocalPlayer:FindFirstChild("Backpack")
                    local humanoid = character and character:FindFirstChildOfClass("Humanoid")
                    if character and backpack and humanoid then
                        local weight = character:FindFirstChild("Weight") or backpack:FindFirstChild("Weight")
                        if weight and weight.Parent ~= character then
                            humanoid:EquipTool(weight)
                        end
                    end
                end)

                fireMuscle("rep")
                task.wait(0.05)

                if not isRunning() then
                    break
                end

                if not autoRebirthInfinite then
                    local ok, current = pcall(function()
                        return LocalPlayer.leaderstats.Rebirths.Value
                    end)
                    if ok and current >= rebirthTarget then
                        autoRebirthTarget = false
                        pcall(function()
                            AutoRebirthTargetToggle:Set(false)
                        end)
                        rebirthUnequip()
                        break
                    end
                end

                pcall(function()
                    ReplicatedStorage.rEvents.rebirthRemote:InvokeServer("rebirthRequest")
                end)
            end
        end)
    end

    Farm:Section({ Title = L("farm_rebirths") })

    Farm:Input({
        Title = L("farm_rebirth_target"),
        Placeholder = L("farm_rebirth_ph"),
        Value = "",
        Callback = function(text)
            local n = tonumber(text)
            if n and n > 0 then
                rebirthTarget = n
            end
        end,
    })

    AutoRebirthTargetToggle = Farm:Toggle({
        Title = L("farm_autorebirth_target"),
        Value = false,
        Callback = function(state)
            autoRebirthTarget = state
            if state then
                if autoRebirthInfinite then
                    autoRebirthInfinite = false
                    pcall(function()
                        AutoRebirthInfiniteToggle:Set(false)
                    end)
                end
                if rebirthTarget <= 0 then
                    autoRebirthTarget = false
                    pcall(function()
                        AutoRebirthTargetToggle:Set(false)
                    end)
                    return
                end
                loopGen.rebirth = loopGen.rebirth + 1
                local gen = loopGen.rebirth
                rebirthLoop(function()
                    return autoRebirthTarget and loopGen.rebirth == gen
                end)
            elseif not autoRebirthInfinite then
                rebirthUnequip()
            end
        end,
    })
    Util.register("auto_rebirth_target", AutoRebirthTargetToggle)

    AutoRebirthInfiniteToggle = Farm:Toggle({
        Title = L("farm_autorebirth_inf"),
        Value = false,
        Callback = function(state)
            autoRebirthInfinite = state
            if state then
                if autoRebirthTarget then
                    autoRebirthTarget = false
                    pcall(function()
                        AutoRebirthTargetToggle:Set(false)
                    end)
                end
                loopGen.rebirth = loopGen.rebirth + 1
                local gen = loopGen.rebirth
                rebirthLoop(function()
                    return autoRebirthInfinite and loopGen.rebirth == gen
                end)
            elseif not autoRebirthTarget then
                rebirthUnequip()
            end
        end,
    })
    Util.register("auto_rebirth_infinite", AutoRebirthInfiniteToggle)

    Farm:Paragraph({
        Title = L("farm_rebirth_info_title"),
        Desc = L("farm_rebirth_info"),
    })

    local function applyLock(character)
        local humanoid = character and character:FindFirstChildOfClass("Humanoid")
        local root = character and character:FindFirstChild("HumanoidRootPart")
        if not humanoid or not root then
            return
        end

        if rebirthLockConn then
            rebirthLockConn:Disconnect()
            rebirthLockConn = nil
        end

        if rebirthLock then
            if not rebirthLockSaved then
                rebirthLockSaved = {
                    walkSpeed = humanoid.WalkSpeed,
                    jumpPower = humanoid.JumpPower,
                }
            end
            humanoid.WalkSpeed = 0
            humanoid.JumpPower = 0
            humanoid.AutoRotate = false
            humanoid:ChangeState(Enum.HumanoidStateType.Physics)
            local savedCFrame = root.CFrame

            rebirthLockConn = RunService.Heartbeat:Connect(function()
                if not rebirthLock then
                    return
                end
                local char = LocalPlayer.Character
                local hrp = char and char:FindFirstChild("HumanoidRootPart")
                if hrp then
                    hrp.AssemblyLinearVelocity = Vector3.zero
                    hrp.AssemblyAngularVelocity = Vector3.zero
                    hrp.CFrame = savedCFrame
                end
            end)
                else
            if rebirthLockSaved then
                humanoid.WalkSpeed = rebirthLockSaved.walkSpeed
                humanoid.JumpPower = rebirthLockSaved.jumpPower
                rebirthLockSaved = nil
            end
            humanoid.AutoRotate = true
            humanoid:ChangeState(Enum.HumanoidStateType.GettingUp)
        end
    end

    local RebirthLockToggle = Farm:Toggle({
        Title = L("farm_lockpos"),
        Value = false,
        Callback = function(state)
            rebirthLock = state

            if rebirthLockConn then
                rebirthLockConn:Disconnect()
                rebirthLockConn = nil
            end
            if rebirthLockCharConn then
                rebirthLockCharConn:Disconnect()
                rebirthLockCharConn = nil
            end

            if LocalPlayer.Character then
                applyLock(LocalPlayer.Character)
            end

            if state then
                rebirthLockCharConn = LocalPlayer.CharacterAdded:Connect(function(character)
                    if rebirthLock then
                        task.wait(1)
                        applyLock(character)
                    end
                end)
            end
        end,
    })
    Util.register("rebirth_lock", RebirthLockToggle)

    Farm:Button({
        Title = L("farm_tpking"),
        Icon = "crown",
        Callback = function()
            local character = LocalPlayer.Character
            local root = character and character:FindFirstChild("HumanoidRootPart")
            if root then
                local base = Vector3.new(-8636, 17, -5759)
                root.CFrame = CFrame.new(base + Vector3.new(
                    (math.random() * 2 - 1) * 0.3, 0, (math.random() * 2 - 1) * 0.3
                ))
            end
        end,
    })

    Farm:Button({
        Title = L("farm_antirebirth"),
        Callback = function()
            if not hookmetamethod or not newcclosure then
                Util.notify(L("farm_antirebirth"), L("farm_antirebirth_unsup"), "triangle-alert")
                return
            end
            if antiRebirthHooked then
                Util.notify(L("farm_antirebirth"), L("farm_antirebirth_already"), "info")
                return
            end
            antiRebirthHooked = true

            local oldNamecall
            oldNamecall = hookmetamethod(game, "__namecall", newcclosure(function(self, ...)
                local method = getnamecallmethod()
                local ok, name = pcall(function()
                    return self.Name
                end)
                if ok and name
                    and not (checkcaller and checkcaller())
                    and (method == "InvokeServer" or method == "FireServer")
                    and string.find(string.lower(name), "rebirth") then
                    return nil
                end
                return oldNamecall(self, ...)
            end))

            Util.notify(L("farm_antirebirth"), L("farm_antirebirth_done"), "check")
        end,
    })
        task.spawn(function()
        while isAlive() do
            task.wait(1)
        end
        rebirthLock = false
        autoRebirthTarget = false
        autoRebirthInfinite = false
        autoRock = false
        autoTool = false
        autoTrain = false
        autoCombo = false
        autoFarmBrawls = false
        autoJoinBrawls = false
        fastTools = false
        if rebirthLockConn then
            rebirthLockConn:Disconnect()
            rebirthLockConn = nil
        end
        if rebirthLockCharConn then
            rebirthLockCharConn:Disconnect()
            rebirthLockCharConn = nil
        end
        if fastToolsConn then
            fastToolsConn:Disconnect()
            fastToolsConn = nil
        end
    end)
end

do
    local Farm = Tabs.Farm
    local CollectionService = game:GetService("CollectionService")
    local VirtualInputManager = game:GetService("VirtualInputManager")

    local NOTIFY_COLOR = 0x170158
    local NOTIFY_NAME = "Mystery Notification"
    local NOTIFY_IMAGE = "https://raw.githubusercontent.com/Mystery-Center/Mystery-Media/main/Mystery%20Notificaciones%20Imagen.png"

    local TRAIN_FLAGS = {
        "auto_tool",
        "auto_train",
        "auto_combo",
        "autofarm_rock",
        "fast_reps",
        "fast_rebirth",
        "auto_rebirth_target",
        "auto_rebirth_infinite",
        "rebirth_lock",
    }

    local connections = {}
    local MainToggle
    local HallToggle
    local MainDropdown
    local HallDropdown

    local function getChar()
        return LocalPlayer.Character
    end

    local function getHum()
        local char = getChar()
        return char and char:FindFirstChildOfClass("Humanoid")
    end

    local function getRoot()
        local char = getChar()
        return char and char:FindFirstChild("HumanoidRootPart")
    end

    local function shortNumber(value)
        value = tonumber(value) or 0
        local units = {
            { 1e18, "Qi" },
            { 1e15, "Qa" },
            { 1e12, "T" },
            { 1e9, "B" },
            { 1e6, "M" },
            { 1e3, "K" },
        }
        for _, unit in ipairs(units) do
            if value >= unit[1] then
                return string.format("%.2f", value / unit[1]) .. unit[2]
            end
        end
        return string.format("%.0f", value)
    end

    local function norm(text)
        return string.lower((tostring(text):gsub("[^%w]", "")))
    end

    local function newTargets()
        return { display = {}, order = {}, selected = {}, byDisplay = {} }
    end

    local function addTarget(targets, id, display)
        id = tostring(id or "")
        display = tostring(display or id)
        if id == "" or targets.display[id] then
            return false
        end
        targets.display[id] = display
        targets.byDisplay[display] = id
        targets.selected[id] = true
        table.insert(targets.order, id)
        return true
    end

    local function displayList(targets)
        local list = {}
        for _, id in ipairs(targets.order) do
            table.insert(list, targets.display[id])
        end
        return list
    end

    local function selectedList(targets)
        local list = {}
        for _, id in ipairs(targets.order) do
            if targets.selected[id] then
                table.insert(list, targets.display[id])
            end
        end
        return list
    end

    local function applySelection(targets, options)
        local chosen = {}
        if type(options) == "table" then
            for _, value in pairs(options) do
                chosen[tostring(value)] = true
            end
        elseif type(options) == "string" then
            chosen[options] = true
        end
        for _, id in ipairs(targets.order) do
            targets.selected[id] = chosen[targets.display[id]] == true
        end
    end

    local function refreshDropdown(dropdown, targets)
        if not dropdown then
            return
        end
        pcall(function()
            dropdown:Refresh(displayList(targets))
        end)
        pcall(function()
            dropdown:Select(selectedList(targets))
        end)
    end

    local MainTargets = newTargets()
    local HallTargets = newTargets()
    local HallLookup = {}

    local bossConfig = nil
    pcall(function()
        local shared = ReplicatedStorage:FindFirstChild("shared")
        local folder = shared and shared:FindFirstChild("config")
        local module = folder and folder:FindFirstChild("BossEventConfig")
        if module then
            bossConfig = require(module)
        end
    end)

    if type(bossConfig) == "table" and type(bossConfig.RARITIES) == "table" then
        for _, rarity in ipairs(bossConfig.RARITIES) do
            addTarget(MainTargets, rarity.BossModel, rarity.DisplayName or rarity.Name or rarity.BossModel)
        end
    end

    local hallBosses = {
        { "GrimReaper", "Grim Reaper" },
        { "FrankenBrute", "Frankenbrute" },
        { "PumpkinTitan", "Pumpkin Titan" },
        { "ScarecrowColossus", "Scarecrow Colossus" },
    }
    for _, entry in ipairs(hallBosses) do
        addTarget(HallTargets, entry[1], entry[2])
        HallLookup[norm(entry[1])] = entry[1]
        HallLookup[norm(entry[2])] = entry[1]
    end

    local Main = {
        running = false,
        generation = 0,
        continueTraining = true,
        status = L("ab_waiting_for_boss"),
        punchInterval = 0.3,
        lastPunch = 0,
        attackSequence = nil,
        evadeUntil = 0,
        evadeDistance = 230,
        punchBehind = 45,
        stompThreshold = 0.35,
        dodgeStomps = false,
        returnCFrame = nil,
    }

    local Hall = {
        running = false,
        generation = 0,
        status = L("ab_waiting_for_halloween_boss"),
        punchInterval = 0.3,
        lastPunch = 0,
        attackSequence = nil,
        evadeUntil = 0,
        evadeDistance = 230,
        punchBehind = 45,
        stompThreshold = 0.35,
        dodgeStomps = false,
        returnCFrame = nil,
        target = nil,
    }

    if type(bossConfig) == "table" then
        local interval = math.max(0.3, (tonumber(bossConfig.MIN_HIT_INTERVAL) or 0.29) + 0.01)
        Main.punchInterval = interval
        Hall.punchInterval = interval
    end

    local function alive(state, generation)
        return state.running and state.generation == generation and isAlive()
    end

    local Training = { snapshot = nil }

    local function isOn(element)
        local ok, value = pcall(function()
            return element.Value
        end)
        return ok and value == true
    end

    local function setElement(element, state)
        pcall(function()
            element:Set(state)
        end)
    end

    local function leaveMachine()
        local humanoid = getHum()
        if humanoid and (humanoid.SeatPart ~= nil or humanoid.Sit) then
            pcall(function()
                humanoid.Sit = false
                humanoid.Jump = true
                humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
            end)
            task.wait(0.2)
        end
    end

    local function pauseTraining()
        if Training.snapshot then
            return
        end
        local snapshot = {}
        for _, flag in ipairs(TRAIN_FLAGS) do
            local element = Registry[flag]
            if element and isOn(element) then
                snapshot[flag] = true
                setElement(element, false)
            end
        end
        Training.snapshot = snapshot
        leaveMachine()
    end

    local function resumeTraining()
        local snapshot = Training.snapshot
        if not snapshot then
            return
        end
        Training.snapshot = nil
        for _, flag in ipairs(TRAIN_FLAGS) do
            local element = Registry[flag]
            if snapshot[flag] and element then
                setElement(element, true)
            end
        end
    end

    local function captureReturn(state)
        local root = getRoot()
        if root and not state.returnCFrame then
            state.returnCFrame = root.CFrame
        end
    end

    local function returnToFarm(state)
        local cframe = state.returnCFrame
        state.returnCFrame = nil
        local char = getChar()
        local root = getRoot()
        if cframe and root then
            pcall(function()
                root.CFrame = cframe
                root.AssemblyLinearVelocity = Vector3.zero
                root.AssemblyAngularVelocity = Vector3.zero
            end)
        end
        local backpack = LocalPlayer:FindFirstChild("Backpack")
        local punch = char and char:FindFirstChild("Punch")
        if punch and backpack then
            pcall(function()
                punch.Parent = backpack
            end)
        end
    end

    local function getHeadPosition(model, hitbox)
        local head = model:FindFirstChild("Head", true) or model:FindFirstChild("head", true)
        if head and head:IsA("BasePart") then
            return head.Position
        end
        if head and head:IsA("Bone") then
            return head.WorldPosition
        end
        return hitbox.Position + Vector3.new(0, hitbox.Size.Y * 0.35, 0)
    end

    local function touchHitbox(hitbox)
        if not firetouchinterest then
            return
        end
        local char = getChar()
        if not char then
            return
        end
        local hands = {
            char:FindFirstChild("LeftHand") or char:FindFirstChild("Left Arm"),
            char:FindFirstChild("RightHand") or char:FindFirstChild("Right Arm"),
        }
        for _, hand in pairs(hands) do
            pcall(function()
                firetouchinterest(hand, hitbox, 0)
                firetouchinterest(hand, hitbox, 1)
            end)
        end
    end

    local function evade(state, model, hitbox, root, humanoid)
        local sequence = model:GetAttribute("BossAttackSequence")
        local kind = model:GetAttribute("BossAttackKind")
        local attackCFrame = model:GetAttribute("BossAttackCFrame")
        local impactTime = model:GetAttribute("BossAttackImpactTime")

        if type(sequence) == "number" and sequence ~= state.attackSequence then
            state.attackSequence = sequence
            if type(kind) == "string" and typeof(attackCFrame) == "CFrame" and type(impactTime) == "number" then
                state.evadeUntil = impactTime + 0.6
            end
        end

        if typeof(attackCFrame) ~= "CFrame" or workspace:GetServerTimeNow() > state.evadeUntil then
            return nil
        end

        kind = string.lower(tostring(kind or ""))

        if string.find(kind, "punch", 1, true) then
            local center = getHeadPosition(model, hitbox)
            local direction = Vector3.new(attackCFrame.LookVector.X, 0, attackCFrame.LookVector.Z)
            if direction.Magnitude < 1 then
                direction = Vector3.new(hitbox.CFrame.LookVector.X, 0, hitbox.CFrame.LookVector.Z)
            end
            if direction.Magnitude < 1 then
                direction = Vector3.new(0, 0, 1)
            end
            local safe = center - direction.Unit * state.punchBehind
            root.CFrame = CFrame.lookAt(safe, center)
            root.AssemblyLinearVelocity = Vector3.zero
            root.AssemblyAngularVelocity = Vector3.zero
            state.status = L("ab_dodging_punch")
            return "Punch"
        end

        if not string.find(kind, "stomp", 1, true) then
            return nil
        end

        if humanoid.Health / math.max(humanoid.MaxHealth, 1) <= state.stompThreshold then
            state.dodgeStomps = true
        end
        if not state.dodgeStomps then
            return nil
        end

        local direction = Vector3.new(root.Position.X - attackCFrame.Position.X, 0, root.Position.Z - attackCFrame.Position.Z)
        if direction.Magnitude < 1 then
            direction = Vector3.new(-attackCFrame.LookVector.X, 0, -attackCFrame.LookVector.Z)
        end
        if direction.Magnitude < 1 then
            direction = Vector3.new(1, 0, 0)
        end
        local safe = attackCFrame.Position + direction.Unit * state.evadeDistance + Vector3.new(0, 18, 0)
        root.CFrame = CFrame.lookAt(safe, attackCFrame.Position)
        root.AssemblyLinearVelocity = Vector3.zero
        root.AssemblyAngularVelocity = Vector3.zero
        state.status = L("ab_dodging_stomp")
        return "Stomp"
    end

    local function attack(state, model, hitbox)
        local char = getChar()
        local root = getRoot()
        local humanoid = getHum()
        if not char or not root or not humanoid or humanoid.Health <= 0 then
            return
        end

        local mode = evade(state, model, hitbox, root, humanoid)
        if mode == "Stomp" then
            return
        end

        local backpack = LocalPlayer:FindFirstChild("Backpack")
        local punch = char:FindFirstChild("Punch") or (backpack and backpack:FindFirstChild("Punch"))
        if punch and punch.Parent ~= char then
            pcall(function()
                humanoid:EquipTool(punch)
            end)
        end

        if mode ~= "Punch" then
            local center = getHeadPosition(model, hitbox)
            root.CFrame = CFrame.lookAt(center, center + hitbox.CFrame.LookVector)
        end
        root.AssemblyLinearVelocity = Vector3.zero
        root.AssemblyAngularVelocity = Vector3.zero

        touchHitbox(hitbox)

        if os.clock() - state.lastPunch >= state.punchInterval then
            state.lastPunch = os.clock()
            local event = LocalPlayer:FindFirstChild("muscleEvent")
            pcall(function()
                if event then
                    event:FireServer("punch", "leftHand")
                    event:FireServer("punch", "rightHand")
                end
                if punch and punch.Parent == char then
                    punch:Activate()
                end
            end)
        end
    end

    local lastBossScan = 0

    local function findMainBoss()
        local model = nil
        for _, candidate in ipairs(CollectionService:GetTagged("BossEventBoss")) do
            if candidate:IsA("Model") and candidate:IsDescendantOf(workspace) then
                model = candidate
                break
            end
        end

        if not model then
            local now = os.clock()
            if now - lastBossScan >= 2 then
                lastBossScan = now
                local events = workspace:FindFirstChild("Events")
                local folder = events and (events:FindFirstChild("BossEvent") or events:FindFirstChild("BossArena"))
                if folder then
                    for _, candidate in ipairs(folder:GetDescendants()) do
                        if candidate:IsA("Model")
                            and (candidate:FindFirstChild("BossDamageHitbox") or CollectionService:HasTag(candidate, "BossEventBoss")) then
                            model = candidate
                            break
                        end
                    end
                end
            end
        end

        if not model then
            return nil
        end

        local stats = model:FindFirstChild("stats")
        local health = stats and stats:FindFirstChild("Health")
        local hitbox = model:FindFirstChild("BossDamageHitbox", true)
        if not hitbox or not hitbox:IsA("BasePart") then
            return nil
        end

        local current = health and health.Value or workspace:GetAttribute("BossHealth")
        if type(current) == "number" and current <= 0 then
            return nil
        end

        return model, hitbox
    end

    local function mainName(model)
        return workspace:GetAttribute("BossDisplayName") or model.Name
    end

    local function mainHealth(model)
        local stats = model:FindFirstChild("stats")
        local health = stats and stats:FindFirstChild("Health")
        local maxHealth = stats and stats:FindFirstChild("MaxHealth")
        local current = health and health.Value or workspace:GetAttribute("BossHealth") or 0
        local maximum = maxHealth and maxHealth.Value or workspace:GetAttribute("BossMaxHealth") or 0
        return tonumber(current) or 0, tonumber(maximum) or 0
    end

    local function shouldFarmMain(model)
        if not MainTargets.display[model.Name] then
            if addTarget(MainTargets, model.Name, mainName(model)) then
                refreshDropdown(MainDropdown, MainTargets)
            end
        end
        return MainTargets.selected[model.Name] == true
    end

    local function hallId(model)
        local raw = model:GetAttribute("BossId") or model.Name
        return HallLookup[norm(raw)] or tostring(raw)
    end

    local function hallName(model)
        return HallTargets.display[hallId(model)] or model.Name
    end

    local function hallHealth(model)
        return tonumber(model:GetAttribute("Health")) or 0, tonumber(model:GetAttribute("MaxHealth")) or 0
    end

    local function shouldFarmHall(model)
        local selected = HallTargets.selected[hallId(model)]
        if selected == nil then
            return true
        end
        return selected
    end

    local function findHallBoss(selectedOnly)
        local root = getRoot()
        local best, bestHitbox = nil, nil
        local bestDistance = math.huge

        for _, candidate in ipairs(CollectionService:GetTagged("HalloweenBoss")) do
            if candidate:IsA("Model") and candidate:IsDescendantOf(workspace)
                and hallHealth(candidate) > 0
                and (not selectedOnly or shouldFarmHall(candidate)) then
                local hitbox = candidate:FindFirstChild("BossDamageHitbox", true)
                    or candidate.PrimaryPart
                    or candidate:FindFirstChild("HumanoidRootPart")

                if hitbox and hitbox:IsA("BasePart") then
                    if selectedOnly and candidate == Hall.target then
                        return candidate, hitbox
                    end
                    local distance = root and (root.Position - hitbox.Position).Magnitude or 0
                    if not best or distance < bestDistance then
                        best, bestHitbox, bestDistance = candidate, hitbox, distance
                    end
                end
            end
        end

        return best, bestHitbox
    end

    local function findChest()
        local chest = nil
        for _, candidate in ipairs(CollectionService:GetTagged("BossEventChest")) do
            if candidate:IsDescendantOf(workspace) then
                chest = candidate
                break
            end
        end

        if not chest then
            chest = workspace:FindFirstChild("BossChest", true)
        end

        if not chest then
            for _, candidate in ipairs(workspace:GetDescendants()) do
                if candidate:IsA("ProximityPrompt") and candidate.Name == "bossChestPrompt" then
                    chest = candidate.Parent
                    break
                end
            end
        end

        if not chest then
            return nil
        end

        local prompt = chest:FindFirstChild("bossChestPrompt", true)
        local part = prompt and prompt.Parent
        if not part then
            if chest:IsA("Model") then
                part = chest.PrimaryPart or chest:FindFirstChildWhichIsA("BasePart", true)
            else
                part = chest
            end
        end

        if part and part:IsA("BasePart") then
            return chest, prompt, part
        end
        return nil
    end

    local function collectChest(state, generation)
        state.status = L("ab_waiting_for_chest")

        local startedAt = os.clock()
        local chest, prompt, part

        repeat
            chest, prompt, part = findChest()
            if chest and chest:GetAttribute("BossChestEmerging") ~= true then
                break
            end
            task.wait(0.1)
        until not alive(state, generation) or os.clock() - startedAt >= 12

        if not alive(state, generation) or not chest or not part then
            return
        end

        state.status = L("ab_collecting_chest")
        startedAt = os.clock()

        repeat
            local root = getRoot()
            local humanoid = getHum()

            if root and humanoid and humanoid.Health > 0 and chest.Parent and part.Parent then
                pcall(function()
                    root.CFrame = CFrame.lookAt(part.Position + Vector3.new(0, 3, 4), part.Position)
                    root.AssemblyLinearVelocity = Vector3.zero
                end)
                task.wait(0.15)

                if not alive(state, generation) then
                    return
                end

                local fired = prompt
                    and prompt.Parent
                    and type(fireproximityprompt) == "function"
                    and pcall(fireproximityprompt, prompt)

                if not fired then
                    pcall(function()
                        VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.E, false, game)
                        task.wait(0.1)
                        VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.E, false, game)
                    end)
                end
            end

            task.wait(0.25)
        until not alive(state, generation)
            or LocalPlayer:GetAttribute("BossChestPending") == false
            or not chest.Parent
            or os.clock() - startedAt >= 12
    end

    local function runMain(generation)
        local wasFighting = false

        while alive(Main, generation) do
            local busy = false

            pcall(function()
                local model, hitbox = findMainBoss()
                local selected = model ~= nil and shouldFarmMain(model)

                if model and not selected then
                    if wasFighting then
                        wasFighting = false
                        returnToFarm(Main)
                        if Main.continueTraining then
                            resumeTraining()
                        end
                    end
                    Main.status = L("ab_skipping") .. " " .. tostring(mainName(model))

                elseif model then
                    busy = true

                    if not wasFighting then
                        wasFighting = true
                        Main.attackSequence = nil
                        Main.evadeUntil = 0
                        Main.dodgeStomps = false
                        captureReturn(Main)
                        pauseTraining()
                    end

                    local humanoid = getHum()
                    if humanoid and humanoid.Health > 0 and getRoot() then
                        Main.status = L("ab_fighting")
                        attack(Main, model, hitbox)
                    else
                        Main.status = L("ab_waiting_for_respawn")
                    end

                elseif wasFighting then
                    wasFighting = false

                    if workspace:GetAttribute("BossResultKind") ~= "Survived" then
                        collectChest(Main, generation)
                    end

                    if not alive(Main, generation) then
                        return
                    end

                    returnToFarm(Main)
                    if Main.continueTraining then
                        resumeTraining()
                    end
                    Main.status = L("ab_waiting_for_boss")

                else
                    Main.status = L("ab_waiting_for_boss")
                end
            end)

            task.wait(busy and 0.03 or 0.25)
        end
    end

    local function runHall(generation)
        local wasFighting = false

        while alive(Hall, generation) do
            local busy = false

            pcall(function()
                local model, hitbox = findHallBoss(true)

                if model then
                    busy = true

                    if not wasFighting then
                        wasFighting = true
                        captureReturn(Hall)
                        pauseTraining()
                    end

                    if Hall.target ~= model then
                        Hall.target = model
                        Hall.attackSequence = nil
                        Hall.evadeUntil = 0
                        Hall.dodgeStomps = false
                    end

                    local humanoid = getHum()
                    if humanoid and humanoid.Health > 0 and getRoot() then
                        Hall.status = L("ab_fighting")
                        attack(Hall, model, hitbox)
                    else
                        Hall.status = L("ab_waiting_for_respawn")
                    end
                else
                    Hall.target = nil
                    if wasFighting then
                        wasFighting = false
                        returnToFarm(Hall)
                        if Main.continueTraining then
                            resumeTraining()
                        end
                    end
                    Hall.status = L("ab_waiting_for_halloween_boss")
                end
            end)

            task.wait(busy and 0.03 or 0.25)
        end
    end

    local function formatCountdown(seconds)
        seconds = math.max(0, math.floor(seconds or 0))
        return string.format("%dh %dmin %ds", math.floor(seconds / 3600), math.floor(seconds % 3600 / 60), seconds % 60)
    end

    Farm:Section({ Title = L("boss_section") })

    local MainStatus = Farm:Paragraph({
        Title = L("boss_status_title"),
        Desc = L("home_loading"),
    })

    MainDropdown = Farm:Dropdown({
        Title = L("ab_target_bosses"),
        Values = displayList(MainTargets),
        Value = selectedList(MainTargets),
        Multi = true,
        AllowNone = true,
        SearchBarEnabled = true,
        Callback = function(options)
            applySelection(MainTargets, options)
        end,
    })
    Util.register("boss_targets", MainDropdown)

    local ContinueToggle = Farm:Toggle({
        Title = L("ab_continue_farming"),
        Value = true,
        Callback = function(state)
            Main.continueTraining = state
            if state and not Main.running and not Hall.running then
                resumeTraining()
            end
        end,
    })
    Util.register("boss_continue", ContinueToggle)

    MainToggle = Farm:Toggle({
        Title = L("boss_autoboss"),
        Value = false,
        Callback = function(state)
            if state and Hall.running then
                pcall(function()
                    HallToggle:Set(false)
                end)
            end

            Main.generation = Main.generation + 1
            local generation = Main.generation
            Main.running = state

            if not state then
                returnToFarm(Main)
                resumeTraining()
                Main.status = L("ab_disabled")
                return
            end

            if type(bossConfig) == "table" and bossConfig.ENABLED == false then
                Main.running = false
                Util.notify(L("boss_section"), L("boss_unavailable"), "triangle-alert")
                task.defer(function()
                    pcall(function()
                        MainToggle:Set(false)
                    end)
                end)
                return
            end

            Main.status = L("ab_waiting_for_boss")
            task.spawn(runMain, generation)
        end,
    })
    Util.register("auto_boss", MainToggle)

    Farm:Section({ Title = L("hw_section") })

    local HallStatus = Farm:Paragraph({
        Title = L("hw_health_title"),
        Desc = L("home_loading"),
    })

    HallDropdown = Farm:Dropdown({
        Title = L("ab_target_halloween_bosses"),
        Values = displayList(HallTargets),
        Value = selectedList(HallTargets),
        Multi = true,
        AllowNone = true,
        SearchBarEnabled = true,
        Callback = function(options)
            applySelection(HallTargets, options)
        end,
    })
    Util.register("halloween_targets", HallDropdown)

    HallToggle = Farm:Toggle({
        Title = L("hw_attack"),
        Value = false,
        Callback = function(state)
            if state and Main.running then
                pcall(function()
                    MainToggle:Set(false)
                end)
            end

            Hall.generation = Hall.generation + 1
            local generation = Hall.generation
            Hall.running = state

            if not state then
                Hall.target = nil
                returnToFarm(Hall)
                resumeTraining()
                Hall.status = L("ab_disabled")
                return
            end

            Hall.status = L("ab_waiting_for_halloween_boss")
            task.spawn(runHall, generation)
        end,
    })
    Util.register("halloween_attack", HallToggle)

    task.spawn(function()
        while isAlive() do
            pcall(function()
                local model = findMainBoss()
                local bossText = L("boss_none")
                local healthText = "0 / 0"
                local nextText

                if model then
                    local current, maximum = mainHealth(model)
                    bossText = tostring(mainName(model))
                    healthText = shortNumber(current) .. " / " .. shortNumber(maximum)
                    nextText = L("ab_current_boss_active")
                else
                    local nextTime = workspace:GetAttribute("BossSpawnNextTime")
                    if type(nextTime) == "number" then
                        nextText = formatCountdown(nextTime - workspace:GetServerTimeNow())
                    else
                        nextText = "N/A"
                    end
                end

                MainStatus:SetDesc(table.concat({
                    L("boss_status") .. ": " .. Main.status,
                    L("boss_boss") .. ": " .. bossText,
                    L("boss_health") .. ": " .. healthText,
                    L("boss_next") .. ": " .. nextText,
                }, "\n"))
            end)

            pcall(function()
                local model = Hall.target
                if not model or not model.Parent or hallHealth(model) <= 0 then
                    model = findHallBoss(false)
                end

                local bossText = L("boss_none")
                local healthText = "0 / 0"
                local nextText = L("ab_waiting_for_spawn")

                if model then
                    local current, maximum = hallHealth(model)
                    bossText = hallName(model)
                    healthText = shortNumber(current) .. " / " .. shortNumber(maximum)
                    nextText = L("ab_current_boss_active")
                end

                HallStatus:SetDesc(table.concat({
                    L("boss_status") .. ": " .. Hall.status,
                    L("boss_boss") .. ": " .. bossText,
                    L("boss_health") .. ": " .. healthText,
                    L("boss_next") .. ": " .. nextText,
                }, "\n"))
            end)

            task.wait(0.25)
        end
    end)

    local Webhook = {
        url = "",
        enabled = false,
        seen = {},
        seenModels = setmetatable({}, { __mode = "k" }),
        avatar = nil,
    }

    local WebhookHosts = {
        ["discord.com"] = true,
        ["discordapp.com"] = true,
        ["ptb.discord.com"] = true,
        ["canary.discord.com"] = true,
    }

    local function isValidWebhook(url)
        if type(url) ~= "string" then
            return false
        end
        local host = url:match("^https://([%w%.]+)/api/webhooks/%d+/[%w_%-]+$")
        return host ~= nil and WebhookHosts[host] == true
    end

    local function webhookAvatar()
        if not Webhook.avatar then
            Webhook.avatar = Logger.getAvatar(LocalPlayer.UserId)
        end
        return Webhook.avatar
    end

    local function buildEmbed(title, bossName, healthText)
        local joinUrl = "https://www.roblox.com/games/start?placeId=" .. tostring(game.PlaceId)
            .. "&gameInstanceId=" .. tostring(game.JobId)

        return {
            title = "🟣 " .. title,
            description = table.concat({
                "**Boss:** " .. bossName,
                "**Health:** `" .. healthText .. "`",
                "**Players:** `" .. #Players:GetPlayers() .. "/" .. Players.MaxPlayers .. "`",
                "",
                "[Click To Join](" .. joinUrl .. ")",
            }, "\n"),
            color = NOTIFY_COLOR,
            image = { url = NOTIFY_IMAGE },
            thumbnail = { url = webhookAvatar() },
            footer = { text = Config.HubName },
            timestamp = os.date("!%Y-%m-%dT%H:%M:%SZ"),
        }
    end

    local function postWebhook(embed)
        local request = Logger.getRequest()
        if not request or not isValidWebhook(Webhook.url) then
            return false
        end

        local encodeOk, body = pcall(function()
            return HttpService:JSONEncode({
                username = NOTIFY_NAME,
                embeds = { embed },
            })
        end)
        if not encodeOk then
            return false
        end

        for attempt = 1, 3 do
            local ok, response = pcall(request, {
                Url = Webhook.url,
                Method = "POST",
                Headers = { ["Content-Type"] = "application/json" },
                Body = body,
            })

            local code = ok and type(response) == "table" and tonumber(response.StatusCode or response.Status)
            if code and code >= 200 and code < 300 then
                return true
            end

            local retry = not code or code == 408 or code == 429 or code >= 500
            if not retry then
                return false
            end

            local delay = 3 * attempt
            if code == 429 then
                pcall(function()
                    local data = HttpService:JSONDecode(response.Body)
                    delay = math.max(delay, tonumber(data.retry_after) or 0)
                end)
            end
            task.wait(delay)
        end

        return false
    end

    local function observeMainSpawn()
        if not Webhook.enabled or not isValidWebhook(Webhook.url) then
            return
        end
        if workspace:GetAttribute("BossActive") ~= true then
            return
        end

        local sequence = workspace:GetAttribute("BossSpawnSequence")
        local name = workspace:GetAttribute("BossDisplayName")
        local health = tonumber(workspace:GetAttribute("BossMaxHealth"))
        if sequence == nil or type(name) ~= "string" or not health or health <= 0 then
            return
        end

        local key = tostring(game.JobId) .. "|" .. tostring(sequence)
        if Webhook.seen[key] then
            return
        end
        Webhook.seen[key] = true

        task.spawn(function()
            postWebhook(buildEmbed("Boss Spawned", name, shortNumber(health)))
        end)
    end

    table.insert(connections, workspace:GetAttributeChangedSignal("BossActive"):Connect(observeMainSpawn))
    table.insert(connections, workspace:GetAttributeChangedSignal("BossSpawnSequence"):Connect(observeMainSpawn))
    table.insert(connections, workspace:GetAttributeChangedSignal("BossMaxHealth"):Connect(observeMainSpawn))

    table.insert(connections, CollectionService:GetInstanceAddedSignal("HalloweenBoss"):Connect(function(model)
        task.spawn(function()
            if not Webhook.enabled or not isValidWebhook(Webhook.url) or Webhook.seenModels[model] then
                return
            end
            Webhook.seenModels[model] = true

            local deadline = os.clock() + 4
            while model.Parent and select(2, hallHealth(model)) <= 0 and os.clock() < deadline do
                task.wait(0.2)
            end

            local _, maximum = hallHealth(model)
            postWebhook(buildEmbed("Halloween Boss Spawned", hallName(model), shortNumber(maximum)))
        end)
    end))

    Farm:Section({ Title = L("bw_section") })

    local WebhookInput = Farm:Input({
        Title = L("bw_input"),
        Placeholder = "https://discord.com/api/webhooks/...",
        Value = "",
        Callback = function(text)
            local clean = tostring(text or ""):gsub("%s+", "")
            Webhook.url = clean
        end,
    })
    Util.register("boss_webhook_url", WebhookInput)

    local WebhookToggle = Farm:Toggle({
        Title = L("bw_toggle"),
        Desc = L("bw_toggle_desc"),
        Value = false,
        Callback = function(state)
            Webhook.enabled = state
            if state then
                task.spawn(observeMainSpawn)
            end
        end,
    })
    Util.register("boss_webhook", WebhookToggle)

    Farm:Button({
        Title = L("bw_test"),
        Icon = "send",
        Callback = function()
            if not Logger.getRequest() then
                Util.notify(L("bw_section"), L("bw_no_http"), "triangle-alert")
                return
            end
            if not isValidWebhook(Webhook.url) then
                Util.notify(L("bw_section"), L("bw_invalid"), "triangle-alert")
                return
            end

            task.spawn(function()
                local sent = postWebhook(buildEmbed("Webhook Test", "Mystery Hub", "N/A"))
                if sent then
                    Util.notify(L("bw_section"), L("bw_test_ok"), "check")
                else
                    Util.notify(L("bw_section"), L("bw_test_fail"), "triangle-alert")
                end
            end)
        end,
    })

    task.spawn(function()
        while isAlive() do
            task.wait(1)
        end
        Main.running = false
        Hall.running = false
        Main.generation = Main.generation + 1
        Hall.generation = Hall.generation + 1
        pcall(function()
            returnToFarm(Main)
            returnToFarm(Hall)
        end)
        for _, connection in ipairs(connections) do
            pcall(function()
                connection:Disconnect()
            end)
        end
    end)
end

do
    local Packs = Tabs.Packs

    local REBIRTH_CYCLE = 6
    local REBIRTH_TOLERANCE = 0.75

    local function remote(name)
        local events = ReplicatedStorage:FindFirstChild("rEvents")
        return events and events:FindFirstChild(name)
    end

    local function getStat(parentName, statName)
        local parent = parentName and LocalPlayer:FindFirstChild(parentName) or LocalPlayer
        local stat = parent and parent:FindFirstChild(statName)
        return stat and tonumber(stat.Value) or 0
    end

    local function getStrength()
        return getStat("leaderstats", "Strength")
    end

    local function getDurability()
        return getStat(nil, "Durability")
    end

    local function getRebirths()
        return getStat("leaderstats", "Rebirths")
    end

    local function formatNumber(n)
        n = tonumber(n) or 0
        local sign = ""
        if n < 0 then
            sign = "-"
        end
        n = math.abs(n)

        if n >= 1e15 then
            return sign .. string.format("%.2fQA", n / 1e15)
        elseif n >= 1e12 then
            return sign .. string.format("%.2fT", n / 1e12)
        elseif n >= 1e9 then
            return sign .. string.format("%.2fB", n / 1e9)
        elseif n >= 1e6 then
            return sign .. string.format("%.2fM", n / 1e6)
        elseif n >= 1e3 then
            return sign .. string.format("%.2fK", n / 1e3)
        end
        return sign .. string.format("%.0f", n)
    end

    local function formatRaw(n)
        local text = string.format("%.0f", math.floor(tonumber(n) or 0))
        local sign = ""
        if text:sub(1, 1) == "-" then
            sign = "-"
            text = text:sub(2)
        end
        local reversed = text:reverse()
        reversed = reversed:gsub("(%d%d%d)", "%1,")
        local result = reversed:reverse()
        result = result:gsub("^,", "")
        return sign .. result
    end

    local function formatBoth(n)
        n = tonumber(n) or 0
        local raw = formatRaw(n)
        if math.abs(n) < 1000 then
            return raw
        end
        return raw .. " [" .. formatNumber(n) .. "]"
    end

    local function formatDuration(seconds)
        seconds = math.max(0, math.floor(seconds))
        return string.format(
            "%dd %dh %dm %ds",
            math.floor(seconds / 86400),
            math.floor(seconds % 86400 / 3600),
            math.floor(seconds % 3600 / 60),
            seconds % 60
        )
    end

    local function rateList(perSecond, formatter)
        local hourly = math.max(0, tonumber(perSecond) or 0) * 3600
        return table.concat({
            L("pk_hour") .. " = " .. formatter(hourly),
            L("pk_day") .. " = " .. formatter(hourly * 24),
            L("pk_week") .. " = " .. formatter(hourly * 168),
            L("pk_month") .. " = " .. formatter(hourly * 720),
        }, "\n")
    end

    local function setDesc(paragraph, text)
        pcall(function()
            paragraph:SetDesc(text)
        end)
    end

    local repsPerTick = 1
    local fastRepEnabled = false
    local fastRepRunning = false

    local track = {
        startTime = 0,
        paused = 0,
        running = false,
        initStrength = 0,
        initDurability = 0,
        strengthHistory = {},
        durabilityHistory = {},
        interval = 10,
    }

    Packs:Paragraph({
        Title = L("pk_recommended"),
        Desc = "",
    })

    local RepsInput = Packs:Input({
        Title = L("pk_reps_speed"),
        Placeholder = "40",
        Value = "",
        Callback = function(text)
            local n = tonumber(text)
            if n and n > 0 then
                repsPerTick = math.floor(n)
            end
        end,
    })
    Util.register("reps_speed", RepsInput)

    local function fastRepLoop()
        while fastRepEnabled and isAlive() do
            if Util.getPing() < 3000 then
                local muscleEvent = LocalPlayer:FindFirstChild("muscleEvent")
                if muscleEvent then
                    for _ = 1, repsPerTick do
                        muscleEvent:FireServer("rep")
                    end
                end
            end
            task.wait()
        end
        fastRepRunning = false
    end

    local StartToggle = Packs:Toggle({
        Title = L("pk_start"),
        Value = false,
        Callback = function(state)
            fastRepEnabled = state

            if state then
                local now = os.clock()
                if track.paused == 0 then
                    track.initStrength = getStrength()
                    track.initDurability = getDurability()
                    track.strengthHistory = {}
                    track.durabilityHistory = {}
                end
                track.startTime = now
                track.running = true

                if not fastRepRunning then
                    fastRepRunning = true
                    task.spawn(fastRepLoop)
                end
            elseif track.running then
                track.paused = track.paused + (os.clock() - track.startTime)
                track.running = false
            end
        end,
    })
    Util.register("fast_reps", StartToggle)

    local autoEgg = false
    local eggRunning = false

        local function eatProteinEgg()
        local char = LocalPlayer.Character
        local backpack = LocalPlayer:FindFirstChild("Backpack")
        local humanoid = char and char:FindFirstChildOfClass("Humanoid")
        if not char or not backpack or not humanoid then
            return
        end

        local egg = char:FindFirstChild("Protein Egg") or backpack:FindFirstChild("Protein Egg")
        if not egg then
            return
        end

        if egg.Parent ~= char then
            pcall(humanoid.EquipTool, humanoid, egg)
            task.wait(0.15)
        end

        local held = char:FindFirstChild("Protein Egg")
        local event = held and (held:IsA("RemoteEvent") and held or held:FindFirstChildWhichIsA("RemoteEvent", true))
        if event then
            pcall(function()
                event:FireServer()
            end)
        end
    end

    local EggToggle = Packs:Toggle({
        Title = L("pk_egg"),
        Value = false,
        Callback = function(state)
            autoEgg = state

            if state and not eggRunning then
                eggRunning = true
                task.spawn(function()
                    while autoEgg and isAlive() do
                        pcall(eatProteinEgg)
                        for _ = 1, 1800 do
                            if not autoEgg or not isAlive() then
                                break
                            end
                            task.wait(1)
                        end
                    end
                    eggRunning = false
                end)
            end
        end,
    })
    Util.register("auto_egg", EggToggle)

    local autoSpin = false
    local spinRunning = false

    local SpinToggle = Packs:Toggle({
        Title = L("pk_spin"),
        Value = false,
        Callback = function(state)
            autoSpin = state

            if state and not spinRunning then
                spinRunning = true
                task.spawn(function()
                    while autoSpin and isAlive() do
                        local wheel = remote("openFortuneWheelRemote")
                        local sharedFolder = ReplicatedStorage:FindFirstChild("shared")
                        local catalogs = sharedFolder and sharedFolder:FindFirstChild("catalogs")
                        local chancesFolder = catalogs and catalogs:FindFirstChild("fortuneWheelChances")
                        local chances = chancesFolder and chancesFolder:FindFirstChild("Fortune Wheel")
                        if wheel and chances then
                            pcall(function()
                                wheel:InvokeServer("openFortuneWheel", chances)
                            end)
                        end
                        task.wait(1)
                    end
                    spinRunning = false
                end)
            end
        end,
    })
    Util.register("auto_spin", SpinToggle)

    local function teleportAndUseMachine(cf, machineName)
        local char = LocalPlayer.Character
        local root = char and char:FindFirstChild("HumanoidRootPart")
        if not root then
            return
        end

        root.CFrame = cf
        task.wait(0.2)

        local folder = workspace:FindFirstChild("machinesFolder")
        local machine = folder and folder:FindFirstChild(machineName)
        local interact = remote("machineInteractRemote")
        local seat = machine and machine:FindFirstChild("interactSeat")

        if interact and seat then
            pcall(function()
                interact:InvokeServer("useMachine", seat)
            end)
        end
    end

    Packs:Button({
        Title = L("pk_ind_squat"),
        Callback = function()
            teleportAndUseMachine(CFrame.new(-5219.5, 59, 5419.8), "Industrial Squat")
        end,
    })

    Packs:Button({
        Title = L("pk_hal_squat"),
        Callback = function()
            teleportAndUseMachine(CFrame.new(4812.03, 83.21, 5839.05), "Hallowed Squat")
        end,
    })

    local function forEachPet(folder, callback)
        if not folder then
            return
        end
        for _, group in ipairs(folder:GetChildren()) do
            if group:IsA("Folder") then
                for _, pet in ipairs(group:GetChildren()) do
                    callback(pet)
                end
            end
        end
    end

    local function petAction(action, pet)
        local equipEvent = remote("equipPetEvent")
        if equipEvent then
            pcall(function()
                equipEvent:FireServer(action, pet)
            end)
        end
    end

    local function unequipAllPets()
        local folder = LocalPlayer:FindFirstChild("petsFolder")
        forEachPet(folder, function(pet)
            petAction("unequipPet", pet)
        end)
        task.wait(0.1)
    end

    local function equipPriorityPets(names)
        local folder = LocalPlayer:FindFirstChild("petsFolder")
        if not folder then
            return
        end

        local equipped = 0
        for _, name in ipairs(names) do
            if equipped >= 12 then
                break
            end
            forEachPet(folder, function(pet)
                if equipped < 12 and pet.Name == name then
                    petAction("equipPet", pet)
                    equipped = equipped + 1
                end
            end)
        end
    end

    Packs:Button({
        Title = L("pk_best_pets"),
        Callback = function()
            task.spawn(function()
                local folder = LocalPlayer:FindFirstChild("petsFolder")
                if not folder then
                    return
                end

                local petsByName = {}
                forEachPet(folder, function(pet)
                    petsByName[pet.Name] = petsByName[pet.Name] or {}
                    table.insert(petsByName[pet.Name], pet)
                end)

                local infernoCount = #(petsByName["Inferno Drake"] or {})

                local omegaCount = 5
                if infernoCount == 1 then
                    omegaCount = 3
                elseif infernoCount == 2 then
                    omegaCount = 1
                elseif infernoCount >= 3 then
                    omegaCount = 0
                end

                local powercoreCount = 7
                if infernoCount == 1 then
                    powercoreCount = 8
                elseif infernoCount >= 2 then
                    powercoreCount = 9
                end

                forEachPet(folder, function(pet)
                    petAction("unequipPet", pet)
                    task.wait(0.1)
                end)

                local equipped = 0
                local target = 12

                local function equip(name, amount)
                    local pool = petsByName[name] or {}
                    local count = math.min(amount, #pool, target - equipped)

                    for i = 1, count do
                        petAction("equipPet", pool[i])
                        task.wait(0.1)
                        equipped = equipped + 1
                    end
                end

                equip("Inferno Drake", infernoCount)
                equip("Omega Overlord", omegaCount)
                equip("Powercore Hound", powercoreCount)

                for _, name in ipairs({
                    "Omega Overlord",
                    "Swift Samurai",
                    "Mythic Boss Pet",
                    "Legendary Boss Pet",
                    "Rainbow Boss Pet",
                    "Epic Boss Pet",
                    "Rare Boss Pet",
                    "Common Boss Pet",
                }) do
                    if equipped >= target then
                        break
                    end
                    equip(name, target - equipped)
                end
            end)
        end,
    })

    Packs:Divider()

    local zeroRates = rateList(0, formatBoth)

    local InfoParagraph = Packs:Paragraph({
        Title = L("pk_time_title"),
        Desc = L("pk_time") .. ": 0d 0h 0m 0s\n"
            .. L("pk_fastreps") .. ": " .. L("pk_off") .. "\n"
            .. L("pk_ping") .. ": 0 ms",
    })

    local StrengthParagraph = Packs:Paragraph({
        Title = L("pk_str_calc"),
        Desc = zeroRates,
    })

    local DurabilityParagraph = Packs:Paragraph({
        Title = L("pk_dur_calc"),
        Desc = zeroRates,
    })

    local TotalsParagraph = Packs:Paragraph({
        Title = L("pk_totals"),
        Desc = L("pk_strength") .. ": 0\n"
            .. L("pk_gained") .. ": 0\n\n"
            .. L("pk_durability") .. ": 0\n"
            .. L("pk_gained") .. ": 0",
    })

    task.spawn(function()
        local lastCalc = os.clock()
        local strengthRates = zeroRates
        local durabilityRates = zeroRates

        local function render(elapsed, statusText, ping, strength, durability)
            setDesc(InfoParagraph, table.concat({
                L("pk_time") .. ": " .. formatDuration(elapsed),
                L("pk_fastreps") .. ": " .. statusText,
                L("pk_ping") .. ": " .. ping .. " ms",
            }, "\n"))

            setDesc(StrengthParagraph, strengthRates)
            setDesc(DurabilityParagraph, durabilityRates)

            setDesc(TotalsParagraph, table.concat({
                L("pk_strength") .. ": " .. formatBoth(strength),
                L("pk_gained") .. ": " .. formatBoth(strength - track.initStrength),
                "",
                L("pk_durability") .. ": " .. formatBoth(durability),
                L("pk_gained") .. ": " .. formatBoth(durability - track.initDurability),
            }, "\n"))
        end

        while isAlive() do
            task.wait(0.5)

            local now = os.clock()
            local strength = getStrength()
            local durability = getDurability()
            local ping = Util.getPing()

            if track.running then
                local elapsed = track.paused + (now - track.startTime)

                table.insert(track.strengthHistory, { time = now, value = strength })
                table.insert(track.durabilityHistory, { time = now, value = durability })

                while track.strengthHistory[1]
                    and now - track.strengthHistory[1].time > track.interval do
                    table.remove(track.strengthHistory, 1)
                end
                while track.durabilityHistory[1]
                    and now - track.durabilityHistory[1].time > track.interval do
                    table.remove(track.durabilityHistory, 1)
                end

                if now - lastCalc >= track.interval then
                    lastCalc = now

                    local sh = track.strengthHistory
                    local dh = track.durabilityHistory

                    if #sh >= 2 and sh[#sh].time > sh[1].time then
                        strengthRates = rateList(
                            (sh[#sh].value - sh[1].value) / (sh[#sh].time - sh[1].time),
                            formatBoth
                        )
                    end

                    if #dh >= 2 and dh[#dh].time > dh[1].time then
                        durabilityRates = rateList(
                            (dh[#dh].value - dh[1].value) / (dh[#dh].time - dh[1].time),
                            formatBoth
                        )
                    end
                end

                render(elapsed, L("pk_running"), ping, strength, durability)
            elseif track.paused > 0 then
                render(track.paused, L("pk_stopped"), ping, strength, durability)
            else
                render(0, L("pk_off"), ping, strength, durability)
            end
        end
    end)

    Packs:Section({ Title = L("pk_rebirth_section") })
    local RebirthFolder = Packs

    RebirthFolder:Paragraph({
        Title = L("pk_important_title"),
        Desc = L("pk_important"),
    })

    local zeroRebirths = rateList(0, formatBoth)

    local RebirthInfoParagraph = RebirthFolder:Paragraph({
        Title = L("pk_rebirth_title"),
        Desc = L("pk_time") .. ": 0d 0h 0m 0s\n"
            .. L("pk_rebirths") .. ": 0\n"
            .. L("pk_rebirths_gained") .. ": 0\n"
            .. L("pk_status") .. ": " .. L("pk_inactive"),
    })

    local RebirthRateParagraph = RebirthFolder:Paragraph({
        Title = L("pk_rb_calc"),
        Desc = zeroRebirths,
    })

    local fastRebirth = false
    local rbGen = 0

    local rbTrack = {
        startTime = 0,
        paused = 0,
        tracking = false,
        initial = 0,
        events = {},
    }

    local function renderRebirthInfo()
        local current = getRebirths()
        local elapsed = rbTrack.paused
        local status = L("pk_inactive")

        if rbTrack.tracking then
            elapsed = rbTrack.paused + (os.clock() - rbTrack.startTime)
            status = L("pk_active")
        end

        setDesc(RebirthInfoParagraph, table.concat({
            L("pk_time") .. ": " .. formatDuration(elapsed),
            L("pk_rebirths") .. ": " .. formatBoth(current),
            L("pk_rebirths_gained") .. ": " .. formatBoth(current - rbTrack.initial),
            L("pk_status") .. ": " .. status,
        }, "\n"))
    end

    task.spawn(function()
        while isAlive() do
            task.wait(1)
            renderRebirthInfo()
        end
    end)

    local function updateRebirthRate()
        local events = rbTrack.events
        if #events < 2 then
            return
        end

        local first = events[1]
        local last = events[#events]
        local span = last.time - first.time
        local gained = last.count - first.count

        if span <= 0 or gained <= 0 then
            return
        end

        local interval = span / gained
        if math.abs(interval - REBIRTH_CYCLE) <= REBIRTH_TOLERANCE then
            interval = REBIRTH_CYCLE
        end

        setDesc(RebirthRateParagraph, rateList(1 / interval, formatBoth))
    end

    local leaderstats = LocalPlayer:FindFirstChild("leaderstats")
    local rebirthValue = leaderstats and leaderstats:FindFirstChild("Rebirths")

    if rebirthValue then
        local rebirthConnection = nil
        rebirthConnection = rebirthValue:GetPropertyChangedSignal("Value"):Connect(function()
            if not isAlive() then
                rebirthConnection:Disconnect()
                return
            end
            if not rbTrack.tracking then
                return
            end

            table.insert(rbTrack.events, { time = os.clock(), count = tonumber(rebirthValue.Value) or 0 })
            while #rbTrack.events > 10 do
                table.remove(rbTrack.events, 1)
            end

            updateRebirthRate()
        end)
    end

    local function getStrengthRequiredForRebirth()
        local rebirths = getRebirths()

        local golden = 0
        local ultimates = LocalPlayer:FindFirstChild("ultimatesFolder")
        local goldenValue = ultimates and ultimates:FindFirstChild("Golden Rebirth")
        if goldenValue then
            golden = tonumber(goldenValue.Value) or 0
        end

        local base = 10000 + 2500 * rebirths
        if golden >= 1 and golden <= 5 then
            base = base * (1 - golden * 0.1)
        end

        return math.floor(base)
    end

    local FastRebirthToggle = RebirthFolder:Toggle({
        Title = L("pk_fast_rebirths"),
        Value = false,
        Callback = function(state)
            fastRebirth = state
            rbGen = rbGen + 1
            local gen = rbGen

            if not state then
                if rbTrack.tracking then
                    rbTrack.paused = rbTrack.paused + (os.clock() - rbTrack.startTime)
                    rbTrack.tracking = false
                end

                renderRebirthInfo()
                setDesc(RebirthRateParagraph, zeroRebirths)
                return
            end

            local now = os.clock()
            local current = getRebirths()

            rbTrack.startTime = now
            rbTrack.paused = 0
            rbTrack.tracking = true
            rbTrack.initial = current
            rbTrack.events = { { time = now, count = current } }

            renderRebirthInfo()
            setDesc(RebirthRateParagraph, zeroRebirths)

            task.spawn(function()
                while fastRebirth and isAlive() and rbGen == gen do
                    local requiredStrength = getStrengthRequiredForRebirth()

                    unequipAllPets()
                    equipPriorityPets({
                        "Omega Overlord",
                        "Swift Samurai",
                        "Mythic Boss Pet",
                        "Legendary Boss Pet",
                        "Rainbow Boss Pet",
                        "Epic Boss Pet",
                        "Rare Boss Pet",
                        "Common Boss Pet",
                    })

                    while getStrength() < requiredStrength and fastRebirth and isAlive() and rbGen == gen do
                        local muscleEvent = LocalPlayer:FindFirstChild("muscleEvent")
                        if muscleEvent then
                            for _ = 1, 10 do
                                muscleEvent:FireServer("rep")
                            end
                        end
                        task.wait()
                    end

                    if fastRebirth and isAlive() and rbGen == gen then
                        unequipAllPets()
                        equipPriorityPets({ "Titanium Hydra", "Tribal Overlord" })

                        local oldRebirths = getRebirths()
                        local rebirthRemote = remote("rebirthRemote")

                        repeat
                            if rebirthRemote then
                                pcall(function()
                                    rebirthRemote:InvokeServer("rebirthRequest")
                                end)
                            end
                            task.wait(0.1)
                        until getRebirths() > oldRebirths or not fastRebirth or not isAlive() or rbGen ~= gen
                    end

                    task.wait()
                end
            end)
        end,
    })
    Util.register("fast_rebirth", FastRebirthToggle)

    RebirthFolder:Button({
        Title = L("pk_ind_lift"),
        Callback = function()
            teleportAndUseMachine(CFrame.new(-5491.4, 59, 4644.6), "Industrial Lift")
        end,
    })

    RebirthFolder:Button({
        Title = L("pk_hal_lift"),
        Callback = function()
            teleportAndUseMachine(CFrame.new(5740.17, 83.79, 6415.02), "Hallowed Bar Lift")
        end,
    })
end

do
    local Extras = Tabs.Extras
    local Lighting = game:GetService("Lighting")

    local function remote(name)
        local events = ReplicatedStorage:FindFirstChild("rEvents")
        return events and events:FindFirstChild(name)
    end

    Extras:Section({ Title = L("ex_farm_section") })

    local lockEnabled = false
    local lockHeartbeat = nil
    local lockCharConn = nil
    local lockSaved = nil

    local function stopLockHeartbeat()
        if lockHeartbeat then
            lockHeartbeat:Disconnect()
            lockHeartbeat = nil
        end
    end

    local function releaseLock(character)
        stopLockHeartbeat()

        local humanoid = character and character:FindFirstChildOfClass("Humanoid")
        if humanoid and lockSaved then
            humanoid.WalkSpeed = lockSaved.walkSpeed
            humanoid.JumpPower = lockSaved.jumpPower
            humanoid.AutoRotate = lockSaved.autoRotate
            pcall(function()
                humanoid:ChangeState(Enum.HumanoidStateType.GettingUp)
            end)
        end
        lockSaved = nil
    end

    local function applyLock(character)
        stopLockHeartbeat()

        local humanoid = character and character:FindFirstChildOfClass("Humanoid")
        local root = character and character:FindFirstChild("HumanoidRootPart")
        if not humanoid or not root then
            return
        end

        if not lockSaved then
            lockSaved = {
                walkSpeed = humanoid.WalkSpeed,
                jumpPower = humanoid.JumpPower,
                autoRotate = humanoid.AutoRotate,
            }
        end

        humanoid.WalkSpeed = 0
        humanoid.JumpPower = 0
        humanoid.AutoRotate = false
        pcall(function()
            humanoid:ChangeState(Enum.HumanoidStateType.Physics)
        end)

        local savedCFrame = root.CFrame

        lockHeartbeat = RunService.Heartbeat:Connect(function()
            if not lockEnabled then
                return
            end
            local char = LocalPlayer.Character
            local hrp = char and char:FindFirstChild("HumanoidRootPart")
            if hrp then
                hrp.AssemblyLinearVelocity = Vector3.zero
                hrp.AssemblyAngularVelocity = Vector3.zero
                hrp.CFrame = savedCFrame
            end
        end)
    end

    local LockToggle = Extras:Toggle({
        Title = L("ex_lockpos"),
        Desc = L("ex_lockpos_desc"),
        Value = false,
        Callback = function(state)
            lockEnabled = state

            if lockCharConn then
                lockCharConn:Disconnect()
                lockCharConn = nil
            end

            if state then
                applyLock(LocalPlayer.Character)

                lockCharConn = LocalPlayer.CharacterAdded:Connect(function(character)
                    if lockEnabled then
                        task.wait(1)
                        applyLock(character)
                    end
                end)
            else
                releaseLock(LocalPlayer.Character)
            end
        end,
    })
    Util.register("ex_lock_position", LockToggle)

    local autoSpin = false
    local spinRunning = false
    local AutoSpinToggle

    local function getFortuneChances()
        local shared = ReplicatedStorage:FindFirstChild("shared")
        local catalogs = shared and shared:FindFirstChild("catalogs")
        local chances = catalogs and catalogs:FindFirstChild("fortuneWheelChances")
        return chances and chances:FindFirstChild("Fortune Wheel")
    end

    AutoSpinToggle = Extras:Toggle({
        Title = L("ex_autospin"),
        Desc = L("ex_autospin_desc"),
        Value = false,
        Callback = function(state)
            autoSpin = state

            if state and not spinRunning then
                spinRunning = true

                task.spawn(function()
                    while autoSpin and isAlive() do
                        local wheel = remote("openFortuneWheelRemote")
                        local chances = getFortuneChances()

                        if not wheel or not chances then
                            autoSpin = false
                            Util.notify(L("ex_autospin"), L("ex_spin_missing"), "triangle-alert")
                            task.defer(function()
                                pcall(function()
                                    AutoSpinToggle:Set(false)
                                end)
                            end)
                            break
                        end

                        pcall(function()
                            wheel:InvokeServer("openFortuneWheel", chances)
                        end)
                        task.wait(1)
                    end
                    spinRunning = false
                end)
            end
        end,
    })
    Util.register("ex_auto_spin", AutoSpinToggle)

    local HidePetsToggle = Extras:Toggle({
        Title = L("ex_hidepets"),
        Desc = L("ex_hidepets_desc"),
        Value = false,
        Callback = function(state)
            local event = remote("showPetsEvent")
            if event then
                pcall(function()
                    event:FireServer(state and "hidePets" or "showPets")
                end)
            end
        end,
    })
    Util.register("ex_hide_pets", HidePetsToggle)

    Extras:Toggle({
        Title = L("ex_hidepopups"),
        Desc = L("ex_hidepopups_desc"),
        Value = false,
        Callback = function()
            local event = remote("savePlayerSizeEvent")
            if event then
                pcall(function()
                    event:FireServer("showPopupsOption")
                end)
            end
        end,
    })

    local DISABLE = { Enabled = false }

    local RULES = {
        ParticleEmitter = {
            cat = "particles",
            set = { Enabled = false, Rate = 0, Lifetime = NumberRange.new(0) },
            clear = true,
        },
        Trail = { cat = "particles", set = DISABLE },
        Beam = { cat = "particles", set = DISABLE },
        Fire = { cat = "particles", set = DISABLE },
        Smoke = { cat = "particles", set = DISABLE },
        Sparkles = { cat = "particles", set = DISABLE },
        Explosion = { cat = "particles", set = { Visible = false } },

        PointLight = { cat = "effects", set = DISABLE },
        SpotLight = { cat = "effects", set = DISABLE },
        SurfaceLight = { cat = "effects", set = DISABLE },
        Highlight = { cat = "effects", set = DISABLE },
        BloomEffect = { cat = "effects", set = DISABLE },
        BlurEffect = { cat = "effects", set = DISABLE },
        SunRaysEffect = { cat = "effects", set = DISABLE },
        ColorCorrectionEffect = { cat = "effects", set = DISABLE },
        DepthOfFieldEffect = { cat = "effects", set = DISABLE },

        Decal = { cat = "graphics", set = { Transparency = 1 } },
        Texture = { cat = "graphics", set = { Transparency = 1 } },
    }

    local PART_SET = {
        CastShadow = false,
        Material = Enum.Material.Plastic,
    }

    local Opt = {
        active = { particles = false, effects = false, graphics = false },
        originals = {
            particles = setmetatable({}, { __mode = "k" }),
            effects = setmetatable({}, { __mode = "k" }),
            graphics = setmetatable({}, { __mode = "k" }),
        },
        connections = {},
        globals = nil,
    }

    local function applySet(category, object, set)
        local store = Opt.originals[category]
        local saved = store[object]
        if not saved then
            saved = {}
            store[object] = saved
        end

        for property, value in pairs(set) do
            if saved[property] == nil then
                saved[property] = object[property]
            end
            object[property] = value
        end
    end

    local function handle(object)
        local rule = RULES[object.ClassName]

        if rule then
            if Opt.active[rule.cat] then
                pcall(applySet, rule.cat, object, rule.set)
                if rule.clear then
                    pcall(object.Clear, object)
                end
            end
        elseif Opt.active.graphics and object:IsA("BasePart") and not object:IsA("Terrain") then
            pcall(applySet, "graphics", object, PART_SET)
        end
    end

    local function onAdded(object)
        local rule = RULES[object.ClassName]

        if rule then
            if Opt.active[rule.cat] then
                task.defer(handle, object)
            end
        elseif Opt.active.graphics and object:IsA("BasePart") then
            task.defer(handle, object)
        end
    end

    local function scan(root)
        local count = 0

        for _, object in ipairs(root:GetDescendants()) do
            if not isAlive() then
                return
            end

            handle(object)

            count = count + 1
            if count % 300 == 0 then
                task.wait()
            end
        end
    end

    local function ensureWatching()
        if Opt.connections.workspace then
            return
        end
        Opt.connections.workspace = workspace.DescendantAdded:Connect(onAdded)
        Opt.connections.lighting = Lighting.DescendantAdded:Connect(onAdded)
    end

    local function stopWatchingIfIdle()
        local active = Opt.active
        if active.particles or active.effects or active.graphics then
            return
        end

        for key, connection in pairs(Opt.connections) do
            connection:Disconnect()
            Opt.connections[key] = nil
        end
    end

    local function restoreCategory(category)
        local store = Opt.originals[category]

        for object, saved in pairs(store) do
            if object.Parent then
                for property, value in pairs(saved) do
                    pcall(function()
                        object[property] = value
                    end)
                end
            end
            store[object] = nil
        end
    end

    local function setGraphicsGlobals(enabled)
        local terrain = workspace:FindFirstChildOfClass("Terrain")

        if enabled then
            if Opt.globals then
                return
            end

            local saved = {}
            Opt.globals = saved

            pcall(function()
                saved.quality = settings().Rendering.QualityLevel
                settings().Rendering.QualityLevel = Enum.QualityLevel.Level01
            end)

            pcall(function()
                saved.shadows = Lighting.GlobalShadows
                saved.fog = Lighting.FogEnd
                Lighting.GlobalShadows = false
                Lighting.FogEnd = 1000000
            end)

            if terrain then
                pcall(function()
                    saved.decoration = terrain.Decoration
                    terrain.Decoration = false
                end)
            end
        else
            local saved = Opt.globals
            if not saved then
                return
            end
            Opt.globals = nil

            pcall(function()
                if saved.quality ~= nil then
                    settings().Rendering.QualityLevel = saved.quality
                end
            end)

            pcall(function()
                if saved.shadows ~= nil then
                    Lighting.GlobalShadows = saved.shadows
                end
                if saved.fog ~= nil then
                    Lighting.FogEnd = saved.fog
                end
            end)

            if terrain and saved.decoration ~= nil then
                pcall(function()
                    terrain.Decoration = saved.decoration
                end)
            end
        end
    end

    local function setCategory(category, enabled)
        Opt.active[category] = enabled

        if enabled then
            ensureWatching()

            if category == "graphics" then
                setGraphicsGlobals(true)
            end

            task.spawn(function()
                scan(workspace)
                scan(Lighting)
            end)
        else
            restoreCategory(category)

            if category == "graphics" then
                setGraphicsGlobals(false)
            end

            stopWatchingIfIdle()
        end
    end

    Extras:Section({ Title = L("ex_opt_section") })

    Extras:Paragraph({
        Title = L("ex_opt_section"),
        Desc = L("ex_opt_note"),
    })

    local ParticlesToggle = Extras:Toggle({
        Title = L("ex_opt_particles"),
        Desc = L("ex_opt_particles_desc"),
        Value = false,
        Callback = function(state)
            setCategory("particles", state)
        end,
    })
    Util.register("opt_particles", ParticlesToggle)

    local EffectsToggle = Extras:Toggle({
        Title = L("ex_opt_effects"),
        Desc = L("ex_opt_effects_desc"),
        Value = false,
        Callback = function(state)
            setCategory("effects", state)
        end,
    })
    Util.register("opt_effects", EffectsToggle)

    local GraphicsToggle = Extras:Toggle({
        Title = L("ex_opt_graphics"),
        Desc = L("ex_opt_graphics_desc"),
        Value = false,
        Callback = function(state)
            setCategory("graphics", state)
        end,
    })
    Util.register("opt_graphics", GraphicsToggle)

    task.spawn(function()
        while isAlive() do
            task.wait(1)
        end

        lockEnabled = false
        autoSpin = false

        if lockCharConn then
            lockCharConn:Disconnect()
            lockCharConn = nil
        end

        pcall(function()
            releaseLock(LocalPlayer.Character)
        end)

        for _, category in ipairs({ "particles", "effects", "graphics" }) do
            pcall(setCategory, category, false)
        end
    end)

    Extras:Section({ Title = L("ex_move_section") })

    local WATER_Y = -9.5
    local waterPart, waterConn = nil, nil

    local function stopWater()
        if waterConn then
            waterConn:Disconnect()
            waterConn = nil
        end
        if waterPart then
            waterPart:Destroy()
            waterPart = nil
        end
    end

    local WaterToggle = Extras:Toggle({
        Title = L("ex_walkwater"),
        Desc = L("ex_walkwater_desc"),
        Value = false,
        Callback = function(state)
            stopWater()
            if not state then
                return
            end

            waterPart = Instance.new("Part")
            waterPart.Name = "MysteryWaterPart"
            waterPart.Size = Vector3.new(256, 1, 256)
            waterPart.Anchored = true
            waterPart.CanCollide = true
            waterPart.Transparency = 1
            waterPart.CFrame = CFrame.new(0, WATER_Y, 0)
            waterPart.Parent = workspace

            waterConn = RunService.Heartbeat:Connect(function()
                if not isAlive() or not waterPart then
                    return
                end
                local character = LocalPlayer.Character
                local root = character and character:FindFirstChild("HumanoidRootPart")
                if root then
                    waterPart.CFrame = CFrame.new(root.Position.X, WATER_Y, root.Position.Z)
                end
            end)
        end,
    })
    Util.register("ex_walk_water", WaterToggle)

    local infiniteJump = false

    local InfJumpToggle = Extras:Toggle({
        Title = L("ex_infjump"),
        Desc = L("ex_infjump_desc"),
        Value = false,
        Callback = function(state)
            infiniteJump = state
        end,
    })
    Util.register("ex_inf_jump", InfJumpToggle)

    local jumpConn = UserInputService.JumpRequest:Connect(function()
        if not infiniteJump or not isAlive() then
            return
        end
        local character = LocalPlayer.Character
        local humanoid = character and character:FindFirstChildOfClass("Humanoid")
        if humanoid and humanoid.Health > 0 then
            humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
        end
    end)

    local TimeDropdown = Extras:Dropdown({
        Title = L("ex_time"),
        Values = { L("ex_time_day"), L("ex_time_night") },
        Value = nil,
        AllowNone = true,
        Callback = function(option)
            if option == L("ex_time_night") then
                Lighting.ClockTime = 0
            elseif option == L("ex_time_day") then
                Lighting.ClockTime = 9
            end
        end,
    })
    Util.register("ex_time", TimeDropdown)

    Extras:Section({ Title = L("ex_shader_section") })

    local function rgb(r, g, b)
        return Color3.fromRGB(r, g, b)
    end

    local SHADER_PRESETS = {
        { Name = "Clean Day", Time = 14, Exposure = .08, Saturation = .08, Contrast = .06, Tint = rgb(255,255,255), Density = .08, Haze = .3 },
        { Name = "Soft Realism", Time = 14.5, Exposure = .04, Saturation = -.04, Contrast = .10, Tint = rgb(255,249,239), Density = .14, Haze = .7 },
        { Name = "Vibrant", Time = 13, Exposure = .12, Saturation = .35, Contrast = .13, Tint = rgb(255,253,247), Density = .10, Haze = .2, Bloom = .32 },
        { Name = "Golden Hour", Time = 17.3, Exposure = .12, Saturation = .15, Contrast = .14, Tint = rgb(255,225,181), Density = .22, Haze = 1.2, Air = rgb(255,210,155), Rays = .12 },
        { Name = "Warm Sunset", Time = 17.9, Exposure = .05, Saturation = .22, Contrast = .17, Tint = rgb(255,205,177), Density = .28, Haze = 1.5, Air = rgb(255,183,151), Bloom = .45 },
        { Name = "Tropical", Time = 13.5, Exposure = .15, Saturation = .27, Contrast = .10, Tint = rgb(230,255,242), Density = .16, Haze = .7, Air = rgb(174,235,240) },
        { Name = "Arctic", Time = 12, Exposure = .12, Saturation = -.16, Contrast = .15, Tint = rgb(203,231,255), Density = .24, Haze = 1.1, Air = rgb(195,225,255) },
        { Name = "Cloudy", Time = 13, Exposure = -.03, Saturation = -.22, Contrast = -.08, Tint = rgb(229,236,243), Density = .30, Haze = 1.8, Rays = 0, Brightness = 1.6 },
        { Name = "Cinematic Teal", Time = 16.5, Exposure = -.05, Saturation = -.15, Contrast = .24, Tint = rgb(199,237,239), Density = .20, Haze = 1, Ambient = rgb(62,92,105), Top = rgb(255,177,98) },
        { Name = "Noir", Time = 16, Exposure = -.12, Saturation = -1, Contrast = .36, Tint = rgb(255,255,255), Density = .20, Haze = 1.1, Rays = .02 },
        { Name = "Moonlight", Time = 0.5, Exposure = .12, Saturation = -.12, Contrast = .15, Tint = rgb(180,204,255), Density = .18, Haze = .7, Ambient = rgb(70,84,122), Brightness = 2, Rays = 0 },
        { Name = "Cyberpunk", Time = 21, Exposure = .02, Saturation = .40, Contrast = .23, Tint = rgb(220,178,255), Density = .26, Haze = 1.6, Air = rgb(161,105,224), Ambient = rgb(92,45,140), Bloom = .65, Rays = 0 },
        { Name = "Neon Purple", Time = 19.2, Exposure = .08, Saturation = .45, Contrast = .18, Tint = rgb(227,169,255), Density = .22, Haze = 1.3, Air = rgb(201,145,255), Bloom = .85, Rays = .02 },
        { Name = "Dreamy", Time = 16.7, Exposure = .18, Saturation = .08, Contrast = -.12, Tint = rgb(255,218,241), Density = .24, Haze = 1.8, Air = rgb(249,207,235), Bloom = .65 },
        { Name = "Soft Pastel", Time = 14, Exposure = .16, Saturation = -.24, Contrast = -.10, Tint = rgb(255,235,224), Density = .15, Haze = 1, Bloom = .25 },
        { Name = "Retro Film", Time = 15.7, Exposure = .02, Saturation = -.32, Contrast = -.06, Tint = rgb(255,229,185), Density = .19, Haze = 1.1, Ambient = rgb(111,99,82) },
        { Name = "Autumn", Time = 16.8, Exposure = .03, Saturation = .12, Contrast = .16, Tint = rgb(255,207,158), Density = .24, Haze = 1.2, Air = rgb(232,186,137) },
        { Name = "Desert", Time = 15.3, Exposure = .18, Saturation = .08, Contrast = .20, Tint = rgb(255,229,173), Density = .32, Haze = 2, Air = rgb(231,203,158), Rays = .10 },
        { Name = "Horror", Time = 23, Exposure = -.22, Saturation = -.40, Contrast = .28, Tint = rgb(185,218,187), Density = .40, Haze = 2.4, Air = rgb(122,156,132), Ambient = rgb(40,62,49), Brightness = 1.2, Rays = 0 },
        { Name = "Volcanic", Time = 18.5, Exposure = -.12, Saturation = .22, Contrast = .30, Tint = rgb(255,171,133), Density = .32, Haze = 1.9, Air = rgb(210,104,72), Ambient = rgb(108,42,32), Bloom = .60, Rays = .02 },
    }

    local LIGHT_PROPS = {
        "Ambient", "OutdoorAmbient", "Brightness", "ClockTime", "ExposureCompensation",
        "ColorShift_Top", "ColorShift_Bottom", "FogColor", "FogStart", "FogEnd",
        "EnvironmentDiffuseScale", "EnvironmentSpecularScale", "GlobalShadows",
    }
    local ATMO_PROPS = { "Density", "Offset", "Color", "Decay", "Glare", "Haze" }
    local SHADER_ALPHA = 0.75

    local Shader = {
        ready = false,
        index = 0,
        names = { L("ex_shader_original") },
        original = {},
        originalEffects = {},
        atmoOriginal = {},
        atmosphere = nil,
        owned = false,
        fx = {},
    }
    for _, preset in ipairs(SHADER_PRESETS) do
        table.insert(Shader.names, preset.Name)
    end

    local function mix(a, b, t)
        if typeof(a) == "Color3" then
            return a:Lerp(b, t)
        end
        return a + (b - a) * t
    end

    local function shaderSetup()
        if Shader.ready then
            return
        end
        Shader.ready = true

        for _, key in ipairs(LIGHT_PROPS) do
            Shader.original[key] = Lighting[key]
        end
        for _, effect in ipairs(Lighting:GetChildren()) do
            if effect:IsA("PostEffect") and not effect:IsA("BlurEffect") then
                Shader.originalEffects[effect] = effect.Enabled
            end
        end

        local atmosphere = Lighting:FindFirstChildOfClass("Atmosphere")
        Shader.owned = atmosphere == nil
        if Shader.owned then
            atmosphere = Instance.new("Atmosphere")
            atmosphere.Name = "MysteryShaderAtmosphere"
        end
        Shader.atmosphere = atmosphere
        for _, key in ipairs(ATMO_PROPS) do
            Shader.atmoOriginal[key] = atmosphere[key]
        end

        local function make(className, name)
            local effect = Instance.new(className)
            effect.Name = name
            effect.Enabled = false
            effect.Parent = Lighting
            return effect
        end
        Shader.fx.correction = make("ColorCorrectionEffect", "MysteryShaderColor")
        Shader.fx.bloom = make("BloomEffect", "MysteryShaderBloom")
        Shader.fx.rays = make("SunRaysEffect", "MysteryShaderRays")
    end

    local function shaderRestore()
        if not Shader.ready then
            return
        end
        for _, effect in pairs(Shader.fx) do
            effect.Enabled = false
        end
        for key, value in pairs(Shader.original) do
            pcall(function()
                Lighting[key] = value
            end)
        end
        for effect, enabled in pairs(Shader.originalEffects) do
            if effect.Parent then
                effect.Enabled = enabled
            end
        end
        if Shader.owned then
            Shader.atmosphere.Parent = nil
        else
            for key, value in pairs(Shader.atmoOriginal) do
                Shader.atmosphere[key] = value
            end
        end
    end

    local function shaderApply(preset)
        local alpha = SHADER_ALPHA
        local original = Shader.original
        local atmosphere = Shader.atmosphere

        for effect in pairs(Shader.originalEffects) do
            if effect.Parent then
                effect.Enabled = false
            end
        end

        local targets = {
            Brightness = preset.Brightness or 2.2,
            ExposureCompensation = preset.Exposure or 0,
            Ambient = preset.Ambient or rgb(91, 97, 109),
            OutdoorAmbient = preset.Ambient or rgb(125, 133, 148),
            ColorShift_Top = preset.Top or rgb(0, 0, 0),
            ColorShift_Bottom = rgb(0, 0, 0),
            FogColor = preset.Air or rgb(192, 218, 240),
            FogStart = 0,
            FogEnd = 100000,
            EnvironmentDiffuseScale = .8,
            EnvironmentSpecularScale = .7,
        }
        for key, value in pairs(targets) do
            Lighting[key] = mix(original[key], value, alpha)
        end

        local delta = (preset.Time - original.ClockTime + 12) % 24 - 12
        Lighting.ClockTime = (original.ClockTime + delta * alpha) % 24
        Lighting.GlobalShadows = true

        local fx = Shader.fx
        fx.correction.TintColor = mix(Color3.new(1, 1, 1), preset.Tint, alpha)
        fx.correction.Contrast = (preset.Contrast or 0) * alpha
        fx.correction.Saturation = (preset.Saturation or 0) * alpha
        fx.correction.Brightness = 0
        fx.correction.Enabled = true

        fx.bloom.Intensity = (preset.Bloom or .22) * alpha
        fx.bloom.Size = 28
        fx.bloom.Threshold = 1.25
        fx.bloom.Enabled = true

        fx.rays.Intensity = (preset.Rays or .05) * alpha
        fx.rays.Spread = .75
        fx.rays.Enabled = fx.rays.Intensity > 0

        local atmoOriginal = Shader.atmoOriginal
        atmosphere.Density = mix(Shader.owned and 0 or atmoOriginal.Density, preset.Density or .15, alpha)
        atmosphere.Offset = 0
        atmosphere.Color = mix(atmoOriginal.Color, preset.Air or rgb(199, 222, 245), alpha)
        atmosphere.Decay = mix(atmoOriginal.Decay, preset.Air or rgb(133, 153, 184), alpha)
        atmosphere.Glare = .15 * alpha
        atmosphere.Haze = (preset.Haze or .7) * alpha
        atmosphere.Parent = Lighting
    end

    local ShaderDropdown

    local function selectShader(name)
        local index = table.find(Shader.names, name)
        if not index or index == Shader.index then
            return
        end

        if index == 1 then
            Shader.index = 1
            shaderRestore()
            return
        end

        local turnedOff = false
        for _, toggle in ipairs({ EffectsToggle, GraphicsToggle }) do
            local ok, value = pcall(function()
                return toggle.Value
            end)
            if ok and value == true then
                pcall(function()
                    toggle:Set(false)
                end)
                turnedOff = true
            end
        end
        if turnedOff then
            Util.notify(L("ex_shader_section"), L("ex_shader_note"), "info")
        end

        shaderSetup()
        Shader.index = index
        shaderApply(SHADER_PRESETS[index - 1])
    end

    ShaderDropdown = Extras:Dropdown({
        Title = L("ex_shader"),
        Values = Shader.names,
        Value = Shader.names[1],
        SearchBarEnabled = true,
        AllowNone = false,
        Callback = function(option)
            if type(option) == "string" then
                selectShader(option)
            end
        end,
    })
    Util.register("ex_shader", ShaderDropdown)

    local function stepShader(direction)
        local current = math.max(Shader.index, 1)
        local nextIndex = (current - 1 + direction) % #Shader.names + 1
        local name = Shader.names[nextIndex]
        selectShader(name)
        pcall(function()
            ShaderDropdown:Select(name)
        end)
    end

    Extras:Button({
        Title = L("ex_shader_prev"),
        Icon = "chevron-left",
        Callback = function()
            stepShader(-1)
        end,
    })

    Extras:Button({
        Title = L("ex_shader_next"),
        Icon = "chevron-right",
        Callback = function()
            stepShader(1)
        end,
    })

    task.spawn(function()
        while isAlive() do
            task.wait(1)
        end
        infiniteJump = false
        stopWater()
        if jumpConn then
            jumpConn:Disconnect()
        end
        pcall(function()
            shaderRestore()
            for _, effect in pairs(Shader.fx) do
                effect:Destroy()
            end
            if Shader.owned and Shader.atmosphere then
                Shader.atmosphere:Destroy()
            end
        end)
    end)

    Extras:Section({ Title = L("ex_player_section") })

    local PlayerCfg = {
        speed = { enabled = false, value = 16, original = nil },
        jump = { enabled = false, value = 50, original = nil, originalUse = nil },
        gravity = { enabled = false, value = 196.2, original = nil },
    }

    local function getHumanoid()
        local character = LocalPlayer.Character
        return character and character:FindFirstChildOfClass("Humanoid")
    end

    local function parseInput(text, min, max)
        local n = tonumber(text)
        if not n then
            return nil
         end
        return math.clamp(n, min, max)
    end

    local function applyPlayerCfg()
    if not (PlayerCfg.speed.enabled or PlayerCfg.jump.enabled or PlayerCfg.gravity.enabled) then
        return
    end
        local humanoid = getHumanoid()
        if humanoid then
            if PlayerCfg.speed.enabled then
                humanoid.WalkSpeed = PlayerCfg.speed.value
            end
            if PlayerCfg.jump.enabled then
                humanoid.UseJumpPower = true
                humanoid.JumpPower = PlayerCfg.jump.value
            end
        end
        if PlayerCfg.gravity.enabled then
            workspace.Gravity = PlayerCfg.gravity.value
        end
    end

    local playerCfgConn = RunService.Heartbeat:Connect(function()
        if not isAlive() then
            return
        end
        pcall(applyPlayerCfg)
    end)

    Extras:Input({
        Title = L("ex_speed_input"),
        Placeholder = "16",
        Value = "",
        Callback = function(text)
            local n = parseInput(text, 0, 1000)
            if n then
                PlayerCfg.speed.value = n
            end
        end,
    })

    local SpeedToggle = Extras:Toggle({
        Title = L("ex_speed_toggle"),
        Desc = L("ex_speed_desc"),
        Value = false,
        Callback = function(state)
            PlayerCfg.speed.enabled = state
            local humanoid = getHumanoid()
            if state then
                PlayerCfg.speed.original = humanoid and humanoid.WalkSpeed or 16
            elseif humanoid then
                humanoid.WalkSpeed = PlayerCfg.speed.original or 16
            end
        end,
    })
    Util.register("ex_speed", SpeedToggle)

    Extras:Input({
        Title = L("ex_jump_input"),
        Placeholder = "50",
        Value = "",
        Callback = function(text)
            local n = parseInput(text, 0, 1000)
            if n then
                PlayerCfg.jump.value = n
            end
       end,
    })

    local JumpToggle = Extras:Toggle({
        Title = L("ex_jump_toggle"),
        Desc = L("ex_jump_desc"),
        Value = false,
        Callback = function(state)
            PlayerCfg.jump.enabled = state
            local humanoid = getHumanoid()
            if state then
                PlayerCfg.jump.original = humanoid and humanoid.JumpPower or 50
                PlayerCfg.jump.originalUse = humanoid and humanoid.UseJumpPower
            elseif humanoid then
                humanoid.JumpPower = PlayerCfg.jump.original or 50
                if PlayerCfg.jump.originalUse ~= nil then
                    humanoid.UseJumpPower = PlayerCfg.jump.originalUse
                end
            end
        end,
    })
    Util.register("ex_jump", JumpToggle)

    Extras:Input({
        Title = L("ex_gravity_input"),
        Placeholder = "196.2",
        Value = "",
        Callback = function(text)
            local n = parseInput(text, 0, 1000)
            if n then
                PlayerCfg.gravity.value = n
            end
        end,
    })

    local GravityToggle = Extras:Toggle({
        Title = L("ex_gravity_toggle"),
        Desc = L("ex_gravity_desc"),
        Value = false,
        Callback = function(state)
            PlayerCfg.gravity.enabled = state
            if state then
                PlayerCfg.gravity.original = workspace.Gravity
            else
                workspace.Gravity = PlayerCfg.gravity.original or 196.2
            end
        end,
    })
    Util.register("ex_gravity", GravityToggle)

    task.spawn(function()
        while isAlive() do
            task.wait(1)
        end
        PlayerCfg.speed.enabled = false
        PlayerCfg.jump.enabled = false
        PlayerCfg.gravity.enabled = false
        if playerCfgConn then
            playerCfgConn:Disconnect()
        end
        pcall(function()
            local humanoid = getHumanoid()
            if humanoid then
                humanoid.WalkSpeed = PlayerCfg.speed.original or 16
                humanoid.JumpPower = PlayerCfg.jump.original or 50
                if PlayerCfg.jump.originalUse ~= nil then
                    humanoid.UseJumpPower = PlayerCfg.jump.originalUse
                end
            end
            workspace.Gravity = PlayerCfg.gravity.original or 196.2
        end)
    end)

    Extras:Section({ Title = L("ex_external_section") })

    local function runExternal(url)
        task.spawn(function()
            local ok = pcall(function()
                loadstring(game:HttpGet(url))()
            end)
            if not ok then
                Util.notify(L("error"), L("ex_external_fail"), "triangle-alert")
            end
        end)
    end

    Extras:Button({
        Title = "Infinite Yield",
        Icon = "terminal",
        Callback = function()
            runExternal("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source")
        end,
    })

    Extras:Button({
        Title = "Permanent Shiftlock",
        Icon = "lock",
        Callback = function()
            runExternal("https://pastebin.com/raw/CjNsnSDy")
        end,
    })

    Extras:Button({
        Title = "All Emotes",
        Icon = "smile",
        Callback = function()
            runExternal("https://raw.githubusercontent.com/7yd7/Hub/refs/heads/Branch/GUIS/Emotes.lua")
        end,
    })

    Extras:Section({ Title = L("ex_server_section") })

    local GuiService = game:GetService("GuiService")
    local CoreGui = game:GetService("CoreGui")

    local ServerSys = {
       autoReconnect = false,
        autoReconnectAuto = false,
        errorConn = nil,
        ancestryConn = nil,
        promptConn = nil,
        lastTeleport = 0,
        hopping = false,
    }

   local function rejoinSameServer()
        if os.clock() - ServerSys.lastTeleport < 3 then
            return
        end
        ServerSys.lastTeleport = os.clock()

        local ok = pcall(function()
            TeleportService:TeleportToPlaceInstance(game.PlaceId, game.JobId, LocalPlayer)
       end)
        if not ok then
            pcall(function()
                TeleportService:Teleport(game.PlaceId, LocalPlayer)
            end)
        end
    end

    local function serverHop(descending)
        if ServerSys.hopping then
            return
        end
        ServerSys.hopping = true

        task.spawn(function()
            local ok, result = pcall(function()
                local url = "https://games.roblox.com/v1/games/" .. game.PlaceId
                    .. "/servers/Public?sortOrder=" .. (descending and "Desc" or "Asc")
                    .. "&limit=100"
                return HttpService:JSONDecode(game:HttpGet(url))
            end)

            local best = nil
            if ok and type(result) == "table" and type(result.data) == "table" then
                for _, server in ipairs(result.data) do
                    local playing = tonumber(server.playing)
                    local maxPlayers = tonumber(server.maxPlayers)

                    if server.id ~= game.JobId and playing and maxPlayers and playing < maxPlayers then
                        if not best
                            or (descending and playing > best.playing)
                            or (not descending and playing < best.playing) then
                            best = { id = server.id, playing = playing }
                        end
                    end
                end
            end

            if best then
                Util.notify(L("ex_server_section"), L("ex_server_joining", best.playing), "server")
                pcall(function()
                    TeleportService:TeleportToPlaceInstance(game.PlaceId, best.id, LocalPlayer)
                end)
            else
                Util.notify(L("ex_server_section"), L("ex_server_none"), "triangle-alert")
            end

            task.wait(3)
            ServerSys.hopping = false
        end)
    end

    local AutoReconnectToggle = Extras:Toggle({
        Title = L("ex_server_autoreconnect"),
        Desc = L("ex_server_autoreconnect_desc"),
        Value = false,
        Callback = function(state)
            ServerSys.autoReconnect = state

            if state then
                if not ServerSys.errorConn then
                    ServerSys.errorConn = GuiService.ErrorMessageChanged:Connect(function()
                        if ServerSys.autoReconnect and isAlive() then
                            rejoinSameServer()
                        end
                    end)
                end
            elseif ServerSys.errorConn then
                ServerSys.errorConn:Disconnect()
                ServerSys.errorConn = nil
            end
        end,
    })
    Util.register("server_auto_reconnect", AutoReconnectToggle)

    local AutoReconnectAutoToggle = Extras:Toggle({
        Title = L("ex_server_autoreconnect_auto"),
        Desc = L("ex_server_autoreconnect_auto_desc"),
        Value = false,
        Callback = function(state)
            ServerSys.autoReconnectAuto = state

            if state then
               if not ServerSys.ancestryConn then
                    ServerSys.ancestryConn = LocalPlayer.AncestryChanged:Connect(function(_, parent)
                        if not parent and ServerSys.autoReconnectAuto then
                            rejoinSameServer()
                        end
                    end)
                end

                if not ServerSys.promptConn then
                    pcall(function()
                        local gui = CoreGui:WaitForChild("RobloxPromptGui", 5)
                        local overlay = gui and gui:WaitForChild("promptOverlay", 5)
                        if overlay then
                            ServerSys.promptConn = overlay.ChildAdded:Connect(function(child)
                                if child.Name == "ErrorPrompt" and ServerSys.autoReconnectAuto and isAlive() then
                                    rejoinSameServer()
                                end
                           end)
                        end
                    end)
                end
            else
                if ServerSys.ancestryConn then
                    ServerSys.ancestryConn:Disconnect()
                    ServerSys.ancestryConn = nil
                end
                if ServerSys.promptConn then
                    ServerSys.promptConn:Disconnect()
                    ServerSys.promptConn = nil
                end
            end
        end,
    })
    Util.register("server_auto_reconnect_auto", AutoReconnectAutoToggle)

    Extras:Button({
        Title = L("ex_server_hop_low"),
        Desc = L("ex_server_hop_low_desc"),
        Icon = "arrow-down",
        Callback = function()
            serverHop(false)
        end,
    })

    Extras:Button({
        Title = L("ex_server_hop_full"),
        Desc = L("ex_server_hop_full_desc"),
        Icon = "arrow-up",
        Callback = function()
            serverHop(true)
        end,
    })

    Extras:Button({
        Title = L("ex_server_rejoin"),
        Icon = "refresh-cw",
        Callback = function()
            rejoinSameServer()
        end,
    })

    task.spawn(function()
        while isAlive() do
            task.wait(1)
        end
        ServerSys.autoReconnect = false
        ServerSys.autoReconnectAuto = false
        for _, key in ipairs({ "errorConn", "ancestryConn", "promptConn" }) do
            if ServerSys[key] then
                ServerSys[key]:Disconnect()
                ServerSys[key] = nil
            end
        end
    end)
end

do
    local Snacks = Tabs.Snacks

    local connections = {}
    local gifters = {}
    local eatEggs = false
    local eatBoosts = false

    local boostItems = {
        "Tropical Shake",
        "ULTRA Shake",
        "Energy Shake",
        "Protein Bar",
        "TOUGH Bar",
        "Protein Shake",
        "Energy Bar",
    }

    local function findItem(name)
        local character = LocalPlayer.Character
        local backpack = LocalPlayer:FindFirstChild("Backpack")
        return (character and character:FindFirstChild(name)) or (backpack and backpack:FindFirstChild(name))
    end

    local function countItem(name)
        local total = 0
        local backpack = LocalPlayer:FindFirstChild("Backpack")
        if backpack then
            for _, item in ipairs(backpack:GetChildren()) do
                if item.Name == name then
                    total = total + 1
                end
            end
        end
        return total
    end

    local function boostEventName(itemName)
        local parts = {}
        for word in itemName:gmatch("%S+") do
            table.insert(parts, word:lower())
        end
        for i = 2, #parts do
            parts[i] = parts[i]:sub(1, 1):upper() .. parts[i]:sub(2)
        end
        return table.concat(parts)
    end

    Snacks:Section({ Title = L("sn_boost_eater") })

    local EatEggsToggle = Snacks:Toggle({
        Title = L("sn_eat_all_eggs"),
        Value = false,
        Callback = function(state)
            eatEggs = state
        end,
    })
    Util.register("snacks_eat_eggs", EatEggsToggle)

    local EatBoostsToggle = Snacks:Toggle({
        Title = L("sn_eat_all_boosts"),
        Desc = L("sn_expect_lag"),
        Value = false,
        Callback = function(state)
            eatBoosts = state
        end,
    })
    Util.register("snacks_eat_boosts", EatBoostsToggle)

    task.spawn(function()
        while isAlive() do
            if eatEggs then
                local egg = findItem("Protein Egg")
                local event = LocalPlayer:FindFirstChild("muscleEvent")
                if egg and event then
                    pcall(function()
                        event:FireServer("proteinEgg", egg)
                    end)
                end
                task.wait(0.25)
            else
                task.wait(1)
            end
        end
    end)

    task.spawn(function()
        while isAlive() do
            if eatBoosts then
                local event = LocalPlayer:FindFirstChild("muscleEvent")
                for _, itemName in ipairs(boostItems) do
                    local tool = findItem(itemName)
                    if tool and event then
                        local eventName = boostEventName(itemName)
                        for _ = 1, 10 do
                            pcall(function()
                                event:FireServer(eventName, tool)
                            end)
                        end
                    end
                end
            end
            task.wait(0.1)
        end
    end)

    local function buildGifter(sectionTitle, itemName, countTitle)
        Snacks:Section({ Title = sectionTitle })

        local state = {
            itemName = itemName,
            targetName = nil,
            amount = 0,
            gifting = false,
            labels = {},
            countText = countTitle,
        }

        state.Paragraph = Snacks:Paragraph({
            Title = countTitle,
            Desc = "0",
        })

        local function buildList()
            state.labels = {}
            local list = {}
            for _, player in ipairs(Players:GetPlayers()) do
                if player ~= LocalPlayer then
                    local label = player.DisplayName .. " - " .. player.Name
                    state.labels[label] = player.Name
                    table.insert(list, label)
                end
            end
            return list
        end

        local Dropdown = Snacks:Dropdown({
            Title = L("sn_choose_player"),
            Values = buildList(),
            Value = nil,
            SearchBarEnabled = true,
            AllowNone = true,
            Callback = function(option)
                if type(option) == "string" and option ~= "" then
                    state.targetName = state.labels[option]
                else
                    state.targetName = nil
                end
            end,
        })

        local function refresh()
            pcall(function()
                Dropdown:Refresh(buildList())
            end)
        end

        table.insert(connections, Players.PlayerAdded:Connect(refresh))
        table.insert(connections, Players.PlayerRemoving:Connect(function(player)
            if player.Name == state.targetName then
                state.targetName = nil
            end
            task.delay(0.5, refresh)
        end))

        Snacks:Input({
            Title = L("sn_amount"),
            Placeholder = "0",
            Value = "",
            Callback = function(text)
                local n = tonumber(text)
                if n then
                    state.amount = math.max(0, math.floor(n))
                end
            end,
        })

        Snacks:Button({
            Title = L("sn_start_gifting"),
            Icon = "gift",
            Callback = function()
                if state.gifting then
                    return
                end

                local target = state.targetName and Players:FindFirstChild(state.targetName)
                if not target or state.amount <= 0 then
                    Util.notify(sectionTitle, L("sn_need_player_amount"), "triangle-alert")
                    return
                end

                state.gifting = true

                task.spawn(function()
                    local events = ReplicatedStorage:FindFirstChild("rEvents")
                    local remote = events and events:FindFirstChild("giftRemote")

                    if remote then
                        for _ = 1, state.amount do
                            if not isAlive() or not target.Parent then
                                break
                            end

                            local folder = LocalPlayer:FindFirstChild("consumablesFolder")
                            local item = folder and folder:FindFirstChild(state.itemName)
                            if not item then
                                break
                            end

                            pcall(function()
                                remote:InvokeServer("giftRequest", target, item)
                            end)
                            task.wait(0.1)
                        end
                    end

                    state.gifting = false
                end)
            end,
        })

        table.insert(gifters, state)
    end

    buildGifter(L("sn_egg_gifter"), "Protein Egg", L("sn_protein_eggs"))
    buildGifter(L("sn_shake_gifter"), "Tropical Shake", L("sn_tropical_shakes"))

    Snacks:Paragraph({
        Title = L("sn_information"),
        Desc = L("sn_info_text"),
    })

    task.spawn(function()
        while isAlive() do
            for _, state in ipairs(gifters) do
                pcall(function()
                    state.Paragraph:SetDesc(tostring(countItem(state.itemName)))
                end)
            end
            task.wait(2)
        end

        eatEggs = false
        eatBoosts = false
        for _, connection in ipairs(connections) do
            pcall(function()
                connection:Disconnect()
            end)
        end
    end)
end

do
    local Crystals = Tabs.Crystals

    local FALLBACK_CRYSTALS = {
        "Blue Crystal",
        "Green Crystal",
        "Frost Crystal",
        "Mythical Crystal",
        "Inferno Crystal",
        "Legends Crystal",
        "Muscle Elite Crystal",
        "Galaxy Oracle Crystal",
        "Jungle Crystal",
        "Industrial Crystal",
    }

    local C = {
        Selected = nil,
        Amount = 1,
        Running = false,
        Generation = 0,
    }

    local connections = {}

    local function setDesc(paragraph, text)
        pcall(function()
            paragraph:SetDesc(text)
        end)
    end

    local function toSet(options)
        local set = {}
        if type(options) == "table" then
            for _, value in pairs(options) do
                set[tostring(value)] = true
            end
        elseif type(options) == "string" and options ~= "" then
            set[options] = true
        end
        return set
    end

    local function getRemote()
        local events = ReplicatedStorage:FindFirstChild("rEvents")
        return events and events:FindFirstChild("openCrystalRemote")
    end

    local sharedFolder = ReplicatedStorage:FindFirstChild("shared")
    local catalogs = sharedFolder and sharedFolder:FindFirstChild("catalogs")
    local Catalog = catalogs and catalogs:FindFirstChild("crystalChances")

    local function crystalNames()
        if not Catalog then
            return FALLBACK_CRYSTALS
        end

        local names, seen = {}, {}
        for _, name in ipairs(FALLBACK_CRYSTALS) do
            if Catalog:FindFirstChild(name) then
                table.insert(names, name)
                seen[name] = true
            end
        end

        local extra = {}
        for _, folder in ipairs(Catalog:GetChildren()) do
            if not seen[folder.Name] then
                table.insert(extra, folder.Name)
            end
        end
        table.sort(extra, function(a, b)
            return a:lower() < b:lower()
        end)
        for _, name in ipairs(extra) do
            table.insert(names, name)
        end

        return #names > 0 and names or FALLBACK_CRYSTALS
    end

    local function hatchCrystal(remote, name, amount)
        if amount > 1 then
            local okBulk, enabled = pcall(function()
                local module = require(ReplicatedStorage.shared.modules.GlobalFunctions)
                return module.isBulkCrystalOpenEnabled()
            end)
            if not okBulk or not enabled then
                return false, L("cr_bulk_unavailable")
            end

            local result = remote:InvokeServer("openCrystalBulk", name, amount)
            if type(result) ~= "table" then
                return false, L("cr_no_result")
            end
            return type(result.Results) == "table" and #result.Results > 0, result.StopReason
        end

        local item, rarity, image, _, _, _, reason = remote:InvokeServer("openCrystal", name)
        return item ~= nil and rarity ~= nil and image ~= nil, reason
    end

    Crystals:Section({ Title = L("cr_section") })

    local HatchStatus = Crystals:Paragraph({
        Title = L("cr_hatch_title"),
        Desc = L("cr_hatch_inactive"),
    })

    local CrystalDropdown

    CrystalDropdown = Crystals:Dropdown({
        Title = L("cr_select_crystal"),
        Values = crystalNames(),
        Value = nil,
        SearchBarEnabled = true,
        AllowNone = true,
        Callback = function(option)
            if type(option) == "string" and table.find(crystalNames(), option) then
                C.Selected = option
            else
                C.Selected = nil
            end
        end,
    })
    Util.register("crystal_selected", CrystalDropdown)

    local function refreshCrystals()
        local names = crystalNames()
        pcall(function()
            CrystalDropdown:Refresh(names)
        end)

        if C.Selected and table.find(names, C.Selected) then
            pcall(function()
                CrystalDropdown:Select(C.Selected)
            end)
        else
            C.Selected = nil
        end
    end

    if Catalog then
        table.insert(connections, Catalog.ChildAdded:Connect(refreshCrystals))
        table.insert(connections, Catalog.ChildRemoved:Connect(refreshCrystals))
    end

    local AmountDropdown = Crystals:Dropdown({
        Title = L("cr_hatch_amount"),
        Values = { "1x", "3x", "10x" },
        Value = "1x",
        AllowNone = false,
        Callback = function(option)
            local amount = tonumber(tostring(option):match("^(%d+)x$"))
            if amount == 1 or amount == 3 or amount == 10 then
                C.Amount = amount
            end
        end,
    })
    Util.register("crystal_amount", AmountDropdown)

    local HatchToggle = Crystals:Toggle({
        Title = L("cr_autohatch"),
        Value = false,
        Callback = function(state)
            C.Running = state
            C.Generation = C.Generation + 1
            local gen = C.Generation

            if not state then
                setDesc(HatchStatus, L("cr_hatch_inactive"))
                return
            end

            setDesc(HatchStatus, L("cr_hatch_preparing"))

            task.spawn(function()
                local lastMessage = nil

                while C.Running and isAlive() and C.Generation == gen do
                    local remote = getRemote()
                    local name, amount = C.Selected, C.Amount

                    if not name then
                        setDesc(HatchStatus, L("cr_hatch_select"))
                    elseif not remote then
                        setDesc(HatchStatus, L("cr_hatch_waiting", "openCrystalRemote"))
                    else
                        local ok, opened, reason = pcall(hatchCrystal, remote, name, amount)

                        if C.Running and C.Generation == gen then
                            if ok and opened then
                                setDesc(HatchStatus, L("cr_hatch_active", name, amount))
                                lastMessage = nil
                            else
                                local detail = tostring(ok and (reason or L("cr_hatch_check")) or opened)
                                setDesc(HatchStatus, L("cr_hatch_waiting", detail))

                                if detail ~= lastMessage then
                                    lastMessage = detail
                                    warn("[Mystery] Hatch " .. name .. " x" .. amount .. ": " .. detail)
                                end
                            end
                        end
                    end

                    task.wait(1)
                end
            end)
        end,
    })
    Util.register("crystal_autohatch", HatchToggle)

    Crystals:Section({ Title = L("cr_psell_section") })

    local PS = {
        selected = {},
        byLabel = {},
        names = {},
        counts = {},
        total = 0,
        sold = 0,
        running = false,
        generation = 0,
        rendering = false,
        signature = "",
        status = L("cr_psell_inactive"),
    }

    local PetSellInfo = Crystals:Paragraph({
        Title = L("cr_psell_info_title"),
        Desc = L("cr_none"),
    })

    local PetSellDropdown, PetSellToggle

    local function equippedSet()
        local set = {}
        local folder = LocalPlayer:FindFirstChild("equippedPets")
        if folder then
            for _, value in ipairs(folder:GetChildren()) do
                if value:IsA("ObjectValue") and value.Value then
                    set[value.Value] = true
                end
            end
        end
        return set
    end

    local function hasFlag(item, name)
        if item:GetAttribute(name) == true then
            return true
        end
        local child = item:FindFirstChild(name) or item:FindFirstChild(name:lower())
        return child ~= nil and child:IsA("BoolValue") and child.Value == true
    end

        local function auraFolder()
        local direct = LocalPlayer:FindFirstChild("powerUpsFolder")
        if direct then
            return direct
        end
        for _, child in ipairs(LocalPlayer:GetChildren()) do
            local n = child.Name:lower()
            if (n:find("powerup", 1, true) or n:find("aura", 1, true))
                and not n:find("equipped", 1, true)
                and (child:IsA("Folder") or child:IsA("Configuration")) then
                return child
            end
        end
        return nil
    end

    local function findRemote(exact, must, anyOf)
        local events = ReplicatedStorage:FindFirstChild("rEvents")
        if not events then
            return nil
        end
        for _, name in ipairs(exact) do
            local remote = events:FindFirstChild(name)
            if remote then
                return remote
            end
        end
        for _, remote in ipairs(events:GetChildren()) do
            if remote:IsA("RemoteEvent") or remote:IsA("RemoteFunction") then
                local n = remote.Name:lower()
                local okMust = n:find(must, 1, true) ~= nil
                local okAny = false
                for _, word in ipairs(anyOf) do
                    if n:find(word, 1, true) then
                        okAny = true
                    end
                end
                if okMust and okAny then
                    return remote
                end
            end
        end
        return nil
    end

    local function fireRemote(remote, ...)
        local args = table.pack(...)
        if remote:IsA("RemoteFunction") then
            return pcall(remote.InvokeServer, remote, table.unpack(args, 1, args.n))
        end
        return pcall(remote.FireServer, remote, table.unpack(args, 1, args.n))
    end

    local function tryVariants(variants, memo, confirm)
        local order = {}
        if memo.sig then
            order[1] = memo.sig
        end
        for i = 1, #variants do
            if i ~= memo.sig then
                order[#order + 1] = i
            end
        end
        for _, i in ipairs(order) do
            variants[i]()
            local started = os.clock()
            while os.clock() - started < 1.5 do
                task.wait(0.1)
                if confirm() then
                    memo.sig = i
                    return true
                end
            end
        end
        return false
    end

    local function sellablePets(onlyName)
        local list = {}
        local folder = LocalPlayer:FindFirstChild("petsFolder")
        if not folder then
            return list
        end

        local equipped = equippedSet()
        for _, group in ipairs(folder:GetChildren()) do
            if group:IsA("Folder") then
                for _, pet in ipairs(group:GetChildren()) do
                    if (not onlyName or pet.Name == onlyName)
                        and not hasFlag(pet, "Locked")
                        and not equipped[pet] then
                        table.insert(list, pet)
                    end
                end
            end
        end
        return list
    end

    local function sellableAuras(onlyName)
        local list = {}
        local container = auraFolder()
        if not container then
            return list
        end

        local equipped = {}
        for _, child in ipairs(LocalPlayer:GetChildren()) do
            local n = child.Name:lower()
            if n:find("equipped", 1, true) and (n:find("powerup", 1, true) or n:find("aura", 1, true)) then
                if child:IsA("ObjectValue") then
                    if child.Value then
                        equipped[child.Value] = true
                    end
                else
                    for _, value in ipairs(child:GetChildren()) do
                        if value:IsA("ObjectValue") and value.Value then
                            equipped[value.Value] = true
                        end
                    end
                end
            end
        end

        local function consider(item)
            if (not onlyName or item.Name == onlyName)
                and not hasFlag(item, "Locked")
                and item:GetAttribute("Equipped") ~= true
                and not equipped[item] then
                table.insert(list, item)
            end
        end

        for _, child in ipairs(container:GetChildren()) do
            if child:IsA("Folder") then
                for _, item in ipairs(child:GetChildren()) do
                    consider(item)
                end
            else
                consider(child)
            end
        end
        return list
    end

    local function evolvablePets(onlyName)
        local list = {}
        for _, pet in ipairs(sellablePets(onlyName)) do
            if not hasFlag(pet, "evolved") then
                table.insert(list, pet)
            end
        end
        return list
    end

    local function evolvableAuras(onlyName)
        local list = {}
        for _, aura in ipairs(sellableAuras(onlyName)) do
            if not hasFlag(aura, "evolved") then
                table.insert(list, aura)
            end
        end
        return list
    end

    local function tradablePets(onlyName)
        return sellablePets(onlyName)
    end

    local Pickers = {}

    local function newPickerDropdown(P, title, flag)
        P.dropdown = Crystals:Dropdown({
            Title = title,
            Values = {},
            Value = {},
            Multi = true,
            AllowNone = true,
            SearchBarEnabled = true,
            Callback = function(options)
                if P.rendering then
                    return
                end
                P.selected = {}
                for label in pairs(toSet(options)) do
                    local name = P.byLabel[label]
                    if name then
                        P.selected[name] = true
                    end
                end
            end,
        })
        Util.register(flag, P.dropdown)
        table.insert(Pickers, P)
    end

    local function makePicker(title, flag, getItems)
        local P = { selected = {}, byLabel = {}, counts = {}, signature = "", rendering = false }
        newPickerDropdown(P, title, flag)

        function P.refresh(force)
            local counts, order = {}, {}
            for _, item in ipairs(getItems()) do
                if not counts[item.Name] then
                    counts[item.Name] = 0
                    table.insert(order, item.Name)
                end
                counts[item.Name] = counts[item.Name] + 1
            end
            table.sort(order)

            local labels, byLabel, sig = {}, {}, {}
            for _, name in ipairs(order) do
                local label = name .. " x" .. counts[name]
                byLabel[label] = name
                table.insert(labels, label)
                table.insert(sig, label)
            end

            local text = table.concat(sig, ";")
            if not force and text == P.signature then
                return
            end
            P.signature = text
            P.byLabel = byLabel
            P.counts = counts

            for name in pairs(P.selected) do
                if not counts[name] then
                    P.selected[name] = nil
                end
            end

            local keep = {}
            for _, name in ipairs(order) do
                if P.selected[name] then
                    table.insert(keep, name .. " x" .. counts[name])
                end
            end

            P.rendering = true
            pcall(function()
                P.dropdown:Refresh(labels)
            end)
            pcall(function()
                P.dropdown:Select(keep)
            end)
            task.delay(0.3, function()
                P.rendering = false
            end)
        end

        return P
    end

    local function makePlayerPicker(title, flag)
        local P = { selected = {}, byLabel = {}, counts = {}, signature = "", rendering = false }
        newPickerDropdown(P, title, flag)

        function P.refresh(force)
            local labels, byLabel, present = {}, {}, {}
            for _, player in ipairs(Players:GetPlayers()) do
                if player ~= LocalPlayer then
                    local label = player.DisplayName .. " - " .. player.Name
                    byLabel[label] = player.Name
                    present[player.Name] = true
                    table.insert(labels, label)
                end
            end
            table.sort(labels)

            local text = table.concat(labels, ";")
            if not force and text == P.signature then
                return
            end
            P.signature = text
            P.byLabel = byLabel

            for name in pairs(P.selected) do
                if not present[name] then
                    P.selected[name] = nil
                end
            end

            local keep = {}
            for label, name in pairs(byLabel) do
                if P.selected[name] then
                    table.insert(keep, label)
                end
            end

            P.rendering = true
            pcall(function()
                P.dropdown:Refresh(labels)
            end)
            pcall(function()
                P.dropdown:Select(keep)
            end)
            task.delay(0.3, function()
                P.rendering = false
            end)
        end

        function P.selectAll()
            local keep = {}
            for label, name in pairs(P.byLabel) do
                P.selected[name] = true
                table.insert(keep, label)
            end
            P.rendering = true
            pcall(function()
                P.dropdown:Select(keep)
            end)
            task.delay(0.3, function()
                P.rendering = false
            end)
        end

        return P
    end

    local function renderPetSell()
        local names = {}
        for name in pairs(PS.selected) do
            table.insert(names, name)
        end
        table.sort(names)

        local types = 0
        for _ in pairs(PS.counts) do
            types = types + 1
        end

        setDesc(PetSellInfo, table.concat({
            L("boss_status") .. ": " .. PS.status,
            L("cr_psell_summary", PS.total, types),
            L("cr_psell_selected", #names > 0 and table.concat(names, ", ") or L("cr_none")),
            L("cr_psell_sold", PS.sold),
        }, "\n"))
    end

    local function refreshPetSell(force)
        local counts, order, total = {}, {}, 0

        for _, pet in ipairs(sellablePets()) do
            if not counts[pet.Name] then
                counts[pet.Name] = 0
                table.insert(order, pet.Name)
            end
            counts[pet.Name] = counts[pet.Name] + 1
            total = total + 1
        end
        table.sort(order)

        local labels, byLabel, signature = {}, {}, {}
        for _, name in ipairs(order) do
            local label = name .. " x" .. counts[name]
            byLabel[label] = name
            table.insert(labels, label)
            table.insert(signature, label)
        end

        local signatureText = table.concat(signature, ";")
        if not force and signatureText == PS.signature then
            return
        end

        PS.signature = signatureText
        PS.byLabel = byLabel
        PS.counts = counts
        PS.total = total

        for name in pairs(PS.selected) do
            if not counts[name] then
                PS.selected[name] = nil
            end
        end

        local keep = {}
        for _, name in ipairs(order) do
            if PS.selected[name] then
                table.insert(keep, name .. " x" .. counts[name])
            end
        end

        PS.rendering = true
        pcall(function()
            PetSellDropdown:Refresh(labels)
        end)
        pcall(function()
            PetSellDropdown:Select(keep)
        end)
        task.delay(0.3, function()
            PS.rendering = false
        end)

        renderPetSell()
    end

    PetSellDropdown = Crystals:Dropdown({
        Title = L("cr_psell_select"),
        Values = {},
        Value = {},
        Multi = true,
        AllowNone = true,
        SearchBarEnabled = true,
        Callback = function(options)
            if PS.rendering then
                return
            end

            PS.selected = {}
            for label in pairs(toSet(options)) do
                local name = PS.byLabel[label]
                if name then
                    PS.selected[name] = true
                end
            end
            renderPetSell()
        end,
    })
    Util.register("crystal_pet_sell_list", PetSellDropdown)

    local SellAuras = makePicker(L("cr_asell_select"), "crystal_aura_sell_list", sellableAuras)

    local auraSellMemo = {}
    local petSellMemo = {}

    local function sellOneAura(aura)
        local remote = findRemote({ "sellPowerUpEvent", "sellAuraEvent" }, "sell", { "powerup", "aura" })
        if not remote then
            return false
        end
        local name = aura.Name
        local before = #sellableAuras(name)
        return tryVariants({
            function() fireRemote(remote, "sellPowerUp", aura) end,
            function() fireRemote(remote, "sellPowerUp", aura, "") end,
            function() fireRemote(remote, "sellPowerUp", name) end,
            function() fireRemote(remote, "sellAura", aura) end,
            function() fireRemote(remote, aura) end,
        }, auraSellMemo, function()
            return not aura.Parent or #sellableAuras(name) < before
        end)
    end

    local function sellOnePet(pet)
        local events = ReplicatedStorage:FindFirstChild("rEvents")
        local remote = events and (events:FindFirstChild("sellPetEvent")
            or findRemote({}, "sell", { "pet" }))
        if not remote then
            return false
        end
        local name = pet.Name
        local before = #sellablePets(name)
        return tryVariants({
            function() fireRemote(remote, "sellPet", pet, "") end,
            function() fireRemote(remote, "sellPet", pet) end,
            function() fireRemote(remote, "sellPet", name) end,
            function() fireRemote(remote, "sellPets", { pet }) end,
            function() fireRemote(remote, pet) end,
        }, petSellMemo, function()
            return not pet.Parent or #sellablePets(name) < before
        end)
    end

    PetSellToggle = Crystals:Toggle({
        Title = L("cr_psell_toggle"),
        Desc = L("cr_psell_toggle_desc"),
        Value = false,
        Callback = function(state)
            PS.running = state
            PS.generation = PS.generation + 1
            local gen = PS.generation

            if not state then
                PS.status = L("cr_psell_inactive")
                renderPetSell()
                return
            end

            if next(PS.selected) == nil and next(SellAuras.selected) == nil then
                PS.running = false
                Util.notify(L("cr_psell_section"), L("cr_psell_select_first"), "triangle-alert")
                task.defer(function()
                    pcall(function()
                        PetSellToggle:Set(false)
                    end)
                end)
                return
            end

            task.spawn(function()
                local failStreak = 0

                while PS.running and isAlive() and PS.generation == gen do
                    local didSell = false

                    for name in pairs(PS.selected) do
                        for _, pet in ipairs(sellablePets(name)) do
                            if not (PS.running and isAlive() and PS.generation == gen) then
                                break
                            end

                            if pet.Parent and PS.selected[name] then
                                PS.status = L("cr_psell_running")
                                didSell = true

                                if sellOnePet(pet) then
                                    PS.sold = PS.sold + 1
                                    failStreak = 0
                                else
                                    failStreak = failStreak + 1
                                end

                                if failStreak >= 3 then
                                    PS.running = false
                                    PS.status = L("cr_psell_inactive")
                                    Util.notify(L("cr_psell_section"), L("cr_psell_failed"), "triangle-alert")
                                    task.defer(function()
                                        pcall(function()
                                            PetSellToggle:Set(false)
                                        end)
                                    end)
                                    renderPetSell()
                                    return
                                end
                            end
                        end
                    end

                    for name in pairs(SellAuras.selected) do
                        for _, aura in ipairs(sellableAuras(name)) do
                            if not (PS.running and isAlive() and PS.generation == gen) then
                                break
                            end

                            if aura.Parent and SellAuras.selected[name] then
                                PS.status = L("cr_psell_running")
                                didSell = true

                                if sellOneAura(aura) then
                                    PS.sold = PS.sold + 1
                                    failStreak = 0
                                else
                                    failStreak = failStreak + 1
                                end

                                if failStreak >= 3 then
                                    PS.running = false
                                    PS.status = L("cr_psell_inactive")
                                    Util.notify(L("cr_psell_section"), L("cr_psell_failed"), "triangle-alert")
                                    task.defer(function()
                                        pcall(function()
                                            PetSellToggle:Set(false)
                                        end)
                                    end)
                                    renderPetSell()
                                    return
                                end
                            end
                        end
                    end

                    if not didSell then
                        PS.status = L("cr_psell_waiting")
                    end
                    renderPetSell()
                    task.wait(0.3)
                end
            end)
        end,
    })
    Util.register("crystal_pet_autosell", PetSellToggle)

    Crystals:Button({
        Title = L("cr_psell_refresh"),
        Icon = "refresh-cw",
        Callback = function()
            refreshPetSell(true)
            SellAuras.refresh(true)
        end,
    })

    Crystals:Section({ Title = L("cr_evo_section") })

    local EVO_NEEDED = 5

    local EV = {
        evolved = 0,
        running = false,
        generation = 0,
        status = L("cr_evo_inactive"),
    }

    local EvoInfo = Crystals:Paragraph({
        Title = L("cr_evo_info_title"),
        Desc = L("cr_none"),
    })

    local EvoPets = makePicker(L("cr_evo_select"), "crystal_pet_evolve_list", evolvablePets)
    local EvoAuras = makePicker(L("cr_evo_select_auras"), "crystal_aura_evolve_list", evolvableAuras)

    local function renderEvo()
        local names = {}
        for name in pairs(EvoPets.selected) do
            table.insert(names, name)
        end
        for name in pairs(EvoAuras.selected) do
            table.insert(names, name)
        end
        table.sort(names)

        local ready, types = 0, 0
        for _, picker in ipairs({ EvoPets, EvoAuras }) do
            for _, count in pairs(picker.counts) do
                if count >= EVO_NEEDED then
                    types = types + 1
                    ready = ready + math.floor(count / EVO_NEEDED) * EVO_NEEDED
                end
            end
        end

        setDesc(EvoInfo, table.concat({
            L("boss_status") .. ": " .. EV.status,
            L("cr_evo_summary", ready, types),
            L("cr_evo_selected", #names > 0 and table.concat(names, ", ") or L("cr_none")),
            L("cr_evo_done", EV.evolved),
        }, "\n"))
    end

    local auraEvoMemo = {}

    local function evolveOne(isAura, name)
        local events = ReplicatedStorage:FindFirstChild("rEvents")
        local getter = isAura and evolvableAuras or evolvablePets
        local remote
        if isAura then
            remote = findRemote({ "evolvePowerUpEvent", "evolveAuraEvent" }, "evolve", { "powerup", "aura" })
        else
            remote = events and events:FindFirstChild("petEvolveEvent")
        end
        local list = getter(name)
        if not remote or #list < EVO_NEEDED then
            return false
        end

        local before = #list

        if not isAura then
            pcall(function()
                remote:FireServer("evolvePet", name)
            end)
            local started = os.clock()
            while os.clock() - started < 4 do
                task.wait(0.2)
                if #getter(name) < before then
                    return true
                end
            end
            return false
        end

        local first = list[1]
        return tryVariants({
            function() fireRemote(remote, "evolvePowerUp", name) end,
            function() fireRemote(remote, "evolvePowerUp", first) end,
            function() fireRemote(remote, "evolveAura", name) end,
            function() fireRemote(remote, name) end,
        }, auraEvoMemo, function()
            return #getter(name) < before
        end)
    end

    local EvoToggle
    EvoToggle = Crystals:Toggle({
        Title = L("cr_evo_toggle"),
        Desc = L("cr_evo_toggle_desc"),
        Value = false,
        Callback = function(state)
            EV.running = state
            EV.generation = EV.generation + 1
            local gen = EV.generation

            if not state then
                EV.status = L("cr_evo_inactive")
                renderEvo()
                return
            end

            if next(EvoPets.selected) == nil and next(EvoAuras.selected) == nil then
                EV.running = false
                Util.notify(L("cr_evo_section"), L("cr_evo_select_first"), "triangle-alert")
                task.defer(function()
                    pcall(function()
                        EvoToggle:Set(false)
                    end)
                end)
                return
            end

            task.spawn(function()
                local failStreak = 0

                while EV.running and isAlive() and EV.generation == gen do
                    local didEvolve = false

                    for _, group in ipairs({ { false, EvoPets }, { true, EvoAuras } }) do
                        local isAura, picker = group[1], group[2]
                        local getter = isAura and evolvableAuras or evolvablePets

                        for name in pairs(picker.selected) do
                            while EV.running and isAlive() and EV.generation == gen
                                and picker.selected[name]
                                and #getter(name) >= EVO_NEEDED do

                                EV.status = L("cr_evo_running")
                                didEvolve = true

                                if evolveOne(isAura, name) then
                                    EV.evolved = EV.evolved + 1
                                    failStreak = 0
                                else
                                    failStreak = failStreak + 1
                                end

                                if failStreak >= 3 then
                                    EV.running = false
                                    EV.status = L("cr_evo_inactive")
                                    Util.notify(L("cr_evo_section"), L("cr_evo_failed"), "triangle-alert")
                                    task.defer(function()
                                        pcall(function()
                                            EvoToggle:Set(false)
                                        end)
                                    end)
                                    renderEvo()
                                    return
                                end
                            end
                        end
                    end

                    if not didEvolve then
                        EV.status = L("cr_evo_waiting")
                    end
                    renderEvo()
                    task.wait(0.5)
                end
            end)
        end,
    })
    Util.register("crystal_pet_autoevolve", EvoToggle)

    Crystals:Button({
        Title = L("cr_evo_refresh"),
        Icon = "refresh-cw",
        Callback = function()
            EvoPets.refresh(true)
            EvoAuras.refresh(true)
        end,
    })

    Crystals:Section({ Title = L("cr_trade_section") })

    local TR = {
        running = false,
        generation = 0,
        sent = 0,
        status = L("cr_trade_inactive"),
    }

    local TradeInfo = Crystals:Paragraph({
        Title = L("cr_trade_info_title"),
        Desc = L("cr_none"),
    })

    local TradePlayers = makePlayerPicker(L("cr_trade_players"), "crystal_trade_players")
    local TradePets = makePicker(L("cr_trade_pets"), "crystal_trade_pets", tradablePets)
    local TradeAuras = makePicker(L("cr_trade_auras"), "crystal_trade_auras", sellableAuras)

    local function renderTrade()
        setDesc(TradeInfo, table.concat({
            L("boss_status") .. ": " .. TR.status,
            L("cr_trade_done", TR.sent),
        }, "\n"))
    end

    local function collectOffer(limit)
        local offer = {}
        for name in pairs(TradePets.selected) do
            for _, pet in ipairs(tradablePets(name)) do
                if #offer >= limit then
                    return offer
                end
                table.insert(offer, pet)
            end
        end
        for name in pairs(TradeAuras.selected) do
            for _, aura in ipairs(sellableAuras(name)) do
                if #offer >= limit then
                    return offer
                end
                table.insert(offer, aura)
            end
        end
        return offer
    end

    local TradeToggle
    TradeToggle = Crystals:Toggle({
        Title = L("cr_trade_toggle"),
        Desc = L("cr_trade_toggle_desc"),
        Value = false,
        Callback = function(state)
            TR.running = state
            TR.generation = TR.generation + 1
            local gen = TR.generation

            if not state then
                TR.status = L("cr_trade_inactive")
                renderTrade()
                return
            end

            local hasItems = next(TradePets.selected) ~= nil or next(TradeAuras.selected) ~= nil
            if next(TradePlayers.selected) == nil or not hasItems then
                TR.running = false
                Util.notify(L("cr_trade_section"), L("cr_trade_select_first"), "triangle-alert")
                task.defer(function()
                    pcall(function()
                        TradeToggle:Set(false)
                    end)
                end)
                return
            end

            task.spawn(function()
                local function active()
                    return TR.running and isAlive() and TR.generation == gen
                end

                while active() do
                    local events = ReplicatedStorage:FindFirstChild("rEvents")
                    local tradingEvent = events and events:FindFirstChild("tradingEvent")

                    local targets = {}
                    for name in pairs(TradePlayers.selected) do
                        local player = Players:FindFirstChild(name)
                        if player then
                            table.insert(targets, player)
                        end
                    end

                    if not tradingEvent or #targets == 0 or #collectOffer(1) == 0 then
                        TR.status = L("cr_trade_waiting")
                    else
                        for _, player in ipairs(targets) do
                            if not active() then
                                break
                            end

                            local offer = collectOffer(6)
                            if #offer == 0 then
                                break
                            end

                            TR.status = L("cr_trade_running")
                            pcall(function()
                                tradingEvent:FireServer("sendTradeRequest", player)
                            end)
                            task.wait(0.5)

                            for _, item in ipairs(offer) do
                                if not active() then
                                    break
                                end
                                pcall(function()
                                    tradingEvent:FireServer("offerItem", item)
                                end)
                                task.wait(0.05)
                            end

                            task.wait(0.05)

                            if active() then
                                pcall(function()
                                    tradingEvent:FireServer("acceptTrade")
                                end)
                                TR.sent = TR.sent + 1
                                renderTrade()
                                task.wait(2)
                            end
                        end
                    end

                    renderTrade()
                    task.wait(2)
                end
            end)
        end,
    })
    Util.register("crystal_trade_toggle", TradeToggle)

    task.spawn(function()
        task.wait(1)
        pcall(refreshPetSell, true)

        while isAlive() do
            task.wait(1.5)
            pcall(refreshPetSell, false)
        end
    end)

    task.spawn(function()
        task.wait(1.2)
        for _, picker in ipairs(Pickers) do
            pcall(picker.refresh, true)
        end

        while isAlive() do
            task.wait(1.5)
            for _, picker in ipairs(Pickers) do
                pcall(picker.refresh, false)
            end
        end
    end)

    task.spawn(function()
        while isAlive() do
            task.wait(1)
        end
        for _, connection in ipairs(connections) do
            pcall(function()
                connection:Disconnect()
            end)
        end
        C.Running = false
        C.Generation = C.Generation + 1
        PS.running = false
        PS.generation = PS.generation + 1
        EV.running = false
        EV.generation = EV.generation + 1
        TR.running = false
        TR.generation = TR.generation + 1
    end)
end

do
    local Data = Tabs.Data

    local NOTIFY_COLOR = 0x170158
    local NOTIFY_NAME = "Mystery Notification"
    local NOTIFY_IMAGE = "https://raw.githubusercontent.com/Mystery-Center/Mystery-Media/main/Mystery%20Notificaciones%20Imagen.png"

    local HOUR = 3600
    local DAY = 86400

    local UNITS = {
        { 1e33, "DC" },
        { 1e30, "NO" },
        { 1e27, "OC" },
        { 1e24, "SP" },
        { 1e21, "SX" },
        { 1e18, "QI" },
        { 1e15, "QA" },
        { 1e12, "T" },
        { 1e9, "B" },
        { 1e6, "M" },
        { 1e3, "K" },
    }

    local HOSTS = {
        ["discord.com"] = true,
        ["discordapp.com"] = true,
        ["ptb.discord.com"] = true,
        ["canary.discord.com"] = true,
    }

    local fields = {
        { key = "Strength", obj = "Strength", label = "st_strength", leader = true },
        { key = "Gems", obj = "Gems", label = "st_gems" },
        { key = "Agility", obj = "Agility", label = "st_agility" },
        { key = "Rebirths", obj = "Rebirths", label = "st_rebirths", leader = true },
        { key = "Durability", obj = "Durability", label = "st_durability" },
        { key = "Kills", obj = "Kills", label = "st_kills", leader = true },
        { key = "MuscleKing", obj = "muscleKingTime", label = "st_mk_time" },
        { key = "EvilKarma", obj = "evilKarma", label = "st_evil" },
        { key = "GoodKarma", obj = "goodKarma", label = "st_good" },
    }

    local Session = {
        start = os.clock(),
        base = {},
        hour = {},
        day = {},
    }

    local webhookUrl = ""

    local function formatRaw(n)
        local text = string.format("%.0f", math.floor(math.abs(tonumber(n) or 0)))
        local reversed = text:reverse():gsub("(%d%d%d)", "%1,")
        return (reversed:reverse():gsub("^,", ""))
    end

    local function formatShort(n)
        n = math.abs(tonumber(n) or 0)
        for _, unit in ipairs(UNITS) do
            if n >= unit[1] then
                local text = string.format("%.2f", n / unit[1])
                text = text:gsub("%.?0+$", "")
                return text .. unit[2]
            end
        end
        return string.format("%.0f", n)
    end

    local function formatBoth(n)
        n = tonumber(n) or 0
        local raw = formatRaw(n)
        if math.abs(n) < 1000 then
            return raw
        end
        return raw .. " [" .. formatShort(n) .. "]"
    end

    local function formatSigned(n)
        n = tonumber(n) or 0
        local sign = n < 0 and "-" or "+"
        return sign .. formatBoth(n)
    end

    local function getObject(field)
        local source = field.leader and LocalPlayer:FindFirstChild("leaderstats") or LocalPlayer
        return source and source:FindFirstChild(field.obj)
    end

    local function readValue(object)
        if Util.getRealValue then
            local ok, value = pcall(Util.getRealValue, object)
            if ok and tonumber(value) then
                return tonumber(value)
            end
        end
        return tonumber(object.Value) or 0
    end

    local function collect()
        local list = {}
        local elapsed = os.clock() - Session.start

        for _, field in ipairs(fields) do
            local object = getObject(field)
            if object then
                local current = readValue(object)
                if Session.base[field.key] == nil then
                    Session.base[field.key] = current
                end

                local gained = current - Session.base[field.key]

                if elapsed < HOUR or Session.hour[field.key] == nil then
                    Session.hour[field.key] = gained
                end
                if elapsed < DAY or Session.day[field.key] == nil then
                    Session.day[field.key] = gained
                end

                table.insert(list, {
                    name = L(field.label),
                    current = current,
                    gained = gained,
                    hour = Session.hour[field.key],
                    day = Session.day[field.key],
                })
            end
        end

        return list, elapsed
    end

    local function signedLines(list, key)
        local lines = {}
        for _, stat in ipairs(list) do
            table.insert(lines, stat.name .. ": " .. formatSigned(stat[key]))
        end
        return #lines > 0 and table.concat(lines, "\n") or L("st_no_data")
    end

    local function totalsText(list)
        local lines = {}
        for _, stat in ipairs(list) do
            table.insert(lines, stat.name .. ": " .. formatBoth(stat.current))
        end
        local map = LocalPlayer:FindFirstChild("currentMap")
        if map then
            table.insert(lines, L("st_map") .. ": " .. tostring(map.Value))
        end
        return #lines > 0 and table.concat(lines, "\n") or L("st_no_data")
    end

    local function windowStatus(elapsed, limit)
        if elapsed >= limit then
            return L("dt_done")
        end
        return L("dt_running") .. " (" .. Util.formatTime(elapsed) .. " / " .. Util.formatTime(limit) .. ")"
    end

    local function sessionText(elapsed)
        return table.concat({
            L("pk_time") .. ": " .. Util.formatTime(elapsed),
            L("pk_hour") .. ": " .. windowStatus(elapsed, HOUR),
            L("pk_day") .. ": " .. windowStatus(elapsed, DAY),
        }, "\n")
    end

    Data:Section({ Title = L("dt_session_section") })

    local SessionParagraph = Data:Paragraph({
        Title = L("dt_session_title"),
        Desc = L("home_loading"),
    })

    local GainedParagraph = Data:Paragraph({
        Title = L("dt_gained_title"),
        Desc = L("home_loading"),
    })

    local HourParagraph = Data:Paragraph({
        Title = L("dt_1h_title"),
        Desc = L("home_loading"),
    })

    local DayParagraph = Data:Paragraph({
        Title = L("dt_1d_title"),
        Desc = L("home_loading"),
    })

    local TotalsParagraph = Data:Paragraph({
        Title = L("dt_totals_title"),
        Desc = L("home_loading"),
    })

    local function makeSetter(paragraph)
        local last
        return function(text)
            if text == last then
                return
            end
            last = text
            pcall(paragraph.SetDesc, paragraph, text)
        end
    end

    local setSession = makeSetter(SessionParagraph)
    local setGained = makeSetter(GainedParagraph)
    local setHour = makeSetter(HourParagraph)
    local setDay = makeSetter(DayParagraph)
    local setTotals = makeSetter(TotalsParagraph)

    local function refreshData()
        local list, elapsed = collect()
        setSession(sessionText(elapsed))
        setGained(signedLines(list, "gained"))
        setHour(signedLines(list, "hour"))
        setDay(signedLines(list, "day"))
        setTotals(totalsText(list))
    end

    Data:Button({
        Title = L("dt_reset"),
        Desc = L("dt_reset_desc"),
        Icon = "rotate-ccw",
        Callback = function()
            Session.start = os.clock()
            Session.base = {}
            Session.hour = {}
            Session.day = {}
            pcall(refreshData)
            Util.notify(L("dt_session_section"), L("dt_reset_done"), "check")
        end,
    })

    task.spawn(function()
        task.wait(1)
        pcall(refreshData)

        local ticks = 0
        while isAlive() do
            task.wait(1)
            if not isAlive() then
                break
            end
            ticks = ticks + 1
            if ticks % 5 == 0 then
                pcall(refreshData)
            else
                pcall(collect)
            end
        end
    end)

    local function isValidHook(url)
        if type(url) ~= "string" then
            return false
        end
        local host = url:match("^https://([%w%.]+)/api/webhooks/%d+/[%w_%-]+$")
        return host ~= nil and HOSTS[host] == true
    end

    local function clip(text, limit)
        text = tostring(text)
        if #text > limit then
            return string.sub(text, 1, limit - 3) .. "..."
        end
        return text
    end

    local avatarCache = nil
    local function getAvatarUrl()
        if not avatarCache then
            avatarCache = Logger.getAvatar(LocalPlayer.UserId)
        end
        return avatarCache
    end

    local function buildEmbed()
        local list, elapsed = collect()

        return {
            title = "Gained Report",
            description = "[`" .. LocalPlayer.Name .. "`](https://www.roblox.com/users/"
                .. LocalPlayer.UserId .. "/profile) - ID `" .. LocalPlayer.UserId .. "`",
            color = NOTIFY_COLOR,
            image = { url = NOTIFY_IMAGE },
            thumbnail = { url = getAvatarUrl() },
            fields = {
                { name = "Session", value = clip(sessionText(elapsed), 1024), inline = false },
                { name = "Total Gained", value = clip(signedLines(list, "gained"), 1024), inline = false },
                { name = "Gained in 1 Hour", value = clip(signedLines(list, "hour"), 1024), inline = false },
                { name = "Gained in 1 Day", value = clip(signedLines(list, "day"), 1024), inline = false },
                { name = "Totals", value = clip(totalsText(list), 1024), inline = false },
            },
            footer = { text = NOTIFY_NAME .. " - " .. Config.HubName },
            timestamp = os.date("!%Y-%m-%dT%H:%M:%SZ"),
        }
    end

    local function postHook(url, embed)
        local request = Logger.getRequest()
        if not request or not isValidHook(url) then
            return false
        end

        local encodeOk, body = pcall(function()
            return HttpService:JSONEncode({
                username = NOTIFY_NAME,
                embeds = { embed },
            })
        end)
        if not encodeOk then
            return false
        end

        local ok, response = pcall(request, {
            Url = url,
            Method = "POST",
            Headers = { ["Content-Type"] = "application/json" },
            Body = body,
        })
        if not ok then
            return false
        end

        if type(response) == "table" then
            local code = tonumber(response.StatusCode or response.Status)
            return code ~= nil and code >= 200 and code < 300
        end
        return true
    end

    Data:Section({ Title = L("dt_webhook_section") })

    local WebhookInput = Data:Input({
        Title = L("bw_input"),
        Placeholder = "https://discord.com/api/webhooks/...",
        Value = "",
        Callback = function(text)
            local clean = tostring(text or ""):gsub("%s+", "")
            webhookUrl = clean
        end,
    })
    Util.register("data_webhook_url", WebhookInput)

    Data:Button({
        Title = L("dt_send"),
        Desc = L("dt_send_desc"),
        Icon = "send",
        Callback = function()
            if not Logger.getRequest() then
                Util.notify(L("dt_webhook_section"), L("bw_no_http"), "triangle-alert")
                return
            end
            if not isValidHook(webhookUrl) then
                Util.notify(L("dt_webhook_section"), L("bw_invalid"), "triangle-alert")
                return
            end

            task.spawn(function()
                local ok, embed = pcall(buildEmbed)
                local sent = ok and postHook(webhookUrl, embed)
                if sent then
                    Util.notify(L("dt_webhook_section"), L("st_hook_sent"), "check")
                else
                    Util.notify(L("dt_webhook_section"), L("st_hook_failed"), "triangle-alert")
                end
            end)
        end,
    })
end

do
    local Stats = Tabs.Stats

    local Spy = {
        selectedName = "",
        lastText = "",
        connections = {},
    }

    local SPY_UNITS = {
        { 1e33, "DC" },
        { 1e30, "NO" },
        { 1e27, "OC" },
        { 1e24, "SP" },
        { 1e21, "SX" },
        { 1e18, "QI" },
        { 1e15, "QA" },
        { 1e12, "T" },
        { 1e9, "B" },
        { 1e6, "M" },
        { 1e3, "K" },
    }

    local function formatSpy(value)
        value = tonumber(value) or 0

        local digits = string.format("%.0f", value)
        local grouped = digits:reverse():gsub("(%d%d%d)", "%1,")
        grouped = grouped:reverse()
        grouped = grouped:gsub("^,", "")

        if value < 1000 then
            return grouped
        end

        local short = tostring(math.floor(value))
        for _, unit in ipairs(SPY_UNITS) do
            if value >= unit[1] then
                short = string.format("%.2f", value / unit[1]):gsub("%.?0+$", "") .. unit[2]
                break
            end
        end

        return grouped .. " [" .. short .. "]"
    end

    local function buildPlayerList()
        local list = {}
        for _, player in ipairs(Players:GetPlayers()) do
            table.insert(list, player.Name .. " - " .. player.DisplayName)
        end
        return list
    end

    local PlayerDropdown = Stats:Dropdown({
        Title = L("st_select_player"),
        Values = buildPlayerList(),
        Value = nil,
        SearchBarEnabled = true,
        AllowNone = true,
        Callback = function(option)
            if type(option) == "string" and option ~= "" then
                Spy.selectedName = option:match("^(%S+)") or ""
            else
                Spy.selectedName = ""
            end
        end,
    })

    local function refreshPlayers()
        pcall(function()
            PlayerDropdown:Refresh(buildPlayerList())
        end)
    end

    table.insert(Spy.connections, Players.PlayerAdded:Connect(refreshPlayers))
    table.insert(Spy.connections, Players.PlayerRemoving:Connect(function(player)
        if player.Name == Spy.selectedName then
            Spy.selectedName = ""
        end
        task.delay(0.5, refreshPlayers)
    end))

    local spyFields = {
        { obj = "Strength", label = "st_strength", leader = true },
        { obj = "Gems", label = "st_gems" },
        { obj = "Agility", label = "st_agility" },
        { obj = "Rebirths", label = "st_rebirths", leader = true },
        { obj = "Durability", label = "st_durability" },
        { obj = "Kills", label = "st_kills", leader = true },
        { obj = "muscleKingTime", label = "st_mk_time" },
        { obj = "currentMap", label = "st_map", raw = true },
        { obj = "evilKarma", label = "st_evil" },
        { obj = "goodKarma", label = "st_good" },
    }

    local function countPets(entity, a, b)
        local pets = entity and entity:FindFirstChild("equippedPets")
        if not pets then
            return 0
        end

        local count = 0
        for _, slot in ipairs(pets:GetChildren()) do
            local pet = slot:IsA("ObjectValue") and slot.Value
            local name = pet and pet.Name:lower()
            if name and name:match(a) and name:match(b) then
                count = count + 1
            end
        end
        return count
    end

    local function getPlayerHealth(entity)
        local character = entity and entity.Character
        local humanoid = character and character:FindFirstChildOfClass("Humanoid")
        return humanoid and humanoid.MaxHealth or 0
    end

    local function getMyDamage()
        local leaderstats = LocalPlayer:FindFirstChild("leaderstats")
        local strength = leaderstats and leaderstats:FindFirstChild("Strength")
        if not strength then
            return 0
        end
        return strength.Value * 0.1 * (1 + countPets(LocalPlayer, "wild", "wizard") / 3)
    end

    local function hitsToKill(health, damage)
        if damage <= 0 then
            return "∞"
        end
        local hits = math.ceil(health / damage)
        if hits > 50 then
            return "∞"
        end
        return tostring(math.max(hits, 1))
    end

    local function buildText()
        local selected = Spy.selectedName
        local target = nil
        if selected ~= "" then
            target = Players:FindFirstChild(selected)
        end

        local lines = {}

        for _, field in ipairs(spyFields) do
            local value

            if selected == "" then
                value = field.raw and "N/A" or "0"
            elseif not target then
                value = L("st_not_found")
            else
                local source = target
                if field.leader then
                    source = target:FindFirstChild("leaderstats")
                end

                local object = source and source:FindFirstChild(field.obj)
                if not object then
                    value = field.raw and L("st_no_data") or "N/A"
                elseif field.raw then
                    value = tostring(object.Value)
                else
                    value = formatSpy(object.Value)
                end
            end

            table.insert(lines, L(field.label) .. ": " .. value)
        end

        local enemyHealth, yourDamage, hits = "N/A", "N/A", "N/A"
        if target then
            local health = getPlayerHealth(target)
            local damage = getMyDamage()
            enemyHealth = formatSpy(health)
            yourDamage = formatSpy(damage)
            hits = hitsToKill(health, damage)
        end

        table.insert(lines, "")
        table.insert(lines, L("st_advanced"))
        table.insert(lines, L("st_enemy_health") .. ": " .. enemyHealth)
        table.insert(lines, L("st_your_damage") .. ": " .. yourDamage)
        table.insert(lines, L("st_hits") .. ": " .. hits)

        return table.concat(lines, "\n")
    end

    local SpyParagraph = Stats:Paragraph({
        Title = L("st_player_stats"),
        Desc = L("home_loading"),
    })

    task.spawn(function()
        while isAlive() do
            local ok, text = pcall(buildText)
            if ok and text ~= Spy.lastText then
                Spy.lastText = text
                pcall(function()
                    SpyParagraph:SetDesc(text)
                end)
            end
            task.wait(0.25)
        end
    end)

    local Fake = {
        records = {},
        originals = setmetatable({}, { __mode = "k" }),
        applying = false,
        presenting = false,
        inputs = {},
    }

    local fakeDefinitions = {
        { key = "Strength", names = { "Strength", "Fuerza" }, title = "st_strength" },
        { key = "Rebirths", names = { "Rebirths", "Rebirth" }, title = "st_rebirths" },
        { key = "Kills", names = { "Kills" }, title = "st_kills" },
        { key = "Fights", names = { "Brawls", "Fights", "Fight" }, title = "st_brawls" },
        { key = "Durability", names = { "Durability", "Durabilidad" }, title = "st_durability" },
        { key = "Gems", names = { "Gems", "Gemas" }, title = "st_gems" },
    }

    local FAKE_MULTIPLIERS = {
        K = 1e3,
        M = 1e6,
        B = 1e9,
        T = 1e12,
        QA = 1e15,
        QI = 1e18,
        SX = 1e21,
        SP = 1e24,
        OC = 1e27,
        NO = 1e30,
        DC = 1e33,
    }

    local FAKE_UNITS = {
        { 1e33, "DC" },
        { 1e30, "NO" },
        { 1e27, "OC" },
        { 1e24, "SP" },
        { 1e21, "SX" },
        { 1e18, "QI" },
        { 1e15, "QA" },
        { 1e12, "T" },
        { 1e9, "B" },
        { 1e6, "M" },
        { 1e3, "K" },
    }

    local function parseFakeNumber(text)
        text = tostring(text or ""):upper():gsub("%s+", "")

        local number, suffix = text:match("^([%d%.]+)(%a*)$")
        number = tonumber(number)
        if not number or number < 0 or number ~= number then
            return nil
        end

        local multiplier = 1
        if suffix ~= "" then
            multiplier = FAKE_MULTIPLIERS[suffix]
        end
        if not multiplier then
            return nil
        end

        return math.floor(number * multiplier + 0.5)
    end

    local function formatFakeNumber(value)
        value = tonumber(value) or 0

        for _, unit in ipairs(FAKE_UNITS) do
            if value >= unit[1] then
                local n = value / unit[1]
                local pattern = "%.2f%s"
                if n >= 100 then
                    pattern = "%.0f%s"
                elseif n >= 10 then
                    pattern = "%.1f%s"
                end
                return string.format(pattern, n, unit[2])
            end
        end

        return string.format("%.0f", value)
    end

    local function findFakeStat(names)
        local leaderstats = LocalPlayer:FindFirstChild("leaderstats")

        for _, name in ipairs(names) do
            local stat = leaderstats and leaderstats:FindFirstChild(name)
            if stat and (stat:IsA("IntValue") or stat:IsA("NumberValue")) then
                return stat
            end
        end

        for _, name in ipairs(names) do
            local stat = LocalPlayer:FindFirstChild(name)
            if stat and (stat:IsA("IntValue") or stat:IsA("NumberValue")) then
                return stat
            end
        end

        return nil
    end

    local function captureLabels(key, record)
        local playerGui = LocalPlayer:FindFirstChild("PlayerGui")
        local gameGui = playerGui and playerGui:FindFirstChild("gameGui")
        if not gameGui then
            return
        end

        local currencyRoot = gameGui:FindFirstChild("currencyFrameGui")
        local currency = currencyRoot and currencyRoot:FindFirstChild("currencyFrame")
        local statsMenu = gameGui:FindFirstChild("statsMenu")
        local statsList = statsMenu and statsMenu:FindFirstChild("statsList")
        local bottom = statsMenu and statsMenu:FindFirstChild("bottomStatList")
        local hud = gameGui:FindFirstChild("hudNewMenu")
        local top = hud and hud:FindFirstChild("Top")
        local slots = top and top:FindFirstChild("InfoSlots")

        local specs = {
            Strength = {
                { statsList, "strengthFrame", "amountLabel" },
                { currency, "strengthFrame", "amountLabel" },
                { slots, "StrengthSlot", "Amnt" },
            },
            Gems = {
                { currency, "gemsFrame", "amountLabel" },
                { slots, "GemSlot", "Amnt" },
            },
            Rebirths = { { bottom, "rebirthsFrame", "statLabel" } },
            Fights = { { bottom, "brawlsFrame", "statLabel" } },
            Kills = { { bottom, "killsFrame", "statLabel" } },
            Durability = {
                { statsList, "durabilityFrame", "amountLabel" },
                { currency, "durabilityFrame", "amountLabel" },
                { slots, "DurabilitySlot", "Amnt" },
            },
        }

        for _, spec in ipairs(specs[key] or {}) do
            local holder = spec[1] and spec[1]:FindFirstChild(spec[2])
            local label = holder and holder:FindFirstChild(spec[3])

            if label and label:IsA("TextLabel") then
                if not Fake.originals[label] then
                    Fake.originals[label] = {
                        Text = label.Text,
                        TextTransparency = label.TextTransparency,
                        TextStrokeTransparency = label.TextStrokeTransparency,
                    }
                end
                if not table.find(record.labels, label) then
                    table.insert(record.labels, label)
                end
            end
        end
    end

    local function restoreLabel(label)
        local original = Fake.originals[label]
        if label and label.Parent and original then
            label.Text = original.Text
            label.TextTransparency = original.TextTransparency
            label.TextStrokeTransparency = original.TextStrokeTransparency
        end
        Fake.originals[label] = nil
    end

    local function applyLabels()
        for key, record in pairs(Fake.records) do
            local text = formatFakeNumber(record.value)

            if key == "Fights" then
                text = "Brawls - " .. text
            elseif key == "Kills" then
                text = "KOs - " .. text
            elseif key == "Rebirths" then
                text = "Rebirths - " .. text
            end

            for _, label in ipairs(record.labels) do
                if label and label.Parent then
                    label.Text = text
                end
            end
        end
    end

    local function startPresentation()
        if Fake.presenting then
            return
        end
        Fake.presenting = true

        task.spawn(function()
            while isAlive() and next(Fake.records) ~= nil do
                if not Fake.applying then
                    for key, record in pairs(Fake.records) do
                        captureLabels(key, record)
                    end
                    applyLabels()
                end
                task.wait(0.5)
            end
            Fake.presenting = false
        end)
    end

    local function clearStat(key)
        local record = Fake.records[key]
        if not record then
            return
        end
        Fake.records[key] = nil

        if record.connection then
            record.connection:Disconnect()
        end

        if record.object and record.object.Parent then
            Fake.applying = true
            pcall(function()
                record.object.Value = record.realValue
            end)
            Fake.applying = false
        end

        for _, label in ipairs(record.labels) do
            restoreLabel(label)
        end
    end

    local function changeStat(definition, text)
        if not text or tostring(text):match("^%s*$") then
            clearStat(definition.key)
            return
        end

        local value = parseFakeNumber(text)
        local stat = findFakeStat(definition.names)
        if not value or not stat then
            Util.notify(L("error"), L("st_fake_invalid"), "triangle-alert")
            return
        end

        clearStat(definition.key)

        local record = {
            object = stat,
            realValue = stat.Value,
            value = value,
            labels = {},
        }
        Fake.records[definition.key] = record

        captureLabels(definition.key, record)

        record.connection = stat:GetPropertyChangedSignal("Value"):Connect(function()
            if Fake.applying or not isAlive() or Fake.records[definition.key] ~= record then
                return
            end
            if stat.Value ~= value then
                record.realValue = stat.Value
                Fake.applying = true
                pcall(function()
                    stat.Value = value
                end)
                Fake.applying = false
            end
        end)

        Fake.applying = true
        pcall(function()
            stat.Value = value
        end)
        Fake.applying = false

        applyLabels()
        startPresentation()
    end

    local function restoreAll()
        for key in pairs(Fake.records) do
            clearStat(key)
        end
        for label in pairs(Fake.originals) do
            restoreLabel(label)
        end
    end

    Stats:Section({ Title = L("st_fake_section") })

    Stats:Paragraph({
        Title = L("st_fake_title"),
        Desc = L("st_fake_desc"),
    })

    for _, definition in ipairs(fakeDefinitions) do
        Fake.inputs[definition.key] = Stats:Input({
            Title = L(definition.title),
            Placeholder = "",
            Value = "",
            Callback = function(text)
                changeStat(definition, text)
            end,
        })
    end

    Stats:Button({
        Title = L("st_fake_restore"),
        Icon = "rotate-ccw",
        Callback = function()
            restoreAll()
            for _, input in pairs(Fake.inputs) do
                pcall(function()
                    input:Set("")
                end)
            end
            Util.notify(L("st_fake_title"), L("st_fake_restored"), "check")
        end,
    })

    task.spawn(function()
        while isAlive() do
            task.wait(1)
        end
        for _, connection in ipairs(Spy.connections) do
            pcall(function()
                connection:Disconnect()
            end)
        end
        pcall(restoreAll)
    end)

    local NOTIFY_COLOR = 0x170158
    local NOTIFY_NAME = "Mystery Notification"
    local NOTIFY_IMAGE = "https://raw.githubusercontent.com/Mystery-Center/Mystery-Media/main/Mystery%20Notificaciones%20Imagen.png"

    local hubStart = os.clock()

    local hookHosts = {
        ["discord.com"] = true,
        ["discordapp.com"] = true,
        ["ptb.discord.com"] = true,
        ["canary.discord.com"] = true,
    }

    local function isValidHook(url)
        if type(url) ~= "string" then
            return false
        end
        local host = url:match("^https://([%w%.]+)/api/webhooks/%d+/[%w_%-]+$")
        return host ~= nil and hookHosts[host] == true
    end

    local function clip(text, limit)
        text = tostring(text)
        if #text > limit then
            return string.sub(text, 1, limit - 3) .. "..."
        end
        return text
    end

    local function shortNumber(value)
        value = tonumber(value) or 0
        for _, unit in ipairs(SPY_UNITS) do
            if value >= unit[1] then
                return string.format("%.2f%s", value / unit[1], unit[2])
            end
        end
        return string.format("%.0f", value)
    end

    local avatarCache = nil

    local function getAvatarUrl()
        if not avatarCache then
            avatarCache = Logger.getAvatar(LocalPlayer.UserId)
        end
        return avatarCache
    end

    local function postHook(url, embed)
        local request = Logger.getRequest()
        if not request or not isValidHook(url) then
            return false
        end

        local encodeOk, body = pcall(function()
            return HttpService:JSONEncode({
                username = NOTIFY_NAME,
                embeds = { embed },
            })
        end)
        if not encodeOk then
            return false
        end

        local ok, response = pcall(request, {
            Url = url,
            Method = "POST",
            Headers = { ["Content-Type"] = "application/json" },
            Body = body,
        })
        if not ok then
            return false
        end

        if type(response) == "table" then
            local code = tonumber(response.StatusCode or response.Status)
            return code ~= nil and code >= 200 and code < 300
        end
        return true
    end

    local reportFields = {
        { names = { "Strength", "Fuerza" }, name = "Strength", track = true },
        { names = { "Durability", "Durabilidad" }, name = "Durability", track = true },
        { names = { "Gems", "Gemas" }, name = "Gems", track = true },
        { names = { "Agility" }, name = "Agility", track = true },
        { names = { "Rebirths", "Rebirth" }, name = "Rebirths", track = true },
        { names = { "Kills" }, name = "Kills", track = true },
        { names = { "Brawls", "Fights", "Fight" }, name = "Brawls", track = true },
        { names = { "muscleKingTime" }, name = "Muscle King Time" },
        { names = { "evilKarma" }, name = "Evil Karma" },
        { names = { "goodKarma" }, name = "Good Karma" },
    }

    local function readReal(object)
        for _, record in pairs(Fake.records) do
            if record.object == object then
                return tonumber(record.realValue) or 0
            end
        end
        return tonumber(object.Value) or 0
    end
    Util.getRealValue = readReal

    local function collectStats()
        local list = {}
        for _, field in ipairs(reportFields) do
            local object = findFakeStat(field.names)
            if object then
                table.insert(list, {
                    name = field.name,
                    value = readReal(object),
                    track = field.track,
                })
            end
        end
        return list
    end

    local function statsText(list)
        local lines = {}
        for _, stat in ipairs(list) do
            table.insert(lines, "**" .. stat.name .. ":** " .. formatSpy(stat.value))
        end
        local map = LocalPlayer:FindFirstChild("currentMap")
        if map then
            table.insert(lines, "**Current Map:** " .. tostring(map.Value))
        end
        return table.concat(lines, "\n")
    end

    local function petsText()
        local pets = LocalPlayer:FindFirstChild("equippedPets")
        if not pets then
            return nil
        end

        local counts = {}
        local order = {}
        for _, pet in ipairs(pets:GetChildren()) do
            local target = pet:IsA("ObjectValue") and pet.Value
            local name = target and target.Name or pet.Name
            if not counts[name] then
                counts[name] = 0
                table.insert(order, name)
            end
            counts[name] = counts[name] + 1
        end

        if #order == 0 then
            return nil
        end

        table.sort(order)
        local lines = {}
        for _, name in ipairs(order) do
            table.insert(lines, "• " .. name .. " x" .. counts[name])
        end
        return table.concat(lines, "\n")
    end

    local function playerText()
        local executor, version = Util.getExecutor("Unknown")
        local membership = LocalPlayer.MembershipType == Enum.MembershipType.Premium and "Premium" or "No Premium"
        local profile = "https://www.roblox.com/users/" .. LocalPlayer.UserId .. "/profile"

        return table.concat({
            "**Username:** [`" .. LocalPlayer.Name .. "`](" .. profile .. ")",
            "**Display Name:** " .. LocalPlayer.DisplayName,
            "**User ID:** `" .. LocalPlayer.UserId .. "`",
            "**Account Age:** " .. Logger.formatAge(LocalPlayer.AccountAge),
            "**Membership:** " .. membership,
            "**Platform:** " .. Logger.getPlatform(),
            "**Executor:** " .. executor .. " (" .. version .. ")",
        }, "\n")
    end

    local function serverText()
        local jobId = tostring(game.JobId)
        local joinUrl = "https://www.roblox.com/games/start?placeId=" .. game.PlaceId
            .. "&gameInstanceId=" .. jobId

        return table.concat({
            "Players: " .. #Players:GetPlayers() .. "/" .. Players.MaxPlayers,
            "Ping: " .. Util.getPing() .. " ms",
            "Memory: " .. math.floor(StatsService:GetTotalMemoryUsageMb()) .. " MB",
            "Place ID: " .. game.PlaceId,
            "Server ID: `" .. jobId .. "`",
            "[Click To Join](" .. joinUrl .. ")",
        }, "\n")
    end

    local function baseEmbed(title)
        return {
            title = title,
            color = NOTIFY_COLOR,
            image = { url = NOTIFY_IMAGE },
            thumbnail = { url = getAvatarUrl() },
            timestamp = os.date("!%Y-%m-%dT%H:%M:%SZ"),
        }
    end

    local function buildInfoEmbed()
        local embed = baseEmbed("Player Report")
        embed.footer = { text = NOTIFY_NAME .. " • " .. Config.HubName }

        local gameUrl = "https://www.roblox.com/games/" .. game.PlaceId
        local gameText = "[" .. Util.getGameName("Unknown") .. "](" .. gameUrl .. ")\nGame ID: " .. game.GameId

        embed.fields = {
            { name = "Player Info", value = clip(playerText(), 1024), inline = false },
            { name = "Stats", value = clip(statsText(collectStats()), 1024), inline = false },
        }

        local pets = petsText()
        if pets then
            table.insert(embed.fields, { name = "Equipped Pets", value = clip(pets, 1024), inline = false })
        end

        table.insert(embed.fields, { name = "Game", value = clip(gameText, 1024), inline = false })
        table.insert(embed.fields, { name = "Server", value = clip(serverText(), 1024), inline = false })

        return embed
    end

    local Notify = {
        url = "",
        minutes = 0,
        enabled = false,
        generation = 0,
        startTime = 0,
        sent = 0,
        gains = {},
        last = {},
    }

    local function sampleGains()
        for _, stat in ipairs(collectStats()) do
            if stat.track then
                local last = Notify.last[stat.name]
                if last ~= nil and stat.value > last then
                    Notify.gains[stat.name] = (Notify.gains[stat.name] or 0) + (stat.value - last)
                end
                Notify.last[stat.name] = stat.value
            end
        end
    end

    local function buildNotifyEmbed(isTest)
        local list = collectStats()
        local running = Notify.enabled
        local elapsed = 0
        if running then
            elapsed = os.clock() - Notify.startTime
        end

        local embed = baseEmbed(isTest and "Test Report" or "Farm Report")
        embed.description = "[`" .. LocalPlayer.Name .. "`](https://www.roblox.com/users/"
            .. LocalPlayer.UserId .. "/profile) • ID `" .. LocalPlayer.UserId .. "`"

        local footer = NOTIFY_NAME
        if not isTest then
            footer = footer .. " • Report #" .. Notify.sent
        end
        embed.footer = { text = footer }

        local timeLines = {
            "**Farming Time:** " .. (running and Util.formatTime(elapsed) or "Not running"),
            "**Hub Session:** " .. Util.formatTime(os.clock() - hubStart),
        }
        if running then
            table.insert(timeLines, "**Interval:** every " .. Notify.minutes .. " min")
        end

        local gainLines = {}
        local rateLines = {}
        if running then
            for _, stat in ipairs(list) do
                if stat.track then
                    local gained = Notify.gains[stat.name] or 0
                    table.insert(gainLines, "**" .. stat.name .. ":** +" .. shortNumber(gained))
                    if elapsed >= 60 and gained > 0 then
                        table.insert(
                            rateLines,
                            "**" .. stat.name .. ":** " .. shortNumber(gained / (elapsed / 3600)) .. "/h"
                        )
                    end
                end
            end
        end

        embed.fields = {
            { name = "Farm Time", value = clip(table.concat(timeLines, "\n"), 1024), inline = false },
            { name = "Stats", value = clip(statsText(list), 1024), inline = false },
        }

        if #gainLines > 0 then
            table.insert(embed.fields, { name = "Gained Since Start", value = clip(table.concat(gainLines, "\n"), 1024), inline = true })
        end
        if #rateLines > 0 then
            table.insert(embed.fields, { name = "Per Hour", value = clip(table.concat(rateLines, "\n"), 1024), inline = true })
        end

        local pets = petsText()
        if pets then
            table.insert(embed.fields, { name = "Equipped Pets", value = clip(pets, 1024), inline = false })
        end

        table.insert(embed.fields, { name = "Server", value = clip(serverText(), 1024), inline = false })

        return embed
    end

    local function sendWithNotice(url, builder, section)
        if not Logger.getRequest() then
            Util.notify(section, L("bw_no_http"), "triangle-alert")
            return
        end
        if not isValidHook(url) then
            Util.notify(section, L("bw_invalid"), "triangle-alert")
            return
        end

        task.spawn(function()
            local ok, embed = pcall(builder)
            local sent = ok and postHook(url, embed)
            if sent then
                Util.notify(section, L("st_hook_sent"), "check")
            else
                Util.notify(section, L("st_hook_failed"), "triangle-alert")
            end
        end)
    end

    Stats:Section({ Title = L("st_info_section") })

    local infoUrl = ""

    local InfoUrlInput = Stats:Input({
        Title = L("bw_input"),
        Placeholder = "https://discord.com/api/webhooks/...",
        Value = "",
        Callback = function(text)
            local clean = tostring(text or ""):gsub("%s+", "")
            infoUrl = clean
        end,
    })
    Util.register("stats_info_webhook_url", InfoUrlInput)

    Stats:Button({
        Title = L("st_info_send"),
        Desc = L("st_info_send_desc"),
        Icon = "send",
        Callback = function()
            sendWithNotice(infoUrl, buildInfoEmbed, L("st_info_section"))
        end,
    })

    Stats:Section({ Title = L("st_notify_section") })

    local NotifyUrlInput = Stats:Input({
        Title = L("bw_input"),
        Placeholder = "https://discord.com/api/webhooks/...",
        Value = "",
        Callback = function(text)
            local clean = tostring(text or ""):gsub("%s+", "")
            Notify.url = clean
        end,
    })
    Util.register("stats_notify_webhook_url", NotifyUrlInput)

    local NotifyMinutesInput = Stats:Input({
        Title = L("st_notify_minutes"),
        Placeholder = "10",
        Value = "",
        Callback = function(text)
            local n = tonumber(text)
            if n and n > 0 then
                Notify.minutes = math.clamp(n, 1, 1440)
            end
        end,
    })
    Util.register("stats_notify_minutes", NotifyMinutesInput)

    local NotifyToggle

    local function rejectNotify(message)
        Notify.enabled = false
        Util.notify(L("st_notify_section"), message, "triangle-alert")
        task.defer(function()
            pcall(function()
                NotifyToggle:Set(false)
            end)
        end)
    end

    local function startNotify()
        Notify.generation = Notify.generation + 1
        local generation = Notify.generation

        Notify.startTime = os.clock()
        Notify.sent = 0
        Notify.gains = {}
        Notify.last = {}

        task.spawn(function()
            local lastSent = os.clock()

            while Notify.enabled and isAlive() and Notify.generation == generation do
                pcall(sampleGains)

                if os.clock() - lastSent >= Notify.minutes * 60 then
                    lastSent = os.clock()
                    Notify.sent = Notify.sent + 1

                    task.spawn(function()
                        local ok, embed = pcall(buildNotifyEmbed, false)
                        if not (ok and postHook(Notify.url, embed)) then
                            Util.notify(L("st_notify_section"), L("st_hook_failed"), "triangle-alert")
                        end
                    end)
                end

                task.wait(1)
            end
        end)
    end

    NotifyToggle = Stats:Toggle({
        Title = L("st_notify_toggle"),
        Desc = L("st_notify_toggle_desc"),
        Value = false,
        Callback = function(state)
            if not state then
                if Notify.enabled then
                    Notify.enabled = false
                    Notify.generation = Notify.generation + 1
                    Util.notify(L("st_notify_section"), L("st_notify_stopped"), "check")
                end
                return
            end

            if not Logger.getRequest() then
                rejectNotify(L("bw_no_http"))
            elseif not isValidHook(Notify.url) then
                rejectNotify(L("bw_invalid"))
            elseif Notify.minutes < 1 then
                rejectNotify(L("st_notify_need_minutes"))
            else
                Notify.enabled = true
                startNotify()
                Util.notify(L("st_notify_section"), L("st_notify_started", Notify.minutes), "check")
            end
        end,
    })

    Stats:Button({
        Title = L("st_notify_test"),
        Icon = "send",
        Callback = function()
            sendWithNotice(Notify.url, function()
                return buildNotifyEmbed(true)
            end, L("st_notify_section"))
        end,
    })
end

do
    local Killer = Tabs.Killer

    local function disconnectList(list)
        for _, connection in ipairs(list) do
            pcall(function()
                connection:Disconnect()
            end)
        end
        table.clear(list)
    end

    local function hasWord(text, words)
        for i = 1, #words do
            if string.find(text, words[i], 1, true) then
                return true
            end
        end
        return false
    end

    local function getHumanoid()
        local character = LocalPlayer.Character
        return character and character:FindFirstChildOfClass("Humanoid")
    end

    Killer:Section({ Title = L("kl_misc_section") })

    local equipBusy = false

    local function equipBestStatPets(priority)
        if equipBusy then
            return
        end
        equipBusy = true

        task.spawn(function()
            pcall(function()
                local folder = LocalPlayer:FindFirstChild("petsFolder")
                local events = ReplicatedStorage:FindFirstChild("rEvents")
                local equipEvent = events and events:FindFirstChild("equipPetEvent")
                if not folder or not equipEvent then
                    return
                end

                local petsByName = {}
                for _, name in ipairs(priority) do
                    petsByName[name] = {}
                end

                for _, group in ipairs(folder:GetChildren()) do
                    if group:IsA("Folder") then
                        for _, pet in ipairs(group:GetChildren()) do
                            equipEvent:FireServer("unequipPet", pet)
                            local pool = petsByName[pet.Name]
                            if pool then
                                pool[#pool + 1] = pet
                            end
                        end
                    end
                end

                task.wait(0.2)

                local equipped = 0
                for _, name in ipairs(priority) do
                    for _, pet in ipairs(petsByName[name]) do
                        if equipped >= 9 or not isAlive() then
                            return
                        end
                        equipEvent:FireServer("equipPet", pet)
                        equipped = equipped + 1
                        task.wait(0.1)
                    end
                end
            end)
            equipBusy = false
        end)
    end

    Killer:Button({
        Title = L("kl_equip_damage"),
        Icon = "swords",
        Callback = function()
            equipBestStatPets({ "Wild Wizard", "Chaos Sorcerer", "Mighty Monster", "Small Fry" })
        end,
    })

    Killer:Button({
        Title = L("kl_equip_health"),
        Icon = "heart",
        Callback = function()
            equipBestStatPets({ "Mighty Monster", "Small Fry", "Wild Wizard", "Chaos Sorcerer" })
        end,
    })

    local BLOCKED_IDS = {
        ["3638729053"] = true,
        ["3638767427"] = true,
        ["507768375"] = true,
        ["522635514"] = true,
        ["522638767"] = true,
        ["182393478"] = true,
        ["129967390"] = true,
        ["129967478"] = true,
    }

    local BLOCKED_WORDS = { "punch", "attack", "right", "equip", "tool", "hold" }
    local MOVEMENT_WORDS = { "idle", "walk", "run", "jump", "fall", "climb", "swim", "sit" }
    local TOOL_WORDS = { "tool", "punch", "attack", "equip", "hold" }
    local ATTACK_TOOL_WORDS = { "punch", "attack", "right" }

    local ACTION_PRIORITIES = {
        [Enum.AnimationPriority.Action] = true,
        [Enum.AnimationPriority.Action2] = true,
        [Enum.AnimationPriority.Action3] = true,
        [Enum.AnimationPriority.Action4] = true,
    }

    local blockCache = setmetatable({}, { __mode = "k" })
    local movementCache = setmetatable({}, { __mode = "k" })

    local Anim = {
        enabled = false,
        conns = {},
        charConns = {},
        toolConns = {},
        hasAttackTool = false,
    }

    local function shouldBlock(track)
        local animation = track and track.Animation
        if not animation then
            return false
        end

        local cached = blockCache[animation]
        if cached ~= nil then
            return cached
        end

        local id = tostring(animation.AnimationId):match("%d+")
        local name = string.lower(track.Name .. " " .. animation.Name)
        local result = (id ~= nil and BLOCKED_IDS[id] == true) or hasWord(name, BLOCKED_WORDS)
        blockCache[animation] = result
        return result
    end

    local function isMovementAnimation(track, character)
        local animation = track and track.Animation
        if not animation then
            return false
        end

        local cached = movementCache[animation]
        if cached ~= nil then
            return cached
        end

        local animate = character and character:FindFirstChild("Animate")
        if not animate or not animation:IsDescendantOf(animate) then
            movementCache[animation] = false
            return false
        end

        local path = ""
        local current = animation
        while current and current ~= animate.Parent do
            path = path .. " " .. string.lower(current.Name)
            if current == animate then
                break
            end
            current = current.Parent
        end

        local result = not hasWord(path, TOOL_WORDS) and hasWord(path, MOVEMENT_WORDS)
        movementCache[animation] = result
        return result
    end

    local function isAttackTool(tool)
        return tool ~= nil
            and tool:IsA("Tool")
            and hasWord(string.lower(tool.Name), ATTACK_TOOL_WORDS)
    end

    local function refreshAttackTool(character)
        Anim.hasAttackTool = false
        if not character then
            return
        end
        for _, child in ipairs(character:GetChildren()) do
            if isAttackTool(child) then
                Anim.hasAttackTool = true
                return
            end
        end
    end

    local function stopTracks(character, aggressive)
        local humanoid = character and character:FindFirstChildOfClass("Humanoid")
        if not humanoid then
            return
        end

        for _, track in ipairs(humanoid:GetPlayingAnimationTracks()) do
            if shouldBlock(track) then
                track:Stop(0)
            elseif aggressive
                and (not isMovementAnimation(track, character) or ACTION_PRIORITIES[track.Priority]) then
                track:Stop(0)
            end
        end
    end

    local function processTool(tool)
        if not isAttackTool(tool) or Anim.toolConns[tool] then
            return
        end

        Anim.toolConns[tool] = {
            tool.Activated:Connect(function()
                task.delay(0.05, function()
                    if Anim.enabled then
                        stopTracks(LocalPlayer.Character, false)
                    end
                end)
            end),
            tool.Equipped:Connect(function()
                for _, delayTime in ipairs({ 0, 0.03, 0.08, 0.15, 0.25 }) do
                    task.delay(delayTime, function()
                        if Anim.enabled then
                            stopTracks(LocalPlayer.Character, true)
                        end
                    end)
                end
            end),
        }
    end

    local function setupCharacter()
        disconnectList(Anim.charConns)

        local character = LocalPlayer.Character
        local humanoid = character and character:FindFirstChildOfClass("Humanoid")
        if not character or not humanoid then
            return
        end

        stopTracks(character, Anim.hasAttackTool)

        table.insert(Anim.charConns, humanoid.AnimationPlayed:Connect(function(track)
            if shouldBlock(track)
                or (Anim.hasAttackTool and not isMovementAnimation(track, character)) then
                track:Stop(0)
            end
        end))

        local backpack = LocalPlayer:FindFirstChild("Backpack")
        if backpack then
            for _, tool in ipairs(backpack:GetChildren()) do
                processTool(tool)
            end
            table.insert(Anim.charConns, backpack.ChildAdded:Connect(function(child)
                if child:IsA("Tool") then
                    processTool(child)
                end
            end))
        end

        for _, tool in ipairs(character:GetChildren()) do
            if tool:IsA("Tool") then
                processTool(tool)
            end
        end

        refreshAttackTool(character)

        table.insert(Anim.charConns, character.ChildAdded:Connect(function(child)
            if child:IsA("Tool") then
                processTool(child)
                refreshAttackTool(character)
            end
        end))
        table.insert(Anim.charConns, character.ChildRemoved:Connect(function(child)
            if child:IsA("Tool") then
                refreshAttackTool(character)
            end
        end))
    end

    local function disableAnimBlock()
        Anim.enabled = false
        Anim.hasAttackTool = false
        disconnectList(Anim.conns)
        disconnectList(Anim.charConns)

        for tool, connections in pairs(Anim.toolConns) do
            for _, connection in ipairs(connections) do
                pcall(function()
                    connection:Disconnect()
                end)
            end
            Anim.toolConns[tool] = nil
        end
    end

    local function enableAnimBlock()
        Anim.enabled = true

        task.spawn(function()
            while Anim.enabled and isAlive() do
                stopTracks(LocalPlayer.Character, Anim.hasAttackTool)
                task.wait(0.15)
            end
        end)

        table.insert(Anim.conns, LocalPlayer.CharacterAdded:Connect(function()
            task.wait(1)
            if Anim.enabled and isAlive() then
                setupCharacter()
            end
        end))

        setupCharacter()
    end

    local RemoveAnimToggle = Killer:Toggle({
        Title = L("kl_remove_anims"),
        Desc = L("kl_remove_anims_desc"),
        Value = false,
        Callback = function(state)
            if state then
                if not Anim.enabled then
                    enableAnimBlock()
                end
            else
                disableAnimBlock()
            end
        end,
    })
    Util.register("killer_remove_anims", RemoveAnimToggle)

        local PackSpam = { enabled = false, gen = 0 }
    local PackSpamToggle

    PackSpamToggle = Killer:Toggle({
        Title = L("kl_packspam"),
        Desc = L("kl_packspam_desc"),
        Value = false,
        Callback = function(state)
            PackSpam.enabled = state
            PackSpam.gen = PackSpam.gen + 1
            local gen = PackSpam.gen
            if not state then
                return
            end

            task.spawn(function()
                local pets = LocalPlayer:FindFirstChild("petsFolder")
                local unique = pets and pets:FindFirstChild("Unique")
                local events = ReplicatedStorage:FindFirstChild("rEvents")
                local remote = events and events:FindFirstChild("equipPetEvent")

                if not pets or not unique or not remote then
                    PackSpam.enabled = false
                    task.defer(function()
                        pcall(function()
                            PackSpamToggle:Set(false)
                        end)
                    end)
                    return
                end

                local function active()
                    return PackSpam.enabled and isAlive() and PackSpam.gen == gen
                end

                while active() do
                    for _, group in ipairs(pets:GetChildren()) do
                        if group:IsA("Folder") then
                            for _, pet in ipairs(group:GetChildren()) do
                                pcall(remote.FireServer, remote, "unequipPet", pet)
                            end
                        end
                    end
                    task.wait()

                    local mighty = {}
                    for _, pet in ipairs(unique:GetChildren()) do
                        if pet.Name == "Mighty Monster" then
                            mighty[#mighty + 1] = pet
                        end
                    end

                    for i = 1, math.min(7, #mighty) do
                        if not active() then
                            break
                        end
                        pcall(remote.FireServer, remote, "equipPet", mighty[i])
                        task.wait()
                    end
                    task.wait()
                end
            end)
        end,
    })
    Util.register("killer_pack_spam", PackSpamToggle)

    local HP_FILL = Color3.fromRGB(88, 28, 135)
    local HP_BACK = Color3.fromRGB(24, 8, 40)
    local HP_UNITS = {
        { 1e12, "T" }, { 1e9, "B" }, { 1e6, "M" }, { 1e3, "K" },
    }

    local function formatHP(value)
        value = tonumber(value) or 0
        for _, unit in ipairs(HP_UNITS) do
            if value >= unit[1] then
                return string.format("%.1f%s", value / unit[1], unit[2])
            end
        end
        return string.format("%.0f", value)
    end

    local ShowHP = {
        enabled = false,
        conns = {},
        humConns = {},
        charConns = {},
    }

    local function removeHPBar(character)
        local old = character and character:FindFirstChild("MysteryHPBillboard", true)
        if old then
            old:Destroy()
        end
    end

    local function createHPBar(character)
        if not ShowHP.enabled or not character then
            return
        end

        local humanoid = character:WaitForChild("Humanoid", 5)
        local head = character:WaitForChild("Head", 5)
        if not humanoid or not head or not ShowHP.enabled then
            return
        end

        removeHPBar(character)

        local billboard = Instance.new("BillboardGui")
        billboard.Name = "MysteryHPBillboard"
        billboard.Size = UDim2.new(6, 0, 1.2, 0)
        billboard.StudsOffset = Vector3.new(0, 3.5, 0)
        billboard.AlwaysOnTop = true
        billboard.MaxDistance = 200
        billboard.Parent = head

        local back = Instance.new("Frame")
        back.BackgroundColor3 = HP_BACK
        back.BackgroundTransparency = 0.2
        back.BorderSizePixel = 0
        back.Size = UDim2.new(1, 0, 1, 0)
        back.Parent = billboard

        local bar = Instance.new("Frame")
        bar.BackgroundColor3 = HP_FILL
        bar.BorderSizePixel = 0
        bar.Size = UDim2.new(1, 0, 1, 0)
        bar.Parent = back

        local label = Instance.new("TextLabel")
        label.BackgroundTransparency = 1
        label.Size = UDim2.new(1, 0, 1, 0)
        label.TextColor3 = Color3.new(1, 1, 1)
        label.Font = Enum.Font.SourceSansBold
        label.TextSize = 18
        label.TextStrokeTransparency = 0.5
        label.Parent = back

        local function update()
            if humanoid.Parent then
                local hp = humanoid.Health
                local max = math.max(humanoid.MaxHealth, 1)
                bar.Size = UDim2.new(math.clamp(hp / max, 0, 1), 0, 1, 0)
                label.Text = formatHP(hp) .. " / " .. formatHP(max)
            end
        end

        if ShowHP.humConns[humanoid] then
            ShowHP.humConns[humanoid]:Disconnect()
        end
        ShowHP.humConns[humanoid] = humanoid.HealthChanged:Connect(update)
        update()
    end

    local function hookHPPlayer(player)
        if player == LocalPlayer then
            return
        end
        if player.Character then
            task.spawn(createHPBar, player.Character)
        end
        if ShowHP.charConns[player] then
            ShowHP.charConns[player]:Disconnect()
        end
        ShowHP.charConns[player] = player.CharacterAdded:Connect(function(character)
            task.spawn(createHPBar, character)
        end)
    end

    local function stopHP()
        ShowHP.enabled = false
        disconnectList(ShowHP.conns)
        for _, connection in pairs(ShowHP.humConns) do
            pcall(function()
                connection:Disconnect()
            end)
        end
        table.clear(ShowHP.humConns)
        for _, connection in pairs(ShowHP.charConns) do
            pcall(function()
                connection:Disconnect()
            end)
        end
        table.clear(ShowHP.charConns)
        for _, player in ipairs(Players:GetPlayers()) do
            removeHPBar(player.Character)
        end
    end

    local function startHP()
        ShowHP.enabled = true
        for _, player in ipairs(Players:GetPlayers()) do
            hookHPPlayer(player)
        end
        table.insert(ShowHP.conns, Players.PlayerAdded:Connect(hookHPPlayer))
        table.insert(ShowHP.conns, Players.PlayerRemoving:Connect(function(player)
            if ShowHP.charConns[player] then
                ShowHP.charConns[player]:Disconnect()
                ShowHP.charConns[player] = nil
            end
        end))
    end

    local ShowHPToggle = Killer:Toggle({
        Title = L("kl_showhp"),
        Desc = L("kl_showhp_desc"),
        Value = false,
        Callback = function(state)
            if state then
                if not ShowHP.enabled then
                    startHP()
                end
            else
                stopHP()
            end
        end,
    })
    Util.register("killer_show_hp", ShowHPToggle)

    Killer:Section({ Title = L("kl_karma_section") })

    Killer:Paragraph({
        Title = L("kl_karma_info_title"),
        Desc = L("kl_karma_info"),
    })

    local KARMA_RED = Color3.fromRGB(255, 40, 40)
    local KARMA_BLUE = Color3.fromRGB(40, 120, 255)
    local MAX_HIGHLIGHTS = 30

    local Karma = {
        enabled = false,
        generation = 0,
        highlights = {},
        conns = {},
    }

    local function getKarmaKind(player)
        local goodObj = player:FindFirstChild("goodKarma")
        local evilObj = player:FindFirstChild("evilKarma")
        if not goodObj or not evilObj then
            return nil
        end

        local good = tonumber(goodObj.Value) or 0
        local evil = tonumber(evilObj.Value) or 0
        if good + evil < 5 then
            return nil
        end

        if good > evil then
            return "red"
        elseif evil > good then
            return "blue"
        end
        return nil
    end

    local function removeHighlight(player)
        local entry = Karma.highlights[player]
        if entry then
            pcall(function()
                entry.highlight:Destroy()
            end)
            Karma.highlights[player] = nil
        end
    end

    local function paintPlayer(player, character, kind)
        local entry = Karma.highlights[player]

        if entry and (not entry.highlight.Parent or entry.character ~= character) then
            removeHighlight(player)
            entry = nil
        end

        if not entry then
            local highlight = Instance.new("Highlight")
            highlight.Name = "MysteryKarmaHighlight"
            highlight.Adornee = character
            highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
            highlight.FillTransparency = 0.45
            highlight.OutlineTransparency = 0
            highlight.Parent = character
            entry = { highlight = highlight, character = character, kind = nil }
            Karma.highlights[player] = entry
        end

        if entry.kind ~= kind then
            entry.kind = kind
            local color = kind == "red" and KARMA_RED or KARMA_BLUE
            entry.highlight.FillColor = color
            entry.highlight.OutlineColor = color
        end
    end

    local function stopKarma()
        Karma.enabled = false
        Karma.generation = Karma.generation + 1
        disconnectList(Karma.conns)
        for player in pairs(Karma.highlights) do
            removeHighlight(player)
        end
    end

    local function karmaPass()
        local myRoot = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
        local candidates = {}
        local seen = {}

        for _, player in ipairs(Players:GetPlayers()) do
            if player ~= LocalPlayer then
                local character = player.Character
                local humanoid = character and character:FindFirstChildOfClass("Humanoid")
                local root = character and character:FindFirstChild("HumanoidRootPart")
                local kind = humanoid and humanoid.Health > 0 and root and getKarmaKind(player)

                if kind then
                    candidates[#candidates + 1] = {
                        player = player,
                        character = character,
                        kind = kind,
                        distance = myRoot and (root.Position - myRoot.Position).Magnitude or 0,
                    }
                end
            end
        end

        if #candidates > MAX_HIGHLIGHTS then
            table.sort(candidates, function(a, b)
                return a.distance < b.distance
            end)
        end

        for i = 1, math.min(#candidates, MAX_HIGHLIGHTS) do
            local item = candidates[i]
            seen[item.player] = true
            paintPlayer(item.player, item.character, item.kind)
        end

        for player in pairs(Karma.highlights) do
            if not seen[player] then
                removeHighlight(player)
            end
        end
    end

    local function startKarma()
        Karma.enabled = true
        Karma.generation = Karma.generation + 1
        local gen = Karma.generation

        table.insert(Karma.conns, Players.PlayerRemoving:Connect(removeHighlight))

        task.spawn(function()
            while Karma.enabled and isAlive() and Karma.generation == gen do
                pcall(karmaPass)
                task.wait(1)
            end
        end)
    end

    local KarmaToggle = Killer:Toggle({
        Title = L("kl_karma_paint"),
        Desc = L("kl_karma_paint_desc"),
        Value = false,
        Callback = function(state)
            if state then
                if not Karma.enabled then
                    startKarma()
                end
            else
                stopKarma()
            end
        end,
    })
    Util.register("killer_karma_paint", KarmaToggle)

    Killer:Section({ Title = L("kl_spec_section") })

    local Spec = {
        enabled = false,
        targetName = nil,
        labels = {},
        conns = {},
        gen = 0,
    }

    local function getCamera()
        return workspace.CurrentCamera
    end

    local function restoreCamera()
        local camera = getCamera()
        local humanoid = getHumanoid()
        if camera and humanoid then
            camera.CameraSubject = humanoid
            camera.CameraType = Enum.CameraType.Custom
        end
    end

    local function buildSpecList()
        Spec.labels = {}
        local list = {}
        for _, player in ipairs(Players:GetPlayers()) do
            if player ~= LocalPlayer then
                local label = player.DisplayName .. " - " .. player.Name
                Spec.labels[label] = player.Name
                list[#list + 1] = label
            end
        end
        table.sort(list)
        return list
    end

    local SpecToggle

    local function stopSpectate()
        Spec.enabled = false
        Spec.gen = Spec.gen + 1
        disconnectList(Spec.conns)
        restoreCamera()
    end

    local function turnOffToggle()
        task.defer(function()
            pcall(function()
                SpecToggle:Set(false)
            end)
        end)
    end

    local function applySpectate()
        local target = Spec.targetName and Players:FindFirstChild(Spec.targetName)
        local character = target and target.Character
        local humanoid = character and character:FindFirstChildOfClass("Humanoid")
        local camera = getCamera()

        if camera and humanoid and camera.CameraSubject ~= humanoid then
            camera.CameraSubject = humanoid
        end
    end

    local function startSpectate()
        Spec.enabled = true
        Spec.gen = Spec.gen + 1
        local gen = Spec.gen
        disconnectList(Spec.conns)

        local function hookCamera()
            local camera = getCamera()
            if camera then
                table.insert(Spec.conns, camera:GetPropertyChangedSignal("CameraSubject"):Connect(function()
                    if Spec.enabled then
                        task.defer(applySpectate)
                    end
                end))
            end
        end
        hookCamera()

        table.insert(Spec.conns, workspace:GetPropertyChangedSignal("CurrentCamera"):Connect(function()
            hookCamera()
            applySpectate()
        end))

        task.spawn(function()
            while Spec.enabled and isAlive() and Spec.gen == gen do
                applySpectate()
                task.wait(0.25)
            end
        end)

        applySpectate()
    end

    local SpecDropdown = Killer:Dropdown({
        Title = L("kl_spec_choose"),
        Values = buildSpecList(),
        Value = nil,
        SearchBarEnabled = true,
        AllowNone = true,
        Callback = function(option)
            if type(option) == "string" and option ~= "" then
                Spec.targetName = Spec.labels[option]
            else
                Spec.targetName = nil
            end
        end,
    })

    local function refreshSpecPlayers()
        local list = buildSpecList()
        pcall(function()
            SpecDropdown:Refresh(list)
        end)

        if Spec.targetName then
            for label, name in pairs(Spec.labels) do
                if name == Spec.targetName then
                    pcall(function()
                        SpecDropdown:Select(label)
                    end)
                    break
                end
            end
        end
    end

    local specPlayerConns = {}

    table.insert(specPlayerConns, Players.PlayerAdded:Connect(function()
        task.delay(0.5, refreshSpecPlayers)
    end))

    table.insert(specPlayerConns, Players.PlayerRemoving:Connect(function(player)
        if player.Name == Spec.targetName then
            Spec.targetName = nil
            if Spec.enabled then
                stopSpectate()
                Util.notify(L("kl_spec_section"), L("kl_spec_left"), "info")
                turnOffToggle()
            end
        end
        task.delay(0.5, refreshSpecPlayers)
    end))

    SpecToggle = Killer:Toggle({
        Title = L("kl_spec_toggle"),
        Desc = L("kl_spec_toggle_desc"),
        Value = false,
        Callback = function(state)
            if not state then
                stopSpectate()
                return
            end

            local target = Spec.targetName and Players:FindFirstChild(Spec.targetName)
            if not target then
                Util.notify(L("kl_spec_section"), L("kl_spec_need_player"), "triangle-alert")
                turnOffToggle()
                return
            end

            startSpectate()
        end,
    })

    Killer:Section({ Title = L("kl_def_section") })

    Killer:Paragraph({
        Title = L("kl_def_info_title"),
        Desc = L("kl_def_info"),
    })

    local Def = {
        spin = false,
        punch = false,
        alert = false,
        speed = 1800,
        spinConn = nil,
        charConn = nil,
        punchGen = 0,
        alertGen = 0,
        humanoid = nil,
        root = nil,
    }

    local function cacheCharacter(character)
        Def.humanoid = character and character:FindFirstChildOfClass("Humanoid")
        Def.root = character and character:FindFirstChild("HumanoidRootPart")
    end

    local function ensureCharacterCache()
        if Def.charConn then
            return
        end

        cacheCharacter(LocalPlayer.Character)

        Def.charConn = LocalPlayer.CharacterAdded:Connect(function(character)
            Def.humanoid = nil
            Def.root = nil
            local humanoid = character:WaitForChild("Humanoid", 5)
            local root = character:WaitForChild("HumanoidRootPart", 5)
            if character == LocalPlayer.Character then
                Def.humanoid = humanoid
                Def.root = root
            end
        end)
    end

    local function releaseCharacterCache()
        if Def.spin or Def.punch or Def.alert then
            return
        end
        if Def.charConn then
            Def.charConn:Disconnect()
            Def.charConn = nil
        end
        Def.humanoid = nil
        Def.root = nil
    end

    local function getDefChar()
        local humanoid, root = Def.humanoid, Def.root
        if humanoid and root and humanoid.Parent and root.Parent and humanoid.Health > 0 then
            return humanoid, root
        end
        return nil
    end

    local function stopSpin()
        Def.spin = false
        if Def.spinConn then
            Def.spinConn:Disconnect()
            Def.spinConn = nil
        end
        local humanoid = getHumanoid()
        if humanoid then
            humanoid.AutoRotate = true
        end
        releaseCharacterCache()
    end

    local function startSpin()
        Def.spin = true
        ensureCharacterCache()
        if Def.spinConn then
            Def.spinConn:Disconnect()
        end

        Def.spinConn = RunService.Heartbeat:Connect(function(dt)
            if not Def.spin or not isAlive() then
                return
            end
            local humanoid, root = getDefChar()
            if not root then
                return
            end
            if humanoid.AutoRotate then
                humanoid.AutoRotate = false
            end
            root.AssemblyAngularVelocity = Vector3.zero
            root.CFrame = root.CFrame * CFrame.Angles(0, math.rad(Def.speed * dt), 0)
        end)
    end

    Killer:Input({
        Title = L("kl_def_speed"),
        Placeholder = "1800",
        Value = "",
        Callback = function(text)
            local n = tonumber(text)
            if n then
                Def.speed = math.clamp(n, 360, 7200)
            end
        end,
    })

    local SpinToggle = Killer:Toggle({
        Title = L("kl_def_spin"),
        Desc = L("kl_def_spin_desc"),
        Value = false,
        Callback = function(state)
            if state then
                if not Def.spin then
                    startSpin()
                end
            else
                stopSpin()
            end
        end,
    })
    Util.register("killer_def_spin", SpinToggle)

    local function startPunch()
        Def.punchGen = Def.punchGen + 1
        local gen = Def.punchGen
        ensureCharacterCache()

        task.spawn(function()
            while Def.punch and isAlive() and Def.punchGen == gen do
                local humanoid = getDefChar()
                if humanoid then
                    local character = humanoid.Parent
                    local punch = character:FindFirstChild("Punch")

                    if not punch then
                        local backpack = LocalPlayer:FindFirstChild("Backpack")
                        punch = backpack and backpack:FindFirstChild("Punch")
                        if punch then
                            pcall(humanoid.EquipTool, humanoid, punch)
                        end
                    end

                    if punch then
                        local attackTime = punch:FindFirstChild("attackTime")
                        if attackTime and attackTime.Value ~= 0 then
                            attackTime.Value = 0
                        end

                        local event = LocalPlayer:FindFirstChild("muscleEvent")
                        if event then
                            pcall(event.FireServer, event, "punch", "rightHand")
                            pcall(event.FireServer, event, "punch", "leftHand")
                        end
                        if punch.Parent == character then
                            pcall(punch.Activate, punch)
                        end
                    end
                end
                task.wait(0.1)
            end
        end)
    end

    local PunchToggle = Killer:Toggle({
        Title = L("kl_def_punch"),
        Desc = L("kl_def_punch_desc"),
        Value = false,
        Callback = function(state)
            Def.punch = state
            Def.punchGen = Def.punchGen + 1
            if state then
                startPunch()
            else
                releaseCharacterCache()
            end
        end,
    })
    Util.register("killer_def_punch", PunchToggle)

    local function startAlert()
        Def.alertGen = Def.alertGen + 1
        local gen = Def.alertGen
        ensureCharacterCache()

        task.spawn(function()
            local last = {}
            local cooldown = {}

            while Def.alert and isAlive() and Def.alertGen == gen do
                local _, myRoot = getDefChar()

                if myRoot then
                    local myPosition = myRoot.Position

                    for _, player in ipairs(Players:GetPlayers()) do
                        if player ~= LocalPlayer then
                            local character = player.Character
                            local root = character and character:FindFirstChild("HumanoidRootPart")

                            if root then
                                local position = root.Position
                                local distance = (position - myPosition).Magnitude
                                local record = last[player]

                                if record then
                                    local moved = (position - record.pos).Magnitude
                                    if record.dist > 60 and distance < 25 and moved > 50
                                        and os.clock() - (cooldown[player] or 0) > 5 then
                                        cooldown[player] = os.clock()
                                        Util.notify(
                                            L("kl_def_section"),
                                            L("kl_def_alert_msg", player.DisplayName, player.Name),
                                            "triangle-alert"
                                        )
                                    end
                                    record.pos = position
                                    record.dist = distance
                                else
                                    last[player] = { pos = position, dist = distance }
                                end
                            else
                                last[player] = nil
                            end
                        end
                    end

                    for player in pairs(last) do
                        if not player.Parent then
                            last[player] = nil
                            cooldown[player] = nil
                        end
                    end
                end

                task.wait(0.2)
            end
        end)
    end

    local AlertToggle = Killer:Toggle({
        Title = L("kl_def_alert"),
        Desc = L("kl_def_alert_desc"),
        Value = false,
        Callback = function(state)
            Def.alert = state
            Def.alertGen = Def.alertGen + 1
            if state then
                startAlert()
            else
                releaseCharacterCache()
            end
        end,
    })
    Util.register("killer_def_alert", AlertToggle)

    task.spawn(function()
        while isAlive() do
            task.wait(1)
        end

        Def.punch = false
        Def.alert = false
        Def.punchGen = Def.punchGen + 1
        Def.alertGen = Def.alertGen + 1

        PackSpam.enabled = false
        PackSpam.gen = PackSpam.gen + 1

        pcall(disableAnimBlock)
        pcall(stopKarma)
        pcall(stopSpectate)
        pcall(stopSpin)
        pcall(stopHP)
        disconnectList(specPlayerConns)

        if Def.charConn then
            Def.charConn:Disconnect()
            Def.charConn = nil
        end
    end)
end

do
    local Teleport = Tabs.Teleport

    local workoutTypes = { "Bench Press", "Squat", "Deadlift", "Pull Up", "Boulder" }

    local locationOrder = {
        "Starter Island",
        "Legend Beach",
        "Frost Gym",
        "Mythical Gym",
        "Eternal Gym",
        "Legend Gym",
        "Muscle King Gym",
        "Jungle Gym",
    }

    local workoutPositions = {
        ["Bench Press"] = {
            ["Starter Island"] = CFrame.new(-17.0609932, 3.31417918, -2.48164988),
            ["Legend Beach"] = CFrame.new(470.334656, 3.31417966, -321.053925),
            ["Frost Gym"] = CFrame.new(-3013.24194, 39.2158546, -335.036926),
            ["Mythical Gym"] = CFrame.new(2371.7356, 39.2158546, 1246.31555),
            ["Legend Gym"] = CFrame.new(4111.91748, 1020.46674, -3799.97217),
            ["Muscle King Gym"] = CFrame.new(-8590.06152, 46.0167427, -6043.34717),
            ["Jungle Gym"] = CFrame.new(-8173, 64, 1898),
        },
        ["Squat"] = {
            ["Starter Island"] = CFrame.new(-48.8711243, 3.31417918, -11.8831778),
            ["Legend Beach"] = CFrame.new(470.334656, 3.31417966, -321.053925),
            ["Frost Gym"] = CFrame.new(-2933.47998, 29.6399612, -579.946045),
            ["Mythical Gym"] = CFrame.new(2489.21484, 3.67686629, 849.051025),
            ["Eternal Gym"] = CFrame.new(-7176.19141, 45.394104, -1106.31421),
            ["Legend Gym"] = CFrame.new(4304.99023, 987.829956, -4124.2334),
            ["Muscle King Gym"] = CFrame.new(-8940.12402, 13.1642084, -5699.13477),
            ["Jungle Gym"] = CFrame.new(-8352, 34, 2878),
        },
        ["Deadlift"] = {
            ["Starter Island"] = CFrame.new(-48.8711243, 3.31417918, -11.8831778),
            ["Legend Beach"] = CFrame.new(470.334656, 3.31417966, -321.053925),
            ["Frost Gym"] = CFrame.new(-2933.47998, 29.6399612, -579.946045),
            ["Mythical Gym"] = CFrame.new(2489.21484, 3.67686629, 849.051025),
            ["Eternal Gym"] = CFrame.new(-7176.19141, 45.394104, -1106.31421),
            ["Legend Gym"] = CFrame.new(4304.99023, 987.829956, -4124.2334),
            ["Muscle King Gym"] = CFrame.new(-8940.12402, 13.1642084, -5699.13477),
        },
        ["Pull Up"] = {
            ["Starter Island"] = CFrame.new(-33.3047485, 3.31417918, -11.8831778),
            ["Legend Beach"] = CFrame.new(470.334656, 3.31417966, -321.053925),
            ["Frost Gym"] = CFrame.new(-2933.47998, 29.6399612, -579.946045),
            ["Mythical Gym"] = CFrame.new(2489.21484, 3.67686629, 849.051025),
            ["Eternal Gym"] = CFrame.new(-7176.19141, 45.394104, -1106.31421),
            ["Legend Gym"] = CFrame.new(4304.99023, 987.829956, -4124.2334),
            ["Muscle King Gym"] = CFrame.new(-8940.12402, 13.1642084, -5699.13477),
            ["Jungle Gym"] = CFrame.new(-8666, 34, 2070),
        },
        ["Boulder"] = {
            ["Starter Island"] = CFrame.new(-33.3047485, 3.31417918, -11.8831778),
            ["Legend Beach"] = CFrame.new(470.334656, 3.31417966, -321.053925),
            ["Frost Gym"] = CFrame.new(-2933.47998, 29.6399612, -579.946045),
            ["Mythical Gym"] = CFrame.new(2489.21484, 3.67686629, 849.051025),
            ["Eternal Gym"] = CFrame.new(-7176.19141, 45.394104, -1106.31421),
            ["Legend Gym"] = CFrame.new(4304.99023, 987.829956, -4124.2334),
            ["Muscle King Gym"] = CFrame.new(-8940.12402, 13.1642084, -5699.13477),
            ["Jungle Gym"] = CFrame.new(-8621, 34, 2684),
        },
    }

    local treadmillOrder = {
        "Tiny Island",
        "Starter Island",
        "Legend Beach",
        "Frost Gym",
        "Mythical Gym",
        "Eternal Gym",
        "Legend Gym",
        "Jungle Gym",
    }

    local treadmillPositions = {
        ["Tiny Island"] = CFrame.new(-31.8626194, 6.0588026, 2087.88672, -0.999396682, -9.72631931e-09, 0.034730725, -6.63278898e-09, 1, 8.91870684e-08, -0.034730725, 8.8902901e-08, -0.999396682),
        ["Starter Island"] = CFrame.new(226.252472, 8.1526947, 219.366516, -0.00880406145, 3.58277887e-08, -0.999961257, -4.41204939e-08, 1, 3.62176351e-08, 0.999961257, 4.44376482e-08, -0.00880406145),
        ["Legend Beach"] = CFrame.new(-365.798309, 44.5082932, -501.618591, 0.00878552441, -6.19950713e-09, 0.999961436, -4.37451603e-10, 1, 6.20358964e-09, -0.999961436, -4.91936492e-10, 0.00878552441),
        ["Frost Gym"] = CFrame.new(-2933.47998, 29.6399612, -579.946045, 0.0345239155, -1.03010173e-07, 0.999403894, 1.03015294e-08, 1, 1.02715752e-07, -0.999403894, 6.74923806e-09, 0.0345239155),
        ["Mythical Gym"] = CFrame.new(2659.50635, 21.6095238, 934.690613, 0.999999881, 4.98906161e-08, 0.000502891606, -4.98585742e-08, 1, -6.37288338e-08, -0.000502891606, 6.37037516e-08, 0.999999881),
        ["Eternal Gym"] = CFrame.new(-7176.19141, 45.394104, -1106.31421, 0.971191287, -2.38377185e-09, 0.238301158, 1.41694778e-09, 1, 4.22844915e-09, -0.238301158, -3.76897269e-09, 0.971191287),
        ["Legend Gym"] = CFrame.new(4446.91699, 1004.46698, -3983.76074, -0.999961317, -1.97616366e-08, 0.00879266672, -1.93830077e-08, 1, 4.31365149e-08, -0.00879266672, 4.29661292e-08, -0.999961317),
        ["Jungle Gym"] = CFrame.new(-8137, 28, 2820),
    }

    local islandList = {
        { name = "Spawn", cf = CFrame.new(2, 8, 115) },
        { name = "Secret Area", cf = CFrame.new(1947, 2, 6191) },
        { name = "Tiny Island", cf = CFrame.new(-34, 7, 1903) },
        { name = "Frozen Island", cf = CFrame.new(-2600.00244, 3.67686558, -403.884369, 0.0873617008, 1.0482899e-09, 0.99617666, 3.07204253e-08, 1, -3.7464023e-09, -0.99617666, 3.09302628e-08, 0.0873617008) },
        { name = "Mythical Island", cf = CFrame.new(2255, 7, 1071) },
        { name = "Hell Island", cf = CFrame.new(-6768, 7, -1287) },
        { name = "Legend Island", cf = CFrame.new(4604, 991, -3887) },
        { name = "Muscle King Island", cf = CFrame.new(-8646, 17, -5738) },
        { name = "Jungle Island", cf = CFrame.new(-8659, 6, 2384) },
        { name = "Industrial Gym", cf = CFrame.new(-5563.2, 58.31, 4942.44) },
        { name = "Halloween Gym", cf = CFrame.new(5558.16, 83.79, 5838.37) },
    }

    local brawlList = {
        { name = "Brawl Lava", cf = CFrame.new(4471, 119, -8836) },
        { name = "Brawl Desert", cf = CFrame.new(960, 17, -7398) },
        { name = "Brawl Regular", cf = CFrame.new(-1849, 20, -6335) },
    }

    local function namesOf(list)
        local names = {}
        for _, entry in ipairs(list) do
            table.insert(names, entry.name)
        end
        return names
    end

    local function findByName(list, name)
        for _, entry in ipairs(list) do
            if entry.name == name then
                return entry.cf
            end
        end
        return nil
    end

    local function getWorkoutLocations(workout)
        local positions = workoutPositions[workout]
        local list = {}
        if positions then
            for _, name in ipairs(locationOrder) do
                if positions[name] then
                    table.insert(list, name)
                end
            end
        end
        return list
    end

    local function teleportTo(cf)
        local character = LocalPlayer.Character
        local root = character and character:FindFirstChild("HumanoidRootPart")
        if not root then
            Util.notify(L("error"), L("tp_failed"), "triangle-alert")
            return false
        end
        root.AssemblyLinearVelocity = Vector3.zero
        root.CFrame = cf
        return true
    end

    local selectedWorkout = workoutTypes[1]
    local selectedLocation = "Starter Island"
    local selectedTreadmill = treadmillOrder[1]
    local islandNames = namesOf(islandList)
    local brawlNames = namesOf(brawlList)
    local selectedIsland = islandNames[1]
    local selectedBrawl = brawlNames[1]

    Teleport:Section({ Title = L("tp_work_section") })

    local LocationDropdown

    Teleport:Dropdown({
        Title = L("tp_select_workout"),
        Values = workoutTypes,
        Value = selectedWorkout,
        SearchBarEnabled = false,
        AllowNone = false,
        Callback = function(option)
            if type(option) ~= "string" then
                return
            end
            selectedWorkout = option

            local locations = getWorkoutLocations(option)
            if not table.find(locations, selectedLocation) then
                selectedLocation = locations[1] or ""
            end

            pcall(function()
                LocationDropdown:Refresh(locations)
            end)
            if selectedLocation ~= "" then
                pcall(function()
                    LocationDropdown:Select(selectedLocation)
                end)
            end
        end,
    })

    LocationDropdown = Teleport:Dropdown({
        Title = L("tp_select_location"),
        Values = getWorkoutLocations(selectedWorkout),
        Value = selectedLocation,
        SearchBarEnabled = true,
        AllowNone = false,
        Callback = function(option)
            if type(option) == "string" then
                selectedLocation = option
            end
        end,
    })

    Teleport:Button({
        Title = L("tp_tp_workout"),
        Icon = "dumbbell",
        Callback = function()
            local positions = workoutPositions[selectedWorkout]
            local cf = positions and positions[selectedLocation]
            if cf then
                teleportTo(cf)
            else
                Util.notify(L("error"), L("tp_no_location"), "triangle-alert")
            end
        end,
    })

    Teleport:Section({ Title = L("tp_treadmill_section") })

    Teleport:Dropdown({
        Title = L("tp_select_treadmill"),
        Values = treadmillOrder,
        Value = selectedTreadmill,
        SearchBarEnabled = true,
        AllowNone = false,
        Callback = function(option)
            if type(option) == "string" then
                selectedTreadmill = option
            end
        end,
    })

    Teleport:Button({
        Title = L("tp_tp_treadmill"),
        Icon = "footprints",
        Callback = function()
            local cf = treadmillPositions[selectedTreadmill]
            if cf then
                teleportTo(cf)
            end
        end,
    })

    Teleport:Section({ Title = L("tp_island_section") })

    Teleport:Dropdown({
        Title = L("tp_select_island"),
        Values = islandNames,
        Value = selectedIsland,
        SearchBarEnabled = true,
        AllowNone = false,
        Callback = function(option)
            if type(option) == "string" then
                selectedIsland = option
            end
        end,
    })

    Teleport:Button({
        Title = L("tp_tp_island"),
        Icon = "map-pin",
        Callback = function()
            local cf = findByName(islandList, selectedIsland)
            if cf then
                teleportTo(cf)
            end
        end,
    })

    Teleport:Section({ Title = L("tp_brawl_section") })

    Teleport:Dropdown({
        Title = L("tp_select_brawl"),
        Values = brawlNames,
        Value = selectedBrawl,
        SearchBarEnabled = true,
        AllowNone = false,
        Callback = function(option)
            if type(option) == "string" then
                selectedBrawl = option
            end
        end,
    })

    Teleport:Button({
        Title = L("tp_tp_brawl"),
        Icon = "swords",
        Callback = function()
            local cf = findByName(brawlList, selectedBrawl)
            if cf then
                teleportTo(cf)
            end
        end,
    })
end

do
    local Settings = Tabs.Settings

    local ConfigManager = Window.ConfigManager
    local configCache = {}
    local currentConfig = "default"
    local newConfigName = ""
    local autoSaveEnabled = false

    local themeNames = {}
    local themesOk, themes = pcall(function()
        return WindUI:GetThemes()
    end)
    if themesOk and type(themes) == "table" then
        for name in pairs(themes) do
            table.insert(themeNames, name)
        end
    end
    if #themeNames == 0 then
        themeNames = { "Sherya", "Dark", "Light" }
    end
    table.sort(themeNames)

    Settings:Section({ Title = L("set_appearance") })

    local ThemeDropdown = Settings:Dropdown({
        Title = L("set_theme"),
        Desc = L("set_theme_desc"),
        Values = themeNames,
        Value = themeName,
        Callback = function(option)
            if type(option) ~= "string" then
                return
            end
            pcall(function()
                WindUI:SetTheme(option)
            end)
        end,
    })
    Util.register("theme", ThemeDropdown)

    local TransparencyToggle = Settings:Toggle({
        Title = L("set_transparency"),
        Desc = L("set_transparency_d"),
        Value = true,
        Callback = function(state)
            pcall(function()
                Window:ToggleTransparency(state)
            end)
        end,
    })
    Util.register("transparency", TransparencyToggle)

    local NotificationsToggle = Settings:Toggle({
        Title = L("set_notifications"),
        Desc = L("set_notifications_desc"),
        Value = true,
        Callback = function(state)
            Util.notificationsEnabled = state
        end,
    })
    Util.register("notifications", NotificationsToggle)

    Settings:Input({
        Title = L("set_menukey"),
        Placeholder = L("set_menukey_ph"),
        Value = "",
        Callback = function(text)
            text = tostring(text or ""):gsub("%s+", "")
            if text == "" then
                return
            end
            local ok, key = pcall(function()
                return Enum.KeyCode[string.upper(text)]
            end)
            if ok and key then
                pcall(function()
                    Window:SetToggleKey(key)
                end)
                Util.notify(L("set_hub_section"), L("set_menukey_set", string.upper(text)), "check")
            else
                Util.notify(L("error"), L("set_menukey_invalid"), "triangle-alert")
            end
        end,
    })

    Settings:Input({
        Title = L("set_fpscap"),
        Desc = L("set_fpscap_desc"),
        Placeholder = "60",
        Value = "",
        Callback = function(text)
            local n = tonumber(text)
            if not n then
                return
            end
            if not setfpscap then
                Util.notify(L("error"), L("set_fpscap_unsup"), "triangle-alert")
                return
            end
            pcall(setfpscap, math.clamp(math.floor(n), 1, 999))
        end,
    })

    local function getConfig(name)
        if not ConfigManager then
            return nil
        end
        if configCache[name] then
            return configCache[name]
        end
        local config = ConfigManager:CreateConfig(name)
        for flag, element in pairs(Registry) do
            config:Register(flag, element)
        end
        configCache[name] = config
        return config
    end

    local function runConfig(action, name)
        return pcall(function()
            local config = getConfig(name)
            config[action](config)
        end)
    end

    local function getConfigNames()
        local ok, names = pcall(function()
            return ConfigManager:AllConfigs()
        end)
        if ok and type(names) == "table" and #names > 0 then
            return names
        end
        return { "default" }
    end

    Settings:Section({ Title = L("set_configuration") })

    local AutoSaveToggle = Settings:Toggle({
        Title = L("set_autosave"),
        Desc = L("set_autosave_desc"),
        Value = false,
        Callback = function(state)
            autoSaveEnabled = state
        end,
    })
    Util.register("autosave", AutoSaveToggle)

    local AUTOLOAD_FILE = "MysteryHubAutoLoad.txt"
    local autoLoadEnabled = true
    pcall(function()
        if isfile and readfile and isfile(AUTOLOAD_FILE) then
            autoLoadEnabled = readfile(AUTOLOAD_FILE) ~= "false"
        end
    end)

    Settings:Toggle({
        Title = L("set_autoload"),
        Desc = L("set_autoload_desc"),
        Value = autoLoadEnabled,
        Callback = function(state)
            autoLoadEnabled = state
            pcall(function()
                if writefile then
                    writefile(AUTOLOAD_FILE, state and "true" or "false")
                end
            end)
        end,
    })

    local ConfigDropdown = Settings:Dropdown({
        Title = L("set_select_config"),
        Values = getConfigNames(),
        Value = currentConfig,
        Callback = function(option)
            if type(option) == "string" then
                currentConfig = option
            end
        end,
    })

    local function refreshConfigs(selectName)
        pcall(function()
            ConfigDropdown:Refresh(getConfigNames())
        end)
        pcall(function()
            ConfigDropdown:Select(selectName)
        end)
    end

    Settings:Input({
        Title = L("set_new_config"),
        Placeholder = L("set_new_config_ph"),
        Value = "",
        Callback = function(text)
            newConfigName = text
        end,
    })

    Settings:Button({
        Title = L("set_create_config"),
        Desc = L("set_create_desc"),
        Callback = function()
            local name = Util.sanitizeName(newConfigName)
            if name == "" then
                Util.notify(L("set_config_title"), L("set_type_name"), "triangle-alert")
                return
            end
            currentConfig = name
            runConfig("Save", name)
            refreshConfigs(name)
            Util.notify(L("set_config_title"), L("set_created", name), "check")
        end,
    })

    Settings:Button({
        Title = L("set_save_config"),
        Callback = function()
            local ok = runConfig("Save", currentConfig)
            Util.notify(
                L("set_config_title"),
                ok and L("set_saved", currentConfig) or L("set_cant_save"),
                ok and "check" or "triangle-alert"
            )
        end,
    })

    Settings:Button({
        Title = L("set_load_config"),
        Callback = function()
            local ok = runConfig("Load", currentConfig)
            Util.notify(
                L("set_config_title"),
                ok and L("set_loaded", currentConfig) or L("set_cant_load"),
                ok and "check" or "triangle-alert"
            )
        end,
    })

    Settings:Button({
        Title = L("set_delete_config"),
        Callback = function()
            local name = currentConfig
            runConfig("Delete", name)
            configCache[name] = nil
            currentConfig = "default"
            refreshConfigs("default")
            Util.notify(L("set_config_title"), L("set_deleted", name), "trash-2")
        end,
    })

    Settings:Section({ Title = L("set_hub_section") })

    local queueFn = queue_on_teleport or (syn and syn.queue_on_teleport)
    local requeueEnabled = false
    local RequeueToggle

    RequeueToggle = Settings:Toggle({
        Title = L("set_requeue"),
        Desc = L("set_requeue_desc"),
        Value = false,
        Callback = function(state)
            requeueEnabled = state
            if not state then
                return
            end
            local message
            if not queueFn then
                message = L("set_requeue_unsup")
            elseif Config.LoaderUrl == "" then
                message = L("set_requeue_nourl")
            end
            if message then
                requeueEnabled = false
                Util.notify(L("set_requeue"), message, "triangle-alert")
                task.defer(function()
                    pcall(function()
                        RequeueToggle:Set(false)
                    end)
                end)
            end
        end,
    })
    Util.register("auto_requeue", RequeueToggle)

    local teleportConn = LocalPlayer.OnTeleport:Connect(function()
        if requeueEnabled and queueFn and isAlive() and Config.LoaderUrl ~= "" then
            pcall(queueFn, 'loadstring(game:HttpGet("' .. Config.LoaderUrl .. '"))()')
        end
    end)

    local PANIC_SKIP = {
        theme = true,
        transparency = true,
        autosave = true,
        notifications = true,
        auto_requeue = true,
    }

    Settings:Button({
        Title = L("set_panic"),
        Desc = L("set_panic_desc"),
        Icon = "octagon-x",
        Callback = function()
            for flag, element in pairs(Registry) do
                if not PANIC_SKIP[flag] then
                    local ok, value = pcall(function()
                        return element.Value
                    end)
                    if ok and value == true then
                        pcall(function()
                            element:Set(false)
                        end)
                    end
                end
            end
            Util.notify(L("set_hub_section"), L("set_panic_done"), "check")
        end,
    })

    Settings:Button({
        Title = L("set_unload"),
        Desc = L("set_unload_desc"),
        Icon = "power",
        Callback = function()
            env.MysteryHubRun = nil
            task.wait(1.5)
            pcall(function()
                Window:Destroy()
            end)
            env.MysteryHubWindow = nil
        end,
    })

    task.spawn(function()
        while task.wait(5) and isAlive() do
            if autoSaveEnabled then
                runConfig("Save", currentConfig)
            end
        end
    end)

    task.spawn(function()
        while isAlive() do
            task.wait(1)
        end
        requeueEnabled = false
        pcall(function()
            teleportConn:Disconnect()
        end)
    end)

    function Util.autoLoad()
        if autoLoadEnabled then
            runConfig("Load", currentConfig)
        end
    end
end

if Util.autoLoad then
    task.delay(2, Util.autoLoad)
end

pcall(function()
    Tabs.Home:Select()
end)
