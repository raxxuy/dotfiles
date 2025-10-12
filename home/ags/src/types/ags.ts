import { Gtk } from "ags/gtk4";
import { CCProps } from "gnim";
import { Align } from "../globals";

// Astal
export type WindowAnchor = "TOP" | "LEFT" | "RIGHT" | "BOTTOM" | "NONE";
export type Exclusivity = "IGNORE" | "EXCLUSIVE" | "NORMAL";
export type Keymode = "EXCLUSIVE" | "NONE" | "ON_DEMAND";

// Gtk
export type Align =
  | "START"
  | "END"
  | "CENTER"
  | "FILL"
  | "BASELINE"
  | "BASELINE_CENTER"
  | "BASELINE_FILL";
export type Orientation = "HORIZONTAL" | "VERTICAL";

// Base
export type Props<T extends Gtk.Widget, Props> = CCProps<T, Partial<Props>>;
