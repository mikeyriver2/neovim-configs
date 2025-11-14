-- ~/.config/nvim/lua/config/luasnip.lua
local ls = require("luasnip")
require("luasnip.loaders.from_vscode").lazy_load() -- load friendly-snippets

ls.config.set_config({
  history = true,
  updateevents = "TextChanged,TextChangedI",
  enable_autosnippets = true,
})

local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

-- TypeScript React Arrow Function Component Snippet
ls.add_snippets("typescriptreact", {
  s("rafc", {  -- Trigger: rafc
    t("import React from 'react';"), t({"", ""}),
    t("interface "), i(1, "Props"), t(" {"), 
    t({"", "  "} ), i(2, "// props here"), t({"", "}"}), t({"", ""}),
    t("const "), i(3, "ComponentName"), t(": React.FC<"), i(1, "Props"), t("> = ("),
    i(4, "{ }"), t(") => {"), t({"", "  return ("}),
    t({"", "    <div>"}), i(5, "Content"), t({"", "    </div>"}), 
    t({"", "  );"}), t({"", "};"}), t({"", ""}),
    t("export default "), i(3, "ComponentName"), t(";")
  }),
})
