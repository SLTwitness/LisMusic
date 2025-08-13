import QtQuick
import QtQuick.Controls
import QtQuick.Controls.Material
import Config 1.0
import "qrc:/RightPage/StackPage/SettingSections/"
import "qrc:/Method"
import "qrc:/DataBase"
import Qt.labs.platform
import QtQuick.Layouts


Rectangle{
    color:"#FAFAFA"
    border.color: "#E5E6E8"
    border.width: 0.7

    Item{
        id:musicpic
        width: 50
        height: 50
        anchors.left: parent.left
        anchors.bottom: parent.bottom
        anchors.leftMargin: 25
        anchors.bottomMargin: 5
        Image {
            width: 65
            height:width
            anchors.left: parent.left
            anchors.bottom: parent.bottom
            source: "/Resrc/Pic/25.png"
        }
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
            fithei: 43
            fitwid: 43
            fitef:0.5
            src:"qrc:/Resrc/Icon/27.png"
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
            anchors.verticalCenter: playslider.verticalCenter
            text:Number(playslider.value).toFixed(2)
            color:"#A6AAB3"
            font.pixelSize: 10
            font.weight: 200
            font.family: "Microsoft YaHei UI"
        }
        Slider{
            id:playslider
            value: 2.18
            from:0
            to:3.42
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
        }
        Label{
            text:"03:42"
            color:"#A6AAB3"
            font.pixelSize: 10
            font.weight: 200
            font.family: "Microsoft YaHei UI"
            anchors.verticalCenter: playslider.verticalCenter
        }
    }
}
