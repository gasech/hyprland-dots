// My modules 
import { CurrentWindow } from '../modules/CurrentWindow.js';
import { Workspaces } from '../modules/Workspaces.js';
import { Clock } from '../modules/Clock.js';
import { SysTray } from '../modules/SysTray.js';
import { KeyboardLayout } from '../modules/KeyboardLayout.js';
import { Indicators } from '../modules/Indicators.js';

import Widget from 'resource:///com/github/Aylur/ags/widget.js';

const spacing = 8;

// layout of the bar
const Left = () => Widget.Box({
  spacing: spacing,
  children: [
    Workspaces(),
    CurrentWindow(),
  ],
});

const Center = () => Widget.Box({
  spacing: spacing,
  children: [
    Clock(),
  ],
});

const Right = () => Widget.Box({
  spacing: spacing,
  hpack: 'end',
  children: [
    SysTray(),
    KeyboardLayout(),
    Indicators(),
  ],
});

export default ({ monitor } = { monitor: 0 }) => Widget.Window({
  name: `bar-${monitor}`, // name has to be unique
  className: 'bar',
  monitor,
  anchor: ['top', 'left', 'right'],
  exclusivity: 'exclusive',
  child: Widget.CenterBox({
    className: 'bar-content',
    startWidget: Left(),
    centerWidget: Center(),
    endWidget: Right(),
  }),
})
