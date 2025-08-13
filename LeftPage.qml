import QtQuick
import QtQuick.Controls
import QtQuick.Controls.Material
import Config 1.0
import "qrc:/RightPage/StackPage/SettingSections/"
import "qrc:/Method"
import "qrc:/DataBase"
import Qt.labs.platform
import QtQuick.Layouts
import QtQuick.Effects


Rectangle{
    color:"#F0F3F6"

    Item{
        height: 60
        width: 100
        Image{
            id:logoicon
            source:"/Resrc/logo/1.png"
            scale: 0.35
            anchors.left:parent.left
            anchors.leftMargin: -10
        }
        Label{
            anchors.left: logoicon.right
            anchors.leftMargin: -25
            anchors.verticalCenter: logoicon.verticalCenter
            text:"远征队音乐"
            color:"#283248"
            font.pixelSize: 18
            font.weight: 400
            font.family: "Microsoft YaHei UI"
        }
    }
    Column{
        anchors.left:parent.left
        anchors.right:parent.right
        anchors.top:parent.top
        anchors.topMargin: 90
        height: 600
        spacing: 10
        Rectangle{
            id:pickrec
            anchors.left:parent.left
            anchors.leftMargin: 15
            anchors.right:parent.right
            anchors.rightMargin: 15
            height:36
            radius:10
            gradient: Gradient{
                orientation:Gradient.Horizontal
                GradientStop{position:0;color: "#FF1168"}
                GradientStop{position:0.4;color: "#FC3D49"}
            }
            Image{
                id:pickicon
                width: 18
                height: 18
                source:"/Resrc/Icon/24.png"
                anchors.leftMargin: 9
                anchors.bottomMargin: 9
                anchors.left: parent.left
                anchors.bottom: parent.bottom
            }
            Label{
                anchors.left:pickicon.right
                anchors.leftMargin: 5
                anchors.verticalCenter: pickicon.verticalCenter
                font.pixelSize: 14
                font.family: "Microsoft YaHei UI"
                font.weight: 400
                text:"精选"
                color:"white"
            }
        }
    }
}
