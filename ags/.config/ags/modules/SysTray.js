import SystemTray from "resource:///com/github/Aylur/ags/service/systemtray.js";
import Widget from "resource:///com/github/Aylur/ags/widget.js";

export const SysTray = () =>
  Widget.Box({
    spacing: 4,
    connections: [
      [
        SystemTray,
        (self) => {
          self.children = SystemTray.items.map((item) =>
            Widget.Button({
              child: Widget.Icon({ binds: [["icon", item, "icon"]] }),
              onPrimaryClick: (_, event) => item.activate(event),
              onSecondaryClick: (_, event) => item.openMenu(event),
              binds: [["tooltip-markup", item, "tooltip-markup"]],
            }),
          );
        },
      ],
    ],
  });
