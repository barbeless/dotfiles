import Quickshell
import QtQuick
  PanelWindow {
    id: datePanel
    screen: Quickshell.screens[1]
    anchors.top: true
    exclusionMode: ExclusionMode.Ignore

    implicitHeight: 34
    implicitWidth: date.implicitWidth + 24

    color: "transparent"
    SystemClock {
      id : dateClock
      precision: SystemClock.Seconds
    }
    Rectangle {
      anchors.fill: parent
      color: "#3c4841"
      radius: 14
      opacity: 0.95
    }
    Text {
      id: date
      anchors.centerIn: parent
      color: "#D699B6"
      font {
	family: "Cousine Nerd Font"
	pixelSize: 14
	bold: true
      }
      Text{
	text:""
      }

      Timer {
	interval: 1000
	running: true
	repeat: true

	onTriggered:
	date.text = Qt.formatDateTime(dateClock.date,"ddd, dd MMM")
      }
    }
  }
