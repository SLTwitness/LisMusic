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
    height: 220
    MouseArea{
        anchors.fill: parent
        hoverEnabled: true
        onEntered:{
            lefticon.visible=true
            righticon.visible=true
        }
        onExited: {
            lefticon.visible=false
            righticon.visible=false
        }
    }
    Label{
        id: musiclisttxt
        text: "官方歌单 >"
        color: "#283248"
        font.weight: 600
        font.family: "Microsoft YaHei UI"
        font.pixelSize: 18
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.topMargin: 20
        anchors.leftMargin: 30
    }
    Item{
        height: parent.height
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: musiclisttxt.bottom
        anchors.topMargin: 10

        NumberAnimation{
            id:showmore
            target: musiclistrep
            property: "x"
            from:musiclistrep.x
            to:musiclistrep.x-200
            duration: 400
            easing.type:Easing.InOutQuad
        }
        NumberAnimation{
            id:showless
            target: musiclistrep
            property: "x"
            from:musiclistrep.x
            to:musiclistrep.x+200
            duration: 400
            easing.type:Easing.InOutQuad
        }

        ButtonHover{
            id:lefticon
            fitwid: 21.5
            fithei: 43
            enabled: musiclistrep.x===0?false:true
            anchors.left: parent.left
            anchors.verticalCenter: parent.verticalCenter
            src: "qrc:/Resrc/Icon/18.png"
            visible: false
            onClicked: {
                showless.start()
            }
        }
        ButtonHover{
            id:righticon
            fitwid: 21.5
            fithei: 43
            enabled: musiclistrep.x<-300?false:true
            anchors.right: parent.right
            anchors.rightMargin: 10
            anchors.verticalCenter: parent.verticalCenter
            src: "qrc:/Resrc/Icon/19.png"
            visible: false
            onClicked: {
                showmore.start()
            }
        }

        ListModel{
            id: musiclistmoel
            ListElement{src:"/Resrc/Pic/7.jpg";clr:"#DFD29E";txt:"Clair Obscur: Expedition 33";txt1:"1 取自Wallpaper Engine";txt2:"2 时间7-22";txt3:"3 kami!"}
            ListElement{src:"/Resrc/Pic/8.jpg";clr:"#A7242C";txt:"Maelle 玛埃尔";txt1:"1 取自Wallpaper Engine";txt2:"2 时间7-22";txt3:"3 这位还真是kami"}
            ListElement{src:"/Resrc/Pic/9.jpg";clr:"#100C0B";txt:"Tomorrow Noexist";txt1:"1 取自我的截图";txt2:"2 时间4-29";txt3:"3 明日在哪我请问了"}
            ListElement{src:"/Resrc/Pic/10.jpg";clr:"#8B7560";txt:"THX PLAY";txt1:"1 取自我的截图";txt2:"2 时间4029";txt3:"3 旅途没有错"}
            ListElement{src:"/Resrc/Pic/11.jpg";clr:"#532D5E";txt:"Baldur's Gate";txt1:"1 取自我的截图";txt2:"2 时间6-29";txt3:"3 啊？博德人长这样吗"}
            ListElement{src:"/Resrc/Pic/12.jpg";clr:"#75B7D7";txt:"Reach Peak";txt1:"1 取自我的截图";txt2:"2 时间7-7";txt3:"3 三个唐人一场戏"}
        }

        Item{
            id:musicitem
            height: 300
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.leftMargin: 30
            anchors.rightMargin: 40
            clip: true
            Row{
                id:musiclistrep
                width: parent.width
                height: parent.height
                spacing: 20
                Repeater{
                    model: musiclistmoel
                    Rectangle{
                        width: 178
                        height: 230
                        radius: 10
                        color:clr
                        property bool hovered: false

                        MouseArea{
                            anchors.fill: parent
                            hoverEnabled: true
                            onEntered:{
                                cursorShape=Qt.PointingHandCursor
                                musiclistrec.endclr=Qt.rgba(1, 1, 1, 0.0)
                                hovered = true
                                showrec.start()
                            }
                            onExited: {
                                cursorShape=Qt.ArrowCursor
                                musiclistrec.endclr=clr
                                hovered = false
                                closerec.start()
                            }
                        }

                        Rectangle{
                            width: parent.width
                            implicitHeight: 110
                            height: 180
                            radius: 10
                            color: clr
                            clip: true
                            Image{
                                width: parent.width
                                height: 180
                                source: src
                            }
                        }

                        NumberAnimation{
                            id:showrec
                            target:musiclistrec
                            property: "height"
                            duration: 200
                            from:50
                            to:230
                            easing.type: Easing.InOutQuad   //动画效果
                            onStarted: {
                                musiccolum.visible=true
                                musiclistrec.topmarg=130
                            }
                        }
                        NumberAnimation{
                            id:closerec
                            target:musiclistrec
                            property: "height"
                            duration: 200
                            from:230
                            to:50
                            easing.type: Easing.InOutQuad   //动画效果
                            onStarted: {
                                musiccolum.visible=true
                                musiclistrec.topmarg=5
                            }
                            onFinished: {
                                musiccolum.visible=false
                            }
                        }

                        Rectangle{
                            id: musiclistrec
                            anchors.bottom: parent.bottom
                            height: 50
                            width: parent.width
                            property color startclr: clr
                            property color endclr: clr
                            property real topmarg: 5
                            gradient: Gradient{
                                GradientStop{
                                    position: 1
                                    color: musiclistrec.startclr
                                }
                                GradientStop{
                                    position: 0
                                    color: musiclistrec.endclr
                                }
                            }
                            Image{
                                source: "qrc:/Resrc/Icon/20.png"
                                anchors.right: parent.right
                                anchors.rightMargin: 0
                                anchors.bottom: parent.bottom
                                anchors.bottomMargin: 0
                                visible: hovered
                                scale: 0.6
                            }
                            Label{
                                text: txt
                                color: "white"
                                font.pixelSize: 15
                                font.weight: 600
                                font.family: "Microsoft YaHei UI"
                                anchors.left: parent.left
                                anchors.leftMargin: 6
                                anchors.top: musiclistrec.top
                                anchors.topMargin: musiclistrec.topmarg
                                wrapMode: Text.WordWrap
                                width: 110
                            }
                            Column{
                                id:musiccolum
                                anchors.left: musiclistrec.left
                                anchors.leftMargin: 6
                                anchors.right: musiclistrec.right
                                anchors.bottom: parent.bottom
                                anchors.bottomMargin: 6
                                spacing: 5
                                visible: false
                                Label{
                                    text: txt1
                                    color: "white"
                                    font.pixelSize: 10
                                    font.family: "Microsoft YaHei UI"
                                }
                                Label{
                                    text: txt2
                                    color: "white"
                                    font.pixelSize: 10
                                    font.family: "Microsoft YaHei UI"
                                }
                                Label{
                                    text: txt3
                                    color: "white"
                                    font.pixelSize: 10
                                    font.family: "Microsoft YaHei UI"
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}

