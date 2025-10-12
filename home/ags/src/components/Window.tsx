import app from "ags/gtk4/app";
import type { WindowProps } from "../types/widget";
import { toProp } from "../utils/ags";

export default function Window({
  anchor,
  exclusivity,
  keymode,
  gdkmonitor,
  visible = true,
  application = app,
  ...props
}: WindowProps) {
  const anchorValue = toProp(anchor);
  const exclusivityValue = toProp(exclusivity);
  const keymodeValue = toProp(keymode!);

  return (
    <window
      visible={visible}
      anchor={anchorValue}
      exclusivity={exclusivityValue}
      keymode={keymodeValue}
      gdkmonitor={gdkmonitor}
      application={application}
      {...props}
    />
  );
}