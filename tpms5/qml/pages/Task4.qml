import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    SilicaFlickable {
    Column {
        id: root
        x: 200
        y: 200


        Image {
            id: man
            x: -100
            y: -50
//                source: "image://theme/icon-m-contact"
            source: "image://theme/icon-cover-pause"
        }


        Sign {
            id: redSign
            activeColor: "red"
            state: "off"
        }

        Sign {
            id: yellowSign
            activeColor: "yellow"
            state: "off"
        }

        Sign {
            id: greenSign
            activeColor: "green"
            state: "off"
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

        transitions: [
            Transition {
                from: "ready"
                to: "go"

                NumberAnimation {
                    target: man
                    property: "x"
                    from: man.x
                    to: man.x == -100 ? parent.width - 150 : -100
                    duration: 1000
                    easing.type: Easing.InOutQuad
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
