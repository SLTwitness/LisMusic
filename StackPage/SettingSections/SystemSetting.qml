import QtQuick
import QtQuick.Controls
import QtQuick.Controls.Material
import Config 1.0
import "qrc:/RightPage/StackPage/SettingSections/"
import "qrc:/Method"

Item{

    Label{
        id:systemtxt
        text:"系统"
        color: "#3C455A"
        font.pixelSize: 16
        font.weight: 600
        font.family: "Microsoft YaHei UI"
        anchors.left: parent.left
    }
    Item{
        id:timer
        anchors.left: systemtxt.right
        anchors.right: parent.right
        height: 130
        anchors.leftMargin: 105
        Column{
            anchors.fill: parent
            spacing: 10
            SelectBox{
                width: 100
                height: 30
                anchors.left: parent.left
                selecttxt: "开启定时关闭软件"
            }
            Row{
                spacing: 10
                anchors.left: parent.left
                Label{
                    text:"剩余关闭时间"
                    font.pixelSize: 15
                    font.family: "Microsoft YaHei UI"
                    font.weight: 400
                    color:"#5B6375"
                    verticalAlignment: Text.AlignVCenter
                    anchors.verticalCenter: parent.verticalCenter
                }
                FontChoseBox{
                    height: 30
                    width: 140
                    leftpad:14
                    fontwit:400
                    model: ListModel{}
                    anchors.verticalCenter: parent.verticalCenter
                    Component.onCompleted: {
                        for(let i=0;i<24;i++){
                            model.append({"modelData":i})
                        }
                    }
                }
                Label{
                    text:"小时"
                    font.pixelSize: 15
                    font.family: "Microsoft YaHei UI"
                    font.weight: 400
                    color:"#5B6375"
                    verticalAlignment: Text.AlignVCenter
                    anchors.verticalCenter: parent.verticalCenter
                }
                FontChoseBox{
                    height: 30
                    width: 140
                    leftpad:14
                    fontwit:400
                    model: ListModel{}
                    anchors.verticalCenter: parent.verticalCenter
                    Component.onCompleted: {
                        for(let i=0;i<60;i++){
                            model.append({"modelData":i})
                        }
                    }
                }
                Label{
                    text:"分钟"
                    font.pixelSize: 15
                    font.family: "Microsoft YaHei UI"
                    font.weight: 400
                    color:"#5B6375"
                    verticalAlignment: Text.AlignVCenter
                    anchors.verticalCenter: parent.verticalCenter
                }
            }
            SelectBox{
                width: 100
                height: 30
                anchors.left: parent.left
                selecttxt: "关闭软件同时关机"
                enabled: false
            }
        }
    }
    Row{
        anchors.left: timer.left
        //anchors.leftMargin: 70
        anchors.top: systemtxt.bottom
        anchors.topMargin: 100
        spacing: 50
        Label{
            id:closemainsetting
            text:"关闭主面板"
            font.pixelSize: 13
            font.weight: 600
            font.family: "Microsoft YaHei UI"
            color:"#3C455A"
        }

        ChoseButton{
            id:minichose
            anchors.verticalCenter: closemainsetting.verticalCenter
            chosetxt: "最小化到系统托盘"
        }
        ChoseButton{
            id:closechose
            anchors.verticalCenter: closemainsetting.verticalCenter
        }
    }
    SettingDivide{
        anchors.top:timer.bottom
        anchors.topMargin: 40
    }
}
