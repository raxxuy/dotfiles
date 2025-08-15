import app from "ags/gtk4/app"
import style from "./scss/style.scss";
import Bar from "./src/widget/bar";

app.start({
  css: style,
  main() {
    app.get_monitors().map(Bar);
  },
})
