import app from "ags/gtk4/app";
import Bar from "./src/widget/bar";
import style from "./style.scss";
import { Astal, Gtk } from "ags/gtk4";
import Launcher from "./src/widget/launcher/Launcher";

app.start({
  css: style,
  main() {
    app.get_monitors().map(Bar);
    app.add_window(Launcher() as Astal.Window);
  },
});
