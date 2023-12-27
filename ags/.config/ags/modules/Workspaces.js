import Hyprland from 'resource:///com/github/Aylur/ags/service/hyprland.js';
import Widget from 'resource:///com/github/Aylur/ags/widget.js';
import { execAsync } from 'resource:///com/github/Aylur/ags/utils.js';

const dispatch = ws => execAsync(`hyprctl dispatch workspace ${ws}`);

export const Workspaces = () => Widget.Box({
  className: 'workspaces',

  children: Array.from({ length: 10 }, (_, i) => i + 1).map(i => Widget.Button({
    setup: btn => btn.id = i,
    onClicked: () => dispatch(i),
    child: Widget.Label(`${i}`),
    connections: [[Hyprland, btn => {
      btn.toggleClassName('focused', Hyprland.active.workspace.id === i);
    }]],
  })),

  // remove this connection if you want fixed number of buttons
  connections: [[Hyprland.active.workspace, self => self.children.forEach(btn => {
    btn.visible = Hyprland.workspaces.some(ws => ws.id === btn.id);
  })]],
});
