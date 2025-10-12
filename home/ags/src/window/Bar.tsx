import { Gdk } from "ags/gtk4";
import Window from "../components/Window";

export default function Bar(gdkmonitor: Gdk.Monitor) {
  return (
    <Window
      name="bar"
      class="Bar"
      gdkmonitor={gdkmonitor}
      exclusivity={"EXCLUSIVE"}
      anchor={["TOP", "LEFT", "RIGHT"]}
    >
      <centerbox cssName="centerbox"></centerbox>
    </Window>
  );
}
