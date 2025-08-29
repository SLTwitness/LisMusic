import QtQuick
import QtQuick.Controls
import QtQuick.Controls.Material
import Config 1.0
import "qrc:/RightPage/StackPage/SettingSections/"
import "qrc:/Method"
import "qrc:/DataBase"
import Qt.labs.platform
import QtQuick.Layouts
import QtMultimedia
import musicinfo 1.0
import musicplay 1.0
import QtQuick.Effects
import Qt5Compat.GraphicalEffects
import "qrc:/PopPage/PopPage"

Rectangle{
    color:"#FAFAFA"
    border.color: "#E5E6E8"
    border.width: 0.7

    Item{
        id:musicpic
        width: 65
        height: 65
        anchors.left: parent.left
        anchors.bottom: parent.bottom
        anchors.leftMargin: 25
        anchors.bottomMargin: 5

        rotation: angle
        transformOrigin: Item.Center
        property real angle:0
        property bool isrot: false
        Image {
            width: 65
            height:width
            anchors.left: parent.left
            anchors.bottom: parent.bottom
            source: "/Resrc/Pic/25.png"
            property bool isrot: false
            Timer{
                interval: 100
                running: musicpic.isrot
                repeat: true
                onTriggered:{
                    musicpic.angle+=1
                }
            }
            MouseArea{
                anchors.fill: parent
                hoverEnabled: true
                onEntered: {
                    cursorShape=Qt.PointingHandCursor
                }
                onExited: {
                    cursorShape=Qt.ArrowCursor
                }
                onClicked: {
                    poplis.open()
                }
            }
        }
    }
    Popmusic{
        id:poplis
    }

    Label{
        id:musicname
        anchors.left: musicpic.right
        anchors.top :parent.top
        anchors.leftMargin: 25
        anchors.topMargin: 17
        text:"Lumière"
        color:"#2D374C"
        font.pixelSize: 16
        font.weight: 400
        font.family: "Microsoft YaHei UI"

        Connections{
            target: player
            function onTitleChanged(title){
                musicname.text=title
            }
        }
    }
    Label{
        id:authortext
        anchors.left: musicname.right
        anchors.leftMargin: 7
        anchors.verticalCenter: musicname.verticalCenter
        text:"- 未知"
        color:"#7C828F"
        font.pixelSize: 14
        font.weight: 200
        font.family: "Microsoft YaHei UI"

        Connections{
            target: player
            function onAuthorChanged(author){
                authortext.text="- "+author
            }
        }
    }

    Row{
        anchors.left: musicpic.right
        anchors.top :musicname.top
        anchors.leftMargin: 25
        anchors.topMargin: 30
        spacing:20
        ButtonHover{
            src:"qrc:/Resrc/Icon/21.png"
        }
        ButtonHover{
            src:"qrc:/Resrc/Icon/22.png"
        }
        ButtonHover{
            src:"qrc:/Resrc/Icon/23.png"
        }

    }

    Row{
        id:playrow
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top :parent.top
        anchors.topMargin: 10
        spacing: 25
        ButtonHover{
            anchors.top: parent.top
            anchors.topMargin: 13
            fithei: 20
            fitwid: 20
            src:"qrc:/Resrc/Icon/25.png"
        }
        ButtonHover{
            id:playicon
            fithei: 43
            fitwid: 43
            fitef:0.5
            src:isplay===true?"qrc:/Resrc/Icon/32.png":"qrc:/Resrc/Icon/27.png"
            onClicked: {
                if(isplay){
                    player.stopplay()
                    musicpic.isrot=false
                }
                else{
                    player.startplay()
                    musicpic.isrot=true
                }
            }
        }
        Connections{
            target: Config
            function onPlayed(){
                playicon.isplay=true
                musicpic.isrot=true
            }
        }

        ButtonHover{
            anchors.top: parent.top
            anchors.topMargin: 13
            fithei: 20
            fitwid: 20
            src:"qrc:/Resrc/Icon/26.png"
        }
    }

    Row{
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top :playrow.bottom
        anchors.topMargin: 8
        spacing: 10
        Label{
            id:currenttime
            anchors.verticalCenter: playslider.verticalCenter
            text:"00:00"
            color:"#A6AAB3"
            font.pixelSize: 10
            font.weight: 200
            font.family: "Microsoft YaHei UI"

            Timer{
                interval: 500
                running: true
                repeat: true
                onTriggered: {
                    currenttime.text = player.transtime(player.position())
                }
            }
        }
        Slider{
            id:playslider
            value: 2.18
            from:0
            to:100
            stepSize:0.01
            width: 350
            height: 5
            background: Rectangle{
                implicitHeight: 5
                radius: 10
                width: parent.width
                color:"#E2E5E9"
                Rectangle{
                    radius: 10
                    width: parent.width*playslider.position
                    height:parent.height
                    color:"#FF3A3A"
                }
            }
            handle: Rectangle{
                width: 15
                height: 15
                radius: height/2
                color:"#F7F7F7"
                anchors.verticalCenter: parent.verticalCenter
                x:playslider.visualPosition * (playslider.width - width)
            }

            onMoved: {
                var currentpos=player.duration()*(playslider.value/100)
                player.setpos(currentpos)
            }
            Timer{
                interval: 1000  //触发时间间隔
                running: true
                repeat: true
                onTriggered: {
                    if(!playslider.pressed){
                        playslider.value=player.position()/player.duration()*100
                    }
                }
            }
        }
        Label{
            id:timelabel
            text:"00:00"
            color:"#A6AAB3"
            font.pixelSize: 10
            font.weight: 200
            font.family: "Microsoft YaHei UI"
            anchors.verticalCenter: playslider.verticalCenter

            Connections{
                target: player
                function onDurationChanged(){
                    timelabel.text = player.transtime(player.duration())
                }
            }
        }
    }

    ButtonHover{
        id:voiceicon
        src:"qrc:/Resrc/Icon/33.png"
        anchors.top: parent.top
        anchors.topMargin: 32
        anchors.right: parent.right
        anchors.rightMargin: 100
        onClicked: {
            voicepop.open()
        }
    }

    Popup{
        id:voicepop
        x:voiceicon.x-5
        y:voiceicon.y-115
        width: 30
        height: 110
        background: Item {
            anchors.fill: parent
            DropShadow{
                anchors.fill: poprec
                source: poprec
                color: "#40000000"
                // samples: 25
                radius: 10
            }
            Rectangle {
                id:poprec
                anchors.fill: parent
                radius: 6
                color: "white"
                //border.color: "#E0E0E0"
            }
        }
        contentItem:Slider{
            anchors.fill: parent
            orientation: Qt.Vertical
            from: 0
            to:1
            stepSize: 0.01
            value:0.5
            onValueChanged: {
                player.setvoice(value)
            }
        }
    }
}
