import { With } from "ags";
import { Gtk } from "ags/gtk4";
import Box from "../../components/Box";
import Window from "../../components/Window";
import { Align } from "../../globals";
import { AppList, SearchEntry } from "./components";
import {
  launch,
  list,
  onActivate,
  onKeyPressed,
  onVisible,
  search,
  setEntry,
  setWindow,
  updateList,
} from "./logic";

export default function Launcher() {
  return (
    <Window
      $={setWindow}
      name="launcher"
      class="Launcher"
      visible={false}
      anchor={["TOP", "BOTTOM", "LEFT", "RIGHT"]}
      exclusivity={"IGNORE"}
      keymode={"EXCLUSIVE"}
      onNotifyVisible={onVisible}
    >
      <Gtk.EventControllerKey onKeyPressed={onKeyPressed} />
      <Box
        class="launcher-content"
        valign={"CENTER"}
        halign={"CENTER"}
        orientation={"VERTICAL"}
        widthRequest={400}
        heightRequest={600}
      >
        <SearchEntry
          $={setEntry}
          value={search}
          onChange={updateList}
          onActivate={onActivate}
          widthRequest={400}
          halign={Align.CENTER}
        />
        <AppList apps={list} onLaunch={launch} />
        <With value={list}>
          {(list) =>
            list.length === 0 &&
            search.get() && (
              <label label="No results found" class="launcher-no-results" />
            )
          }
        </With>
      </Box>
    </Window>
  );
}
