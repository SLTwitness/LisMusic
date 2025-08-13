import QtQuick
import QtQuick.Controls
import QtQuick.Controls.Material
import Config 1.0
import "qrc:/RightPage/StackPage/SettingSections/"
import "qrc:/Method"

Item {

    Label{
        id:normaltxt
        text:"常规"
        color: "#3C455A"
        font.pixelSize: 16
        font.weight: 600
        font.family: "Microsoft YaHei UI"
        anchors.left: parent.left
    }
    Label{
        id:fontchose
        text:"字体选择"
        color:"#3C455A"
        font.pixelSize: 14
        font.weight: 500
        font.family: "Microsoft YaHei UI"
        anchors.left: normaltxt.right
        anchors.leftMargin: 105
        anchors.verticalCenter: normaltxt.verticalCenter
    }
    Label{
        text:"（如果字体显示不清晰，我也没有办法，QT里没这属性）"
        color:"#8F95A2"
        font.pixelSize: 13
        font.weight: 200
        font.family: "Microsoft YaHei UI"
        anchors.left: normaltxt.right
        anchors.leftMargin: 156
        anchors.verticalCenter: normaltxt.verticalCenter
    }

    FontChoseBox{
        id: chosefont
        width: 120
        height: 30
        anchors.left: fontchose.left
        anchors.top: fontchose.bottom
        anchors.topMargin: 10
    }

    Column{
        id:normalsec
        anchors.left: chosefont.left
        anchors.right: chosefont.right
        anchors.top: chosefont.bottom
        anchors.topMargin: 30
        anchors.bottom: parent.bottom
        spacing: 34
        Repeater{
            model:[ "<span style='color:#3C455A;'> 开机自动运行</span>",
                "<span style='color:#3C455A;'> 将网易云音乐设为默认播放器</span>",
                "<span style='color:#3C455A;'> 开启GPU加速</span><span style='color:#8F95A2;'>（若软件黑屏，请关闭GPU加速尝试解决）</span>",
                "<span style='color:#3C455A;'> 禁用动画效果</span><span style='color:#8F95A2;'>（减少部分资源占用）</span>",
                "<span style='color:#3C455A;'> 禁用系统缩放比例</span><span style='color:#8F95A2;'>（减少部分资源占用）</span>"]
            SelectBox{
                selecttxt:modelData
                selecttext: 1
            }
        }
    }
    SettingDivide{
        anchors.top:normalsec.bottom
        anchors.topMargin: 55
    }
}

