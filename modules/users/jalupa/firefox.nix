{pkgs, addons, ...}:
let 
  updateInterval = 32 * 24 * 60 * 60 * 1000; # search about monthly
  gh_search = 
  {type, alias, personal ? false, addAliases ? [],...}: 
  let
    title = "GitHub ${type}"+ (if personal then " personal" else ""); 
  in
  {
    "${title}" = {
      urls =  [{
        template = "https://github.com/search";
        params = [
          {name = "q"; value = if personal then "owner:jalupaja+{searchTerms}" else ""+"{searchTerms}";}
          {name = "type"; value = type;}
        ];
      }];
      definedAliases = [ ("<gh" + (if personal then "p" else "") +"${alias}") ] ++ addAliases;
      iconUpdateURL = "https://github.githubassets.com/assets/pinned-octocat-093da3e6fa40.svg";
      inherit updateInterval;
    };
  };

settings = {
    # TODO ??? https://github.com/dwarfmaster/arkenfox-nixos

    # These settings are an alternation from arkenfox
    # https://github.com/arkenfox/user.js/blob/master/user.js

    # startup page
    "browser.startup.page" = 0;
    "browser.startup.homepage" = "about:blank";

    # remove sponsored content
    "browser.newtabpage.activity-stream.showSponsored" = false;
"browser.newtabpage.activity-stream.showSponsoredTopSites" = false;

    # Geo location
};

in
  {
    programs.firefox.enable = true;
    programs.firefox.profiles.research = {
      isDefault = true;
      id = 0;
      name = "research";
      extensions = with addons; [ublock-origin];
      search = {
        force = true;
        default = "bravesearch";
        engines = {
          "Nix Packages" = {
            urls = [{
              template = "https://search.nixos.org/packages";
              params = [
                { name = "type"; value = "packages"; }
                { name = "query"; value = "{searchTerms}"; }
              ];
            }];
            icon = "''${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
            definedAliases = [ "<np" ];
          };

          "Nix Options" = {
            urls = [{
              template = "https://search.nixos.org/options";
              params = [
                { name = "type"; value = "packages"; }
                { name = "query"; value = "{searchTerms}"; }
              ];
            }];
            icon = "''${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
            definedAliases = [ "<no" ];
          };

          "Nix noogle" = {
            urls = [{
              template = "https://noogle.dev/";
              params = [
                { name = "term"; value = "{searchTerms}"; }
              ];
            }];
            icon = "''${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
            definedAliases = [ "<nop" ];
          };

              "Nix Hound" = {
                urls = [{
                  template = "https://search.nix.gsc.io/";
                  params = [
                    { name = "q"; value = "{searchTerms}"; }
                  ];
                }];
                icon = "''${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
                definedAliases = [ "<nh" ];
              };
              "NixOS Wiki" = {
                urls = [{ template = "https://nixos.wiki/index.php?search={searchTerms}"; }];
                iconUpdateURL = "https://nixos.wiki/favicon.png";
                inherit updateInterval;
                definedAliases = [ "<nw" ];
              };

              "Home Manager Option Search" = {
                urls = [{ template = "https://mipmip.github.io/home-manager-option-search/?query={searchTerms}"; }];
                iconUpdateURL = "https://nixos.wiki/favicon.png";
                inherit updateInterval;
                definedAliases = [ "<ho" ];
              };

              "Rust Std" = {
                urls = [{ template = "https://doc.rust-lang.org/std/?search={searchTerms}"; }];
                iconUpdateURL = "https://www.rust-lang.org/static/images/rust-logo-blk.svg";
                inherit updateInterval;
                definedAliases = [ "<rsd" ];
              };

              "Crates.io" = {
                urls = [{ template = "https://crates.io/search?q={searchTerms}"; }];
                iconUpdateURL = "https://crates.io/assets/cargo.png";
                inherit updateInterval;
                definedAliases = [ "<cr" ];
              };

              "Pip / PyPi" = {
                urls = [{ template = "https://pypi.org/search/?q={searchTerms}"; }];
                iconUpdateURL = "https://www.python.org/static/opengraph-icon-200x200.png";
                inherit updateInterval;
                definedAliases = [ "<pip" "<py" ];
              };

              "Wikipedia DE" = {
                urls = [{
                  template = "https://de.wikipedia.org/wiki/{searchTerms}";
                }];
                iconUpdateURL = "https://upload.wikimedia.org/wikipedia/commons/5/5a/Wikipedia%27s_W.svg";
                inherit updateInterval;
                definedAliases = [ "<wd" ];
              };

              "Wikipedia EN" = {
                urls = [{
                  template = "https://en.wikipedia.org/wiki/{searchTerms}";
                }];
                iconUpdateURL = "https://upload.wikimedia.org/wikipedia/commons/5/5a/Wikipedia%27s_W.svg";
                inherit updateInterval;
                definedAliases = [ "<we" ];
              };

              "Invidious (nerdvpn.de)" ={
                urls = [{
                  template = "https://invidious.nerdvpn.de/search?q={searchTerms}";
                }];
                iconUpdateURL = "https://docs.invidious.io/images/invidious.png";
                inherit updateInterval;
                definedAliases = [ "<yt" "<inv" ];
              };

              "Startpage" = {
                urls =  [{
                  template = "https://www.startpage.com/sp/search";
                  params = [
                    {name = "query"; value = "{searchTerms}";}
                    {name = "cat"; value = "web";}
                  ];
                }];
                definedAliases = [ "<sp" ];
                iconUpdateURL = "https://www.startpage.com/sp/cdn/images/startpage-logo-gradient-dark.svg";
                inherit updateInterval;
              };

                  "DuckDuckGo" = {
                    urls = [{
                      template = "https://duckduckgo.com";
                      params = [
                        {name = "t"; value = "ffab";}
                        {name = "ia"; value = "web";}
                        {name = "q"; value = "{searchTerms}";}
                      ];
                    }];
                    iconUpdateURL = "https://duckduckgo.com/duckduckgo-help-pages/logo.v109.svg";
                    inherit updateInterval;
                    definedAliases = [ "<ddg" ];
                  };

                  "alternativeto.net" = {
                    urls = [{template = "https://alternativeto.net/browse/search/?q={searchTerms}";}];
                    iconUpdateURL = "https://cdn-1.webcatalog.io/catalog/alternativeto/alternativeto-icon-filled.png";
                    inherit updateInterval;
                    definedAliases = [ "<alto" ];
                  };

                  "ddg" = {
                    urls = [{template = "https://duckduckgo.com/?t=h_&q={searchTerms}&ia=web";}];
                    iconUpdateURL = "https://duckduckgo.com/favicon.ico";
                    inherit updateInterval;
                    definedAliases = [ "<ddg" ];
                  };

                  "ecosia" = {
                    urls = [{template = "https://www.ecosia.org/search?method=index&q={searchTerms}";}];
                    iconUpdateURL = "https://www.ecosia.org/favicon.ico";
                    inherit updateInterval;
                    definedAliases = [ "<e" ];
                  };

                  "bravesearch" = {
                    urls = [{template = "https://search.brave.com/search?q={searchTerms}&source=web";}];
                    iconUpdateURL = "https://brave.com/favicon.ico";
                    inherit updateInterval;
                    definedAliases = [ "<b" ];
                  };
                }
                //  gh_search ({type="repositories"; alias="r"; addAlias = "gh";}) #<ghr or <gh
                //  gh_search ({type="users"; alias="u";}) #<ghu

                //  gh_search ({type="repositories"; alias="r"; personal = true; addAlias  = "ghp";}) #<ghpr or <ghp
                //  gh_search ({type="users"; alias="u";personal = true;}) #<ghpu
                //  gh_search ({type="issues"; alias="i";personal = true;}) #<ghpi
                ;
              };
	      settings = settings;
            };
            programs.firefox.profiles.shopping = {
              id = 1;
              name = "shopping";
              extensions = with addons; [ublock-origin bitwarden];
              search = {
                force = true;
                default = "ddg";
                engines = {
                  "ddg" = {
                    urls = [{template = "https://duckduckgo.com/?t=h_&q={searchTerms}&ia=web";}];
                    iconUpdateURL = "https://duckduckgo.com/favicon.ico";
                    inherit updateInterval;
                    definedAliases = [ "<ddg" ];
                  };

                  "brave" = {
                    urls = [{template = "https://search.brave.com/search?q={searchTerms}&source=web";}];
                    iconUpdateURL = "https://brave.com/favicon.ico";
                    inherit updateInterval;
                    definedAliases = [ "<b" ];
                  };
                };
              };
	      settings = settings;
            };
            programs.firefox.profiles.uni = {
              id = 2;
              name = "uni";
              extensions = with addons; [ublock-origin bitwarden];
              search = {
                force = true;
                default = "ddg";
                engines = {
                  "ddg" = {
                    urls = [{template = "https://duckduckgo.com/?t=h_&q={searchTerms}&ia=web";}];
                    iconUpdateURL = "https://duckduckgo.com/favicon.ico";
                    inherit updateInterval;
                    definedAliases = [ "<ddg" ];
                  };

		  "brave" = {
		      urls = [{template = "https://search.brave.com/search?q={searchTerms}&source=web";}];
		      iconUpdateURL = "https://brave.com/favicon.ico";
		      inherit updateInterval;
		      definedAliases = [ "<b" ];
		  };
		};
	      };
	      bookmarks = [  
	      {    
		  name = "OTH";    
		  toolbar = false;    
		  bookmarks = [      
		  {        
		      name = "Infoboard";        
		      url = "https://elearning.oth-regensburg.de/course/view.php?id=3696";      
		  }    
		  {        
		      name = "Mail";        
		      url = "https://exchange.hs-regensburg.de";
		  }      
		  {        
		      name = "Studiuservice, QIS";        
		      url = "https://hisinone-studium.oth-regensburg.de";      
		  }    
		  {        
		      name = "Cloud";        
		      url = "https://cloud.fsim-ev.de";      
		  }    
		  {        
		      name = "Webuntis";        
		      tags = [ "untis" ];
		      url = "https://untis.oth-regensburg.de";      
		  }    
		  {        
		      name = "Prüfungsterminplanung";        
		      url = "https://java.oth-regensburg.de/ptp/index.xhtml";      
		  }    
		  {        
		      name = "Elearning";        
		      url = "https://elearning.hs-regensburg.de";      
		  }    
		  {        
		      name = "Semesterzeiten";        
		      url = "https://www.oth-regensburg.de/die-oth/termine-und-oeffnungszeiten";      
		  }    
		  ];  
	      }
	      ];
	      settings = settings;
	    };
	    programs.firefox.profiles.github = {
		id = 3;
		name = "github";
              extensions = with addons; [ublock-origin];
              search = {
                force = true;
                default = "bravesearch";
                engines = {
                  "ddg" = {
                    urls = [{template = "https://duckduckgo.com/?t=h_&q={searchTerms}&ia=web";}];
                    iconUpdateURL = "https://duckduckgo.com/favicon.ico";
                    inherit updateInterval;
                    definedAliases = [ "<ddg" ];
                  };

                  "bravesearch" = {
                    urls = [{template = "https://search.brave.com/search?q={searchTerms}&source=web";}];
                    iconUpdateURL = "https://brave.com/favicon.ico";
                    inherit updateInterval;
                    definedAliases = [ "<b" ];
                  };
                };
              };
	      settings = settings;
            };
          }

