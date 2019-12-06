import QtQuick 2.0
import Sailfish.Silica 1.0
import Nemo.Configuration 1.0

Page {
    id: page
    allowedOrientations: Orientation.All

    ConfigurationGroup {
        id: settings
        path: "apps/task5/settings"
        property int pops: 0
        property int pushs: 0
        property int depth : -10000
    }

    SilicaFlickable {
        anchors.fill: parent
        Column {
            spacing: 5

            Button {
                text: qsTr("Task1")
                onClicked: pageStack.push(Qt.resolvedUrl("Task1.qml"))
            }

            Button {
                text: qsTr("Task2")
                onClicked: pageStack.push(Qt.resolvedUrl("Task2.qml"))
            }

            Button {
                text: qsTr("Task3")
                onClicked: pageStack.push(Qt.resolvedUrl("Task3.qml"))
            }

            Button {
                text: qsTr("Task4")
                onClicked: pageStack.push(Qt.resolvedUrl("Task4.qml"))
            }

            Button {
                text: qsTr("Task5")
                onClicked: pageStack.push(Qt.resolvedUrl("Task5.qml"))
            }

            Button {
                text: qsTr("Task6")
                onClicked: pageStack.push(Qt.resolvedUrl("Task6.qml"))
            }

            Button {
                text: qsTr("Task7")
                onClicked: pageStack.push(Qt.resolvedUrl("Task7.qml"))
            }
        }
    }

    Component.onCompleted: {
        if(settings.depth === -10000) {
            settings.depth = pageStack.depth;
        }
        pageStack.busyChanged.connect(depthChangedHandler);
    }

    function depthChangedHandler() {
        if(pageStack.busy % 2 == 1)  return;

        var depth = pageStack.depth;

        if(settings.depth < depth) {
            settings.pushs = settings.pushs + 1;
        } else if(settings.depth > depth) {
            settings.pops = settings.pops + 1;
        }

        console.log("current pushes = " + settings.pushs);
        console.log("current pops = " + settings.pops);

        settings.depth = depth;
    }
}
