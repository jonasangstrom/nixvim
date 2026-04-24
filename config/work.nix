{ pkgs, ... }:
{
  imports = [
    ./default.nix
    ./csharp.nix
  ];

  extraPackages = [
    pkgs.dotnet-sdk_10
    pkgs.omnisharp-roslyn
  ];

  plugins.copilot-lua = {
    enable = true;
    settings.suggestion.auto_trigger = true;
  };

  plugins.copilot-chat = {
    enable = true;
    settings = {
      window.layout = "vertical";
    };
  };

  plugins.avante = {
    enable = true;
    settings = {
      provider = "copilot";
      providers.copilot = {
        model = "claude-sonnet-4-6";
      };
      behaviour = {
        auto_suggestions = false;
        auto_apply_diff_after_generation = false;
      };
      hints.enabled = true;
    };
  };

  keymaps = [
    {
      mode = "n";
      key = "<leader>am";
      action = "<cmd>AvanteModels<cr>";
      options.silent = true;
    }
    {
      mode = "n";
      key = "<leader>aa";
      action = "<cmd>AvanteAsk<cr>";
      options.silent = true;
    }
    {
      mode = "n";
      key = "<leader>at";
      action = "<cmd>AvanteToggle<cr>";
      options.silent = true;
    }
  ];
}
