import { Astal, Gdk, Gtk } from "ags/gtk4";
import AstalApps from "gi://AstalApps";
import { Accessor, createComputed, createState, Setter, With } from "gnim";
import Box from "../../components/Box";
import { Cursors, ModifierType } from "../../globals";
import AppList from "./AppList";
import SearchEntry from "./SearchEntry";

interface MainProps {
  window: Accessor<Astal.Window | null>;
  entry: Accessor<Gtk.Entry | null>;
  setEntry: Setter<Gtk.Entry | null>;
}

const specialKeys = [Gdk.KEY_Shift_L, Gdk.KEY_Super_L, Gdk.KEY_Control_L];

export default function Main({ window, entry, setEntry }: MainProps) {
  const apps = new AstalApps.Apps();
  const [search, setSearch] = createState<string>("");
  const [current, setCurrent] = createState<number>(0);
  const [focused, setFocused] = createState<boolean>(false);
  const [list, setList] = createState<AstalApps.Application[]>([]);

  const updateList = (content: string, icon: Gtk.Widget | null) => {
    setList(content ? apps.fuzzy_query(content).slice(0, 8) : []);
    setSearch(content);
    setCurrent(0);

    if (icon) {
      icon.cursor = content ? Cursors.Pointer : Cursors.Default;
    }
  };

  const onActivate = () => {
    const currentList = list.get();
    if (currentList.length > 0) {
      launch(window.get(), currentList[current.get()]);
    }
  };

  const launch = (window: Astal.Window | null, app: AstalApps.Application) => {
    window?.hide();
    app.launch();
  };

  const handleKeyPressed = (
    _e: Gtk.EventControllerKey,
    key: number,
    _: number,
    mod: number
  ) => {
    const currentList = list.get();
    const length = currentList.length;

    console.log(search.get());

    if (key === Gdk.KEY_Escape) {
      window.get()?.hide();
      return;
    }

    if (mod === ModifierType.ALT_MASK) {
      for (const i of [1, 2, 3, 4, 5, 6, 7, 8, 9] as const) {
        if (key === Gdk[`KEY_${i}`] && length >= i) {
          launch(window.get(), currentList[i - 1]);
          return;
        }
      }
    }

    if (key === Gdk.KEY_Down && length) {
      setCurrent((current.get() + 1) % length);
      setFocused(false);
      return;
    }

    if (key === Gdk.KEY_Up && length) {
      setCurrent((current.get() - 1 + length) % length);
      if (current.get() === 0) setFocused(true);
      return;
    }

    if (key === Gdk.KEY_Return && length) {
      launch(window.get(), currentList[current.get()]);
      return;
    }

    const isTyping =
      [ModifierType.NO_MODIFIER_MASK, ModifierType.LOCK_MASK].includes(mod) &&
      ![Gdk.KEY_Left, Gdk.KEY_Right].includes(key) &&
      !focused.get();

    if (isTyping) {
      setFocused(true);

      if (key === Gdk.KEY_BackSpace && entry) {
        const currentText = entry.get()?.text ?? "";
        entry.get()?.set_text(currentText.slice(0, -1));
      } else if (!specialKeys.includes(key) && entry) {
        const currentText = entry.get()?.text ?? "";
        entry.get()?.set_text(currentText + String.fromCharCode(key));
      }

      entry.get()?.grab_focus_without_selecting();
      entry.get()?.select_region(-1, -1);
    }
  };

  return (
    <>
      <Gtk.EventControllerKey onKeyPressed={handleKeyPressed} />
      <Box
        class="launcher-content"
        valign="CENTER"
        halign="CENTER"
        orientation="VERTICAL"
        widthRequest={400}
        heightRequest={600}
      >
        <SearchEntry
          value={search}
          setEntry={setEntry}
          onChange={updateList}
          onActivate={onActivate}
        />
        <AppList apps={list} onLaunch={launch} />
        <With
          value={createComputed(
            [list, search],
            (list, search) => list.length === 0 && search.length > 0
          )}
        >
          {(flag) =>
            (flag as boolean) && (
              <label label="No results found" class="launcher-no-results" />
            )
          }
        </With>
      </Box>
    </>
  );
}
