local function load_env_file(filename)
    local env_vars = {}
    local lines = vim.fn.readfile(filename)

    for _, line in ipairs(lines) do
        local key, value = line:match("([^=]+)=(.+)")
        if key and value then
            env_vars[key] = value
        end
    end

    return env_vars
end

return {
    {
        "nvim-neotest/neotest",
        dependencies = { "nvim-neotest/nvim-nio", "nvim-neotest/neotest-python" },
        opts = function()
            local env_vars = load_env_file(".env.test")
            return {
                adapters = {
                    ["neotest-python"] = {
                        runner = "unittest",
                        dap = {
                            env = env_vars,
                            console = "internalConsole",
                            justMyCode = true,
                        },
                    },
                },
            }
        end,
    },
}
