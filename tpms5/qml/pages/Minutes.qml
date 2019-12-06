import QtQuick 2.0
import Sailfish.Silica 1.0

Text {
    property int minCount: 0
    text: minCount.toString()
    font.bold: true
    font.pointSize: 100

    signal overflow()

    function add(min) {
        if(minCount + min >= 60) {
            overflow();
        }
        minCount = (minCount + min) % 60;
    }
}
