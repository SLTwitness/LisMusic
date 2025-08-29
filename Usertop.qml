import QtQuick
import "qrc:/Method"
import Config 1.0


Row{
    Item {
        height: 30
        width: 140
        anchors.verticalCenter: parent.verticalCenter
        Row{
            anchors.verticalCenter: parent.verticalCenter
            spacing: 8
            Rectangle{
                id:user
                width: 25
                height: width
                radius: width/2
                color: "#EAEDF1"
                Image {
                    scale:0.7
                    anchors.centerIn: parent
                    source: "qrc:/Resrc/Icon/9.png"
                }
            }
            Text {
                id: logtxt
                text: "未登录"
                font.pixelSize: 14
                font.family: "Microsoft YaHei UI"
                anchors.verticalCenter: user.verticalCenter
                color:"#666D7E"
                MouseArea{
                    anchors.fill: parent
                    hoverEnabled: true
                    onEntered: {
                        cursorShape=Qt.PointingHandCursor
                        parent.color="#283248"
                    }
                    onExited: {
                        cursorShape=Qt.ArrowCursor
                        parent.color="#666D7E"
                    }
                    onClicked: {
                        Config.startlogin()
                    }
                }
            }
            Image {
                width:50
                height: 20
                anchors.verticalCenter: user.verticalCenter
                source: "qrc:/Resrc/Icon/10.png"
            }

            ButtonHover {
                id:login
                src: "qrc:/Resrc/Icon/8.png"
                anchors.verticalCenter: parent.verticalCenter
                onClicked: {

                }
            }
            ButtonHover {
                id:mesg
                src: "qrc:/Resrc/Icon/5.png"
                anchors.verticalCenter: parent.verticalCenter
                onClicked: {

                }
            }
            ButtonHover {
                id:setting
                src: "qrc:/Resrc/Icon/4.png"
                anchors.verticalCenter: parent.verticalCenter
                onClicked: {
                    rstackview.push("/RightPage/StackPage/StackSetting.qml")
                    Config.stackstate.push(()=>{rstackview.pop()})
                }
            }
            ButtonHover {
                id:skin
                src: "qrc:/Resrc/Icon/1.png"
                anchors.verticalCenter: parent.verticalCenter
                onClicked: {

                }
            }
            Rectangle{
                height: 24
                width: 1
                color: "#E2E5E9"
                anchors.verticalCenter: parent.verticalCenter
            }
        }
    }
}
