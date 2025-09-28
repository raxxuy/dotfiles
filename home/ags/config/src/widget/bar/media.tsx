import AstalMpris from "gi://AstalMpris";
import Pango from "gi://Pango";
import { createBinding, createComputed, createState, With } from "gnim";

const icons = ["", "", ""];

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
    <menubutton class="media">
      <With value={player}>
        {(player) =>
          player ? (
            <label
              class="media-title"
              maxWidthChars={30}
              ellipsize={Pango.EllipsizeMode.END}
              label={createComputed(
                [
                  createBinding(player, "title"),
                  createBinding(player, "playbackStatus"),
                ],
                (title, playback) => `${icons[playback]}  ${title}`
              )}
            />
          ) : (
            <label class="media-no-player" label={"No player currently"} />
          )
        }
      </With>
      <popover />
    </menubutton>
  );
}
