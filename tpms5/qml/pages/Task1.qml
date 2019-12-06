import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    SilicaFlickable {
    Column {
        id: root
        x: 200
        y: 200

        Rectangle {
            id: redSign
            width: 300
            height: width
            anchors.horizontalCenter: parent.horizontalCenter
            color: "red"
            border.color: "black"
            border.width: 1
            radius: width * 0.5
            state: "on"
            states: [
                State {
                    name: "on"
                    PropertyChanges {
                        target: redSign
                        color: "red"
                    }
                },
                State {
                    name: "off"
                    PropertyChanges {
                        target: redSign
                        color: "black"
                    }
                }
            ]
        }

        Rectangle {
            id: yellowSign
            width: 300
            height: width
            anchors.horizontalCenter: parent.horizontalCenter
            color: "yellow"
            border.color: "black"
            border.width: 1
            radius: width * 0.5
            state: "off"
            states: [
                State {
                    name: "on"
                    PropertyChanges {
                        target: yellowSign
                        color: "yellow"
                    }
                },
                State {
                    name: "off"
                    PropertyChanges {
                        target: yellowSign
                        color: "black"
                    }
                }
            ]
        }

        Rectangle {
            id: greenSign
            width: 300
            height: width
            anchors.horizontalCenter: parent.horizontalCenter
            color: "green"
            border.color: "black"
            border.width: 1
            radius: width * 0.5
            state: "off"
            states: [
                State {
                    name: "on"
                    PropertyChanges {
                        target: greenSign
                        color: "green"
                    }
                },
                State {
                    name: "off"
                    PropertyChanges {
                        target: greenSign
                        color: "black"
                    }
                }
            ]
        }

        state: "stop"
        states: [
            State {
                name: "stop"
                PropertyChanges {
                    target: redSign
                    state: "on"
                }
                PropertyChanges {
                    target: yellowSign
                    state: "off"
                }
                PropertyChanges {
                    target: greenSign
                    state: "off"
                }
            },
            State {
                name: "ready"
                PropertyChanges {
                    target: redSign
                    state: "off"
                }
                PropertyChanges {
                    target: yellowSign
                    state: "on"
                }
                PropertyChanges {
                    target: greenSign
                    state: "off"
                }
            },
            State {
                name: "go"
                PropertyChanges {
                    target: redSign
                    state: "off"
                }
                PropertyChanges {
                    target: yellowSign
                    state: "off"
                }
                PropertyChanges {
                    target: greenSign
                    state: "on"
                }
            }
        ]
    }
    }

    Timer {
        interval: 1000;
        running: true;
        repeat: true
        onTriggered: {
            switch(root.state) {
                case "stop":
                    root.state = "ready"
                    break
                case "ready":
                    root.state = "go"
                    break
                case "go":
                    root.state = "stop"
            }
        }
    }

}
