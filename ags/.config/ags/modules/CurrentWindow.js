import Hyprland from "resource:///com/github/Aylur/ags/service/hyprland.js";
import Widget from "resource:///com/github/Aylur/ags/widget.js";
import { exec } from "resource:///com/github/Aylur/ags/utils.js";

const getCurrentWindow = () => JSON.parse(exec("hyprctl activewindow -j"));

const formatTitle = (title) => {
  const maxLength = 50;

  // Remove the "— Mozilla Firefox" part from the title
  const firefoxString = "— Mozilla Firefox";

  if (title.includes(firefoxString)) {
    const truncatedPart = title.substr(0);
    const index = truncatedPart.lastIndexOf(firefoxString);

    if (index !== -1) {
      title = truncatedPart.substr(0, index);
    }
  }

  if (title.length <= maxLength) return title;

  // Truncate the title if it's too long
  const truncatedPart = title.substr(0, maxLength);
  return truncatedPart + "...";
};

const handleFirefox = (currentTitle) => {
  const title_icon = [
    ["GitHub", ""],
    ["Discord", "󰙯"],
    ["Twitch", ""],
    ["YouTube", ""],
  ];

  for (let i = 0; i < title_icon.length; i++) {
    if (currentTitle.includes(title_icon[i][0])) {
      return title_icon[i][1];
    }
  }

  return "";
};

const handleKitty = (currentTitle) => {
  const title_icon = [["NVIM", ""]];

  for (let i = 0; i < title_icon.length; i++) {
    if (currentTitle.includes(title_icon[i][0])) {
      return title_icon[i][1];
    }
  }

  return "";
};

const handleIcon = (currentTitle) => {
  let currentClass = getCurrentWindow().class;
  let icon = "";

  if (currentClass.includes("firefox")) return handleFirefox(currentTitle);
  if (currentClass.includes("kitty")) return handleKitty(currentTitle);
  if (currentClass.includes("Spotify")) return "";
  if (currentClass.includes("thunar")) return "";
  if (currentClass.includes("VencordDesktop")) return "󰙯";
  if (currentClass.includes("feh")) return "";

  return icon;
};

const ClientTitle = () =>
  Widget.Label({
    className: "client-title",
    binds: [
      ["label", Hyprland.active.client, "title", (title) => formatTitle(title)],
    ],
  });

const ClientIcon = () =>
  Widget.Label({
    className: "client-class",
    binds: [
      ["label", Hyprland.active.client, "title", (title) => handleIcon(title)],
    ],
  });

export const CurrentWindow = () =>
  Widget.Box({
    children: [ClientIcon(), ClientTitle()],
  });
