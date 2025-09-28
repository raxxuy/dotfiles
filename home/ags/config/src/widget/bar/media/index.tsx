import AstalMpris from "gi://AstalMpris";
import { createState, With } from "gnim";
import MediaButton from "./MediaButton";

export default function Media() {
  const mpris = AstalMpris.get_default();
  const [player, setPlayer] = createState<AstalMpris.Player | null>(null);

  const initalizePlayer = () => {
    const player = mpris.players.find(
      (player) => player.identity === "Spotify"
    );

    if (player) setPlayer(player);
  };

  mpris.connect("player-added", (_, player) => {
    if (player.identity === "Spotify") setPlayer(player);
  });

  mpris.connect("player-closed", (_, player) => {
    if (player.busName === "org.mpris.MediaPlayer2.spotify") setPlayer(null);
  });

  initalizePlayer();

  return (
    <box>
      <With value={player}>
        {(player) => (
          <box class="media">
            <MediaButton player={player} />
          </box>
        )}
      </With>
    </box>
  );
}
