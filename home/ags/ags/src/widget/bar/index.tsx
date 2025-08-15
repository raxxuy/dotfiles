import { Gdk } from "ags/gtk4";
import { exclusivitiy, windowAnchors } from "../../globals";
import Workspaces from "./workspaces";

const { TOP, LEFT, RIGHT } = windowAnchors;

export default function Bar(gdkmonitor: Gdk.Monitor) {
  return (
    <window
      visible
      name="bar"
      gdkmonitor={gdkmonitor}
      anchor={TOP | LEFT | RIGHT}
      exclusivity={exclusivitiy.EXCLUSIVE}
    >
      <centerbox>
        <box $type="start" spacing={20}>
        </box>
        <box $type="center" spacing={20}>
          <Workspaces />
        </box>
        <box $type="end" spacing={20}>
        </box>
      </centerbox>
    </window>
  );
}
