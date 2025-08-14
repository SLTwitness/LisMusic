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

Popup{
    id:loginpop
    background:Rectangle{
        anchors.fill:parent
        radius: 10
        border.width: 1
        border.color: "#B9BABB"
        gradient: Gradient{
            orientation:Gradient.Vertical
            GradientStop{position:0;color:"#F7EEF1"}
            GradientStop{position:0.5;color:"#F7F9FC"}
        }
        ButtonHover{
            src:"qrc:/Resrc/Icon/6.png"
            anchors.top: parent.top
            anchors.right: parent.right
            anchors.rightMargin: 20
            anchors.topMargin: 20
            fitwid: 28
            fithei: 25
            onClicked: {
                loginpop.close()
            }
        }
    }
    Label{
        id:scan
        text:"老用户登录免费扫码付款"
        color:"#283248"
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        anchors.topMargin: 50
        font.weight:Font.Black
        font.family: "Microsoft YaHei UI"
        font.pixelSize: 21
    }
    Image {
        id:qr
        x:-50             //35
        y:10             //-35
        scale:0.5         //0.33
        z:1
        source: "qrc:/Resrc/log/1.png"
        MouseArea{
            anchors.fill: parent
            hoverEnabled: true
            onEntered:{
                plzscan.start()
                plzscan.isshow=true
            }
            onExited: {
                plzscan.start()
                plzscan.isshow=false
            }
        }
    }
    Image {
        id:sample
        x:0
        y:60
        scale: 0.7
        opacity: 0
        source: "qrc:/Resrc/log/2.png"
    }
    Label{
        anchors.top: qr.bottom
        anchors.topMargin: plzscan.isshow?-130:-90
        anchors.horizontalCenter: qr.horizontalCenter
        visible: qr.scale===0.5||qr.scale===0.33
        width: plzscan.isshow?120:200
        wrapMode: Text.WrapAnywhere
        horizontalAlignment: Text.AlignHCenter
        textFormat: Text.RichText
        text:"使用 <span style='color:#5975B2; font-family:\"Microsoft YaHei UI\";'>微信零钱通APP</span> 扫码登陆" //HTML
    }
    Text {
        text: "选择其他付款模式 >"
        color:"#8F95A2"
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 50
        anchors.horizontalCenter: parent.horizontalCenter
        font.pixelSize: 14
        font.family: "Microsoft YaHei UI"
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
                loginpop.close()
                otherloginpop.open()
            }
        }
    }

    ParallelAnimation{
        id:plzscan
        property bool isshow: false
        NumberAnimation{
            target: qr
            property:"x"
            duration: 300
            from: plzscan.isshow?-50:35
            to: plzscan.isshow?35:-50
        }
        NumberAnimation{
            target: qr
            property:"y"
            duration: 300
            from: plzscan.isshow?10:-35
            to: plzscan.isshow?-35:10
        }
        NumberAnimation{
            target: qr
            property:"scale"
            duration: 300
            from: plzscan.isshow?0.5:0.33
            to: plzscan.isshow?0.33:0.5
        }
        NumberAnimation{
            target: sample
            property:"x"
            duration: 300
            from: plzscan.isshow?40:0
            to: plzscan.isshow?0:40
        }
        NumberAnimation{
            target: sample
            property:"y"
            duration: 300
            from: plzscan.isshow?40:60
            to: plzscan.isshow?60:40
        }
        NumberAnimation{
            target: sample
            property:"opacity"
            duration: 300
            from: plzscan.isshow?0:1
            to: plzscan.isshow?1:0
        }
    }
}

