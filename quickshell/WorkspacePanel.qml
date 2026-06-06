import Quickshell
import Quickshell.Hyprland
import QtQuick
import QtQuick.Layouts

PanelWindow {
    id: root

    screen: Quickshell.screens[1]
    color: "transparent"
    exclusionMode: ExclusionMode.Ignore

    anchors.top: true
    anchors.left: true

    implicitHeight: 34
    implicitWidth: row.implicitWidth + 20

    property color bgColor: "#3c4841"
    property color activeColor: "#e67e80"
    property color inactiveColor: "#7fbbb3"

    Rectangle {
        anchors.fill: parent
        radius: 14
        color: root.bgColor
        opacity: 0.95
    }

    RowLayout {
        id: row
        anchors.fill: parent
        anchors.margins: 10

        Repeater {
            model: 9

            Text {
                property var ws:
                    Hyprland.workspaces.values.find(w => w.id === index + 1)

                property bool isActive:
                    Hyprland.focusedWorkspace?.id === index + 1

                text: index + 1

                color: isActive ? root.activeColor : root.inactiveColor

                MouseArea {
                    anchors.fill: parent
                    onClicked: Hyprland.dispatch("workspace " + (index + 1))
                }
		font {
		  family: workspacePanel.fontFamily
		  pixelSize: workspacePanel.fontSize
		  bold: true
		}
            }
        }
    }
}
