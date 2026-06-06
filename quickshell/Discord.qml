import Quickshell
import Quickshell.Hyprland
import Quickshell.Services.Notifications
import QtQuick
Item{
  id: item
  implicitWidth: 34
  implicitHeight: 34

  QtObject{
    id:discordState
    property int count: 0

    readonly property bool discordFocused:
    (Hyprland.activeToplevel?.lastIpcObject?.class || "").toLowerCase().includes("discord")
    onDiscordFocusedChanged: {
      if (discordFocused) count = 0
    }
  }
  NotificationServer{
    id: notifServer
    keepOnReload: false
    bodySupported: true
    imageSupported: true
    onNotification: (notif) => {
      notif.tracked = true;
      if ((notif.appName || "").toLowerCase() === "discord" && ~!discordState.discordFocused)
      discordState.count = 1;
    }
  }
  Rectangle {
      anchors.fill: parent
      color: "#3c4841"
      radius: 14
      opacity: 0.95
    Text {
      anchors.centerIn: parent

      text: "󰙯"
      color: discordState.count > 0 ? "#e67e80" : "#7fbbb3"
      font {
	family: "Cousine Nerd Font"
	pixelSize: 16
	bold: true
      }
    }
  }
}
