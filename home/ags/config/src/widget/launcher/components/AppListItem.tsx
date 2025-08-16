import AstalApps from "gi://AstalApps";

interface AppListItemProps {
  app: AstalApps.Application;
  onLaunch: (app: AstalApps.Application) => void;
}

export default function AppListItem({ app, onLaunch }: AppListItemProps) {
  return (
    <button class="launcher-item" onClicked={() => onLaunch(app)}>
      <box>
        <image iconName={app.iconName} />
        <label label={app.name} maxWidthChars={40} wrap />
      </box>
    </button>
  );
}