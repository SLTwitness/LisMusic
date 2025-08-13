import QtQuick
import QtQuick.Controls
import QtQuick.Controls.Material
import Config 1.0
import "qrc:/RightPage/StackPage/SettingSections/"
import "qrc:/Method"

RadioButton{    //单选
    id:closechose
    property string chosetxt: "退出队音乐"
    property color choseclr: "#A0A6B1"
    indicator: Item {
        width: 15
        height: 15
        anchors.verticalCenter: closechose.verticalCenter
        Rectangle {
            anchors.centerIn: parent
            width: 15
            height: 15
            radius: 7.5
            color: "transparent"
            border.color: closechose.checked?"#FF3A3A":"#A0A6B1"
            border.width: 1.2
        }
        Rectangle {
            anchors.centerIn: parent
            width: closechose.checked ? 7 : 0
            height: closechose.checked ? 7 : 0
            radius: 3.5
            color: "#FF3A3A"
            Behavior on width { NumberAnimation { duration: 100 } }
            Behavior on height { NumberAnimation { duration: 100 } }
        }
    }
    contentItem: Text {
        text: chosetxt
        font.pixelSize: 13
        color: choseclr
        anchors.verticalCenter: parent.verticalCenter
        anchors.left: parent.left
        anchors.leftMargin: 22
    }
}
