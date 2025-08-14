import QtQuick
import QtQuick.Controls
import QtQuick.Controls.Material
import Config 1.0
import "qrc:/RightPage/StackPage/SettingSections/"
import "qrc:/Method"
import "qrc:/DataBase"
import Qt.labs.platform

Item{
    id:foldersec
    height: 200
    width: 800
    property string foldertxt: "下载目录"
    property string foldertxturl: "C:\\wozenmezhidao"
    Label{
        id:downloadfolder
        text:foldertxt
        font.pixelSize: 14
        font.weight: 600
        font.family: "Microsoft YaHei UI"
        color:"#3C4562"
        anchors.left: parent.left
    }
    Label{
        id:folderurl
        text:foldertxturl
        font.pixelSize: 14
        width:400
        anchors.left: downloadfolder.left
        anchors.top:downloadfolder.bottom
        anchors.topMargin: 15
        color:"#3C4562"
        elide:Text.ElideRight
    }
    Rectangle{
        id:folderrec
        height: 30
        width: 100
        radius: 15
        anchors.left:folderurl.right
        anchors.leftMargin: folderurl.contentWidth-350
        anchors.verticalCenter: folderurl.verticalCenter
        color:"transparent"
        border.width: 0.7
        border.color: "#E5E8EC"
        Label{
            text:"更改目录"
            font.pixelSize: 14
            anchors.centerIn: parent
            anchors.topMargin: 10
            color: "#3C4562"
        }
        MouseArea{
            anchors.fill: parent
            hoverEnabled: true
            onEntered: {
                folderrec.color="#F0F3F6"
                folderrec.border.color="#C6CBD1"
                cursorShape=Qt.PointingHandCursor
            }
            onExited: {
                folderrec.color="transparent"
                folderrec.border.color="#E5E8EC"
                cursorShape=Qt.ArrowCursor
            }
            onClicked: {
                folderopen.open()
            }
        }
    }
    FolderDialog{
        id:folderopen
        onAccepted: {
            let s=String(folderopen.currentFolder)
            let str=s.slice(8)
            folderurl.text=str
        }
    }
}

