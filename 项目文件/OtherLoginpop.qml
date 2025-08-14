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
import "qrc:/DataBase"

Popup{
    id:otherloginpop
    anchors.centerIn: parent
    width: 375
    height: 520
    clip:true
    closePolicy: Popup.NoAutoClose

    Connections{
        target: Config
        function onBlankclick(){
            accountnumber.focus=false
        }
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
            otherloginpop.close()
        }
    }
    background:Rectangle{
        anchors.fill:parent
        radius: 10
        border.width: 1
        border.color: "#B8B9BA"
        color:"#FFFFFF"
        MouseArea {
            anchors.fill: parent
            z:0
            onClicked: {
                Config.blankclick()
            }
        }
        Image {
            id:qr
            anchors.left:parent.left
            anchors.leftMargin: -170
            anchors.top: parent.top
            anchors.topMargin: -170
            scale:0.2
            z:1
            source: "qrc:/Resrc/log/1.png"
            MouseArea{
                anchors.left:parent.left
                anchors.top: parent.top
                width: 180
                height: 180
                hoverEnabled: true
                onEntered:{
                    // plzscan.start()
                    // plzscan.isshow=true
                    cursorShape=Qt.PointingHandCursor
                }
                onExited: {
                    // plzscan.start()
                    // plzscan.isshow=false
                    cursorShape=Qt.ArrowCursor
                }
                onClicked: {
                    otherloginpop.close()
                    loginpop.open()
                }
            }
        }
        Canvas{
            id:shelter
            anchors.fill: parent
            contextType: "2d"
            z:1
            onPaint: {
                let cvs=shelter.getContext("2d")
                cvs.beginPath()
                cvs.moveTo(100,5)
                cvs.lineTo(85,5)
                cvs.lineTo(5,85)
                cvs.lineTo(5,100)
                cvs.lineTo(100,100)
                cvs.lineTo(100,5)
                cvs.fillStyle="#FFFFFF"
                cvs.fill()
            }
        }
        Row{
            id:loginlogo
            anchors.top:parent.top
            anchors.topMargin: 75
            anchors.horizontalCenter:parent.horizontalCenter
            spacing: 1
            Image {
                id: loglogo
                scale:0.6
                source: "/Resrc/logo/1.png"
            }
            Label{
                color: "black"
                text:"远征队音乐"
                anchors.verticalCenter: parent.verticalCenter
                font.pixelSize: 25
                font.bold: Font.Bold
                font.family: Config.fontfmy
            }
        }

        ButtonHover{
            src:"/Resrc/Icon/17.png"
            x:293
            y:156
            z:4
            fitwid: 16.3
            fithei: 16.3
            visible: accountnumber.text!==""
            onClicked: {
                accountnumber.text=""
            }
        }
        ButtonHover{
            src:logincolumn.isshow?"/Resrc/Icon/15.png":"/Resrc/Icon/16.png"
            x:312
            y:156
            z:4
            fitwid: 16.3
            fithei: 16.3
            visible: accountnumber.text!==""
            onClicked: {
                if(logincolumn.isshow){
                    accountnumber.echoMode=TextInput.Password
                    logincolumn.isshow=false
                }
                else{
                    accountnumber.echoMode=TextInput.Normal
                    logincolumn.isshow=true
                }
            }
        }

        Column{
            id:logincolumn
            anchors.top:loginlogo.bottom
            anchors.topMargin: 25
            anchors.horizontalCenter: parent.horizontalCenter
            property bool isshow: accountnumber.echoMode===TextInput.Normal?true:false
            spacing: 23
            TextField{
                id:accountnumber
                width: 300
                height: 35
                font.pixelSize: 15
                placeholderText: "请输入支付密码"
                verticalAlignment: Text.AlignVCenter
                leftPadding:105
                echoMode: TextInput.Password
                MouseArea{
                    anchors.left: parent.left
                    anchors.top:parent.top
                    width: accountnumber.leftPadding
                    height: accountnumber.height
                    hoverEnabled: true
                    onEntered: {
                        cursorShape=Qt.PointingHandCursor
                    }
                    onExited: {
                        cursorShape=Qt.ArrowCursor
                    }
                    onClicked: {
                        accountlist.open()
                    }
                }
                background: Rectangle{
                    anchors.fill: parent
                    radius:20
                    border.width: 0.7
                    border.color: "#EBEDEE"
                    color:"#F8F9F9"
                    Item {
                        id:accountchose
                        anchors.top: parent.top
                        anchors.bottom: parent.bottom
                        anchors.left: parent.left
                        anchors.leftMargin: 5
                        width: accountnumber.leftPadding
                        Row{
                            anchors.centerIn: parent
                            spacing: 10
                            Label{
                                id:accountchoice
                                text:"+app"
                                color:"#283248"
                                font.pixelSize: 15
                                font.weight: 600
                                font.family: "Microsoft YaHei UI"
                                anchors.verticalCenter: parent.verticalCenter
                            }
                            Label{
                                id:accountarrow
                                text:"∨"
                                color:"#283248"
                                font.pixelSize: 15
                                font.weight: 600
                                font.family: "Microsoft YaHei UI"
                                anchors.verticalCenter: parent.verticalCenter
                                anchors.leftMargin:-50
                            }
                            Label{
                                text:"|"
                                color:"#C4C8CC"
                                font.pixelSize: 15
                                font.weight: 100
                                font.family: "Microsoft YaHei UI"
                                anchors.verticalCenter: parent.verticalCenter
                                anchors.leftMargin:-50
                            }
                        }
                    }
                }

                AccountData{
                    id:modelaccount
                }

                Popup{
                    id:accountlist
                    width: 110
                    height: 300
                    y:accountnumber.height+3
                    background: Rectangle{
                        anchors.fill: parent
                        radius:10
                        color: "#FFFFFF"
                        border.width: 0.6
                        border.color: "#E9EAEC"
                        clip: true
                        ListView{
                            id:chooseview
                            anchors.fill: parent
                            anchors.topMargin: 10
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
                            model:modelaccount
                            delegate:Rectangle{
                                height: 40
                                anchors.left: parent.left
                                anchors.right:parent.right
                                anchors.rightMargin: 10
                                color:"transparent"
                                Image {
                                    id:accountimage
                                    anchors.left: parent.left
                                    anchors.leftMargin: 5
                                    anchors.verticalCenter: parent.verticalCenter
                                    width: 20
                                    height: 20
                                    source: src
                                }
                                Text{
                                    text:account
                                    color:"#656C7C"
                                    font.pixelSize: 15
                                    font.family: Config.fontfmy
                                    anchors.left: parent.left
                                    anchors.leftMargin: 30
                                    anchors.verticalCenter: parent.verticalCenter
                                }
                                MouseArea{
                                    anchors.fill: parent
                                    hoverEnabled: true
                                    onEntered: {
                                        parent.color="#F2F3F4"
                                        cursorShape=Qt.PointingHandCursor
                                    }
                                    onExited: {
                                        parent.color="transparent"
                                        cursorShape=Qt.ArrowCursor
                                    }
                                    onClicked: {
                                        accountchoice.text=account
                                    }
                                }
                            }
                        }
                    }
                }
            }

            Item{
                height: 25
                width: 300
                anchors.left: accountnumber.left
                anchors.leftMargin: 13
                SelectBox {
                    id: autolog
                    selecttxt: "自动登录"
                }
                Label{
                    text:"密码登录"
                    color:"#686F7F"
                    font.pixelSize: 13
                    font.weight: 300
                    font.family: "Microsoft YaHei UI"
                    anchors.verticalCenter: autolog.verticalCenter
                    anchors.left: autolog.left
                    anchors.leftMargin: 230
                    MouseArea{
                        anchors.fill: parent
                        hoverEnabled: true
                        onEntered: {
                            cursorShape=Qt.PointingHandCursor
                        }
                        onExited: {
                            cursorShape=Qt.ArrowCursor
                        }
                    }
                }
            }
        }

        Rectangle{
            id:loginbutton
            width: 305
            height: 38
            x:40
            y:267
            radius:50
            gradient: Gradient{
                orientation:Gradient.Horizontal
                GradientStop{position:0;color: "#FF1168"}
                GradientStop{position:1;color: "#FC3D49"}
            }
            Label{
                text:"验证码付款"
                font.pixelSize: 20
                font.weight: 600
                color:"white"
                font.family: "Microsoft YaHei UI"
                anchors.centerIn: loginbutton
            }
        }

        Row{
            id:logorow
            width: 305
            height: 38
            anchors.top: loginbutton.bottom
            anchors.left: loginbutton.left
            anchors.topMargin: 108
            anchors.leftMargin: 35
            spacing: 45
            Rectangle{
                id:wxrec
                width: 40
                height: width
                radius: width/2
                color: wxhover.hovered ? "#EFFAEC" : "#F8F9F9"
                border.width: 0.7
                border.color: wxhover.hovered ?"#E1F5DB":"#ECEEEF"
                ButtonHover{
                    src:"qrc:/Resrc/logo/4.png"
                    anchors.centerIn: parent
                    fitclr:"#8ADA76"
                }
                HoverHandler {
                    id: wxhover
                    acceptedDevices: PointerDevice.Mouse
                    onActiveChanged: {
                        btnHover.hovered = active
                    }
                }
            }
            Rectangle{
                id:qqrec
                width: 40
                height: width
                radius: width/2
                color: qqhover.hovered ? "#EBF8FF" : "#F8F9F9"
                border.width: 0.7
                border.color: qqhover.hovered ?"#D9F1FF":"#ECEEEF"
                ButtonHover{
                    src:"qrc:/Resrc/logo/5.png"
                    anchors.centerIn: parent
                    fitclr:"#6FCAFF"
                }
                HoverHandler {
                    id: qqhover
                    acceptedDevices: PointerDevice.Mouse
                    onActiveChanged: {
                        btnHover.hovered = active
                    }
                }
            }
            Rectangle{
                id:alirec
                width: 40
                height: width
                radius: width/2
                color: alihover.hovered ? "#EBF8FF" : "#F8F9F9"
                border.width: 0.7
                border.color: alihover.hovered ?"#D9F1FF":"#ECEEEF"
                ButtonHover{
                    src:"qrc:/Resrc/logo/8.png"
                    anchors.centerIn: parent
                    fitclr:"#6FCAFF"
                }
                HoverHandler {
                    id: alihover
                    acceptedDevices: PointerDevice.Mouse
                    onActiveChanged: {
                        btnHover.hovered = active
                    }
                }
            }
        }

        Row{
            anchors.top:logorow.bottom
            anchors.left: logorow.left
            anchors.topMargin: 20
            anchors.leftMargin: -38
            width: 300
            height: 30
            spacing: 10
            Rectangle{
                id:agreerec
                width: 15
                height: 15
                radius: width/2
                color:agreerec.isagree?"#FF3A3A":"transparent"
                border.width: 0.6
                border.color: "#AAAEB7"
                property bool isagree: false
                Label{
                    text:"√"
                    font.pixelSize: 12
                    font.weight: 600
                    anchors.centerIn: parent
                    color:"white"
                    font.family: "Microsoft YaHei UI"
                    visible: agreerec.isagree?true:false
                }
                MouseArea{
                    anchors.fill:parent
                    hoverEnabled:true
                    onEntered: {
                        cursorShape=Qt.PointingHandCursor
                        agreerec.border.color="#3F485B"
                    }
                    onExited: {
                        cursorShape=Qt.ArrowCursor
                        agreerec.border.color="#AAAEB7"
                    }
                    onClicked: {
                        agreerec.isagree=!agreerec.isagree
                    }
                }
            }
            Label{
                text: "同意《自愿捐赠》《扶贫救济》《善待作者保护法》"
                color: "#9398A3"
                font.pixelSize: 12
                font.weight: 200
                font.family: "Microsoft YaHei UI"
                anchors.verticalCenter: agreerec.verticalCenter
            }
        }
    }
}
