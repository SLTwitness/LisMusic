import QtQuick
import QtQuick.Controls
import QtQuick.Controls.Material
import Config 1.0
import "qrc:/RightPage/StackPage/SettingSections/"
import "qrc:/Method"
import "qrc:/DataBase"
import Qt.labs.platform

Item{
    anchors.left: parent.left
    anchors.right:parent.right
    height: 700
    Label{
        id:desktoptitle
        text:"桌面歌词"
        color:"#3C455A"
        font.pixelSize: 16
        font.weight: 600
        font.family: "Microsoft YaHei UI"
        anchors.left: parent.left
        verticalAlignment: Text.AlignVCenter
        height: 18
        clip:true
    }
    Row{
        id:desktoprow1
        anchors.bottom: desktoptitle.bottom
        anchors.left: desktoptitle.left
        anchors.leftMargin: 150
        spacing: 50
        Repeater{
            model:["启用桌面歌词","启用歌词总在最前面","外文歌词显示翻译","外文歌词显示音译"]
            SelectBox{
                selecttxt:modelData
            }
        }
    }
    Row{
        id:desktoprow2
        anchors.top:desktoprow1.bottom
        anchors.left: desktoprow1.left
        anchors.right: desktoprow1.right
        anchors.topMargin: 20
        spacing: 60
        Repeater{
            model:["字体","字号","字粗","描边"]
            Item{
                width: 100
                height: 50
                Label{
                    id:fontsetting
                    text:modelData
                    font.pixelSize: 14
                    font.weight: 600
                    font.family: "Microsoft YaHei UI"
                    anchors.left: parent.left
                    anchors.top: parent.top
                    anchors.topMargin:10
                    color:"#3C455A"
                    height: 20
                }
                FontChoseBox{
                    width: 140
                    height: 30
                    anchors.top: fontsetting.bottom
                    anchors.left: fontsetting.left
                    anchors.topMargin: 8
                    fontwit:400
                    leftpad:11
                    Component.onCompleted: {
                        if(index==1){
                            let arr=[]
                            for(let a=20;a<90;a++){
                                arr.push(a.toString())
                            }
                            model=arr
                        }
                        else if(index==2){
                            let i
                            model=["标准","加粗"]
                        }
                        else if(index==3){
                            model=["有描边","无描边"]
                        }
                    }
                }
            }
        }
    }

    Label{
        id:adjusttitle
        text:"调整排版样式"
        font.pixelSize: 14
        font.weight: 600
        font.family: "Microsoft YaHei UI"
        color:"#3C455A"
        height: 20
        anchors.left: desktoprow2.left
        anchors.top:desktoprow2.bottom
        anchors.topMargin: 50
    }
    Row{
        id:desktoprow3
        anchors.top:adjusttitle.bottom
        anchors.left: adjusttitle.left
        anchors.topMargin: 10
        spacing: 20
        Repeater{
            model:[["单行显示","双行显示"],["横排显示","竖排显示"],["居中","左对齐","右对齐"]]
            FontChoseBox{
                width: 140
                height: 30
                model:modelData
                fontwit: 400
                leftpad:11
            }
        }
    }

    Label{
        id:changecolor
        text:"更改配色方案"
        font.pixelSize: 14
        font.weight: 600
        font.family: "Microsoft YaHei UI"
        color:"#3C455A"
        height: 20
        anchors.left: desktoprow3.left
        anchors.top:desktoprow3.bottom
        anchors.topMargin: 30
    }
    Row{
        id:desktoprow4
        anchors.top: changecolor.bottom
        anchors.left: changecolor.left
        anchors.right: changecolor.right
        anchors.topMargin: 10
        spacing: 20
        FontChoseBox{
            model:["自定义","远征金","落日晖","阔爱粉","天际蓝","清新绿","活力紫","温柔黄","低调灰"]
            width:140
            height:30
            showindex:1
            fontwit:400
            leftpad:11
        }
        Repeater{
            model:["已播放","未播放"]
            Rectangle{
                id:changecolortxt
                radius:15
                width: 140
                height: 30
                border.width: 0.7
                border.color: "#EDF0F3"
                color:"#F0F3F6"
                Rectangle{
                    id:changclrrec
                    width: parent.height/2
                    height: width
                    anchors.left: parent.left
                    anchors.leftMargin: 15
                    anchors.verticalCenter: parent.verticalCenter
                    border.width: 0.7
                    border.color:index===0?Config.musicclrborder:Config.musicclrborder1
                    gradient:Gradient{
                        GradientStop{
                            position:0
                            color:index===0?Config.musicclrup:Config.musicclrup1
                        }
                        GradientStop{
                            position:1
                            color:index===0?Config.musicclrdown:Config.musicclrdown1
                        }
                    }
                }
                Text{
                    color:"#4A5265"
                    text:modelData
                    font.pixelSize: 14
                    font.family: "Microsoft YaHei UI"
                    anchors.left: changclrrec.right
                    anchors.leftMargin: 10
                    anchors.verticalCenter: changclrrec.verticalCenter
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
                        Config.showmusicplay=!index
                        Config.opencolordialog()
                    }
                }
            }
        }
    }

    Label{
        id:previewlable
        text:"预览"
        font.pixelSize: 14
        font.weight: 600
        font.family: "Microsoft YaHei UI"
        color:"#3C455A"
        height: 20
        anchors.left: desktoprow4.left
        anchors.top:desktoprow4.bottom
        anchors.topMargin: 30
    }
    Rectangle{
        anchors.left: desktoprow2.left
        anchors.right: desktoprow2.right
        anchors.top:previewlable.bottom
        anchors.topMargin: 8
        height: 210
        radius: 20
        border.width: 0.7
        border.color: "#E2E6E9"
        color:"#F2F5F8"
        Item{
            width:titletxt.implicitWidth+1
            height: titletxt.font.pixelSize+1
            anchors.centerIn: parent
            Item{
                width: parent.width/2
                anchors.left: parent.left
                anchors.bottom: parent.bottom
                anchors.top: parent.top
                clip:true
                Label{
                    id:titletxt
                    text:"远征队音乐"
                    color:Config.musicclrup         //"#B4B5B5"
                    anchors.left: parent.left
                    anchors.verticalCenter: parent.verticalCenter
                    font.weight: 400
                    font.family: "幼圆"
                    font.pixelSize: 83
                    layer.enabled: true
                    style: Text.Outline
                    styleColor: Config.musicclrborder
                }
            }
        }
        Item{
            width:titletxt.implicitWidth+1
            height: titletxt.font.pixelSize+1
            anchors.centerIn: parent
            Item{
                width: parent.width/2
                anchors.right: parent.right
                anchors.bottom: parent.bottom
                anchors.top: parent.top
                clip:true
                Label{
                    text:"远征队音乐"
                    color:Config.musicclrup1
                    anchors.right: parent.right
                    anchors.rightMargin: 1
                    anchors.verticalCenter: parent.verticalCenter
                    font.weight: 400
                    font.family: "幼圆"
                    font.pixelSize: 83
                    layer.enabled: true
                    style: Text.Outline
                    styleColor: Config.musicclrborder1
                }
            }
        }
    }
    SettingDivide{
        anchors.top:previewlable.bottom
        anchors.topMargin: 260
    }
}

