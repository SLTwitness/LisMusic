import QtQuick
import QtQuick.Controls
import QtQuick.Controls.Material
import Config 1.0
import "qrc:/RightPage/StackPage/SettingSections/"
import "qrc:/Method"
import "qrc:/DataBase"
import Qt.labs.platform
import QtQuick.Layouts
import QtMultimedia
import musicinfo 1.0
import musicplay 1.0
import QtQuick.Effects
import Qt5Compat.GraphicalEffects

Popup{
    id:poplis
    x:0
    y:parent.height
    width: parent.width
    height: 753
    background: Rectangle{
        anchors.fill: parent
        color:"#242424"
        radius: 7
        Rectangle{
            color:"#2C2C2C"
            anchors.top: parent.top
            anchors.left: parent.left
            anchors.topMargin: 27
            anchors.leftMargin: 40
            radius: 7
            border.width: 0.7
            border.color: "#393939"
            width: 40
            height: width
            Image {
                source: "qrc:/Resrc/Icon/34.png"
                anchors.centerIn: parent
                scale: 0.7
            }
            MouseArea{
                anchors.fill: parent
                hoverEnabled: true
                onEntered: {
                    cursorShape=Qt.PointingHandCursor
                    parent.color="#323232"
                }
                onExited: {
                    cursorShape=Qt.ArrowCursor
                    parent.color="#2C2C2C"
                }
                onClicked: {
                    poplis.close()
                }
            }
        }
    }

    enter: Transition {
        NumberAnimation{
            target: poplis
            property: "y"
            from:parent.height
            to:-673
            duration: 500
            easing.type: Easing.OutCubic
        }
    }
    exit: Transition {
        NumberAnimation{
            target: poplis
            property: "y"
            from:-673
            to:parent.height
            duration: 500
            easing.type: Easing.OutCubic
        }
    }
}
