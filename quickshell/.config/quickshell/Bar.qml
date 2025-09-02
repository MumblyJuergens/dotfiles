import Quickshell
import QtQuick

Scope {
    Variants {
        model: Quickshell.screens

        PanelWindow {
            required property var modelData
            screen: modelData

            color: "black"

            anchors {
                top: true
                left: true
                right: true
            }

            implicitHeight: 30

            WorkspaceWidget {
            }

            ClockWidget {
                anchors.centerIn: parent
                color: "white"
            }
        }
    }
}

