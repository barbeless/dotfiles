import Quickshell
import Quickshell.Services.Pipewire
import QtQuick
import QtQuick.Layouts

//PanelWindow {
//    id: root
Item {
  id: root  
//    property int trayWidth: 0
    property color bgColor: "#3c4841"
    property color accentColor: "#7fbbb3"

//    exclusionMode: ExclusionMode.Ignore

//    anchors {
//        top: true
//        right: true
//    }
//
//    screen: Quickshell.screens[1]
//    margins.right: trayWidth + 2

    implicitWidth: 100
    implicitHeight: 34

//    color: "transparent"
//    mask: Region {}

    PwObjectTracker {
        objects: [Pipewire.defaultAudioSink]
    }

    Connections {
        target: Pipewire.defaultAudioSink?.audio
    }

    property string volumeIcon: {
        const audio = Pipewire.defaultAudioSink?.audio

        if (!audio || audio.muted)
            return "󰖁"

        if (audio.volume < 0.33)
            return "󰕿"

        if (audio.volume < 0.66)
            return "󰖀"

        return "󰕾"
    }

    Rectangle {
        anchors.fill: parent
        radius: height / 3
        color: root.bgColor

        RowLayout {
            anchors.fill: parent
            anchors.leftMargin: 10
            anchors.rightMargin: 10
            spacing: 8

            Text {
                text: root.volumeIcon
                color: root.accentColor
                font.pixelSize: 16
            }

            Rectangle {
                Layout.fillWidth: true
                implicitHeight: 10

                color: "#E67E80"
                radius: 12

                Rectangle {
                    anchors {
                        left: parent.left
                        top: parent.top
                        bottom: parent.bottom
                    }

                    width: parent.width *
                           (Pipewire.defaultAudioSink?.audio?.volume ?? 0)

                    color: "#83C092"
                    radius: parent.radius
                }
            }
        }
    }
}
