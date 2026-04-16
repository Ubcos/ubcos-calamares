import QtQuick 2.0
import calamares.slideshow 1.0

Presentation {
    id: presentation

    function nextSlide() {
        if (presentation.currentSlide >= 3)
            presentation.currentSlide = 0
        else
            presentation.currentSlide++
    }

    Timer {
        id: slideshowTimer
        interval: 5000
        repeat: true
        running: presentation.activatedInCalamares
        onTriggered: presentation.nextSlide()
    }

    Slide {
        Rectangle {
            width: parent.width; height: parent.height
            color: "#1e2127"
            Column {
                anchors.centerIn: parent
                spacing: 20
                Text {
                    anchors.horizontalCenter: parent.horizontalCenter
                    text: "Welcome to Ubcos"
                    font.pointSize: 28
                    font.bold: true
                    color: "#61afef"
                }
                Text {
                    anchors.horizontalCenter: parent.horizontalCenter
                    text: "Ultra-Minimal. Fast. Beautiful."
                    font.pointSize: 14
                    color: "#abb2bf"
                }
            }
        }
    }

    Slide {
        Rectangle {
            width: parent.width; height: parent.height
            color: "#1e2127"
            Column {
                anchors.centerIn: parent
                spacing: 20
                Text {
                    anchors.horizontalCenter: parent.horizontalCenter
                    text: "Openbox Desktop"
                    font.pointSize: 24
                    font.bold: true
                    color: "#98c379"
                }
                Text {
                    anchors.horizontalCenter: parent.horizontalCenter
                    text: "Lightweight window manager with full keyboard control."
                    font.pointSize: 12
                    color: "#abb2bf"
                }
            }
        }
    }

    Slide {
        Rectangle {
            width: parent.width; height: parent.height
            color: "#1e2127"
            Column {
                anchors.centerIn: parent
                spacing: 20
                Text {
                    anchors.horizontalCenter: parent.horizontalCenter
                    text: "Ubuntu 24.04 Foundation"
                    font.pointSize: 24
                    font.bold: true
                    color: "#e5c07b"
                }
                Text {
                    anchors.horizontalCenter: parent.horizontalCenter
                    text: "Rock-solid base. Vast package ecosystem."
                    font.pointSize: 12
                    color: "#abb2bf"
                }
            }
        }
    }

    Slide {
        Rectangle {
            width: parent.width; height: parent.height
            color: "#1e2127"
            Column {
                anchors.centerIn: parent
                spacing: 20
                Text {
                    anchors.horizontalCenter: parent.horizontalCenter
                    text: "Installation Almost Done!"
                    font.pointSize: 24
                    font.bold: true
                    color: "#c678dd"
                }
                Text {
                    anchors.horizontalCenter: parent.horizontalCenter
                    text: "Ubcos is being installed to your system."
                    font.pointSize: 12
                    color: "#abb2bf"
                }
            }
        }
    }
}
