import QtQuick
import Config 1.0
import QtQuick.Window

Window {
    width: 1055
    height: 753
    visible: true
    color: "transparent"
    flags:Qt.FramelessWindowHint|Qt.Window|Qt.WindowSystemMenuHint|
          Qt.WindowMinimizeButtonHint|Qt.WindowMaximizeButtonHint

    Rectangle{
        anchors.fill: parent
        radius: 10
        color:"#ffffff"
        layer.enabled: true
        layer.smooth: true
        layer.samples: 4
    }

    MouseArea{
        // width: parent.width
        // height: 25
        // anchors.top: parent.top
        anchors.fill: parent
        onPressed: (mouse) => {
            if (mouse.button === Qt.LeftButton) {
                mainwindow.startSystemMove();
            }
        }
        onClicked: {
            Config.blankclick()
        }
    }
}
