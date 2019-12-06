import QtQuick 2.0
import Sailfish.Silica 1.0

Page {

    Button {
        id: _text
        anchors.horizontalCenter: parent.horizontalCenter
        state: "top"

        Text{
            id: _text_

            anchors.horizontalCenter: parent.horizontalCenter

            font.bold: true
            font.pixelSize: 46
            color: "blue"

            text: "Hello!"
        }

        states: [
            State {
                name: "top"
                AnchorChanges {
                    target: _text
                    anchors.top: parent.top
                    anchors.bottom: undefined
                }
            },
            State {
                name: "bot"
                AnchorChanges {
                    target: _text
                    anchors.top: undefined
                    anchors.bottom: parent.bottom
                }
            }
        ]

        transitions: [
            Transition {
                from: "top"
                to: "bot"
                AnchorAnimation {
                    duration: 2000
                }
                RotationAnimation {
                    target: _text
                    from: 0
                    to: 180
                    duration: 2000
                }
                ColorAnimation {
                    target: _text_
                    from: "blue"
                    to: "green"
                    property: "color"
                    duration: 2000
                }
            },
            Transition {
                from: "bot"
                to: "top"
                AnchorAnimation {
                    duration: 2000
                }
                RotationAnimation {
                    target: _text
                    from: 180
                    to: 0
                    duration: 2000
                }
                ColorAnimation {
                    target: _text_
                    from: "green"
                    to: "blue"
                    property: "color"
                    duration: 2000
                }
            }
        ]

        onPressedChanged: {

            if(_text.state === "bot") {
                _text.state = "top";
            } else {
                _text.state = "bot";
            }
        }

    }

}
