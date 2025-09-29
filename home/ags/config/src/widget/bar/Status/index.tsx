import Audio from "./Audio";
import Bluetooth from "./Bluetooth";

export default function Status() {
  return (
    <box class="status" spacing={8}>
      <Audio />
      <Bluetooth />
    </box>
  );
}
