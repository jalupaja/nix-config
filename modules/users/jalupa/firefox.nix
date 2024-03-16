{ pkgs, lib, addons, ...}:
let 
updateInterval = 32 * 24 * 60 * 60 * 1000; # search about monthly

favicon = domain: "https://${domain}/favicon.ico";
# Search engines
search = {
    "Nix Packages" = {
	urls = [{
	    template = "https://search.nixos.org/packages";
	    params = [
	    { name = "type"; value = "packages"; }
	    { name = "query"; value = "{searchTerms}"; }
	    ];
	}];
	iconUpdateURL = favicon("search.nixos.org");
	inherit updateInterval;
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
	iconUpdateURL = favicon("search.nixos.org");
	inherit updateInterval;
	definedAliases = [ "<no" ];
    };

    "Nix noogle" = {
	urls = [{
	    template = "https://noogle.dev/";
	    params = [
	    { name = "term"; value = "{searchTerms}"; }
	    ];
	}];
	iconUpdateURL = favicon("noogle.dev");
	inherit updateInterval;
	definedAliases = [ "<nop" ];
    };

    "Nix Hound" = {
	urls = [{
	    template = "https://search.nix.gsc.io/";
	    params = [
	    { name = "q"; value = "{searchTerms}"; }
	    ];
	}];
	iconUpdateURL = favicon("search.nix.gsc.io");
	inherit updateInterval;
	definedAliases = [ "<nh" ];
    };
    "NixOS Wiki" = {
	urls = [{ template = "https://nixos.wiki/index.php?search={searchTerms}"; }];
	iconUpdateURL = favicon("nixos.wiki");
	inherit updateInterval;
	definedAliases = [ "<nw" ];
    };

    "Home Manager Option Search" = {
	urls = [{ template = "https://mipmip.github.io/home-manager-option-search/?query={searchTerms}"; }];
	iconUpdateURL = favicon("nixos.wiki");
	inherit updateInterval;
	definedAliases = [ "<ho" ];
    };

    "Rust Std" = {
	urls = [{ template = "https://doc.rust-lang.org/std/?search={searchTerms}"; }];
	iconUpdateURL = favicon("rust-lang.org");
	inherit updateInterval;
	definedAliases = [ "<rsd" ];
    };

    "Crates.io" = {
	urls = [{ template = "https://crates.io/search?q={searchTerms}"; }];
	iconUpdateURL = favicon("crates.io");
	inherit updateInterval;
	definedAliases = [ "<cr" ];
    };

    "Pip / PyPi" = {
	urls = [{ template = "https://pypi.org/search/?q={searchTerms}"; }];
	iconUpdateURL = favicon("python.org");
	inherit updateInterval;
	definedAliases = [ "<pip" "<py" ];
    };

    "wiki DE" = {
	urls = [{
	    template = "https://de.wikipedia.org/wiki/{searchTerms}";
	}];
	iconUpdateURL = favicon("wikipedia.org");
	inherit updateInterval;
	definedAliases = [ "<wd" ];
    };

    "wiki EN" = {
	urls = [{
	    template = "https://en.wikipedia.org/wiki/{searchTerms}";
	}];
	iconUpdateURL = favicon("wikipedia.org");
	inherit updateInterval;
	definedAliases = [ "<we" ];
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
	iconUpdateURL = favicon("startpage.com");
	inherit updateInterval;
    };

    "alternativeto.net" = {
	urls = [{template = "https://alternativeto.net/browse/search/?q={searchTerms}";}];
	iconUpdateURL = favicon("alternativeto.net");
	inherit updateInterval;
	definedAliases = [ "<alto" ];
    };

    "ddg" = {
	urls = [{template = "https://duckduckgo.com/?t=h_&q={searchTerms}&ia=web";}];
	iconUpdateURL = favicon("duckduckgo.com");
	inherit updateInterval;
	definedAliases = [ "<ddg" ];
    };

    "ecosia" = {
	urls = [{template = "https://www.ecosia.org/search?method=index&q={searchTerms}";}];
	iconUpdateURL = favicon("ecosia.org");
	inherit updateInterval;
	definedAliases = [ "<e" ];
    };

    "brave" = {
	urls = [{template = "https://search.brave.com/search?q={searchTerms}&source=web";}];
	iconUpdateURL = favicon("brave.com");
	inherit updateInterval;
	definedAliases = [ "<b" ];
    };
};

settings = {
    # These settings are an alternation from arkenfox
    # https://github.com/arkenfox/user.js/blob/master/user.js

    # startup page
    "browser.startup.page" = 0;
    "browser.startup.homepage" = "about:blank";

    # remove sponsored content
    "browser.newtabpage.activity-stream.showSponsored" = false;
    "browser.newtabpage.activity-stream.showSponsoredTopSites" = false;
    "browser.newtabpage.activity-stream.default.sites" = "";

    # Geo location
    "geo.provider.network.url" = "https://location.services.mozilla.com/v1/geolocate?key=%MOZILLA_API_KEY%";
    "geo.provider.use_gpsd" = false;
    "geo.provider.use_geoclue" = false;

    # Quieter Fox
    "extensions.getAddons.showPane" = false;
    "extensions.htmlaboutaddons.recommendations.enabled" = false;
    "browser.discovery.enabled" = false;
    "browser.shopping.experience2023.enabled" = false;

    # Telemetry
    "datareporting.policy.dataSubmissionEnabled" = false;
    "datareporting.healthreport.uploadEnabled" = false;
    "toolkit.telemetry.unified" = false;
    "toolkit.telemetry.enabled" = false;
    "toolkit.telemetry.server" = "data:,";
    "toolkit.telemetry.archive.enabled" = false;
    "toolkit.telemetry.newProfilePing.enabled" = false;
    "toolkit.telemetry.shutdownPingSender.enabled" = false;
    "toolkit.telemetry.updatePing.enabled" = false;
    "toolkit.telemetry.bhrPing.enabled" = false;
    "toolkit.telemetry.firstShutdownPing.enabled" = false;
    "toolkit.telemetry.coverage.opt-out" = true;
    "toolkit.coverage.opt-out" = true;
    "toolkit.coverage.endpoint.base" = "";
    "browser.ping-centre.telemetry" = false;
    "browser.newtabpage.activity-stream.feeds.telemetry" = false;
    "browser.newtabpage.activity-stream.telemetry" = false;

    # Studies
    "app.shield.optoutstudies.enabled" = false;
    "app.normandy.enabled" = false;
    "app.normandy.api_url" = "";

    # Crash reports
    "breakpad.reportURL" = "";
    "browser.tabs.crashReporting.sendReport" = false;
    "browser.crashReports.unsubmittedCheck.autoSubmit2" = false;

    # Other
    "captivedetect.canonicalURL" = "";
    "network.captive-portal-service.enabled" = false;
    "network.connectivity-service.enabled" = false;

    # Safe Browsing
    "browser.safebrowsing.downloads.remote.enabled" = false;

    # Block implicit outbound
    "network.prefetch-next" = false;
    "network.dns.disablePrefetch" = true;
    "network.predictor.enabled" = false;
    "network.predictor.enable-prefetch" = false;
    "network.http.speculative-parallel-limit" = 0;
    "browser.places.speculativeConnect.enabled" = false;

    # DNS / DoH / PROXY / SOCKS
    "network.proxy.socks_remote_dns" = true;
    "network.file.disable_unc_paths" = true;
    "network.gio.supported-protocols" = "";

    # LOCATION BAR / SEARCH BAR / SUGGESTIONS / HISTORY / FORMS
    "browser.urlbar.speculativeConnect.enabled" = false;
    "browser.urlbar.suggest.quicksuggest.nonsponsored" = false;
    "browser.urlbar.suggest.quicksuggest.sponsored" = false;
    "browser.search.suggest.enabled" = false;
    "browser.urlbar.suggest.searches" = false;
    "browser.urlbar.trending.featureGate" = false;
    "browser.urlbar.addons.featureGate" = false;
    "browser.urlbar.mdn.featureGate" = false;
    "browser.urlbar.pocket.featureGate" = false;
    "browser.urlbar.weather.featureGate" = false;
    "browser.formfill.enable" = false;
    "browser.search.separatePrivateDefault" = false; # CHANGED
    "browser.search.separatePrivateDefault.ui.enabled" = true;

    # Passwords
    "signon.autofillForms" = false;
    "signon.formlessCapture.enabled" = false;
    "network.auth.subresource-http-auth-allow" = 1;

    # Disk Avoidance
    "browser.cache.disk.enable" = false;
    "browser.privatebrowsing.forceMediaMemoryCache" = true;
    "media.memory_cache_max_size" = 65536;
    "browser.sessionstore.privacy_level" = 2;
    "toolkit.winRegisterApplicationRestart" = false;
    "browser.shell.shortcutFavicons" = false;

    # HTTPS
    "security.ssl.require_safe_negotiation" = true;
    "security.tls.enable_0rtt_data" = true;
    "security.OCSP.enabled" = 1;
    "security.OCSP.require" = true;
    "security.cert_pinning.enforcement_level" = 2;
    "security.remote_settings.crlite_filters.enabled" = true;
    "security.pki.crlite_mode" = 2;

    # Mixed Content
    "dom.security.https_only_mode" = true;
    "dom.security.https_only_mode_send_http_background_request" = false;
    "security.ssl.treat_unsafe_negotiation_as_broken" = true;
    "browser.xul.error_pages.expert_bad_cert" = true;

    # Referers
    "network.http.referer.XOriginTrimmingPolicy" = 2;

    # Containers
    "privacy.userContext.enabled" = true;
    "privacy.userContext.ui.enabled" = true;

    # Plugins / Media / WebRTC
    "media.peerconnection.ice.proxy_only_if_behind_proxy" = true;
    "media.peerconnection.ice.default_address_only" = true;

    # DOM
    "dom.disable_window_move_resize" = true;

    # Misc
    "browser.download.start_downloads_in_tmp_dir" = true;
    "browser.helperApps.deleteTempFileOnExit" = true;
    "browser.uitour.enabled" = true;
    "devtools.debugger.remote-enabled" = false;
    "permissions.manager.defaultsUrl" = "";
    "webchannel.allowObject.urlWhitelist" = "";
    "network.IDN_show_punycode" = true;
    "pdfjs.disabled" = false;
    "pdfjs.enableScripting" = false;
    "browser.tabs.searchclipboardfor.middleclick" = false;

    # Downloads
    "browser.download.useDownloadDir" = false;
    "browser.download.alwaysOpenPanel" = false;
    "browser.download.manager.addToRecentDocs" = false;
    "browser.download.always_ask_before_handling_new_types" = true;

    # Extensions
    "extensions.enabledScopes" = 5;
    "extensions.postDownloadThirdPartyPrompt" = false;

    # Enhanced Tracking Protection
    "browser.contentblocking.category" = "strict";

    # Sanitize on Shutdown
    "privacy.clearOnShutdown.cache" = true;
    "privacy.clearOnShutdown.downloads" = true;
    "privacy.clearOnShutdown.formdata" = true;
    "privacy.clearOnShutdown.history" = true;
    "privacy.clearOnShutdown.sessions" = true;
    "privacy.clearOnShutdown.cookies" = true;
    "privacy.clearOnShutdown.offlineApps" = true;

    # Ignore "ALLOW" site exception
    "privacy.cpd.cache" = false; # CHANGED
    "privacy.cpd.formdata" = true;
    "privacy.cpd.history" = true;
    "privacy.cpd.sessions" = false; # CHANGED
    "privacy.cpd.offlineApps" = false; # CHANGED
    "privacy.cpd.cookiesApps" = false; # CHANGED
    "privacy.sanitize.timeSpan" = 0;

    # FPP
    "privacy.resistFingerprinting" = true;
    #"privacy.window.maxInnerWidth" = 1600; # CHANGED
    #"privacy.window.maxInnerHeight" = 900; # CHANGED
    "privacy.resistFingerprinting.block_mozAddonManager" = true;
    "privacy.resistFingerprinting.letterboxing" = true;
    "browser.display.use_system_colors" = false;
    "widget.non-native-theme.enabled" = true;
    "browser.link.open_newwindow" = 3;
    "browser.link.open_newwindow.restriction" = 0;
    "webgl.disabled" = true; # false if Netflix/Streaming is needed

    # Don't touch
    "extensions.blocklist.enabled" = true;
    "network.http.referer.spoofSource" = false;
    "security.dialog_enable_delay" = 1000;
    "privacy.firstparty.isolate" = false;
    "extensions.webcompat.enable_shims" = true;
    "security.tls.version.enable-deprecated" = false;
    "extensions.webcompat-reporter.enabled" = false;
    "extensions.quarantinedDomains.enabled" = true;

    # non-project related
    "browser.startup.homepage_override.mstone" = "ignore";
    "browser.newtabpage.activity-stream.asrouter.userprefs.cfr.addons" = false;
    "browser.newtabpage.activity-stream.asrouter.userprefs.cfr.features" = false;
    "browser.messaging-system.whatsNewPanel.enabled" = false;
    "browser.urlbar.showSearchTerms.enabled" = false;
};

in
{
    programs.firefox = {
	enable = true;

	profiles = {
	    research = {
		isDefault = true;
		id = 0;
		name = "research";
		extensions = with addons; [ vim-vixen ublock-origin darkreader ];
		search = {
		    force = true;
		    default = "bravesearch";
		    engines = {
			"bravesearch" = search.brave;
			"DuckDuckGo" = search.ddg;
			"Startpage" = search.Startpage;
			"Ecosia" = search.ecosia;

			"Wikipedia" = search."wiki EN";
			"alternativeto" = search."alternativeto.net";

			"Nix Packages" = search."Nix Packages";
			"Nix Options" = search."Nix Options";
			"Nix noogle" = search."Nix noogle";
			"Nix Hound" = search."Nix Hound";
			"NixOS Wiki" = search."NixOS Wiki";
			"Home Manager Option Search" = search."Home Manager Option Search";
		    };
		};
		settings = settings;
	    };
	    shopping = {
		id = 1;
		name = "shopping";
		extensions = with addons; [ vim-vixen ublock-origin bitwarden multi-account-containers ];
		search = {
		    force = true;
		    default = "DuckDuckGo";
		    engines = {
			"brave" = search.brave;
			"DuckDuckGo" = search.ddg;
			"Startpage" = search.Startpage;
		    };
		};
		containers = {
		    "research" = {
			name = "research";
			id = 0;
			color = "green";
			icon = "chill";
		    };
		    "shopping" = {
			name = "shopping";
			id = 1;
			color = "red";
			icon = "cart";
		    };
		};
		settings = settings;
	    };
	    uni = {
		id = 2;
		name = "uni";
		extensions = with addons; [ vim-vixen ublock-origin bitwarden ];
		search = {
		    force = true;
		    default = "ddg";
		    engines = {
			"brave" = search.brave;
			"DuckDuckGo" = search.ddg;
			"Startpage" = search.Startpage;
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
	    github = {
		id = 3;
		name = "github";
		extensions = with addons; [ vim-vixen ublock-origin ];
		search = {
		    force = true;
		    default = "bravesearch";
		    engines = {
			"bravesearch" = search.brave;
			"DuckDuckGo" = search.ddg;
			"Startpage" = search.Startpage;
		    };
		};
		settings = settings;
	    };
	};
    };
}
