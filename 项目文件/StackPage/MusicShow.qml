import QtQuick
import QtQuick.Controls
import QtQuick.Controls.Material

Item {
    id:musicshowbox
    Item{
        anchors.fill: parent
        anchors.leftMargin: 30
        anchors.topMargin: 20
        Flow{
            id:selectflow
            anchors.left: parent.left
            anchors.top:parent.top
            height: 20
            spacing: 15
            Repeater{
                id:selectrep
                anchors.fill: parent
                model:["精选","歌单广场","排行榜","歌手","VIP"]
                property int selectrepindex: 0
                Item{
                    height:30
                    width: selecttitle.implicitWidth+10
                    Label{
                        id:selecttitle
                        text:modelData
                        font.pixelSize: 16
                        color:selectrep.selectrepindex===index?"#283248":"#7B8290"
                        font.family: "Microsoft YaHei UI"
                        font.weight: selectrep.selectrepindex === index?600:200
                        anchors.centerIn: parent
                    }
                    Rectangle{
                        anchors.left: selecttitle.left
                        anchors.right: selecttitle.right
                        anchors.top: selecttitle.bottom
                        anchors.leftMargin: selecttitle.implicitWidth/selecttitle.font.pixelSize*2
                        anchors.rightMargin: selecttitle.implicitWidth/selecttitle.font.pixelSize*2
                        anchors.topMargin: 3
                        height: 3
                        color:"red"
                        radius: 10
                        visible: selectrep.selectrepindex===index
                    }
                    MouseArea{
                        anchors.fill: parent
                        hoverEnabled: true
                        onEntered: {
                            if(selectrep.selectrepindex===index){
                                selecttitle.color="#283248"
                            }
                            else{
                                selecttitle.color="#666D7E"
                            }
                            cursorShape=Qt.PointingHandCursor
                        }
                        onExited: {
                            if(selectrep.selectrepindex===index){
                                selecttitle.color="#283248"
                            }
                            else{
                                selecttitle.color="#7B8290"
                            }
                            cursorShape=Qt.ArrowCursor
                        }
                        onClicked: {
                            selectrep.selectrepindex=index
                            for(let i=0; i<selectrep.count;i++){
                                let item=selectrep.itemAt(i)
                                if(item){
                                    let label=item.children.find(child=>child instanceof Label)
                                    if(label){
                                        label.color=(i===index)?"#283248":"#7B8290"
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }

        StackView{
            anchors.top: selectflow.bottom
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.bottom: parent.bottom
            anchors.topMargin: 10
            anchors.leftMargin: -20
            clip: true
            initialItem: "qrc:/RightPage/StackPage/SelectPage/WellSelect.qml"
        }
    }
}
