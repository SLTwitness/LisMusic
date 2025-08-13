import QtQuick
import QtQuick.Controls
import QtQuick.Controls.Material
import Config 1.0
import "qrc:/RightPage/StackPage/SettingSections/"
import "qrc:/Method"
import "qrc:/DataBase"
import Qt.labs.platform
import QtQuick.Layouts

Item {

    Flickable{
        id: selectflick
        anchors.fill: parent
        contentHeight: 2000
        clip: true
        ScrollBar.vertical: ScrollBar{
            anchors.right: parent.right
            anchors.rightMargin: 5
            width: 10
            contentItem: Rectangle{
                visible: parent.active
                implicitWidth: 10
                radius: 30
                color: "#E9EAEC"
            }
            background: Rectangle{
                color: "transparent"
            }
        }
        Column{
            anchors.fill: parent
            anchors.topMargin: 20
            clip: true
            spacing: 30

            RollPicture{
                anchors.left: parent.left
                anchors.right: parent.right
                height: 160
            }

            MusicList{
                anchors.left: parent.left
                anchors.right: parent.right
                height: 220
            }

            NewMusic{
                anchors.left: parent.left
                anchors.right: parent.right
                height: 400
            }
        }
    }
}
