import app from "ags/gtk4/app";
import style from "./style.scss";
import Bar from "./src/window/Bar";

app.start({
  css: style,
  gtkTheme: "Adwaita",
  instanceName: "ags",
  requestHandler(argv: string[], response: (response: string) => void) {
    const [cmd, arg, ...rest] = argv;
    if (cmd == "quit") {
      app.quit();
      response(arg);
    }
    response("unknown command");
  },
  main() {
    app.get_monitors().map(Bar);
  },
});
