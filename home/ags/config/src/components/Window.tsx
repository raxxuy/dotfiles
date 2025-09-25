import app from "ags/gtk4/app";
import type { WindowProps } from "../types/widget";
import { toAnchorProp, toExclusivityProp, toKeymodeProp } from "../utils/ags";

export default function Window({
  anchor,
  exclusivity,
  keymode,
  gdkmonitor,
  visible = true,
  application = app,
  ...props
}: WindowProps) {
  const anchorValue = toAnchorProp(anchor);
  const exclusivityValue = toExclusivityProp(exclusivity);
  const keymodeValue = toKeymodeProp(keymode!);

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
