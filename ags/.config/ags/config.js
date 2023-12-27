import App from "resource:///com/github/Aylur/ags/app.js";
import Bar from "./windows/Bar.js";
import { AppLauncher } from "./windows/AppLauncher.js";
import { NotificationPopup } from "./windows/NotificationsPopup.js";

// exporting the config so ags can manage the windows
export default {
  style: App.configDir + "/style.css",
  windows: [Bar({ monitor: 0 }), AppLauncher, NotificationPopup],
};
