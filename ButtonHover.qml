import QtQuick
import QtQuick.Effects

Item {
    id:it
    property url src:""
    property real imgsc: 1
    property real effsc: 1
    property real fitwid: 23
    property real fithei: 21
    property color fitclr:"#283248"
    property real fitef: 1.0
    property bool isplay: false
    width: img.width
    height: img.height

    signal clicked()

    Image {
        id:img
        scale:imgsc
        source:src

        width: fitwid
        height: fithei
    }
    MultiEffect{
        id:effect
        source: img
        scale:effsc
        anchors.fill: parent
        visible: false
        colorization: fitef
        colorizationColor:fitclr
    }
    MouseArea{
        anchors.fill: parent
        hoverEnabled: true
        propagateComposedEvents: true
        onEntered: {
            effect.visible=true
            cursorShape=Qt.PointingHandCursor
        }
        onExited: {
            effect.visible=false
            cursorShape=Qt.ArrowCursor
        }
        onClicked: {
            it.clicked()
            isplay=!isplay
        }
    }
}
