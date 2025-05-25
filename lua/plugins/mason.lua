return
{
    "williamboman/mason.nvim",
    cmd = {
        "Mason",
        "MasonUpdate",
        "MasonInstall",
        "MasonUninstall",
        "MasonUninstallAll",
        "MasonLog",
    },
    build = ":MasonUpdate",
    opts = {
		ensure_installed = {
				"clangd",
				"clangd-format",
				"jedi-language-server",
				"lua-language-server",
		},
        ui = {
            icons = {
                package_installed = "✓",
                package_pending = "➜",
                package_uninstalled = "✗"
            },
        },
    },
}
