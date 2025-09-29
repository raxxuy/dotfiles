import { Accessor, For } from "ags";
import { Astal } from "ags/gtk4";
import AstalApps from "gi://AstalApps";
import Box from "../../components/Box";

interface AppListProps {
  apps: Accessor<AstalApps.Application[]>;
  onLaunch: (window: Astal.Window | null, app: AstalApps.Application) => void;
}

export default function AppList({ apps, onLaunch }: AppListProps) {
  return (
    <Box class="launcher-list" orientation="VERTICAL">
      <For each={apps}>
        {(app) => (
          <button class="launcher-item" onClicked={() => onLaunch}>
            <box>
              <image iconName={app.iconName} />
              <label label={app.name} maxWidthChars={40} wrap />
            </box>
          </button>
        )}
      </For>
    </Box>
  );
}
