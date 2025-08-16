import { Accessor } from "ags";
import { Gtk } from "ags/gtk4";
import { cursors } from "../../globals";
import { Props } from "../../types";

interface ButtonProps
  extends Partial<Props<Gtk.Button, Gtk.Button.ConstructorProps>> {
  label?: string | Accessor<string>;
  iconName?: string | Accessor<string>;
  children?: any;
  class: string | Accessor<string>;
  pixelSize?: number;
  wrapper?: boolean;
  onClicked?: () => void;
  tooltipText?: string | Accessor<string>;
  sensitive?: boolean | Accessor<boolean>;
}

export default function Button({
  label,
  iconName,
  children,
  class: className,
  pixelSize,
  wrapper = true,
  onClicked,
  tooltipText,
  sensitive = true,
  ...props
}: ButtonProps) {
  const button = (
    <button
      class={wrapper ? `button` : className}
      onClicked={onClicked}
      cursor={cursors.pointer}
      tooltipText={tooltipText}
      sensitive={sensitive}
      {...props}
    >
      {iconName && <image iconName={iconName} pixelSize={pixelSize} />}
      {label && <label label={label} />}
      {children}
    </button>
  );

  return wrapper ? <box class={className}>{button}</box> : button;
}
