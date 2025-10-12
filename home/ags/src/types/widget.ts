import { Astal, Gtk } from "ags/gtk4";
import { Accessor } from "gnim";
import {
  Align,
  Exclusivity,
  Keymode,
  Orientation,
  Props,
  WindowAnchor,
} from "./ags";

export type WindowProps = Omit<
  Props<Astal.Window, Astal.Window.ConstructorProps>,
  "anchor" | "exclusivity" | "keymode"
> & {
  anchor:
    | WindowAnchor
    | WindowAnchor[]
    | Accessor<WindowAnchor | WindowAnchor[]>;
  exclusivity: Exclusivity | Accessor<Exclusivity>;
  keymode?: Keymode | Accessor<Keymode>;
};

export type ButtonProps = Omit<
  Props<Gtk.Button, Gtk.Button.ConstructorProps>,
  "halign" | "valign"
> & {
  halign?: Align | Accessor<Align>;
  valign?: Align | Accessor<Align>;
};

export type BoxProps = Omit<
  Props<Gtk.Box, Gtk.Box.ConstructorProps>,
  "halign" | "valign" | "orientation"
> & {
  halign?: Align | Accessor<Align>;
  valign?: Align | Accessor<Align>;
  orientation?: Orientation | Accessor<Orientation>;
};
