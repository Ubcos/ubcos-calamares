import QtQuick 2.0
import calamares.slideshow 1.0

Presentation {
    id: presentation

    property int currentSlide: 0
    property int totalSlides: 4

    function nextSlide() {
        currentSlide = (currentSlide + 1) % totalSlides
    }

    Timer {
        id: slideshowTimer
        interval: 5000
        repeat: true
        running: presentation.activatedInCalamares
        onTriggered: presentation.nextSlide()
    }

    Rectangle {
        anchors.fill: parent
        color: "#1e2127"

        // Accent gradient
        LinearGradient {
            anchors.fill: parent
            start: Qt.point(0, 0)
            end: Qt.point(parent.width, parent.height)
            gradient: Gradient {
                GradientStop { position: 0.0; color: "#1e2127" }
                GradientStop { position: 1.0; color: "#282c34" }
            }
        }

        // Logo
        Image {
            id: logo
            source: "logo.png"
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: parent.top
            anchors.topMargin: 80
            width: 120
            height: 120
            fillMode: Image.PreserveAspectFit
        }

        // Slide content
        Item {
            anchors.centerIn: parent
            width: parent.width * 0.8
            height: parent.height * 0.5

            // Slide 1: Welcome
            Item {
                id: slide1
                anchors.fill: parent
                visible: currentSlide === 0
                
                Column {
                    anchors.centerIn: parent
                    spacing: 20
                    
                    Text {
                        anchors.horizontalCenter: parent.horizontalCenter
                        text: "Welcome to Ubcos"
                        font.pixelSize: 36
                        font.bold: true
                        color: "#61afef"
                    }
                    
                    Text {
                        anchors.horizontalCenter: parent.horizontalCenter
                        text: "Ultra-Minimal. Fast. Beautiful."
                        font.pixelSize: 18
                        color: "#abb2bf"
                    }
                    
                    Text {
                        anchors.horizontalCenter: parent.horizontalCenter
                        text: "Based on Ubuntu 24.04 Noble"
                        font.pixelSize: 14
                        color: "#5c6370"
                    }
                }
            }

            // Slide 2: Openbox
            Item {
                id: slide2
                anchors.fill: parent
                visible: currentSlide === 1
                
                Column {
                    anchors.centerIn: parent
                    spacing: 20
                    
                    Text {
                        anchors.horizontalCenter: parent.horizontalCenter
                        text: "Openbox Desktop"
                        font.pixelSize: 32
                        font.bold: true
                        color: "#98c379"
                    }
                    
                    Text {
                        anchors.horizontalCenter: parent.horizontalCenter
                        text: "Lightweight window manager"
                        font.pixelSize: 16
                        color: "#abb2bf"
                        horizontalAlignment: Text.AlignHCenter
                    }
                    
                    Column {
                        spacing: 8
                        anchors.horizontalCenter: parent.horizontalCenter
                        
                        Feature {
                            text: "Full keyboard control"
                            color: "#98c379"
                        }
                        Feature {
                            text: "Highly customizable"
                            color: "#98c379"
                        }
                        Feature {
                            text: "Low memory usage"
                            color: "#98c379"
                        }
                    }
                }
            }

            // Slide 3: Features
            Item {
                id: slide3
                anchors.fill: parent
                visible: currentSlide === 2
                
                Column {
                    anchors.centerIn: parent
                    spacing: 20
                    
                    Text {
                        anchors.horizontalCenter: parent.horizontalCenter
                        text: "Modern Applications"
                        font.pixelSize: 32
                        font.bold: true
                        color: "#e5c07b"
                    }
                    
                    Row {
                        spacing: 40
                        anchors.horizontalCenter: parent.horizontalCenter
                        
                        Column {
                            spacing: 8
                            Image {
                                source: "icon.png"
                                width: 48
                                height: 48
                                anchors.horizontalCenter: parent.horizontalCenter
                            }
                            Text {
                                text: "SDDM"
                                color: "#abb2bf"
                                anchors.horizontalCenter: parent.horizontalCenter
                            }
                        }
                        
                        Column {
                            spacing: 8
                            Image {
                                source: "icon.png"
                                width: 48
                                height: 48
                                anchors.horizontalCenter: parent.horizontalCenter
                            }
                            Text {
                                text: "Calamares"
                                color: "#abb2bf"
                                anchors.horizontalCenter: parent.horizontalCenter
                            }
                        }
                        
                        Column {
                            spacing: 8
                            Image {
                                source: "icon.png"
                                width: 48
                                height: 48
                                anchors.horizontalCenter: parent.horizontalCenter
                            }
                            Text {
                                text: "PCManFM"
                                color: "#abb2bf"
                                anchors.horizontalCenter: parent.horizontalCenter
                            }
                        }
                    }
                }
            }

            // Slide 4: Installing
            Item {
                id: slide4
                anchors.fill: parent
                visible: currentSlide === 3
                
                Column {
                    anchors.centerIn: parent
                    spacing: 20
                    
                    Text {
                        anchors.horizontalCenter: parent.horizontalCenter
                        text: "Installing Ubcos"
                        font.pixelSize: 32
                        font.bold: true
                        color: "#c678dd"
                    }
                    
                    Text {
                        anchors.horizontalCenter: parent.horizontalCenter
                        text: "Just a few more steps..."
                        font.pixelSize: 16
                        color: "#abb2bf"
                    }
                    
                    Text {
                        anchors.horizontalCenter: parent.horizontalCenter
                        text: "Your system will be ready in minutes!"
                        font.pixelSize: 14
                        color: "#5c6370"
                    }
                }
            }
        }

        // Slide indicators
        Row {
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 30
            anchors.horizontalCenter: parent.horizontalCenter
            spacing: 10
            
            Repeater {
                model: totalSlides
                Rectangle {
                    width: 10
                    height: 10
                    radius: 5
                    color: index === currentSlide ? "#61afef" : "#3e4451"
                }
            }
        }
    }
}

// Feature component
Component {
    id: featureComponent
    Row {
        spacing: 8
        Text {
            text: "✓"
            color: parent.color
            font.pixelSize: 14
        }
        Text {
            text: modelData
            color: "#abb2bf"
            font.pixelSize: 14
        }
    }
}

Item {
    id: featureSingleton
    function createFeature(text, color) {
        return featureComponent.createObject(null, {text: text, color: color})
    }
}

Row {
    id: featureRow
    
    function addFeature(text, color) {
        var feature = Qt.createQmlObject(
            'import QtQuick 2.0; Row { spacing: 8; Text { text: "✓"; color: "' + color + '"; font.pixelSize: 14; } Text { text: "' + text + '"; color: "#abb2bf"; font.pixelSize: 14; } }',
            featureRow, "dynamicFeature"
        )
    }
}
