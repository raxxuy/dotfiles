import { Accessor, For } from "ags";
import AstalApps from "gi://AstalApps";
import { Orientation } from "../../../globals";
import AppListItem from "./AppListItem";

interface AppListProps {
  apps: Accessor<AstalApps.Application[]>;
  onLaunch: (app: AstalApps.Application) => void;
}

export default function AppList({ apps, onLaunch }: AppListProps) {
  return (
    <box class="launcher-list" orientation={Orientation.VERTICAL}>
      <For each={apps}>
        {(app) => <AppListItem app={app} onLaunch={onLaunch} />}
      </For>
    </box>
  );
}