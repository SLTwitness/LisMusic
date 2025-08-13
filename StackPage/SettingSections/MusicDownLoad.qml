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
    anchors.right: parent.right
    height:700
    Label{
        id:musicsettting
        text:"音质与下载"
        color:"#3C455A"
        font.pixelSize: 16
        font.weight: 600
        font.family: "Microsoft YaHei UI"
        anchors.left: parent.left
    }
    Column{
        id:musicsettingtxt
        anchors.left: musicsettting.left
        anchors.right: parent.right
        anchors.top:musicsettting.top
        anchors.leftMargin: 200
        spacing: 30
        Repeater{
            model: ["音质播放设置","音质下载设置"]
            Item{
                anchors.left: parent.left
                anchors.right: parent.right
                height:100
                Label{
                    id:musicchose
                    text:modelData
                    font.pixelSize: 15
                    font.weight: 600
                    font.family: "Microsoft YaHei UI"
                    anchors.left: parent.left
                    color:"#3C4562"
                }
                Grid{
                    rows:3
                    columns: 3
                    rowSpacing: -5
                    columnSpacing: 60
                    anchors.left: musicchose.right
                    anchors.top: musicchose.top
                    anchors.right: parent.right
                    anchors.topMargin: -10
                    anchors.leftMargin: 30
                    Repeater{
                        model: ["沉浸环绕音","超清母带","高清臻音","高解析度无损","无损","极高","标准"]
                        ChoseButton{
                            chosetxt:modelData
                            choseclr:"#3C4562"
                        }
                    }
                }
            }
        }
        Label{
            text:"了解音质>"
            anchors.left: musicsettingtxt.left
            font.pixelSize: 14
            font.family: "Microsoft YaHei UI"
            color:"#7684B9"
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
                    //Qt.openUrlExternally("https://www.bilibili.com/video/BV1UjcGeCEC5/?spm_id_from=333.788.videopod.sections&vd_source=4619f090f7f28fdecf730f741ee5903b")
                }
            }
        }
        Foldersec{
            id:foldersec
            height: 70
            width: 800
        }
        Foldersec{
            id:cacheurl
            height: 60
            width: 800
            foldertxt:"缓存目录"
            foldertxturl:"C:\\wozhenbuzhidaozaina\\Cache"
        }
        Row{
            anchors.left: parent.left
            anchors.right: parent.right
            spacing: 10
            Label{
                id:cacheocc
                text:"缓存最大占用"
                color:"#3C4562"
                font.pixelSize: 14
                font.family: "Microsoft YaHei UI"
            }
            Slider{
                id:cacheslider
                value: 6
                from:5
                to:20
                stepSize:0.5
                width: 300
                height: 10
                anchors.verticalCenter: cacheocc.verticalCenter
                background: Rectangle{
                    implicitHeight: 5
                    radius: 10
                    anchors.verticalCenter: cacheocc.vertical
                    width: parent.width
                    color:"#E2E5E9"
                    Rectangle{
                        radius: 10
                        width: parent.width*cacheslider.position
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
                    x:cacheslider.visualPosition * (cacheslider.width - width)
                }
            }
            Label{
                text:cacheslider.value+"G"
                color:"#3C4562"
                font.pixelSize: 14
                font.family: "Microsoft YaHei UI"
            }
            Rectangle{
                id:cacherec
                height: 25
                width: 80
                radius: 15
                anchors.verticalCenter: cacheocc.verticalCenter
                color:"transparent"
                border.width: 0.7
                border.color: "#E5E8EC"
                Label{
                    text:"清除缓存"
                    font.pixelSize: 14
                    font.family: "Microsoft YaHei UI"
                    anchors.centerIn: parent
                    color:"#3C4562"
                }
                MouseArea{
                    anchors.fill: parent
                    hoverEnabled: true
                    onEntered: {
                        cacherec.color="#F0F3F6"
                        cacherec.border.color="#C6CBD1"
                        cursorShape=Qt.PointingHandCursor
                    }
                    onExited: {
                        cacherec.color="transparent"
                        cacherec.border.color="#E5E8EC"
                        cursorShape=Qt.ArrowCursor
                    }
                }
            }
        }

        Column{
            anchors.left: parent.left
            anchors.right: parent.right
            spacing: 30
            Repeater{
                model:["音乐命名格式","文件智能分类"]
                Item{
                    anchors.left: parent.left
                    anchors.right: parent.right
                    height: 20
                    Label{
                        id:musicname
                        text:modelData
                        font.pixelSize: 14
                        font.family: "Microsoft YaHei UI"
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.left: parent.left
                        color:"#3C4562"
                    }
                    Row{
                        anchors.left: musicname.right
                        anchors.leftMargin: 20
                        anchors.verticalCenter: musicname.verticalCenter
                        spacing: 20
                        Repeater{
                            model: index===0?["歌曲名","歌手-歌曲名","歌曲名-歌手"]:
                                        ["不分文件夹","按歌手分文件夹","按歌手/专辑分文件夹"]
                            ChoseButton{
                                chosetxt:modelData

                            }
                        }
                    }
                }
            }
        }
    }
    SettingDivide{
        anchors.top:musicsettting.bottom
        anchors.topMargin: 630
    }
}

