import { Cursors } from "../../globals";

export default function Menu() {
  return (
    <menubutton class="menu">
      <label class="menu-label" label={"󰍜"} cursor={Cursors.Pointer} />
      <popover
        class="menu-popover"
        widthRequest={200}
        heightRequest={400}
      ></popover>
    </menubutton>
  );
}
