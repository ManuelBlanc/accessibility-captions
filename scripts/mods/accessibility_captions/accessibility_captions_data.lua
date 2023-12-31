local mod = get_mod("accessibility_captions")

mod:dofile("scripts/mods/accessibility_captions/caption_definitions")

-- Generate a checkbox option for each caption.
local sound_widgets = {}
for i, data in ipairs(mod.caption_data) do
    if not data.no_option then
        local label = data.label
        sound_widgets[i] = {
            type = "checkbox",
            setting_id = label,
            title = label,
            tooltip = mod:localize("sound_description"),
            default_value = false,
            localize = false,
        }
        data.enabled = mod:get(label)
    end
end

local SCREEN_W, SCREEN_H = Gui.resolution()

return {
    name = mod:localize("mod_name"),
    description = mod:localize("mod_description"),
    is_togglable = true,
    options = {
        widgets = {
            {
                setting_id = "sound_widgets",
                type = "group",
                sub_widgets = sound_widgets,
            },
            {
                type = "numeric",
                setting_id = "max_hearing_distance",
                range = { 1, 50 },
                default_value = 50,
            },
            {
                type = "dropdown",
                setting_id = "widget_direction",
                default_value = 0,
                options = {
                    {text = "north_east", value = 0x3 },
                    {text = "north_west", value = 0x2 },
                    {text = "south_east", value = 0x1 },
                    {text = "south_west", value = 0x0 },
                },
            },
            {
                type = "numeric",
                setting_id = "font_size",
                unit_text = "pixels",
                range = { 8, 52 },
                default_value = 14,
            },
            {
                type = "checkbox",
                setting_id = "show_all_sounds",
                default_value = false,
            },
            {
                type = "numeric",
                setting_id = "widget_x",
                unit_text = "pixels",
                range = { 0, SCREEN_W },
                default_value = SCREEN_W*0.5,
            },
            {
                type = "numeric",
                setting_id = "widget_y",
                unit_text = "pixels",
                range = { 0, SCREEN_H },
                default_value = SCREEN_H*0.5,
            },
        },
        collapsed_widgets = {
            "sound_widgets",
        },
    },
}
