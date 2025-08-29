import QtQuick
import QtQuick.Controls
import QtQuick.Controls.Material
import "qrc:/Basictop"
import "qrc:/Method"
import "qrc:/RightPage"
import Config 1.0

Rectangle{
    RightTopTitle{
        id:rtoptitle
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top:parent.top
        height:60
    }

    StackView{
        id:rstackview
        anchors.top:rtoptitle.bottom
        anchors.left: parent.left
        anchors.right:parent.right
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 0
        clip:true
        initialItem: "qrc:/RightPage/StackPage/MusicShow.qml"
    }

    Connections{
        target: Config
        function onTomymusic(){
            rstackview.push("qrc:/RightPage/StackPage/MyMusic.qml")
            Config.stackstate.push(()=>{rstackview.pop()})
        }
        function onTomusicshow(){
            rstackview.push("qrc:/RightPage/StackPage/MusicShow.qml")
            Config.stackstate.push(()=>{rstackview.pop()})
        }
    }
}
