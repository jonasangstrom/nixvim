{ pkgs, inputs, ... }:
{
  imports = [
    ./default.nix
    ./csharp.nix
  ];

  extraPackages = [
    pkgs.dotnet-sdk_10
  ];

  plugins.copilot-lua = {
    enable = true;
    settings = {
      suggestion = {
        enabled = false;
      }; # Keep inline suggestions disabled; Copilot is used by the AI plugins.
      panel = {
        enabled = false;
      };
    };
  };
  # Enable the native Nixvim module
  plugins.codecompanion = {
    enable = true;

    settings = {
      strategies = {
        chat = {
          adapter = "copilot"; # Change to "anthropic", "openai", etc. as desired
          roles = {
            llm = "CodeCompanion Agent";
          };
        };
        inline = {
          adapter = "copilot";
        };
        agent = {
          adapter = "copilot";
        };
      };

      # Global options to allow autonomous agent execution
      opts = {
        send_code = true;
        system_prompt = ''
          You are an autonomous AI programming agent running inside Neovim. 
          You can actively create, delete, and read files using the system tools provided to you.
        '';
      };
    };
  };

  # Shortcut Keymaps
  keymaps = [
    # Toggle the agentic chat buffer instantly
    {
      mode = [ "n" "v" ];
      key = "<leader>cc";
      action = "<cmd>CodeCompanionChat Toggle<cr>";
      options = { desc = "Toggle AI Chat"; silent = true; };
    }
    
    # ONE-CLICK MODEL/ADAPTER SELECTOR: Open the actions menu to instantly switch models
    {
      mode = [ "n" "v" ];
      key = "<leader>ca";
      action = "<cmd>CodeCompanionActions<cr>";
      options = { desc = "AI Actions / Select Model"; silent = true; };
    }

    # Add visually highlighted code block directly into the ongoing chat context
    {
      mode = "v";
      key = "<leader>ce";
      action = "<cmd>CodeCompanionChat Add<cr>";
      options = { desc = "Add Selection to AI Chat"; silent = true; };
    }
  ];
}
