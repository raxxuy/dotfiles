import AstalMpris from "gi://AstalMpris";
import Pango from "gi://Pango";
import { createBinding, createComputed } from "gnim";
import { Cursors } from "../../../globals";

interface MediaButtonProps {
  player: AstalMpris.Player | null;
}

const icons = ["", "", ""];

export default function MediaButton({ player }: MediaButtonProps) {
  const handlePlayback = () => {
    player?.play_pause();
  };

  const fullTitle = createComputed(
    [createBinding(player!, "title"), createBinding(player!, "artist")],
    (title, artist) => `${title} - ${artist}`
  );

  return player ? (
    <>
      <button
        class="media-playback"
        cursor={Cursors.Pointer}
        onClicked={handlePlayback}
        label={createBinding(player, "playbackStatus")((p) => icons[p])}
      />
      <label
        class="media-title"
        tooltipText={fullTitle}
        maxWidthChars={30}
        ellipsize={Pango.EllipsizeMode.END}
        label={createBinding(player, "title")}
      />
    </>
  ) : (
    <label class="media-no-player" label={"No player currently"} />
  );
}
