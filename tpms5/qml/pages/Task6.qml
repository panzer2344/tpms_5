import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    SilicaFlickable {
        anchors.fill: parent


            Row {
                anchors.verticalCenter: parent.verticalCenter
                anchors.horizontalCenter: parent.horizontalCenter

                spacing: 10

                Hours { id: hours }
                Text { text: " : "; font.pointSize: 100; font.bold: true }
                Minutes {
                    id: minutes
                    onOverflow: {
                        hours.add(1)
                    }
                }
                Text { text: " : "; font.pointSize: 100; font.bold: true }
                Seconds {
                    id: seconds
                    onOverflow: {
                        minutes.add(1)
                    }
                }
            }


    }

    Timer {
        interval: 1000;
        running: true;
        repeat: true
        onTriggered: seconds.add(1)
    }
}
