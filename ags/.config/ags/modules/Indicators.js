import Network from "resource:///com/github/Aylur/ags/service/network.js";
import Widget from "resource:///com/github/Aylur/ags/widget.js";
import Battery from "resource:///com/github/Aylur/ags/service/battery.js";
import Audio from "resource:///com/github/Aylur/ags/service/audio.js";
import { exec } from "resource:///com/github/Aylur/ags/utils.js";

const VolumeIndicator = () =>
  Widget.EventBox({
    onScrollUp: () => exec("pamixer -i 5"),
    onScrollDown: () => exec("pamixer -d 5"),
    child: Widget.Button({
      onClicked: () => (Audio.speaker.isMuted = !Audio.speaker.isMuted),
      child: Widget.Icon().hook(
        Audio,
        (self) => {
          if (!Audio.speaker) return;

          const vol = Audio.speaker.volume * 100;
          const icon = [
            [101, "overamplified"],
            [67, "high"],
            [34, "medium"],
            [1, "low"],
            [0, "muted"],
          ].find(([threshold]) => threshold <= vol)[1];

          self.icon = `audio-volume-${icon}-symbolic`;
          self.tooltipText = `Volume: ${Math.floor(vol)}%`;
        },
        "speaker-changed",
      ),
    }),
  });

const secondsToTime = (seconds) => {
  const hours = Math.floor(seconds / 3600);
  const minutes = Math.floor((seconds % 3600) / 60);

  return `| Estimated time remaining: ${hours}h ${minutes}m`;
};

const BatteryIndicator = () =>
  Widget.Icon().hook(Battery, (self) => {
    self.icon = Battery["icon-name"];
    self.visible = Battery.available;
    self.tooltipText = `Battery Status: ${Battery.percent}% available ${
      Battery.charging
        ? "(plugged in)"
        : secondsToTime(Battery["time-remaining"])
    }`;
  });

const WifiIndicator = () =>
  Widget.Box({
    spacing: 2,
    children: [
      Widget.Icon().hook(Network.wifi, (self) => {
        self.icon = Network.wifi["icon-name"];
        self.tooltipText = `SSID: ${Network.wifi["ssid"]} | Strength: ${Network.wifi["strength"]}%`;
      }),
    ],
  });

const WiredIndicator = () =>
  Widget.Icon({
    icon: Network.wired.bind("icon-name"),
    tooltipText: "Connected via Ethernet",
  });

const NetworkIndicator = () =>
  Widget.Stack({
    items: [
      ["wifi", WifiIndicator()],
      ["wired", WiredIndicator()],
    ],
    shown: Network.bind("primary").transform((p) => p || "wifi"),
  });

const BrightnessIndicator = () =>
  Widget.EventBox({
    onScrollUp: () => exec("brightnessctl set +5%"),
    onScrollDown: () => exec("brightnessctl set 5%-"),
    child: Widget.Icon({
      icon: "display-brightness-symbolic",
      connections: [
        [
          1000,
          (self) => {
            const maxBrightness = exec("brightnessctl max");
            const currentBrightness = exec("brightnessctl get") * 100;
            self.icon = "display-brightness-symbolic";
            self.tooltipText = `Brightness: ${
              currentBrightness / maxBrightness
            }%`;
          },
        ],
      ],
    }),
  });

const ControlCenter = () =>
  Widget.Icon({
    icon: "multimedia-volume-control-symbolic",
  });

export const Indicators = () =>
  Widget.Box({
    className: "indicators",
    spacing: 4,
    children: [
      NetworkIndicator(),
      BatteryIndicator(),
      VolumeIndicator(),
      BrightnessIndicator(),
      ControlCenter(),
    ],
  });
