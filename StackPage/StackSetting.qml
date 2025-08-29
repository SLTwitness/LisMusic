import QtQuick
import QtQuick.Controls
import QtQuick.Controls.Material
import Config 1.0
import "qrc:/RightPage/StackPage/SettingSections/"
import "qrc:/Method"
import "qrc:/DataBase"
import Qt.labs.platform

Item {
    Item {
        anchors.fill: parent
        anchors.leftMargin: 38
        anchors.topMargin: 23
        Label{
            id:settingtitle
            color:"#283248"
            text:"设置"
            font.pixelSize: 25
            font.weight: 600
            anchors.left: parent.left
            anchors.top:parent.top
        }
        Flow{
            id:settingflow
            anchors.left:settingtitle.left
            anchors.top:settingtitle.bottom
            anchors.topMargin: 23
            height: 20
            spacing:22
            Repeater{
                id:settingrep
                anchors.fill: parent
                model:["账号","常规","系统","播放","消息与隐私","快捷键","音质与下载","桌面与歌词","工具","关于远征队音乐"]
                property int settingindex: 0
                Item{
                    height: 30
                    width: settingsec.implicitWidth
                    Label{
                        id:settingsec
                        text:modelData
                        color:settingrep.settingindex===index?"#283248":"#7B8290"
                        font.pixelSize: 15
                        font.weight: 600
                        font.family: "Microsoft YaHei UI"
                        anchors.centerIn: parent
                    }
                    Rectangle{
                        color:"#FF3A3A"
                        radius: 5
                        height: 3
                        anchors.left: settingsec.left
                        anchors.right: settingsec.right
                        anchors.top:settingsec.bottom
                        anchors.leftMargin: settingsec.implicitWidth/settingsec.font.pixelSize*2
                        anchors.rightMargin: settingsec.implicitWidth/settingsec.font.pixelSize*2
                        anchors.topMargin: 1
                        visible: settingrep.settingindex===index
                    }
                    MouseArea{
                        anchors.fill:parent
                        hoverEnabled: true
                        onEntered: {
                            if(settingrep.settingindex===index){
                                settingsec.color="#283248"
                            }
                            else{
                                settingsec.color="#666D7E"
                            }
                            cursorShape=Qt.PointingHandCursor
                        }
                        onExited: {
                            if(settingrep.settingindex===index){
                                settingsec.color="#283248"
                            }
                            else{
                                settingsec.color="#7B8290"
                            }
                            cursorShape=Qt.ArrowCursor
                        }
                        onClicked: {
                            settingrep.settingindex=index
                            for(let i=0;i<settingrep.count;i++){
                                let item=settingrep.itemAt(i)
                                if(item){
                                    let label=item.children.find(child=>child instanceof Label)
                                    if(label){
                                        label.color=(i===index)?"#283248":"#7B8290"
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }

        SettingDivide{
            id:dividrec1
            anchors.top:settingflow.bottom
            anchors.topMargin: 20
            anchors.rightMargin: 20
        }

        Flickable{
            id:settingflick
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: dividrec1.bottom
            anchors.bottom: parent.bottom
            anchors.topMargin: 10
            contentHeight:3000
            clip:true
            ScrollBar.vertical: ScrollBar{
                anchors.right: parent.right
                anchors.rightMargin: 5
                width: 10
                contentItem: Rectangle{
                    visible: parent.active
                    implicitWidth:10
                    radius: 30
                    color: "#E9EAEC"
                }
                background: Rectangle{
                    color: "transparent"
                }
            }

            Item {
                anchors.fill: parent
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        Config.blankclick();    //失焦信号
                    }
                }
            }

            Column{
                anchors.fill: parent
                anchors.topMargin: 20
                spacing: 20

                AccountSec{
                    id:accountsec
                    anchors.left: parent.left
                    anchors.right: parent.right
                }

                Item {
                    height: 110
                    width: 1
                }

                NormalSetting{
                    //anchors.fill: parent
                    anchors.left: parent.left
                    anchors.right: parent.right
                    //anchors.top: accountsec.bottom
                    //anchors.topMargin: 123
                    height: 300
                }

                Item {
                    height: 47
                    width: 1
                }

                SystemSetting{
                    anchors.left: parent.left
                    anchors.right: parent.right
                    height: 150
                }

                Item {
                    height: 10
                    width: 1
                }

                QuickButton{
                    anchors.left: parent.left
                    anchors.right: parent.right
                    height: 700
                }

                Item {
                    height: 60
                    width: 1
                }

                MusicDownLoad{
                    anchors.left: parent.left
                    anchors.right: parent.right
                    height:700
                }

                // Item {
                //     height: 10
                //     width: 1
                // }

                FontColor{
                    anchors.left: parent.left
                    anchors.right:parent.right
                    height: 700
                }
            }
        }

        ChangeColor{
            id:colorpop
            width: 440
            height: 260
            modal: true
            x:100
            y:155
            closePolicy: Popup.NoAutoClose
        }
    }
}
