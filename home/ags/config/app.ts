import { Astal } from "ags/gtk4";
import app from "ags/gtk4/app";
import Bar from "./src/widget/bar";
import Launcher from "./src/widget/launcher";
import style from "./style/index.scss";

app.start({
  css: style,
  main() {
    app.get_monitors().map(Bar);
    app.add_window(Launcher() as Astal.Window);
  },
});
