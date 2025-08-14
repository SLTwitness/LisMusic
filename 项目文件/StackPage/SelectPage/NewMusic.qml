import QtQuick
import QtQuick.Controls
import QtQuick.Controls.Material
import Config 1.0
import "qrc:/RightPage/StackPage/SettingSections/"
import "qrc:/Method"
import "qrc:/DataBase"
import Qt.labs.platform
import QtQuick.Layouts


Item{
    anchors.left: parent.left
    anchors.right: parent.right
    height: 400
    MouseArea{
        anchors.fill: parent
        hoverEnabled: true
        onEntered: {
            lefticon.visible=true
            righticon.visible=true
        }
        onExited: {
            lefticon.visible=false
            righticon.visible=false
        }
    }
    Label{
        id:newmusic
        text:"最新音乐 >"
        color:"#283248"
        font.weight: 600
        font.family: "Microsoft YaHei UI"
        font.pixelSize: 18
        anchors.top: parent.top
        anchors.topMargin: 65
        anchors.left: parent.left
        anchors.leftMargin: 20
    }
    Item{
        height: parent.height
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: newmusic.bottom
        anchors.topMargin: 10
        property real offsety: 10
    }
    ButtonHover{
        id:lefticon
        src:"/Resrc/Icon/18.png"
        anchors.left: parent.left
        anchors.top: newmusic.bottom
        anchors.topMargin: 134
        enabled:newmusicgrid.x===0?false:true
        fitwid: 21.5
        fithei: 43
        visible: false
        onClicked: {
            showless.start()
        }
    }
    ButtonHover{
        id:righticon
        src:"/Resrc/Icon/19.png"
        anchors.right: parent.right
        anchors.rightMargin: 10
        anchors.top: newmusic.bottom
        anchors.topMargin: 134
        enabled:newmusicgrid.x===0?true:false
        fitwid: 21.5
        fithei: 43
        visible: false
        onClicked: {
            showmore.start()
        }
    }

    NumberAnimation{
        id:showmore
        target: newmusicgrid
        property: "x"
        from:newmusicgrid.x
        to:newmusicgrid.x-800
        duration: 400
        easing.type:Easing.InOutQuad
    }
    NumberAnimation{
        id:showless
        target: newmusicgrid
        property: "x"
        from:newmusicgrid.x
        to:newmusicgrid.x+800
        duration: 400
        easing.type:Easing.InOutQuad
    }

    Item{
        anchors.left: lefticon.right
        anchors.leftMargin: 5
        anchors.right: righticon.left
        anchors.rightMargin: 10
        anchors.top:newmusic.bottom
        height: 400
        width: 300
        clip: true
        property real ofst: 30
        ListModel{
            id:modelnewmusic
            ListElement{musicname:"Alicia";singer:"Maelle";sviper:"没有母带";viper:""}
            ListElement{musicname:"Gustave";singer:"Lune";sviper:"没有母带";viper:"偷唱"}
            ListElement{musicname:"Lumière";singer:"Sciel";sviper:"没有母带";viper:""}
            ListElement{musicname:"Spring Meadows";singer:"Monoco";sviper:"";viper:"偷唱"}
            ListElement{musicname:"Lune";singer:"EsQuie";sviper:"没有母带";viper:""}
            ListElement{musicname:"World Map";singer:"Gustave";sviper:"没有母带";viper:"偷唱"}
            ListElement{musicname:"Flying Waters";singer:"verso";sviper:"没有母带";viper:""}
            ListElement{musicname:"The Curator";singer:"who know";sviper:"没有母带";viper:""}
            ListElement{musicname:"Sciel";singer:"wo bu know";sviper:"没有母带";viper:""}
            ListElement{musicname:"Firecamp";singer:"ever";sviper:"没有母带";viper:""}
            ListElement{musicname:"Loin d'Elle";singer:"unknown";sviper:"";viper:"偷唱"}
            ListElement{musicname:"Une vie à t'aimer";singer:"Renoir";sviper:"没有母带";viper:""}
        }
        Grid{
            id:newmusicgrid
            width: parent.width
            height: parent.height
            anchors.top:parent.top
            anchors.topMargin: 20
            spacing: 15
            Repeater{
                id:newmusicrep
                model:modelnewmusic
                Rectangle{
                    id:newmusicrec
                    width: 380
                    height: 80
                    radius: 15
                    color: "#F7F9FC"
                    border.color:"transparent"
                    border.width:0.6
                    MouseArea{
                        anchors.fill:parent
                        hoverEnabled: true
                        onEntered: {
                            cursorShape=Qt.PointingHandCursor
                            newmusicrec.color="white"
                            newmusicrec.border.color="#F0F2F6"
                            newmusicplay.visible=true
                            newmusicrowsec.visible=true
                        }
                        onExited: {
                            cursorShape=Qt.ArrowCursor
                            newmusicrec.color="#F7F9FC"
                            newmusicrec.border.color="transparent"
                            newmusicplay.visible=false
                            newmusicrowsec.visible=false
                        }
                    }
                    Rectangle{
                        id:newmusicpicrec
                        anchors.left: parent.left
                        anchors.leftMargin: 10
                        anchors.verticalCenter: parent.verticalCenter
                        height: 70
                        width: height-5
                        radius: 10
                        clip:true
                        Image{
                            id:newmusicpic
                            anchors.left: parent.left
                            anchors.leftMargin: -230
                            anchors.top:parent.top
                            anchors.topMargin: -210
                            scale:0.2
                            source:`/Resrc/Pic/${index+13}.png`
                            Image{
                                id:newmusicplay
                                scale: 2
                                opacity: 0.8
                                source: "/Resrc/Icon/20.png"
                                anchors.centerIn: parent
                                visible: false
                            }
                        }
                    }
                    Item{
                        id:newmusicitem
                        anchors.left: newmusicpicrec.right
                        anchors.leftMargin: 10
                        anchors.top: parent.top
                        anchors.right:parent.right
                        anchors.bottom: parent.bottom
                        Column{
                            anchors.verticalCenter: parent.verticalCenter
                            spacing: 6
                            Label{
                                text:musicname
                                font.pixelSize: 14
                                font.weight: 400
                                font.family: "Microsoft YaHei UI"
                                color:"#283248"
                            }
                            Row{
                                id: newmusicrow
                                spacing: 5
                                Rectangle{
                                    width: newmusictxt1.implicitWidth+4
                                    height: newmusictxt1.implicitHeight+2
                                    color:"transparent"
                                    border.color:"#DEB76B"
                                    border.width: 0.7
                                    visible: sviper!==''
                                    radius:3
                                    Label{
                                        id:newmusictxt1
                                        text:sviper
                                        color:"#DEB86C"
                                        font.weight: 600
                                        font.pixelSize: 8
                                        font.family: "Microsoft YaHei UI"
                                        anchors.centerIn: parent
                                    }
                                }
                                Rectangle{
                                    width: newmusictxt2.implicitWidth+4
                                    height: newmusictxt2.implicitHeight+2
                                    color:"transparent"
                                    border.color:"#FF3A3A"
                                    border.width: 0.7
                                    visible: viper!==''
                                    radius:3
                                    Label{
                                        id:newmusictxt2
                                        text:viper
                                        color:"#FF3A3A"
                                        font.weight: 600
                                        font.pixelSize: 8
                                        font.family: "Microsoft YaHei UI"
                                        anchors.centerIn: parent
                                    }
                                }
                                Label{
                                    id:newmusictxt3
                                    text:singer
                                    font.weight: 200
                                    font.family: "Microsoft YaHei UI"
                                    font.pixelSize: 12
                                    anchors.bottom: newmusicrow.bottom
                                    anchors.bottomMargin: 2.5
                                }
                            }
                        }

                        Row{
                            id:newmusicrowsec
                            spacing: 15
                            anchors.right: newmusicitem.right
                            anchors.rightMargin: 25
                            anchors.verticalCenter: newmusicitem.verticalCenter
                            visible:false
                            ButtonHover{
                                src:"/Resrc/Icon/21.png"

                            }
                            ButtonHover{
                                src:"/Resrc/Icon/22.png"

                            }
                            ButtonHover{
                                src:"/Resrc/Icon/23.png"

                            }
                        }
                    }
                }
            }
        }
    }
}

