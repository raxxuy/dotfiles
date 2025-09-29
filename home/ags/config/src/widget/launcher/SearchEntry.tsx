import { Accessor, createState, Setter } from "ags";
import { Gtk } from "ags/gtk4";

interface SearchEntryProps {
  value: Accessor<string>;
  setEntry: Setter<Gtk.Entry | null>;
  onChange: (value: string, icon: Gtk.Widget | null) => void;
  onActivate: () => void;
}

export default function SearchEntry({
  value,
  setEntry,
  onChange,
  onActivate,
}: SearchEntryProps) {
  const [icon, setIcon] = createState<Gtk.Widget | null>(null);

  const handleSetup = (self: Gtk.Entry) => {
    setEntry(self);
    setIcon(self.get_last_child());
  };

  return (
    <entry
      $={handleSetup}
      class={value((v) => `launcher-entry ${!v && "empty"}`)}
      text={value}
      widthRequest={400}
      secondaryIconName={"go-next-symbolic"}
      placeholderText="Start typing to search"
      onActivate={onActivate}
      onIconPress={onActivate}
      onNotifyText={({ text }) => onChange(text, icon.get())}
    />
  );
}
