local hipatterns = require("mini.hipatterns")

return {
    "mini/mini.hipatterns",
    version = "*",
    opts = {
        highlighters = {
            hex_color = hipatterns.gen_highlighter.hex_color(),
        },
    },
}
