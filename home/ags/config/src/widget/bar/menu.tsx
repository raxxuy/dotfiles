import { Cursors } from "../../globals";

export default function Menu() {
  return (
    <menubutton class="menu" cursor={Cursors.Pointer}>
      <label class="menu-label" label={"󰍜"} />
      <popover
        class="menu-popover"
        widthRequest={200}
        heightRequest={400}
      >
        
      </popover>
    </menubutton>
  );
}
