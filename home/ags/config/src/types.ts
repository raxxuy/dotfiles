import { CCProps } from "ags";
import { Gtk } from "ags/gtk4";

export type Workspace = {
  id: number;
  name: string;
  active: boolean;
  occupied: boolean;
};

export type Props<T extends Gtk.Widget, Props> = CCProps<T, Partial<Props>>;
