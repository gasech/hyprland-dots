import Widget from "resource:///com/github/Aylur/ags/widget.js";
import Hyprland from "resource:///com/github/Aylur/ags/service/hyprland.js";

const formatKeyboard = (kbLayout) =>
  kbLayout == "Portuguese (Brazil)" ? "pt-br" : "en-us";

const KeyboardIcon = () =>
  Widget.Icon({
    icon: "preferences-desktop-keyboard-symbolic",
  });

const KeyboardLabel = () =>
  Widget.Label({
    className: "keyboard-label",
    label: "en",
    connections: [
      [
        Hyprland,
        (self, kbName, layoutName) => {
          self.label = kbName ? formatKeyboard(layoutName) : "en-us";
          self.tooltipText = kbName ? layoutName : "English (US)";
        },
        "keyboard-layout",
      ],
    ],
  });

export const KeyboardLayout = () =>
  Widget.Box({
    children: [KeyboardIcon(), KeyboardLabel()],
  });
