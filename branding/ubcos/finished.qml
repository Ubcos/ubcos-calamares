import QtQuick 2.0
import calamares.slideshow 1.0

Rectangle {
    id: finishedView
    color: "#1e2127"
    
    property string doneText: "Installation Complete!"
    property string dontShutdown: ""
    property bool rebootNow: false
    property bool shutdownNow: false

    // Header
    Column {
        anchors.top: parent.top
        anchors.topMargin: 80
        anchors.horizontalCenter: parent.horizontalCenter
        spacing: 20
        
        Image {
            id: successIcon
            source: "logo.png"
            width: 100
            height: 100
            anchors.horizontalCenter: parent.horizontalCenter
        }
        
        Text {
            anchors.horizontalCenter: parent.horizontalCenter
            text: doneText
            font.pixelSize: 36
            font.bold: true
            color: "#61afef"
        }
        
        Text {
            anchors.horizontalCenter: parent.horizontalCenter
            text: "Ubcos has been installed successfully."
            font.pixelSize: 18
            color: "#abb2bf"
        }
    }
    
    // Instructions
    Column {
        anchors.centerIn: parent
        spacing: 15
        anchors.horizontalCenter: parent.horizontalCenter
        
        Text {
            anchors.horizontalCenter: parent.horizontalCenter
            text: "What would you like to do now?"
            font.pixelSize: 16
            color: "#abb2bf"
        }
        
        Rectangle {
            width: 300
            height: 50
            color: "#61afef"
            radius: 4
            
            Text {
                anchors.centerIn: parent
                text: "Restart Now"
                font.pixelSize: 18
                font.bold: true
                color: "#1e2127"
            }
            
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    rebootNow = true
                    doneText = "Rebooting..."
                    Calamares.exec("reboot")
                }
            }
        }
        
        Rectangle {
            width: 300
            height: 50
            color: "#282c34"
            border.color: "#3e4451"
            border.width: 1
            radius: 4
            
            Text {
                anchors.centerIn: parent
                text: "Shutdown"
                font.pixelSize: 18
                color: "#abb2bf"
            }
            
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    shutdownNow = true
                    doneText = "Shutting Down..."
                    Calamares.exec("poweroff")
                }
            }
        }
        
        Rectangle {
            width: 300
            height: 50
            color: "#282c34"
            border.color: "#3e4451"
            border.width: 1
            radius: 4
            
            Text {
                anchors.centerIn: parent
                text: "Stay in Live Session"
                font.pixelSize: 18
                color: "#abb2bf"
            }
            
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    dontShutdown = "true"
                    doneText = "Done!"
                }
            }
        }
    }
    
    // Footer
    Text {
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 30
        anchors.horizontalCenter: parent.horizontalCenter
        text: "Thank you for choosing Ubcos!"
        font.pixelSize: 14
        color: "#5c6370"
    }
}
