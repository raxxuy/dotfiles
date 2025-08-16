import { Astal, Gdk, Gtk } from "ags/gtk4";

export const {
  WindowAnchor: windowAnchors,
  Exclusivity: exclusivitiy,
  Keymode: keymode,
} = Astal;

export const { Orientation: orientation, Align: align } = Gtk;

export const { ModifierType: modifierType } = Gdk;

export const cursors = {
  default: Gdk.Cursor.new_from_name("default", null),
  pointer: Gdk.Cursor.new_from_name("pointer", null),
};
