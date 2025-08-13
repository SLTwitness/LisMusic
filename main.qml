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
import "qrc:/Basictop"
import Qt.labs.platform
import "qrc:/RightPage/StackPage/SettingSections"

LisMusic {
    id:mainwindow

    Connections{
        target: Config
        function onStartlogin(){
            loginpop.open()
        }
    }

    LeftPage{
        id:leftrec
        width: 205
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.bottom:bottomrec.top
        radius: 10  //
    }

    RightPage{
        id:rightrec
        anchors.left: leftrec.right
        anchors.right: parent.right
        anchors.top:parent.top
        anchors.bottom: bottomrec.top

        color:"#F7F9FC"
        Material.theme: Material.Light
        radius: 10  //
    }

    BottomSection{
        id:bottomrec
        height:80
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        radius: 10  //
    }

    Loginpop{
        id:loginpop
        anchors.centerIn: parent
        width: 375
        height: 520
        clip:true
        closePolicy: Popup.NoAutoClose
        // onOpened:{
        //     plzscan.restart()
        // }
    }

    OtherLoginpop {
        id: otherloginpop
    }

    QtObject{
        id:privatecolor
        property int colorindex: 0
        property color colorup: Config.showmusicplay?Config.musicclrup:Config.musicclrup1
        property color colordown: Config.showmusicplay?Config.musicclrdown:Config.musicclrdown1
        property color colorborder:Config.showmusicplay?Config.musicclrborder:Config.musicclrborder1
    }

}
