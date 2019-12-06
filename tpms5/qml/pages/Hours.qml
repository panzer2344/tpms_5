import QtQuick 2.0
import Sailfish.Silica 1.0

Text {
    property int hoursCount: 0
    text: hoursCount.toString()
    font.bold: true
    font.pointSize: 100

    function add(hours) {
        hoursCount = (hoursCount + hours) % 24;
    }
}
