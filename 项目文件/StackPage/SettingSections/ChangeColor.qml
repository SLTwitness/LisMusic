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

Popup{
    id:colorpop
    width: 440
    height: 260
    modal: true
    x:(parent.width-width)/2
    y:(parent.height-height)/2
    closePolicy: Popup.NoAutoClose
    Connections {
        target: Config
        function onOpencolordialog() {
        if (Config.showmusicplay) {
                privatecolor.colorup = Config.musicclrup
                privatecolor.colordown = Config.musicclrdown
                privatecolor.colorborder = Config.musicclrborder
        } else {
            privatecolor.colorup = Config.musicclrup1
            privatecolor.colordown = Config.musicclrdown1
            privatecolor.colorborder = Config.musicclrborder1
        }
        privatecolor.colorindex = 0
        colorpop.open()
        }
    }

    ColorDialog{
        id:colordialogpop
        title:"选择你的英雄"
        onAccepted: {
            if(privatecolor.colorindex===0){
                privatecolor.colorup=color
            }
            else if(privatecolor.colorindex===1){
                privatecolor.colordown=color
            }
            else if(privatecolor.colorindex===2){
                privatecolor.colorborder=color
            }
        }
    }

    background: Rectangle{
        anchors.fill: parent
        radius: 10
        color:"#FFFFFF"
        ButtonHover{
            anchors.top: parent.top
            anchors.right: parent.right
            anchors.topMargin: 10
            anchors.rightMargin: 10
            src:"/Resrc/Icon/6.png"
            onClicked: {
                colorpop.close()
            }
        }
        Label{
            id:colorchangtitle
            text:"更改「"+(Config.showmusicplay?"已播放":"未播放")+"」配色方案"
            color:"#283248"
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top:parent.top
            anchors.topMargin: 40
            font.weight:600
            font.pixelSize: 19
            font.family: "Microsoft YaHei UI"
        }

        Item {
            anchors.top: colorchangtitle.bottom
            anchors.topMargin: 55
            width: parent.width
            Row {
                id: colorRow
                anchors.horizontalCenter: parent.horizontalCenter
                spacing: 23
                Rectangle {
                    width: 40
                    height: width
                    radius: 8
                    border.color: privatecolor.colorborder
                    border.width: 1
                    gradient: Gradient {
                        GradientStop { position: 0; color: privatecolor.colorup }
                        GradientStop { position: 1; color: privatecolor.colordown }
                    }
                }
                Repeater {
                    model: ["渐变上", "渐变下", "描边"]
                    delegate: Rectangle {
                        width: 95
                        height: 35
                        radius: 20
                        border.width: 1
                        border.color: "#F3F5F5"
                        color: "#F8F9F9"
                        Row {
                            anchors.centerIn: parent
                            spacing: 5
                            Rectangle {
                                width: 15
                                height: 15
                                radius: 3
                                color: index === 0 ? privatecolor.colorup :
                                            (index === 1 ? privatecolor.colordown : privatecolor.colorborder)
                            }
                            Label {
                                text: modelData
                                font.pixelSize: 12
                                font.family: "Microsoft YaHei UI"
                                color: "#606878"
                            }
                        }

                        MouseArea {
                            anchors.fill: parent
                            hoverEnabled: true
                            onEntered:{
                                cursorShape = Qt.PointingHandCursor
                            }
                            onExited: {
                                cursorShape = Qt.ArrowCursord
                            }
                            onClicked:{
                                privatecolor.colorindex=index
                                colordialogpop.open()
                            }
                        }
                    }
                }
            }
            Rectangle{
                id:confirmcolor
                height: 38
                width: 160
                radius: 20
                anchors.top:colorRow.bottom
                anchors.topMargin: 30
                anchors.horizontalCenter: colorRow.horizontalCenter
                opacity:1
                gradient: Gradient{
                    orientation: Gradient.Horizontal
                    GradientStop{
                        position: 0
                        color:"#FC3B5B"
                    }
                    GradientStop{
                        position: 1
                        color:"#FC3D49"
                    }
                }
                Label{
                    text:"确认"
                    color:"white"
                    font.pixelSize: 16
                    font.weight: 400
                    font.family: "Microsoft YaHei UI"
                    anchors.centerIn: parent
                }
                MouseArea{
                    anchors.fill:parent
                    hoverEnabled: true
                    onEntered: {
                        confirmcolor.opacity=0.9
                        cursorShape=Qt.PointingHandCursor
                    }
                    onExited: {
                        confirmcolor.opacity=1
                        cursorShape=Qt.ArrowCursor
                    }
                    onClicked: {
                        if(Config.showmusicplay){
                            Config.musicclrup=privatecolor.colorup
                            Config.musicclrdown=privatecolor.colordown
                            Config.musicclrborder=privatecolor.colorborder
                        }
                        else{
                            Config.musicclrup1=privatecolor.colorup
                            Config.musicclrdown1=privatecolor.colordown
                            Config.musicclrborder1=privatecolor.colorborder
                        }
                        colorpop.close()
                    }
                }
            }
        }
    }
}

