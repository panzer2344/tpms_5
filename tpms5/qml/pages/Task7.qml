import QtQuick 2.0
import Sailfish.Silica 1.0
import Nemo.Configuration 1.0

Page {
    // Добавить обработчик сигналов PageStack, подсчитывающий количество добавленных и удаленных страниц в PageStack

    ConfigurationGroup {
        id: settings
        path: "apps/task5/settings"
        property int pops: 0
        property int pushs: 0
        property int depth : 0
    }

    Column {
        Button {
            text: "Add page"
            onClicked: pageStack.push(Qt.resolvedUrl("Task7.qml"));
        }

        Button {
            text: "Remove page"
            onClicked: pageStack.pop();
        }
    }

}
