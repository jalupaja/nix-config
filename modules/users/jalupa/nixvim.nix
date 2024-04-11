{ pkgs, lib, inputs, theme, globals, ... }:
# TODO check what TODOs do
with inputs;
{
# TODO implement comment for .nix
# TODO in multiple files?
# TODO resources:
# https://github.com/GaetanLepage/nix-config/tree/master/home/modules/tui/neovim
imports = [ nixvim.homeManagerModules.nixvim ];

programs.nixvim = {
  enable = true;

  defaultEditor = true;
    # TODO check
    luaLoader.enable = false;

    globals = {
      mapleader = " ";
    };

    colorschemes = {
    # TODO
    # https://nix-community.github.io/nixvim/colorschemes/tokyonight/index.html#colorschemestokyonightenable
    tokyonight = {
      enable = true;
      style = "night";
    };
    ayu = {
      enable = false;

        # doesn't work?
        #extraOptions.overrides = {
        #    fg = "#000000";
        #};
      };
      oxocarbon.enable = false;
    };

    options = {
      number = true;
      relativenumber = true;
      shiftwidth = 4;
      autochdir = true;
      autoindent = true;
      autoread = true;
      clipboard = "unnamed"; # use global clipboard
      title = true;
      signcolumn = "no";
      ignorecase = true;
    };

    plugins = {
        # https://nix-community.github.io/nixvim/plugins/lsp/index.html

        nvim-autopairs.enable = true;

        neogit.enable = true;

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

        # TODO
        startify = {
          enable = false;
        };

        # fold
        # TODO
        nvim-ufo = {
          enable = false;
        };

				nvim-tree = {
					enable = true;
					#disableNetrw = true;
				};

        # TODO
        #clipboard-image.enable = true;

        treesitter = {
          enable = true;
          disabledLanguages = [ "latex" ];
        };

        diffview = {
          enable = true;
          diffBinaries = true;
        };

				lsp = {
					enable = true;
					servers = {
						# Programming languages
						clangd.enable = true; # C/C++
							pyright.enable = true; # python
							java-language-server.enable = false; # java
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
            htmx.enable = true; # htmx
            cssls.enable = true; # css

            # markup
            jsonls.enable = true; # json
            lemminx.enable = true; # xml
            marksman.enable = true; # Markdown
            texlab.enable = true; # LaTex

            typos-lsp.enable = true; # text (prob. just simple english)
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
        lspsaga = {
          enable = true;

          beacon.enable = true;
          implement.enable = false;
          lightbulb.enable = false;
          hover.openCmd = "!${globals.browser}";

          finder.keys = {
            split = "s";
            vsplit = "v";
          };
          rename.keys = {
            exec = "<CR>";
            quit = "q";
          };
        };
        lsp-format = {
          enable = true;
          lspServersToEnable = "all";
				};
				#lsp-lines.enable = true;
				# java lsp
				nvim-jdtls = {
					enable = true;
					cmd = [
						# Eclipse language server
						"${pkgs.jdt-language-server}/bin/jdtls"
							"-noverify"
							"-Xms1G"
							"-jar"
							"-data" ".cache/jdtls/workspace"
							"-configuration" ".cache/jdtls/config"
					];
				};

        # more LaTex features
        vimtex = {
          enable = true;
          settings = {
						view_method = "zathura";
					};
        };

        # commenting
        commentary = {
          enable = true;
        };

        markdown-preview = {
          enable = true;
          settings.auto_start = false;
        };

        telescope = {
          enable = true;
        };

        # TODO fix: probably by installing plenary ...
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

				# might only work with a colortheme?
				nvim-colorizer = {
					enable = true;
				};

				lspkind = {
					enable = true;

					cmp = {
						enable = true;
						menu = {
							nvim_lsp = "[LSP]";
							nvim_lua = "[api]";
							path = "[path]";
							luasnip = "[snip]";
							buffer = "[buffer]";
							neorg = "[neorg]";
							cmp_tabby = "[Tabby]";
						};
					};
				};

				cmp = {
					enable = true;

					settings = {
						snippet.expand = "function(args) require('luasnip').lsp_expand(args.body) end";
						mapping = {
							"<C-d>" = "cmp.mapping.scroll_docs(-4)";
							"<C-f>" = "cmp.mapping.scroll_docs(4)";
							"<C-Space>" = "cmp.mapping.complete()";
							"<C-e>" = "cmp.mapping.close()";
							"<Tab>" = "cmp.mapping(cmp.mapping.select_next_item(), {'i', 's'})";
							"<S-Tab>" = "cmp.mapping(cmp.mapping.select_prev_item(), {'i', 's'})";
							"<CR>" = "cmp.mapping.confirm({ select = true })";
						};

						sources = [
						{name = "path";}
						{name = "nvim_lsp";}
						{name = "cmp_tabby";}
						{name = "luasnip";}
						{
							# Words from other open buffers can also be suggested.
							name = "buffer";
							option.get_bufnrs.__raw = "vim.api.nvim_list_bufs";
						}
						{name = "neorg";}
						];
					};
				};

				cmp-nvim-lsp.enable = true;
				cmp_luasnip.enable = true;

				luasnip.enable = true;
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
			# Escape to remove highleight
			mode = "n";
			key = "<Esc>";
			action = ":noh<CR>";
			options.silent = true;
		}
		{
			# current project
			mode = "n";
			key = "<leader>fr";
			action = "<cmd>lua require'telescope.builtin'.oldfiles{}<CR>";
		}
		{
			# file finder
			mode = "n";
			key = "<leader>.";
			action = "<cmd>lua require'telescope.builtin'.find_files{}<CR>";
		}
		{
			# Neogit
			mode = "n";
			key = "<leader>gg";
			action = "<cmd>Neogit<CR>";
		}
		{
			# Commenting
			key = "<leader>c";
			action = "<cmd>Commentary<CR>";
		}
		{
			# rename variable in Buffer
			key = "<leader>r";
			action = "<cmd>Lspsaga rename<CR>";
		}
		{
			# File Tree
			mode = "n";
			key = "<leader>d";
			action = "<cmd>NvimTreeToggle<CR>";
		}
		{
			# rename variable in Project
			key = "<leader>pr";
			action = "<cmd>Lspsaga rename ++project<CR>";
		}
		{
			# floating terminal
			mode = "n";
			key = "<leader>t";
			action = "<cmd>Lspsaga term_toggle<CR>";
		}

		# Lsp keybindings
		{
			# hover definition
			mode = "n";
			key = "<leader>gh";
			action = "<cmd>Lspsaga hover_doc<CR>";
		}
		{
			# definition
			mode = "n";
			key = "<leader>gd";
			action = "<cmd>Lspsaga peek_definition<CR>";
		}
		{
			# type definition
			mode = "n";
			key = "<leader>gt";
			action = "<cmd>Lspsaga peek_type_definition<CR>";
		}
		{
			# type definition
			mode = "n";
			key = "<leader>f";
			action = "<cmd>Lspsaga finder<CR>";
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
			action = "<cmd>q<CR>";
		}

		## buffer
		{
			mode = "n";
			key = "<leader>bp";
			action = "<cmd>bp<CR>";
		}
		{
			mode = "n";
			key = "<leader>bn";
			action = "<cmd>bn<CR>";
		}
		{
			mode = "n";
			key = "<leader>bd";
			action = "<cmd>bd<CR>";
		}

		## access global clipboard
		{
			mode = "";
			key = "<leader>y";
			action = ''"+y'';
		}
		{
			mode = "";
			key = "<leader>p";
			action = ''"+p'';
		}
		];

  autoCmd = [
  # from https://github.com/GaetanLepage/nix-config/blob/master/home/modules/tui/neovim/autocommands.nix
  # Remove trailing whitespace on save
  {
      event = "BufWrite";
      command = "%s/\\s\\+$//e";
  }

  # Open help in a vertical split
  {
      event = "FileType";
      pattern = "help";
      command = "wincmd L";
  }

  # Set indentation to 2 spaces for nix files
  {
      event = "FileType";
      pattern = "nix";
      command = "setlocal tabstop=2 shiftwidth=2";
  }

  # Enable spellcheck for some filetypes
  {
      event = "FileType";
      pattern = [
	  "tex"
	  "latex"
	  "markdown"
      ];
      command = "setlocal spell spelllang=en,de";
  }
  ];

};
}
