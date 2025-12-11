{
  plugins.oil = { enable = true; };
  keymaps = [{
    mode = "n";
    key = "fo";
    action.__raw = "	function()\n	    require('oil').open()\n	end\n    ";
  }];
}
