import { Gtk } from "ags/gtk4";
import AstalTray from "gi://AstalTray";
import { createBinding, For } from "gnim";

export default function Tray() {
  const tray = AstalTray.get_default();
  const items = createBinding(tray, "items");

  const init = (btn: Gtk.MenuButton, item: AstalTray.TrayItem) => {
    btn.menuModel = item.menuModel;
    btn.popover.hasArrow = false;
    btn.insert_action_group("dbusmenu", item.actionGroup);
    item.connect("notify::action-group", () => {
      btn.insert_action_group("dbusmenu", item.actionGroup);
    });
  };

  return (
    <box class="tray" visible={items((i) => i.length > 0)} spacing={8}>
      <For each={items}>
        {(item) => (
          <menubutton class="tray-item" $={(self) => init(self, item)}>
            <image gicon={createBinding(item, "gicon")} />
          </menubutton>
        )}
      </For>
    </box>
  );
}
