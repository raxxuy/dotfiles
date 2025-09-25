import { BoxProps } from "../types/widget";
import { toAlignProp, toOrientationProp } from "../utils/ags";

export default function Box({
  halign,
  valign,
  orientation,
  ...props
}: BoxProps) {
  const halignValue = toAlignProp(halign!);
  const valignValue = toAlignProp(valign!);
  const orientationValue = toOrientationProp(orientation!);

  return (
    <box
      halign={halignValue}
      valign={valignValue}
      orientation={orientationValue}
      {...props}
    />
  );
}
