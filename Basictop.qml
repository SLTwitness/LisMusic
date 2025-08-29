import QtQuick
import "qrc:/Method"
import savehisty 1.0
import "qrc:/DataBase"

Item{
    Row{
        id:opticon
        spacing: 8
        anchors.right: parent.right
        anchors.rightMargin: 0.033*mainwindow.width
        anchors.verticalCenter: parent.verticalCenter
        ButtonHover{
            src:"qrc:/Resrc/Icon/2.png"
            anchors.verticalCenter: parent.verticalCenter
        }
        ButtonHover {
            src: "qrc:/Resrc/Icon/3.png"
            anchors.verticalCenter: parent.verticalCenter
            onClicked: {
                mainwindow.showMinimized()
            }
        }
        ButtonHover {
            src: "qrc:/Resrc/Icon/7.png"
            anchors.verticalCenter: parent.verticalCenter
            property bool ismax: false
            onClicked: {
                ismax=!ismax
                if(ismax){
                    mainwindow.showFullScreen()
                }
                else{
                    mainwindow.showNormal()
                }
            }
        }
        ButtonHover {
            src: "qrc:/Resrc/Icon/6.png"
            anchors.verticalCenter: parent.verticalCenter
            onClicked: {
                Qt.quit()
            }
        }
    }
}
