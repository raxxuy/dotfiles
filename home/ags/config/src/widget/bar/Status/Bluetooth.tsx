import AstalBluetooth from "gi://AstalBluetooth";
import { createBinding, createComputed, With } from "gnim";

export default function Bluetooth() {
  const bluetooth = AstalBluetooth.get_default();

  const iconName = createComputed(
    [
      createBinding(bluetooth, "isPowered"),
      createBinding(bluetooth, "isConnected"),
    ],
    (powered, connected) =>
      powered
        ? connected
          ? "bluetooth-active-symbolic"
          : "bluetooth-symbolic"
        : "bluetooth-disabled-symbolic"
  );

  const activeDevice = createComputed(
    [
      createBinding(bluetooth, "devices"),
      createBinding(bluetooth, "isConnected"),
    ],
    (devices, connected) => (connected ? devices[0].name : "")
  );

  return (
    <With value={iconName}>
      {(iconName) => (
        <image iconName={iconName} pixelSize={14} tooltipText={activeDevice} />
      )}
    </With>
  );
}
