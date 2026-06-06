import Quickshell
import QtQuick
//  PanelWindow {
//    id: clockPanel
//    screen: Quickshell.screens[1]
//    anchors {top:true; right: true}
//    exclusionMode: ExclusionMode.Ignore
//
//    implicitHeight: 34
//    implicitWidth: date.implicitWidth + 24
//
//    color: "transparent"
//    SystemClock {
//      id : clock
//      precision: SystemClock.Seconds
//    }
//    Rectangle {
//      anchors.fill: parent
//      color: "#3c4841"
//      radius: 14
//      opacity: 0.95
//    }
//    Text {
//      id: date
//      anchors.centerIn: parent
//      color: "#E69875"
//      font {
//	family: "Cousine Nerd Font"
//	pixelSize: 14
//	bold: true
//      }
//      Text{
//	text:""
//      }
//
//      Timer {
//	interval: 1000
//	running: true
//	repeat: true
//
//	onTriggered:
//	date.text = Qt.formatDateTime(clock.date,"HH:mm")
//      }
//    }
//  }
Item {
  id: main
  implicitWidth: date.implicitWidth + 20
  implicitHeight: 34

  SystemClock {
    id: clock
    precision: SystemClock.Seconds
  }
  Rectangle{
  implicitWidth: main.implicitWidth
  implicitHeight: 34
  color: "#3c4841"
  radius: height / 3

  Text{
    id: date
    anchors.centerIn: parent
    color: "#E69875"
    font{
      family: "Cousine Nerd Font"
      pixelSize: 14
      bold: true
    }
    text: Qt.formatDateTime(clock.date,"HH:mm")
  }
}
}
