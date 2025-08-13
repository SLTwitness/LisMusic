import QtQuick
import QtQuick.Controls
import QtQuick.Controls.Material
import Config 1.0
import "qrc:/RightPage/StackPage/SettingSections/"
import "qrc:/Method"


Item{

    Label{
        id:myaccounttxt
        text:"账号"
        color: "#3C455A"
        font.pixelSize: 16
        font.weight: 600
        font.family: "Microsoft YaHei UI"
        anchors.left: parent.left
    }
    Label{
        id:logtxt
        text:"登录远征队音乐，向作者付款，软件随便玩"
        color:"#3C455A"
        font.pixelSize: 14
        font.weight: 200
        font.family: "Microsoft YaHei UI"
        anchors.left: myaccounttxt.right
        anchors.leftMargin: 105
        anchors.verticalCenter: myaccounttxt.verticalCenter
    }
    Rectangle{
        id:logrec
        color: "#FC3D49"
        width: 80
        height: 27
        radius: 14
        anchors.left: logtxt.left
        anchors.top: logtxt.bottom
        anchors.topMargin: 18
        opacity:0.9
        Label{
            id:logintxt
            text:"立即付款"
            color:"white"
            font.pixelSize: 14
            font.weight: 400
            font.family: "Microsoft YaHei UI"
            anchors.centerIn: parent
        }
        MouseArea{
            anchors.fill: parent
            hoverEnabled: true
            onEntered: {
                logrec.opacity=1
                cursorShape=Qt.PointingHandCursor
            }
            onExited: {
                logrec.opacity=0.9
                cursorShape=Qt.ArrowCursor
            }
        }
    }
    SettingDivide{
        anchors.top:logrec.bottom
        anchors.topMargin: 35
    }
}
