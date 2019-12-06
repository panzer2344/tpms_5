import QtQuick 2.0
import Sailfish.Silica 1.0

Item{
    default property var itemWithText

    Button {
        id: _button
        text: itemWithText.text
    }
}
