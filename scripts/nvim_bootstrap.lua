-- Headless nvim setup, run by install.sh:
--   nvim --headless -c "luafile scripts/nvim_bootstrap.lua"
-- Installs/updates (to latest) plugins, treesitter parsers and Mason tools, then quits.

local function log(msg)
  io.stdout:write(msg .. "\n")
end

local function step(name, fn)
  log("==> " .. name)
  local ok, err = pcall(fn)
  if not ok then
    log("  ! " .. tostring(err))
  end
end

-- 1. plugins: no lockfile is tracked, so sync = install missing + update all to latest + clean
step("lazy.nvim: sync plugins", function()
  require("lazy").sync { wait = true, show = false }
end)

-- 2. treesitter parsers (nvim-treesitter main branch needs nvim >= 0.12)
step("nvim-treesitter: install/update parsers", function()
  if vim.fn.has "nvim-0.12" == 0 then
    error "nvim >= 0.12 required, skipping (brew upgrade neovim)"
  end
  require("lazy").load { plugins = { "nvim-treesitter" } }
  local langs = require("lazy.core.config").plugins["nvim-treesitter"].opts.ensure_installed
  local ts = require "nvim-treesitter"
  ts.install(langs):wait(600000)
  ts.update():wait(600000)
end)

-- 3. Mason: every LSP / formatter the config references (same list as :MasonInstallAll)
step("mason: install/update LSPs and formatters", function()
  require("lazy").load { plugins = { "nvim-lspconfig", "conform.nvim", "mason.nvim" } }
  local registry = require "mason-registry"

  local refreshed = false
  registry.refresh(function()
    refreshed = true
  end)
  vim.wait(120000, function()
    return refreshed
  end, 200)

  local running = {}
  for _, name in ipairs(require("nvchad.mason").get_pkgs()) do
    local pkg = registry.get_package(name)
    local installed = pkg:is_installed() and pkg:get_installed_version()
    local latest = pkg:get_latest_version()

    if installed == latest then
      log("  = " .. name .. " " .. latest)
    else
      running[name] = true
      pkg:install({}, function(ok, err)
        running[name] = nil
        if ok then
          log("  + " .. name .. " " .. (installed and (installed .. " -> ") or "") .. latest)
        else
          log("  ! " .. name .. ": " .. tostring(err))
        end
      end)
    end
  end

  vim.wait(900000, function()
    return next(running) == nil
  end, 500)
end)

vim.cmd "qa!"
