import { Gtk } from "ags/gtk4";
import { interval } from "ags/time";
import GLib from "gi://GLib";
import { createState } from "gnim";

const FORMATS = {
  NORMAL: "%H:%M",
  DETAILED: "%I:%M:%S %p",
};

export default function Clock() {
  const [format, setFormat] = createState(FORMATS.NORMAL);
  const [isHovered, setIsHovered] = createState(false);

  const getCurrentTime = () =>
    GLib.DateTime.new_now_local().format(format.get())!;

  const [time, setTime] = createState(getCurrentTime());

  const handleMouseEnter = () => {
    setIsHovered(true);
    setFormat(FORMATS.DETAILED);
    setTime(GLib.DateTime.new_now_local().format(FORMATS.DETAILED)!);
  };

  const handleMouseLeave = () => {
    setIsHovered(false);
    setFormat(FORMATS.NORMAL);
    setTime(GLib.DateTime.new_now_local().format(FORMATS.NORMAL)!);
  };

  interval(1000, () => setTime(getCurrentTime()));

  return (
    <box>
      <Gtk.EventControllerMotion
        onEnter={handleMouseEnter}
        onLeave={handleMouseLeave}
      />
      <label
        cssClasses={isHovered((hover) =>
          hover ? ["clock", "hover"] : ["clock", "normal"]
        )}
        label={time}
      />
    </box>
  );
}
