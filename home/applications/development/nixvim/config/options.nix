{
  config = {
    clipboard = {
      register = "unnamedplus";
      providers.xsel.enable = true;
    };
    globals = {
      semantic_tokens_enabled = false;
    };
  };
  config.opts = {
    relativenumber = true;
    number = true;

    tabstop = 2;
    shiftwidth = 2;
    expandtab = true;
    autoindent = true;

    wrap = true;

    ignorecase = true;
    smartcase = true;
    cursorline = true;

    termguicolors = true;
    background = "dark";
    signcolumn = "yes";

    backspace = "indent,eol,start";

    splitright = true;
    splitbelow = true;

    mouse = "";
    encoding = "utf8";
    swapfile = false;

    foldcolumn = "0";
    foldlevel = 99;
    foldlevelstart = 99;
    foldenable = true;
    foldmethod = "indent";
  };
}
