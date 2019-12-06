import QtQuick 2.0
import Sailfish.Silica 1.0

Text {
    property int secCount: 0
    text: secCount.toString()
    font.bold: true
    font.pointSize: 100

    signal overflow()

    function add(sec) {
        if(secCount + sec >= 60) {
            overflow();
        }
        secCount = (secCount + sec) % 60;
    }
}
