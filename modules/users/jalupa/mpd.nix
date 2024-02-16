{ pkgs, ... }:
let 
  musicDir = "~/Music";
in
{
  services.mpd = {
    enable = true;
    musicDirectory = "${musicDir}";
    #playlistDirectory = "${musicDir}/playlists";

    extraConfig = ''
      audio_output {
        type p
        }
    '';
  };

  programs.ncmpcpp = {
    enable = true;

    mpdMusicDir = "${musicDir}";
  };
}
