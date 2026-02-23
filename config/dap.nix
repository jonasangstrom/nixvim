{ pkgs, ... }:
{
  plugins = {
    # ui stuff
    dap-ui.enable = true;
    dap-virtual-text.enable = true;
    dap = {
      enable = true;
      # needed for rust
      adapters.servers.codelldb = {
        port = 13000;
        executable = {
          command = "${pkgs.vscode-extensions.vadimcn.vscode-lldb}/share/vscode/extensions/vadimcn.vscode-lldb/adapter/codelldb";
          args = [
            "--port"
            "13000"
          ];
        };
      };

      # needed for python
      adapters.executables.python = {
        command = "python";
        args = [
          "-m"
          "debugpy.adapter"
        ];
      };

      # needed for c#
      adapters.executables.coreclr = {
        command = "${pkgs.netcoredbg}/bin/netcoredbg";
        args = [ "--interpreter=vscode" ];
      };

      configurations.rust = [
        {
          name = "Rust Debug";
          type = "codelldb";
          request = "launch";
          program = "\${workspaceFolder}/target/debug/\${packageName}";
          cwd = "\${workspaceFolder}";
          stopOnEntry = false;
        }
      ];

      configurations.cs = [
        {
          name = "dotnet launch - netcoredbg";
          type = "coreclr";
          request = "launch";
          program = {
            __raw = ''
              function()
                return vim.fn.input('Path to dll: ', vim.fn.getcwd() .. '/bin/Debug/net10.0/', 'file')
              end
            '';
          };
        }
      ];

      configurations.python = [
        {
          type = "python";
          request = "launch";
          name = "Launch with Arguments";
          program = "\${file}";
          args.__raw = ''
            function()
              local args_string = vim.fn.input('Arguments: ')
              return vim.split(args_string, " +") 
            end
          '';
        }
      ];
    };
  };
  keymaps = [
    {
      mode = "n";
      key = "<F5>";
      action.__raw = "function() require('dap').continue() end";
      options.desc = "DAP Continue";
    }
    {
      mode = "n";
      key = "<leader>db";
      action.__raw = "function() require('dap').toggle_breakpoint() end";
      options.desc = "(d)ebug (b)reakpoint";
    }
    {
      mode = "n";
      key = "<leader>dd";
      action.__raw = "function() require('dapui').toggle() end";
      options.desc = "(s)ebug (d)apui";
    }
  ];
}
