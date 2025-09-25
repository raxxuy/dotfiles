import type { ButtonProps } from "../types/widget";
import { toAlignProp } from "../utils/ags";

export default function Button({ halign, valign, ...props }: ButtonProps) {
  const halignValue = toAlignProp(halign!);
  const valignValue = toAlignProp(valign!);

  return <button halign={halignValue} valign={valignValue} {...props} />;
}
