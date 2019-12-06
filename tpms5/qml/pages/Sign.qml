import QtQuick 2.0

Rectangle {
    id: redSign

    property string activeColor: "red"
    property string disactiveColor: "black"

    width: 300
    height: width
    anchors.horizontalCenter: parent.horizontalCenter

    color: activeColor

    border.color: "black"
    border.width: 1
    radius: width * 0.5

    state: "on"

    states: [
        State {
            name: "on"
            PropertyChanges {
                target: redSign
                color: activeColor
            }
        },
        State {
            name: "off"
            PropertyChanges {
                target: redSign
                color: disactiveColor
            }
        }
    ]
}
