import QtQuick
import QtQuick.Effects
import QtQuick.Controls
import QtQuick.Controls.Material
import "qrc:/RightPage"
import "qrc:/LeftPage"
import "qrc:/BottomSection"
import "qrc:/MainWindow"
import "qrc:/Method"
import Config 1.0
import "qrc:/DataBase"

Item {  //多选
    id: isuse
    height: 15
    width: rec.width+selecttxt.width
    property string selecttxt: "自动登录"
    property color selectcolor: "#3C455A"
    property int selecttext : 0 //0纯文本 1副文本
    MouseArea{
        anchors.fill: parent
        hoverEnabled: true
        onEntered: {
            cursorShape=isuse.enabled?Qt.PointingHandCursor:Qt.ForbiddenCursor
        }
        onExited: {
            cursorShape=Qt.ArrowCursor
        }
        onClicked: {
            rec.toselect=!rec.toselect
        }
    }
    Row{
        anchors.left: parent.left
        anchors.verticalCenter: parent.verticalCenter
        spacing: 5
        Rectangle{
            id:rec
            width: 15
            height: width
            radius: 3
            color: rec.toselect?"red":"transparent"
            border.color: rec.enabled?(rec.toselect?"#FF3A3A":"#A9ADB6"):"#E3E6EB"
            border.width: 0.7
            property bool toselect: false
            Label{
                id:selectlabel
                text: "√"
                color: "white"
                font.pixelSize: 13
                font.weight: 800
                font.family: "Microsoft YaHei UI"
                anchors.centerIn: parent
                visible: parent.toselect
            }
        }
        Label{
            id:selecttxt
            text:isuse.selecttxt
            font.pixelSize: 13
            font.weight:100
            font.family: "Microsoft YaHei UI"
            anchors.verticalCenter: rec.verticalCenter
            color: isuse.enabled?isuse.selectcolor:"#BFC3CB"
            textFormat: isuse.selecttext===0?Text.Normal:Text.RichText
        }
    }
}

