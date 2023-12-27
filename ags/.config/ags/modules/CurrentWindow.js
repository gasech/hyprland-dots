import Hyprland from "resource:///com/github/Aylur/ags/service/hyprland.js";
import Widget from "resource:///com/github/Aylur/ags/widget.js";

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

  // Truncate the title if it's too long
  if (title.length <= maxLength) {
    return title; // No truncation needed
  } else {
    const truncatedPart = title.substr(0, maxLength);

    return truncatedPart + "...";
  }
};

const ClientTitle = () =>
  Widget.Label({
    className: "client-title",
    binds: [
      ["label", Hyprland.active.client, "title", (title) => formatTitle(title)],
    ],
  });

const ClientClass = () =>
  Widget.Label({
    className: "client-class",
    binds: [
      [
        "label",
        Hyprland.active.client,
        "class",
        (classname) => {
          switch (classname) {
            case "firefox":
              return "";
            case "kitty":
              return "";
            case "Spotify":
              return "";
            case "thunar":
              return "";
            case "VencordDesktop":
              return "󰙯";
            default:
              return "";
          }
        },
      ],
    ],
  });

export const CurrentWindow = () =>
  Widget.Box({
    children: [ClientClass(), ClientTitle()],
  });
