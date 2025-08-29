import QtQuick
import QtQuick.Controls
import QtQuick.Controls.Material
import Config 1.0

ComboBox {
    id:chosefont
    property int dataheight: count < 8 ? count * 30 : 210
    property real leftpad: 7
    property real fontwit: 200
    property int showindex:0
    currentIndex: showindex
    background: Rectangle {
        anchors.fill: parent
        color: "#F0F3F6"
        border.width: 0.7
        border.color: "#E4E8EB"
        radius: 20
        MouseArea {
            anchors.fill: parent
            hoverEnabled: true
            onEntered: cursorShape = Qt.PointingHandCursor
            onExited: cursorShape = Qt.ArrowCursor
            onClicked: chosefont.popup.visible = !chosefont.popup.visible
        }
    }

    indicator: Label {
        text: chosefont.popup.visible ? "⮝" : "⮟"
        font.pixelSize: 15
        font.weight: 600
        color: "black"
        anchors.right: parent.right
        anchors.rightMargin: 12
        anchors.verticalCenter: parent.verticalCenter
        elide: Text.ElideRight
    }
    contentItem: Text {
        text: chosefont.currentText
        color: "#283248"
        font.pixelSize: 13
        font.weight: fontwit
        font.family: "Microsoft YaHei UI"
        verticalAlignment: Text.AlignVCenter
        leftPadding: leftpad
    }
    model: ["默认", "仿宋", "华文仿宋", "华文宋体", "华文新魏", "华文楷体",
            "华文细黑", "华文行楷", "宋体", "幼圆", "微软雅黑", "思源黑体", "新宋体",
            "方正姚体", "方正舒体", "楷体", "等线", "隶书", "黑体"]
    popup: Popup {
        y: parent.height + 5
        width: parent.width
        height: chosefont.dataheight
        background: Rectangle {
            anchors.fill: parent
            radius: 10
            color: "white"
            clip: true
            ListView {
                anchors.fill: parent
                model: chosefont.model
                ScrollBar.vertical: ScrollBar{
                    anchors.right: parent.right
                    anchors.rightMargin: 5
                    width: 10
                    contentItem: Rectangle{
                        visible: parent.active
                        implicitWidth:10
                        radius: 30
                        color: "#E9EAEC"
                    }
                    background: Rectangle{
                        color: "transparent"
                    }
                }
                delegate: Rectangle {
                    width: chosefont.width
                    height: 30
                    color: "transparent"
                    Text {
                        text: modelData
                        font.pixelSize: 14
                        font.family: "Microsoft YaHei UI"
                        color: "#686F7F"
                        anchors.left: parent.left
                        anchors.leftMargin: 5
                        anchors.verticalCenter: parent.verticalCenter
                    }
                    MouseArea {
                        anchors.fill: parent
                        hoverEnabled: true
                        onEntered: {
                            parent.color = "#F2F3F4"
                            cursorShape = Qt.PointingHandCursor
                        }
                        onExited: {
                            parent.color = "transparent"
                            cursorShape = Qt.ArrowCursor
                        }
                        onClicked: {
                            chosefont.currentIndex = index
                            chosefont.popup.visible = false
                        }
                    }
                }
            }
        }
    }
}

