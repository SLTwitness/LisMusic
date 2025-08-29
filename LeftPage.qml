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
        id:reccolumn
        anchors.left:parent.left
        anchors.leftMargin: 20
        anchors.right:parent.right
        anchors.top:parent.top
        anchors.topMargin: 90
        height: 600
        spacing: 5
        property int crntindex: 0
        Repeater{
            model:["推荐","精选","播客","漫游","我的音乐"];
            delegate: Rectangle{
                width: 170
                height:36
                radius:8
                property bool hovered: false
                property Gradient grd: Gradient{
                    orientation:Gradient.Horizontal
                    GradientStop{position:0;color: "#FF1168"}
                    GradientStop{position:0.4;color: "#FC3D49"}
                }
                gradient: index==reccolumn.crntindex?grd:undefined
                color:index==reccolumn.crntindex?null:(hovered==true?"#E4E8EC":"transparent")
                Image{
                    width: 18
                    height: 18
                    source:"/Resrc/Icon/24.png"
                    anchors.leftMargin: 9
                    anchors.bottomMargin: 9
                    anchors.left: parent.left
                    anchors.bottom: parent.bottom
                }
                Label{
                    text:modelData
                    anchors.left:parent.left
                    anchors.leftMargin: 38
                    anchors.verticalCenter: parent.verticalCenter
                    font.pixelSize: 14
                    font.family: "Microsoft YaHei UI"
                    font.weight: 400
                    color:"#787F8D"
                }
                MouseArea{
                    anchors.fill: parent
                    hoverEnabled: true
                    onEntered: {
                        cursorShape=Qt.PointingHandCursor
                        parent.hovered=true
                    }
                    onExited: {
                        cursorShape=Qt.ArrowCursor
                        parent.hovered=false
                    }
                    onClicked: {
                        reccolumn.crntindex=index
                        Config.leftindex.push(index)
                        console.log("加入数字",index,"，目前数组长度"+Config.leftindex.length)
                        if(reccolumn.crntindex==0){
                            Config.tomusicshow()
                        }
                        if(reccolumn.crntindex==4){
                            Config.tomymusic()
                        }
                    }
                }
            }
        }
        Connections{
            target: Config
            function onChangepage(){
                console.log(Config.leftindex[Config.leftindex.length-2])
                reccolumn.crntindex=Config.leftindex[Config.leftindex.length-2]
                Config.leftindex.pop()
            }
        }
    }
}
