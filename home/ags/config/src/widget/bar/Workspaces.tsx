import { createState, For } from "ags";
import AstalHyprland from "gi://AstalHyprland";
import { Cursors } from "../../globals";

type Workspace = {
  id: number;
  name: string;
  active: boolean;
  occupied: boolean;
};

const wpCount = 9;

export default function Workspaces() {
  const hypr = AstalHyprland.get_default();

  const [workspaces, setWorkspaces] = createState<Workspace[]>(
    Array.from({ length: wpCount }, (_, i) => ({
      id: i + 1,
      name: `${i + 1}`,
      active: false,
      occupied: false,
    }))
  );

  const updateWorkspaces = () => {
    const { workspaces: wss, focused_workspace } = hypr;
    setWorkspaces(
      Array.from({ length: wpCount }, (_, i) => {
        const wsId = i + 1;
        const ws = wss.find(({ id }) => id === wsId);
        return {
          id: wsId,
          name: `${i + 1}`,
          active: focused_workspace?.id === wsId,
          occupied: (ws?.clients?.length ?? 0) > 0,
        };
      })
    );
  };

  updateWorkspaces();

  hypr.connect("workspace-added", updateWorkspaces);
  hypr.connect("workspace-removed", updateWorkspaces);
  hypr.connect("client-added", updateWorkspaces);
  hypr.connect("client-removed", updateWorkspaces);
  hypr.connect("notify::focused-workspace", updateWorkspaces);

  return (
    <box class="workspaces" spacing={8}>
      <For each={workspaces}>
        {(workspace) => (
          <button
            class={`workspace ${workspace.active && "active"} ${
              workspace.occupied && "occupied"
            }`}
            onClicked={() => hypr.dispatch("workspace", `${workspace.id}`)}
            cursor={Cursors.Pointer}
            label=""
          />
        )}
      </For>
    </box>
  );
}
