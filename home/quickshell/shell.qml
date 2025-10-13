import QtQuick
import Quickshell

PanelWindow {
    id: panel
    
    // Panel positioning
    anchors {
        top: true
        left: true
        right: true
    }
    
    // Panel appearance
    implicitHeight: 32
    color: "#1e1e2e"
    
    // Panel content
    Row {
        anchors.fill: parent
        anchors.margins: 8
        spacing: 16
        
        // Left section
        Text {
            text: "Quickshell"
            color: "#cdd6f4"
            font.pixelSize: 14
            font.bold: true
            anchors.verticalCenter: parent.verticalCenter
        }
        
        // Right section - Clock
        Text {
            id: clock
            color: "#cdd6f4"
            font.pixelSize: 13
            anchors.verticalCenter: parent.verticalCenter
            
            property var currentTime: new Date()
            
            text: Qt.formatDateTime(currentTime, "hh:mm AP")
            
            Timer {
                interval: 1000
                running: true
                repeat: true
                onTriggered: clock.currentTime = new Date()
            }
        }
    }
}
