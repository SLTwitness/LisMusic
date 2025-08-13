import QtQuick
import QtQuick.Controls
import QtQuick.Controls.Material
import "qrc:/Basictop"
import "qrc:/Method"
Item {
    Searchtop{
        id:searchrec
        anchors.left: parent.left
        anchors.leftMargin: 36
        anchors.verticalCenter: titlesec.verticalCenter
        spacing:5
    }

    Usertop{
        id:titlesec
        anchors.verticalCenter: basicsec.verticalCenter
        anchors.right: basicsec.left
        //anchors.rightMargin: 0.15*mainwindow.width
        spacing: 5
    }

    Basictop{
        id:basicsec
        anchors.right: parent.right
        anchors.top: parent.top
        height: 60
        width: 280
    }
}
