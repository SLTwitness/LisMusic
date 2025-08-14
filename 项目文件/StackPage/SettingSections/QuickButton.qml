import QtQuick
import QtQuick.Controls
import QtQuick.Controls.Material
import Config 1.0
import "qrc:/RightPage/StackPage/SettingSections/"
import "qrc:/Method"
import "qrc:/DataBase"

Item{
    anchors.left: parent.left
    anchors.right: parent.right
    height: 700
    Label{
        id:quicktxt
        text:"快捷键"
        color: "#3C455A"
        font.pixelSize: 16
        font.weight: 600
        font.family: "Microsoft YaHei UI"
        anchors.left: parent.left
    }
    Label{
        id:quicktxt1
        text:"真的能改"
        color: "#3C455A"
        font.pixelSize: 14
        font.weight: 500
        font.family: "Microsoft YaHei UI"
        anchors.left: quicktxt.right
        anchors.leftMargin: 90
        anchors.verticalCenter: quicktxt.verticalCenter
    }
    Label{
        id:quicktxt2
        text:"快捷键"
        color: "#3C455A"
        font.pixelSize: 14
        font.weight: 500
        font.family: "Microsoft YaHei UI"
        anchors.left: quicktxt1.right
        anchors.leftMargin: 80
        anchors.verticalCenter: quicktxt.verticalCenter
    }
    Label{
        id:quicktxt3
        text:"全局快捷键"
        color: "#3C455A"
        font.pixelSize: 14
        font.weight: 500
        font.family: "Microsoft YaHei UI"
        anchors.left: quicktxt2.right
        anchors.leftMargin: 200
        anchors.verticalCenter: quicktxt.verticalCenter
    }

    QuickData{
        id:modelquick
    }

    Column{
        id:quickcolum
        anchors.top:quicktxt1.bottom
        anchors.left: quicktxt1.left
        anchors.right: parent.right
        anchors.topMargin: 10
        spacing: 30
        Repeater{
            model:modelquick
            Item{
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.rightMargin: 100
                height: 40
                Item{
                    id:quickfield
                    anchors.top:parent.top
                    anchors.left:parent.left
                    anchors.bottom: parent.bottom
                    width: 80
                    Label{
                        text: quickusing
                        font.pixelSize: 15
                        font.weight: 200
                        font.family: "Microsoft YaHei UI"
                        color: "#6F7183"
                        anchors.left: parent.left
                        anchors.verticalCenter: parent.verticalCenter
                    }
                }

                QuicktxtField{
                    id:quicktxtfield
                    color:"#7C8290"
                    height: 30
                    width: 180
                    text:quickbutton
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.left: quickfield.right
                    anchors.leftMargin: 60
                }
                QuicktxtField{
                    id:globalquicktxtfield
                    color:"#7C8290"
                    height: 30
                    width: 180
                    text:globalquickbutton
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.left: quicktxtfield.right
                    anchors.leftMargin: 60
                }
            }
        }
    }

    SelectBox{
        id:quickselect1
        anchors.left: quickcolum.left
        anchors.top: quickcolum.bottom
        anchors.topMargin: 30
        selecttext:1
        selecttxt:"<span style='color:#3C455A;'> 启用全局快捷键</span><span style='color:#8F95A2;'>（队音乐在后台时也能响应 不可能）</span>"
    }
    SelectBox{
        id:quickselect2
        anchors.left: quickcolum.left
        anchors.top: quickselect1.bottom
        anchors.topMargin: 40
        selecttext:1
        selecttxt:"<span style='color:#3C455A;'> 使用系统媒体快捷键</span><span style='color:#8F95A2;'> (播放/暂停、上一首、下一首、停止) </span>"
    }
    Rectangle{
        height: 25
        width: 80
        radius: 20
        opacity: 1
        color: "transparent"
        border.width: 0.7
        border.color: "#E5E8EC"
        anchors.verticalCenter: quickselect2.verticalCenter
        anchors.left: quickselect2.right
        anchors.leftMargin: 60
        Label{
            text: "恢复默认"
            color:"#5B6375"
            font.pixelSize: 13
            font.weight: 400
            font.family: "Microsoft YaHei UI"
            anchors.centerIn: parent
        }
        MouseArea{
            anchors.fill: parent
            hoverEnabled: true
            onEntered: {
                parent.opacity=0.8
                cursorShape=Qt.PointingHandCursor
            }
            onExited: {
                parent.opacity=1
                cursorShape=Qt.ArrowCursor
            }
            onClicked: {
                modelquick.clear()
                modelquick.append({quickusing:"播放/暂停",quickbutton:"Ctrl+P",globalquickbutton:"Ctrl+Alt+P"})
                modelquick.append({quickusing:"上一首",quickbutton:"Ctrl+Left",globalquickbutton:"Ctrl+Alt+Left"})
                modelquick.append({quickusing:"下一首",quickbutton:"Ctrl+Right",globalquickbutton:"Ctrl+Alt+Right"})
                modelquick.append({quickusing:"音量加",quickbutton:"Ctrl+Up",globalquickbutton:"Ctrl+Alt+Up"})
                modelquick.append({quickusing:"音量减",quickbutton:"Ctrl+Down",globalquickbutton:"Ctrl+Alt+Down"})
                modelquick.append({quickusing:"mini/完整模式",quickbutton:"Ctrl+M",globalquickbutton:"Ctrl+Alt+M"})
                modelquick.append({quickusing:"喜欢歌曲",quickbutton:"Ctrl+L",globalquickbutton:"Ctrl+Alt+L"})
                modelquick.append({quickusing:"打开/关闭歌词",quickbutton:"Ctrl+D",globalquickbutton:"Ctrl+Alt+D"})
                modelquick.append({quickusing:"翻译当前歌词",quickbutton:"Ctrl+T",globalquickbutton:"Ctrl+Alt+T"})
            }
        }
    }
    SettingDivide{
        anchors.top:quickselect2.bottom
        anchors.topMargin: 40
    }
}

