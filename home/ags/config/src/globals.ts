import { Astal, Gdk, Gtk } from "ags/gtk4";

export const { Exclusivity, WindowAnchor, Keymode } = Astal;
export const { Align, Orientation } = Gtk;
export const { ModifierType } = Gdk;

export const Cursors = {
  Default: Gdk.Cursor.new_from_name("default", null),
  Pointer: Gdk.Cursor.new_from_name("pointer", null),
};
