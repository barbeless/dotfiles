import Quickshell
import Quickshell.Wayland
import Quickshell.Hyprland
import Quickshell.Io
import QtQuick
import QtQuick.Layouts
import Quickshell.Services.Notifications
import Quickshell.Services.Pipewire
import Quickshell.Widgets
import "."
Scope {
  id:scopeid
  PanelWindow {
    screen: Quickshell.screens[1]
    id: test
    color: "transparent"
    implicitHeight: 36
    anchors {top: true;left: true;right: true}
  }
WorkspacePanel{}
Date{}
    PanelWindow{
      anchors{ top: true; right: true}
      implicitWidth: row.implicitWidth + 24
      implicitHeight: 34
      exclusionMode: ExclusionMode.Ignore
      screen: Quickshell.screens[1]
      color: "transparent"
      Row{
	id: row
	spacing: 2
	anchors.centerIn: parent
	Discord{}
	Volume{}
	Clock{}
      }
    }
  }
