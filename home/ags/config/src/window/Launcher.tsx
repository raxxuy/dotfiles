import { Astal, Gtk } from "ags/gtk4";
import { createState } from "gnim";
import Window from "../components/Window";
import Main from "../widget/launcher/Main";

export default function Launcher() {
  const [window, setWindow] = createState<Astal.Window | null>(null);
  const [entry, setEntry] = createState<Gtk.Entry | null>(null);

  const handleNotifyVisible = (source: Astal.Window) => {
    if (source.visible) entry.get()?.grab_focus();
    else entry.get()?.set_text("");
  };

  return (
    <Window
      $={setWindow}
      visible={false}
      name="launcher"
      class="Launcher"
      anchor={["TOP", "BOTTOM", "LEFT", "RIGHT"]}
      exclusivity="IGNORE"
      keymode="EXCLUSIVE"
      onNotifyVisible={handleNotifyVisible}
    >
      <Main window={window} entry={entry} setEntry={setEntry} />
    </Window>
  );
}
