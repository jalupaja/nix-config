{ pkgs, globals, ... }:
{
	tailscale = pkgs.pkgs.writeShellScript "tailscale" ''

		DMENU="${globals.dmenu}"

  status=$(tailscale status)

  if [ "$status" = "Tailscale is stopped." ]; then
      status="start"

      options="$status"
  else
      status="stop"
      options="$status
exit node"

  fi

  chosen=$(echo -e "$options" | $DMENU "Tailscale")

  case "$chosen" in
      "start")
          tailscale up
          ;;
      "stop")
          tailscale down
          ;;
      "exit node")
          current=$(tailscale status | grep '; exit node' | awk '{print $2}')
          if [[ -z "$current" ]]; then
              current="DISABLED"
          fi
          echo "current: $current"

          options=$(tailscale status | grep 'exit node' | awk '{print $2}')
          chosen=$(echo -e "DISABLE\n$options" | $DMENU "$current")
          case "$chosen" in
              "DISABLE")
                  tailscale set --exit-node=
                  ;;
              "")
                  ;;
              *)
                  tailscale set --exit-node="$chosen"
                  ;;
          esac
          ;;
      *)
          ;;
  esac
'';
}
