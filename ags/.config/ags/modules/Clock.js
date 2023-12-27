import Widget from "resource:///com/github/Aylur/ags/widget.js";
import Variable from "resource:///com/github/Aylur/ags/variable.js";

const date = Variable("", {
  poll: [1000, ["date", "+%a %d/%m - %H:%M"]],
});

export const Clock = () =>
  Widget.Label({
    label: date.bind(),
  });
