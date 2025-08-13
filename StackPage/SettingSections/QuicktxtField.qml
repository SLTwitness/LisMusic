import QtQuick
import QtQuick.Controls
import QtQuick.Controls.Material
import Config 1.0
import "qrc:/RightPage/StackPage/SettingSections/"
import "qrc:/Method"

TextField {
    id: quicktxtfield
    width: 180
    height: 30
    readOnly: true
    font.pixelSize: 14
    font.family: "Microsoft YaHei UI"

    signal colorDialogRequested()
    Connections{
        target: Config
        function onBlankclick(){
            focus=false
        }
        // function onOpencolordialog() {
        //     colorpop.open()
        // }
    }

    Component.onCompleted: {
        quicktxtfield.forceActiveFocus();
    }

    Keys.onPressed: (event) => {
        if (!quicktxtfield.focus) return;

        let str = "";
        if (event.modifiers & Qt.ControlModifier){
            str += "Ctrl+";
        }
        if (event.modifiers & Qt.ShiftModifier)
            str += "Shift+";
        if (event.modifiers & Qt.AltModifier){
            str += "Alt+";
        }

        let key = event.key;
        if (key >= Qt.Key_A && key <= Qt.Key_Z) {
            str += String.fromCharCode(key);
        }
        else if (key >= Qt.Key_0 && key <= Qt.Key_9) {
            str += String.fromCharCode(key);
        }

        quicktxtfield.text = str;
        event.accepted = true;
    }

    background: Rectangle {
        anchors.fill: parent
        color: "#F0F3F6"
        border.width: 0.7
        border.color: "#E6EAED"
        radius: height / 2
        Rectangle {
            id: cursorrec
            color: "#7C8290"
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            anchors.left: parent.left
            anchors.topMargin: 4
            anchors.bottomMargin: 4
            anchors.leftMargin: quicktxtfield.implicitWidth-15
            width: 1.5
            height: 4
            visible: quicktxtfield.focus
            opacity: 0
            z: 4
        }
        SequentialAnimation {
            id: cursoranim
            running: quicktxtfield.focus
            loops: Animation.Infinite
            PropertyAnimation {
                target: cursorrec
                property: "opacity"
                from: 1
                to: 0
                duration: 450
            }
            PropertyAnimation {
                target: cursorrec
                property: "opacity"
                from: 0
                to: 1
                duration: 450
            }
        }
        MouseArea {
            anchors.fill: parent
            hoverEnabled: true
            onEntered: cursorShape = Qt.IBeamCursor
            onExited: cursorShape = Qt.ArrowCursor
            onPressed: {
                quicktxtfield.forceActiveFocus();
            }
        }
    }
}
