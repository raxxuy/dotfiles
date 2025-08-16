import { createState } from "ags";
import { Astal, Gdk, Gtk } from "ags/gtk4";
import AstalApps from "gi://AstalApps";
import { cursors, modifierType } from "../../globals";

const { ALT_MASK, LOCK_MASK, NO_MODIFIER_MASK } = modifierType;
const specialKeys = [Gdk.KEY_Shift_L, Gdk.KEY_Super_L, Gdk.KEY_Control_L];
const apps = new AstalApps.Apps();

export const [search, setSearch] = createState("");
export const [focused, setFocused] = createState(false);
export const [list, setList] = createState<AstalApps.Application[]>([]);

export let window: Astal.Window | undefined;
export let entry: Gtk.Entry | undefined;
let current = 0;

export const setWindow = (w: Astal.Window) => {
  window = w;
};
export const setEntry = (e: Gtk.Entry) => {
  entry = e;
};

export const updateList = (value: string, icon: Gtk.Widget | null) => {
  setSearch(value);
  setList(value ? apps.fuzzy_query(value).slice(0, 8) : []);
  current = 0;

  if (icon) {
    icon.cursor = value ? cursors.pointer : cursors.default;
  }
};

export const launch = (app: AstalApps.Application) => {
  window?.hide();
  app.launch();
};

export const onKeyPressed = (
  _e: Gtk.EventControllerKey,
  key: number,
  _code: number,
  mod: number
) => {
  const currentList = list.get();
  const len = currentList.length;

  if (key === Gdk.KEY_Escape) {
    window?.hide();
    return;
  }

  if (mod === ALT_MASK) {
    for (const i of [1, 2, 3, 4, 5, 6, 7, 8, 9] as const) {
      if (key === Gdk[`KEY_${i}`] && len >= i) {
        launch(currentList[i - 1]);
        return;
      }
    }
  }

  if (key === Gdk.KEY_Down && len) {
    current = (current + 1) % len;
    setFocused(false);
    return;
  }

  if (key === Gdk.KEY_Up && len) {
    current = (current - 1 + len) % len;
    if (current === 0) setFocused(true);
    return;
  }

  if (key === Gdk.KEY_Return && len) {
    launch(currentList[current]);
    return;
  }

  const isTyping =
    [NO_MODIFIER_MASK, LOCK_MASK].includes(mod) &&
    ![Gdk.KEY_Left, Gdk.KEY_Right].includes(key) &&
    !focused.get();

  if (isTyping) {
    setFocused(true);
    if (key === Gdk.KEY_BackSpace && entry) {
      entry.text = entry.text.slice(0, -1);
    } else if (!specialKeys.includes(key) && entry) {
      entry.text += String.fromCharCode(key);
    }
    entry?.grab_focus_without_selecting();
    entry?.select_region(-1, -1);
  }
};

export const onActivate = () => {
  const currentList = list.get();
  if (currentList.length > 0) {
    launch(currentList[current]);
  }
};

export const onVisible = (source: Astal.Window) => {
  if (source.visible && entry) {
    entry.grab_focus();
    setFocused(true);
  } else if (entry) {
    entry.text = "";
  }
};