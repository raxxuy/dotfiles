import { Gtk } from "ags/gtk4";
import AstalWp from "gi://AstalWp";
import { createBinding } from "gnim";
import { EventControllerScrollFlags } from "../../../globals";

export default function Audio() {
  const wp = AstalWp.get_default();
  const { defaultSpeaker: speaker, defaultMicrophone: microphone } = wp;

  const roundVolume = (v: number) => Math.round(v * 100);

  const adjustVolume = (endpoint: AstalWp.Endpoint, direction: number) => {
    if (direction === -1)
      endpoint.set_volume(Math.min(1, endpoint.volume + 0.05));
    else endpoint.set_volume(Math.max(0, endpoint.volume - 0.05));
  };

  return (
    <>
      <box spacing={4} tooltipText={createBinding(speaker, "description")}>
        <Gtk.EventControllerScroll
          flags={EventControllerScrollFlags.VERTICAL}
          onScroll={(_, __, direction) => adjustVolume(speaker, direction)}
        />
        <label
          class="status-speaker"
          label={createBinding(speaker, "volume")((v) => `${roundVolume(v)}%`)}
        />
        <image
          class="status-speaker-icon"
          iconName={createBinding(speaker, "volumeIcon")}
          pixelSize={14}
        />
      </box>
      <box spacing={4} tooltipText={createBinding(microphone, "description")}>
        <Gtk.EventControllerScroll
          flags={EventControllerScrollFlags.VERTICAL}
          onScroll={(_, __, direction) => adjustVolume(microphone, direction)}
        />
        <label
          class="status-microphone"
          label={createBinding(
            microphone,
            "volume"
          )((v) => `${roundVolume(v)}%`)}
        />
        <image
          class="status-microphone-icon"
          iconName={createBinding(microphone, "volumeIcon")}
          pixelSize={14}
        />
      </box>
    </>
  );
}
