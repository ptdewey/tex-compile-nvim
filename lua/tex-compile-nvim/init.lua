local M = {}

local plugin_path = debug.getinfo(1).source:sub(2):match("(.*/).*/.*/")
local script_path = plugin_path .. "scripts/tex-compile.sh"
local live_script_path = plugin_path .. "scripts/tex-compile-live.sh"

local Job = require("plenary.job")

-- display to message history
local function display_messages(messages)
    vim.schedule(function()
        local concatenated_messages = table.concat(messages, "\n")
        vim.api.nvim_echo({{concatenated_messages, "None"}}, true, {})
    end)
end

-- handle job errors and output
local function handle_job_output(err, return_val)
    local messages = {}
    if return_val == 0 then
        table.insert(messages, "Compilation finished successfully.")
    else
        table.insert(messages, "Compilation failed with exit code: " .. return_val)
        if err and #err > 0 then
            table.insert(messages, "Error Trace:")
            for _, line in ipairs(err) do
                table.insert(messages, line)
            end
        end
    end
    display_messages(messages)
end


-- compile once
local function latex_compile()
    print("Compiling latex files...")
    local err_output = {}

    Job:new({
        command = script_path,
        on_stderr = function(_, data)
            table.insert(err_output, data)
        end,
        on_exit = function(_, return_val)
            handle_job_output(err_output, return_val)
        end,
    }):start()
end

-- compile live
local function latex_compile_live()
    print("Live compiling latex files...")
    local err_output = {}

    Job:new({
        command = live_script_path,
        on_stderr = function(_, data)
            table.insert(err_output, data)
        end,
        on_exit = function(_, return_val)
            handle_job_output(err_output, return_val)
        end,
    }):start()
end

-- plugin setup function
function M.setup()
    vim.api.nvim_create_user_command("LatexCompile", latex_compile, {
        desc = "Compile Latex files in the present working directory."
    })

    vim.api.nvim_create_user_command("LatexCompileLive", latex_compile_live, {
        desc = "Live compile Latex files in the present working directory."
    })
end

return M
