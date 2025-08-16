import { With } from "ags";
import { Gtk } from "ags/gtk4";
import {
  align,
  exclusivitiy,
  keymode,
  orientation,
  windowAnchors,
} from "../../globals";
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

const { TOP, BOTTOM, LEFT, RIGHT } = windowAnchors;

export default function Launcher() {
  return (
    <window
      $={(ref) => setWindow(ref)}
      name="launcher"
      anchor={TOP | BOTTOM | LEFT | RIGHT}
      exclusivity={exclusivitiy.IGNORE}
      keymode={keymode.EXCLUSIVE}
      onNotifyVisible={onVisible}
    >
      <Gtk.EventControllerKey onKeyPressed={onKeyPressed} />
      <box
        class="launcher-content"
        valign={align.CENTER}
        halign={align.CENTER}
        orientation={orientation.VERTICAL}
        widthRequest={400}
        heightRequest={600}
      >
        <SearchEntry
          $={(ref) => setEntry(ref)}
          value={search}
          onChange={updateList}
          onActivate={onActivate}
          widthRequest={400}
          halign={align.CENTER}
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
      </box>
    </window>
  );
}
