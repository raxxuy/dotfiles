import { Gdk } from "ags/gtk4";
import Window from "../components/Window";
import Clock from "../widget/bar/Clock";
import Media from "../widget/bar/Media";
import Menu from "../widget/bar/Menu";
import Workspaces from "../widget/bar/Workspaces";

export default function Bar(gdkmonitor: Gdk.Monitor) {
  return (
    <Window
      name="bar"
      class="Bar"
      gdkmonitor={gdkmonitor}
      exclusivity={"EXCLUSIVE"}
      anchor={["TOP", "LEFT", "RIGHT"]}
    >
      <centerbox cssName="centerbox">
        <box class="container" name="start" $type="start">
          <Workspaces />
        </box>
        <box class="container" name="center" $type="center">
          <Clock />
        </box>
        <box class="container" name="end" $type="end">
          <Media />
          <Menu />
        </box>
      </centerbox>
    </Window>
  );
}
