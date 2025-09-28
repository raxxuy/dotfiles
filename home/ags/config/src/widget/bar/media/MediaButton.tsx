import AstalMpris from "gi://AstalMpris";
import Pango from "gi://Pango";
import { createBinding, createComputed, With } from "gnim";
import { Cursors } from "../../../globals";

interface MediaButtonProps {
  player: AstalMpris.Player | null;
}

const icons = ["", "", ""];

export default function MediaButton({ player }: MediaButtonProps) {
  const handlePlayback = () => {
    player?.play_pause();
  };

  const computed = createComputed(
    [createBinding(player!, "title"), createBinding(player!, "playbackStatus")],
    (title, playback) => (
      <box>
        <button
          class="media-playback"
          cursor={Cursors.Pointer}
          onClicked={handlePlayback}
        >
          {icons[playback]}
        </button>
        {"  "}
        <label
          class="media-title"
          maxWidthChars={30}
          ellipsize={Pango.EllipsizeMode.END}
          label={title}
        />
      </box>
    )
  );

  return player ? (
    <With value={computed}>{(computed) => computed}</With>
  ) : (
    <label class="media-no-player" label={"No player currently"} />
  );
}
