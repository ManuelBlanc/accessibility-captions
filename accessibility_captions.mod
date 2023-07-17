return {
    run = function()
        fassert(rawget(_G, "new_mod"), "`accessibility_captions` mod must be lower than Vermintide Mod Framework in your launcher's load order.")

        new_mod("accessibility_captions", {
            mod_script       = "scripts/mods/accessibility_captions/accessibility_captions",
            mod_data         = "scripts/mods/accessibility_captions/accessibility_captions_data",
            mod_localization = "scripts/mods/accessibility_captions/accessibility_captions_localization",
        })

        return {}
    end,
    packages = {
        "resource_packages/accessibility_captions/accessibility_captions",
    },
}
