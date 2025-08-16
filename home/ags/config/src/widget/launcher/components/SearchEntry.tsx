import { Accessor } from "ags";
import { Gtk } from "ags/gtk4";
import { Props } from "../../../types";

interface SearchEntryProps
  extends Partial<Props<Gtk.Entry, Gtk.Entry.ConstructorProps>> {
  value: Accessor<string>;
  onChange: (value: string, icon: Gtk.Widget | null) => void;
  onActivate: () => void;
}

export default function SearchEntry({
  value,
  onChange,
  onActivate,
  ...props
}: SearchEntryProps) {
  const entryClass = value.as((value) => `launcher-entry ${!value && "empty"}`);
  let icon: Gtk.Widget | null;

  return (
    <entry
      $={(self) => (icon = self.get_last_child())}
      class={entryClass}
      text={value}
      onNotifyText={({ text }) => onChange(text, icon)}
      placeholderText="Start typing to search"
      onActivate={onActivate}
      onIconPress={onActivate}
      secondaryIconName={"go-next-symbolic"}
      {...props}
    />
  );
}