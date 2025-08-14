import QtQuick
import QtQuick.Controls
import QtQuick.Controls.Material
import Config 1.0
import "qrc:/RightPage/StackPage/SettingSections/"
import "qrc:/Method"
import "qrc:/DataBase"
import Qt.labs.platform

Item{
    anchors.left: parent.left
    anchors.right: parent.right
    height: 160
    MouseArea{
        anchors.fill: parent
        // anchors.leftMargin: 30
        // anchors.rightMargin: 30
        hoverEnabled: true
        onEntered: {
            cursorShape=Qt.PointingHandCursor
            leftarrow.visible=true
            rightarrow.visible=true
        }
        onExited: {
            cursorShape=Qt.ArrowCursor
            leftarrow.visible=false
            rightarrow.visible=false
        }
    }
    ButtonHover{
        id:leftarrow
        src:"/Resrc/Icon/18.png"
        fitwid: 21.5
        fithei: 43
        visible: false
        anchors.left: parent.left
        anchors.verticalCenter: parent.verticalCenter
        onClicked: {
            modelpic.insert(0,modelpic.get(modelpic.count-1))
            modelpic.remove(modelpic.count-1)
            pictimer.stop()
            pictimer.start()
        }
    }
    ButtonHover{
        id:rightarrow
        src:"/Resrc/Icon/19.png"
        fitwid: 21.5
        fithei: 43
        visible: false
        anchors.right: parent.right
        anchors.rightMargin: 10
        anchors.verticalCenter: parent.verticalCenter
        onClicked: {
            modelpic.append(modelpic.get(0))
            modelpic.remove(0)
            pictimer.stop()
            pictimer.start()
        }
    }

    Timer{
        id:pictimer
        repeat:true
        running: true
        interval: 4000
        onTriggered: {
            modelpic.append(modelpic.get(0))
            modelpic.remove(0)
            recseqanim.start()
        }
    }

    Item{
        id:picitem
        width: 780
        height: parent.height
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.leftMargin: 20
        clip: true

        ListModel{
            id:modelpic
            ListElement{src:"/Resrc/Pic/1.jpg"}
            ListElement{src:"/Resrc/Pic/2.jpg"}
            ListElement{src:"/Resrc/Pic/3.jpg"}
            ListElement{src:"/Resrc/Pic/4.jpg"}
            ListElement{src:"/Resrc/Pic/5.jpg"}
            ListElement{src:"/Resrc/Pic/6.jpg"}
        }

        ListView{
            id:piclist
            height: 300
            spacing: 20
            orientation: ListView.Horizontal
            anchors.left: parent.left
            anchors.leftMargin: 10
            anchors.right: parent.right
            model:modelpic
            enabled: false
            //snapMode: ListView.SnapToItem

            remove:Transition {
                NumberAnimation{
                    property: "x"
                    from:0
                    to:-390
                    duration: 2000
                }
            }
            removeDisplaced:Transition {
                NumberAnimation{
                    property: "x"
                    duration: 2000
                }
            }
            addDisplaced:Transition{
                NumberAnimation{
                    property: "x"
                    duration: 2000
                }
            }
            add:Transition {
                NumberAnimation{
                    property:"x"
                    from:-390
                    to:0
                    duration: 2000
                }
            }

            delegate:Rectangle{
                width: 370
                height: 150
                color: "transparent"
                radius: 15
                clip: true
                Image {
                    source: src
                    anchors.centerIn: parent
                    scale: 0.7
                }
            }
        }
        Item{
            id:recanim
            anchors.bottom: picitem.bottom
            //anchors.topMargin: 10
            anchors.left: parent.left
            anchors.leftMargin: 360
            width: 80
            height: 8

            property var widarray: [0,4,6,8,6,4,0]
            property var posarray:[]

            Rectangle{
                id:rec1
                width: recanim.widarray[0]
                height: width
                radius: width/2
                color:"#CED1D8"
                anchors.verticalCenter: parent.verticalCenter
                Component.onCompleted: {
                    parent.posarray.push(x)
                    parent.posarray.reverse()
                }
            }
            Rectangle{
                id:rec2
                width: recanim.widarray[1]
                height: width
                radius: width/2
                color:"#CED1D8"
                x:rec1.x+7+rec1.width
                anchors.verticalCenter: parent.verticalCenter
                Component.onCompleted: {
                    parent.posarray.push(x)
                }
            }
            Rectangle{
                id:rec3
                width: recanim.widarray[2]
                height: width
                radius: width/2
                color:"#CED1D8"
                x:rec2.x+7+rec2.width
                anchors.verticalCenter: parent.verticalCenter
                Component.onCompleted: {
                    parent.posarray.push(x)
                }
            }
            Rectangle{
                id:rec4
                width: recanim.widarray[3]
                height: width
                radius: width/2
                color:rec4.width===8?"#7B8290":"#CED1D8"
                x:rec3.x+7+rec3.width
                anchors.verticalCenter: parent.verticalCenter
                Component.onCompleted: {
                    parent.posarray.push(x)
                }
            }
            Rectangle{
                id:rec5
                width: recanim.widarray[4]
                height: width
                radius: width/2
                color:rec5.width===8?"#7B8290":"#CED1D8"
                x:rec4.x+7+rec4.width
                anchors.verticalCenter: parent.verticalCenter
                Component.onCompleted: {
                    parent.posarray.push(x)
                }
            }
            Rectangle{
                id:rec6
                width: recanim.widarray[5]
                height: width
                radius: width/2
                color:"#CED1D8"
                x:rec5.x+7+rec5.width
                anchors.verticalCenter: parent.verticalCenter
                Component.onCompleted: {
                    parent.posarray.push(x)
                }
            }
            Rectangle{
                id:rec7
                width: recanim.widarray[6]
                height: width
                radius: width/2
                color:"#CED1D8"
                x:rec6.x+7+rec6.width
                anchors.verticalCenter: parent.verticalCenter
                Component.onCompleted: {
                    parent.posarray.push(x)
                }
            }

            SequentialAnimation{
                id:recseqanim
                alwaysRunToEnd: false
                ParallelAnimation{
                    alwaysRunToEnd: true
                    PropertyAnimation{
                        target: rec2
                        properties:"width,height"
                        from:4
                        to:0
                        duration: 2000
                        alwaysRunToEnd: true
                    }
                    NumberAnimation{
                        target: rec2
                        property: "x"
                        from:rec2.x
                        to:0
                        duration: 2000
                        alwaysRunToEnd: true
                    }
                    PropertyAnimation{
                        target: rec3
                        properties:"width,height"
                        from:6
                        to:4
                        duration: 2000
                        alwaysRunToEnd: true
                    }
                    NumberAnimation{
                        target: rec3
                        property: "x"
                        from:rec3.x
                        to:rec2.x
                        duration: 2000
                        alwaysRunToEnd: true
                    }
                    PropertyAnimation{
                        target: rec4
                        properties:"width,height"
                        from:8
                        to:6
                        duration: 2000
                        alwaysRunToEnd: true
                    }
                    NumberAnimation{
                        target: rec4
                        property: "x"
                        from:rec4.x
                        to:rec3.x
                        duration: 2000
                        alwaysRunToEnd: true
                    }
                    PropertyAnimation{
                        target: rec5
                        properties:"width,height"
                        from:6
                        to:8
                        duration: 2000
                        alwaysRunToEnd: true
                    }
                    NumberAnimation{
                        target: rec5
                        property: "x"
                        from:rec5.x
                        to:rec4.x
                        duration: 2000
                        alwaysRunToEnd: true
                    }
                    PropertyAnimation{
                        target: rec6
                        properties:"width,height"
                        from:4
                        to:6
                        duration: 2000
                        alwaysRunToEnd: true
                    }
                    NumberAnimation{
                        target: rec6
                        property: "x"
                        from:rec6.x
                        to:rec5.x
                        duration: 2000
                        alwaysRunToEnd: true
                    }
                    PropertyAnimation{
                        target: rec7
                        properties:"width,height"
                        from:0
                        to:4
                        duration: 2000
                        alwaysRunToEnd: true
                    }
                    NumberAnimation{
                        target: rec7
                        property: "x"
                        from:rec7.x
                        to:rec6.x
                        duration: 2000
                        alwaysRunToEnd: true
                    }
                }
                ScriptAction{
                    script: {
                        rec1.width=recanim.widarray[0]
                        rec2.width=recanim.widarray[1]
                        rec3.width=recanim.widarray[2]
                        rec4.width=recanim.widarray[3]
                        rec5.width=recanim.widarray[4]
                        rec6.width=recanim.widarray[5]
                        rec7.width=recanim.widarray[6]
                        rec1.x=recanim.posarray[0]
                        rec2.x=recanim.posarray[1]
                        rec3.x=recanim.posarray[2]
                        rec4.x=recanim.posarray[3]
                        rec5.x=recanim.posarray[4]
                        rec6.x=recanim.posarray[5]
                        rec7.x=recanim.posarray[6]
                    }
                }
            }
        }
    }
}

