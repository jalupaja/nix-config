{ pkgs, lib, inputs, globals, ... }:
# TODO check what TODOs do
with inputs;
{
    imports = [ nixvim.homeManagerModules.nixvim ];

    programs.nixvim = {
	enable = true;

	globals = {
	    mapleader = " ";
	};

	# TODO 
	colorschemes.tokyonight = { 
	    # enable = true;
	    # TODO
	    # https://nix-community.github.io/nixvim/colorschemes/tokyonight/index.html#colorschemestokyonightenable
	    # onColors
	};

	options = {
	    number = true;
	    relativenumber = true;
	    shiftwidth = 4;
	    autochdir = true;
	    autoindent = true;
	    autoread = true;
		clipboard = "unnamedplus"; # use global clipboard
		title = true;
	};

	plugins = {
	    # https://nix-community.github.io/nixvim/plugins/lsp/index.html

	    nvim-autopairs.enable = true;

	    neogit.enable = true;

	    # TODO doesn't work
	    #specs.enable = true;

	    # better default movement keys
	    spider = {
		enable = true;
		keymaps.motions = {
		    b = "b";
		    e = "e";
		    ge = "ge";
		    w = "w";
		};
	    };

	    # TODO doesn't work
	    nvim-colorizer = {
		enable = true;
		#fileTypes = {
		#    AARRGGBB = true;
		#    RGB = true;
		#};
	    };

	    # TODO 
	    startify = {
		enable = true;
	    };

	    # fold
	    nvim-ufo = {
		enable = true;
	    };

	    # TODO
	    #clipboard-image.enable = true;

	    treesitter.enable = true;

	    diffview = {
		enable = true;
		diffBinaries = true;
	    };

	    lsp = {
		enable = true;
		servers = {
		    # Programming languages
		    clangd.enable = true; # C/C++
		    ruff-lsp.enable = true; # python
		    java-language-server.enable = true; # java
		    rust-analyzer = { # rust
			enable = true;
			installRustc = true;
			installCargo = true;
		    };

		    # script languages
		    bashls.enable = true; # bash
		    cmake.enable = true; # cmake
		    nixd.enable = true; # nix files

		    #web stuff
		    html.enable = true; # html
		    # TODO
		    #htmx.enable = true; # htmx
		    cssls.enable = true; # css

		    # markup
		    jsonls.enable = true; # json
		    # TODO
		    #lemminx.enable = true; # xml
		    #marksman.enable = true; # Markdown
		    texlab.enable = true; # LaTex

		    # TODO
		    #typos-lsp.enable = true; # text (prob. just simple english)
		};
		keymaps = {
		    lspBuf = {
			K = "hover";
			gD = "references";
			gd = "definition";
			gi = "implementation";
			gt = "type_definition";
		    };
		};
	    };

	    lsp-format = {
		enable = true;
		lspServersToEnable = "all";
	    };

	    markdown-preview = {
		enable = true;
		autoStart = false;
	    };

	    telescope = {
		enable = true;
	    };

	    harpoon = {
		enable = true;
		enableTelescope = true;

		keymaps = {
		    addFile = "<leader>a>";
		    cmdToggleQuickMenu = "<leader>i";
		    gotoTerminal = { 
			"1" = "<C-1>"; 
			"2" = "<C-2>"; 
			"3" = "<C-3>"; 
			"4" = "<C-4>"; 
		    };
		};
	    };

	};

	keymaps = [
	# Those are somewhat doom-emacs keybinds...
	{
	    # Escape out of terminal
	    mode = "t";
	    key = "<Esc><Esc>";
	    action = "<C-\\><C-n>";
	}
	{
	    # file finder
	    mode = "n";
	    key = "<leader>.";
	    action = ":lua require'telescope.builtin'.find_files{}<CR>";
	}
	{
	    # Neogit
	    mode = "n";
	    key = "<leader>gg";
	    action = ":Neogit<CR>";
	}

	# remap Control to leader key
    ## movement
	{
	    mode = "n";
	    key = "<leader>ww";
	    action = "<C-w>w";
	}
	{
	    mode = "n";
	    key = "<leader>wh";
	    action = "<C-w>h";
	}
	{
	    mode = "n";
	    key = "<leader>w<Left>";
	    action = "<C-w>h";
	}
	{
	    mode = "n";
	    key = "<leader>wj";
	    action = "<C-w>j";
	}
	{
	    mode = "n";
	    key = "<leader>w<Down>";
	    action = "<C-w>j";
	}
	{
	    mode = "n";
	    key = "<leader>wk";
	    action = "<C-w>k";
	}
	{
	    mode = "n";
	    key = "<leader>w<Up>";
	    action = "<C-w>k";
	}
	{
	    mode = "n";
	    key = "<leader>wl";
	    action = "<C-w>l";
	}
	{
	    mode = "n";
	    key = "<leader>w<Right>";
	    action = "<C-w>l";
	}

    ## split
    {
	    mode = "n";
	    key = "<leader>ws";
	    action = "<C-w>s";
    }
    {
	    mode = "n";
	    key = "<leader>wv";
	    action = "<C-w>v";
    }
    {
	    mode = "n";
	    key = "<leader>wq";
	    action = ":q<CR>";
    }

    ## buffer
    {
	    mode = "n";
	    key = "<leader>bp";
	    action = ":bp<CR>";
    }
    {
	    mode = "n";
	    key = "<leader>bn";
	    action = ":bn<CR>";
    }
    {
	    mode = "n";
	    key = "<leader>bd";
	    action = ":bd<CR>";
    }

	# TODO continue this for all keys + split creation, buffer deletion, ...
	];
    };
}
