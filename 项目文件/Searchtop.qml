import QtQuick
import QtQuick.Controls
import QtQuick.Controls.Material
import "qrc:/Method"
import "qrc:/DataBase"
import Config 1.0
import savehisty 1.0

Row{
    Rectangle{
        id:backrec
        width: 26
        height: 34
        color: "transparent"
        border.width: 0.6
        border.color: "#E2E5E9"
        radius: 7
        Image{
            id:backsec
            source: "qrc:/Resrc/Icon/11.png"
            anchors.centerIn: parent
            width:33
            height:43
            MouseArea{
                anchors.fill: parent
                hoverEnabled: true
                onEntered: {
                    cursorShape=Qt.PointingHandCursor
                    backrec.color="#E2E5E9"
                }
                onExited: {
                    cursorShape=Qt.ArrowCursor
                    backrec.color="transparent"
                }
                onClicked: {
                    console.log(Config.stackstate.length)
                    Config.stackstate.pop()()
                }
            }
        }
    }

    TextField{
        id:searchtxt
        height: backrec.height
        width: 255
        placeholderText:"🔥输入查找歌曲"
        font.pixelSize: 15
        font.family: "Microsoft YaHei UI"
        leftPadding:50

        Connections{
            target: Config
            function onBlankclick(){
                searchtxt.focus=false
            }
        }

        Keys.onReturnPressed: { //Enter输入功能

            let data=[]
            for(let i=0;i<modelhistory.count;i++){
                let getdata=modelhistory.get(i);
                data.push(
                            {
                                historysearch:getdata.historysearch
                            })
            }
            sv.savehis(data)

            if(modelhistory.count>1){
                modelhistory.insert(modelhistory.count-1,{historysearch:searchtxt.text})
                searchtxt.text=""
                searchtxt.focus=false
            }
            else{
                modelhistory.append({historysearch:searchtxt.text})
                modelhistory.append({historysearch:""})
                searchtxt.text=""
                searchtxt.focus=false
            }
        }

        background: Rectangle{
            Rectangle{
                anchors.fill: parent
                radius:8
                opacity: searchtxt.focus ? 1.0 : 0.0
                color:"transparent"
                border.color: "#E2E5E9"
                border.width: 1
                ButtonHover{
                    src:"qrc:/Resrc/Icon/13.png"
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.left: parent.left
                    anchors.leftMargin: 15
                    fitwid: 20
                    fithei: 23
                }
            }
            Rectangle{
                anchors.fill: parent
                radius:8
                opacity: searchtxt.focus ? 0.0 : 1.0
                gradient: Gradient{
                    id:searchgrd
                    orientation:Gradient.Horizontal
                    GradientStop{color:"#DAE7F8";position:0}
                    GradientStop{color:"#F7E2F0";position:1}
                }
                Rectangle{
                    anchors.fill: parent
                    anchors.margins:1
                    radius:8
                    opacity: searchtxt.focus ? 0.0 : 1.0  //
                    gradient: Gradient{
                        orientation:Gradient.Horizontal
                        GradientStop{color:"#EAF0FA";position:0}
                        GradientStop{color:"#EEF0FB";position:0.3}
                        GradientStop{color:"#F7EEF7";position:1}
                    }
                }
                ButtonHover{
                    src:"qrc:/Resrc/Icon/13.png"
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.left: parent.left
                    anchors.leftMargin: 15
                    fitwid: 20
                    fithei: 23
                    onClicked: {
                        modelhistory.append({historysearch:searchtxt.text})
                        searchtxt.text=""
                    }
                }
            }
        }
        TapHandler {
            onTapped: {
                searchpop.open()
            }
        }
    }
    SearchData{
        id:modelhistory
    }

    Savehisty{
        id:sv
    }

    FavorData{
        id:modelguess
    }
    HotData{
        id:modelhot
    }
    HotIdData{
        id:modelhotid
    }
    OtherData{
        id:modelother
    }
    OtherIdData{
        id:modelotherid
    }
    Popup{
        id:searchpop
        width: 780
        height: 600
        y:searchtxt.height+10
        clip: true
        background: Rectangle{
            anchors.fill: parent
            radius: 15
            border.color:"gray" //
            color: "#FFFFFF"
            clip:true
            Flickable{
                id:searchroll
                anchors.fill: parent
                //height:900
                contentHeight: 800
                clip:true
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
                // WheelHandler {
                //         id: wheelHandler
                //         target: searchroll
                //         onWheel: (event) => {
                //             searchroll.contentY -= event.angleDelta.y
                //         }
                //     }                  //不做无法实现的梦~~~~~~~~~~~~~~~~~
                Item{
                    id:itemhistory
                    anchors.right:parent.right
                    anchors.left: parent.left
                    anchors.top:parent.top
                    anchors.topMargin: 10
                    anchors.leftMargin: 25
                    height: 25
                    Label{
                        id:searchhistory
                        color:"#283248"
                        text:"搜索历史"
                        font.pixelSize: 12
                        font.bold:true
                        font.family: "Microsoft YaHei UI"
                    }
                    ButtonHover {
                        id:deletehistory
                        src: "qrc:/Resrc/Icon/14.png"
                        anchors.verticalCenter: searchhistory.verticalCenter
                        anchors.left: searchhistory.right
                        anchors.leftMargin: 10
                        fitwid: 15.5
                        fithei: 14.5
                        onClicked: {
                            modelhistory.clear()
                        }
                    }
                }
                Flow{
                    id:flowhistory
                    anchors.top:itemhistory.bottom
                    anchors.left: itemhistory.left
                    anchors.right: itemhistory.right
                    anchors.rightMargin: 10
                    anchors.topMargin: 5
                    spacing: 10
                    Repeater{
                        id:historylist
                        anchors.fill:parent
                        model:modelhistory
                        property bool isroll: true
                        delegate: Rectangle{
                            width: labelhistory.width+15
                            height: 30
                            border.width: 0.8
                            border.color: "#E8EAEC"
                            color:historylist.isroll?(index===6?"transparent":"#F2F3F4"):
                                            (index===historylist.count-1?"transparent":"#F2F3F4")
                            radius: 20
                            visible: index<(historylist.isroll?7:historylist.count)
                            Label{
                                id:labelhistory
                                text:undefined===historysearch?"":
                                                (historylist.isroll?(index===6?"﹀":historysearch):
                                                (index===historylist.count-1?"︿":historysearch))
                                font.pixelSize: 13
                                anchors.centerIn: parent
                                color:"#656C7C"
                                font.family: "Microsoft YaHei UI"
                            }
                            MouseArea{
                                anchors.fill: parent
                                hoverEnabled: true
                                onEntered: {
                                    parent.color="#E9EAEC"
                                    cursorShape=Qt.PointingHandCursor
                                }
                                onExited: {
                                    parent.color=historylist.isroll?(index===6?"transparent":"#F2F3F4"):
                                                            (index===historylist.count-1?"transparent":"#F2F3F4")
                                    cursorShape=Qt.ArrowCursor
                                }
                                onClicked: {
                                    if(historylist.isroll&&index===6){
                                        historylist.isroll=false
                                    }
                                    else if(!historylist.isroll&&index===historylist.count-1){
                                        historylist.isroll=true
                                    }
                                    else{
                                        searchtxt.text=historysearch
                                    }
                                }
                            }
                        }
                    }
                }

                Item {
                    id: itemguessfavor
                    anchors.top: flowhistory.bottom
                    anchors.right:parent.right
                    anchors.left: parent.left
                    anchors.leftMargin: 25
                    anchors.topMargin: 20
                    Label{
                        id:guessfavor
                        color:"#283248"
                        text:"猜你喜欢"
                        font.pixelSize: 12
                        font.bold:true
                        font.family: "Microsoft YaHei UI"
                    }
                }
                Flow{
                    id:flowfavor
                    anchors.top: itemguessfavor.bottom
                    anchors.right:itemguessfavor.right
                    anchors.left: itemguessfavor.left
                    anchors.rightMargin: 10
                    anchors.topMargin: 25
                    spacing: 10
                    Repeater{
                        id:guesslist
                        anchors.fill:parent
                        model:modelguess
                        delegate: Rectangle{
                            width: labelguess.width+15
                            height: 30
                            border.width: 0.8
                            border.color: "#E8EAEC"
                            color:"#F2F3F4"
                            radius: 20
                            Label{
                                id:labelguess
                                text:favormaybe
                                font.pixelSize: 13
                                anchors.centerIn: parent
                                color:"#656C7C"
                                font.family: "Microsoft YaHei UI"
                            }
                            MouseArea{
                                anchors.fill: parent
                                hoverEnabled: true
                                onEntered: {
                                    parent.color="#E9EAEC"
                                    cursorShape=Qt.PointingHandCursor
                                }
                                onExited: {
                                    parent.color="#F2F3F4"
                                    cursorShape=Qt.ArrowCursor
                                }
                            }
                        }
                    }
                }
                Rectangle{
                    id:hotrec
                    anchors.top: flowfavor.bottom
                    anchors.left: parent.left
                    anchors.leftMargin: 25
                    anchors.right: parent.right
                    anchors.rightMargin: 25
                    anchors.topMargin: 20
                    height: 180
                    color:"#F8F9F9"
                    radius: 10
                    Label{
                        text: "热搜榜"
                        font.pixelSize:19
                        font.family:"Microsoft YaHei UI"
                        font.weight:Font.Black
                        color: "#51596B"
                        anchors.left: parent.left
                        anchors.leftMargin:20
                        anchors.top: parent.top
                        anchors.topMargin: 10
                    }
                }
                Flow{
                    id:flowhot
                    anchors.top:hotrec.top
                    anchors.left: hotrec.left
                    anchors.right: hotrec.right
                    anchors.leftMargin: 40
                    anchors.topMargin: 50
                    Repeater{
                        id:hotlist
                        anchors.fill:parent
                        model:modelhot
                        delegate: Item {
                            width: parent.width/3
                            height: 40
                            Label{
                                id:labelhot
                                text:onhot
                                font.pixelSize: 15
                                font.family: "Microsoft YaHei UI"
                                color:"#51596B"
                                font.weight: fontweight!==0 ?fontweight:400
                            }
                        }
                    }
                }
                Flow{
                    anchors.top:hotrec.top
                    anchors.left: hotrec.left
                    anchors.right: hotrec.right
                    anchors.leftMargin: 22
                    anchors.topMargin: 50
                    Repeater{
                        id:hotidlist
                        anchors.fill:parent
                        model:modelhotid
                        delegate: Item {
                            width: parent.width/3
                            height: 40
                            Label{
                                id:labelhotid
                                text:hotid
                                font.pixelSize: 15
                                color: textcolor!==undefined ?textcolor:"#51596B"
                                font.family: "Microsoft YaHei UI"
                            }
                        }
                    }
                }

                Rectangle{
                    id:otherrec
                    anchors.top: hotrec.bottom
                    anchors.left: parent.left
                    anchors.leftMargin: 25
                    anchors.right: parent.right
                    anchors.rightMargin: 25
                    anchors.topMargin: 20
                    height: 350
                    color:"#F8F9F9"
                    radius: 10
                    Label{
                        text: "随便榜"
                        font.pixelSize:19
                        font.family:"Microsoft YaHei UI"
                        font.weight:Font.Black
                        color: "#51596B"
                        anchors.left: parent.left
                        anchors.leftMargin:20
                        anchors.top: parent.top
                        anchors.topMargin: 10
                    }
                }
                Flow{
                    id:flowother
                    anchors.top:otherrec.top
                    anchors.left: otherrec.left
                    anchors.right: otherrec.right
                    anchors.leftMargin: 40
                    anchors.topMargin: 50
                    Repeater{
                        id:otherlist
                        anchors.fill:parent
                        model:modelother
                        delegate: Item {
                            width: parent.width/3
                            height: 40
                            Label{
                                id:labelother
                                text:onhot
                                font.pixelSize: 15
                                font.family: "Microsoft YaHei UI"
                                color:"#51596B"
                                font.weight: fontweight!==0 ?fontweight:400
                            }
                        }
                    }
                }
                Flow{
                    anchors.top:otherrec.top
                    anchors.left: otherrec.left
                    anchors.right: otherrec.right
                    anchors.leftMargin: 22
                    anchors.topMargin: 50
                    Repeater{
                        id:otheridlist
                        anchors.fill:parent
                        model:modelotherid
                        delegate: Item {
                            width: parent.width/3
                            height: 40
                            Label{
                                id:labelotherid
                                text:hotid
                                font.pixelSize: 15
                                color: textcolor!==undefined ?textcolor:"#51596B"
                                font.family: "Microsoft YaHei UI"
                            }
                        }
                    }
                }
            }
        }
    }

    Rectangle{
        id:foundsoundrec
        height: backrec.height
        width: height
        color: "#F7EFF8"
        border.width:1
        border.color:"#F4E4E9"
        radius: 7
        Image{
            anchors.centerIn: parent
            source: "qrc:/Resrc/Icon/12.png"
            width:38
            height: 38
            MouseArea{
                anchors.fill: parent
                hoverEnabled: true
                onEntered: {
                    foundsoundrec.color="#F3E7F6"
                }
                onExited: {
                    foundsoundrec.color="#F7EFF8"
                }
            }
        }
    }

    Component.onCompleted:{
        modelhistory.clear()
        let data=sv.loadhis()
        for(let i=0;i<data.length;i++){
            modelhistory.append(data[i]);
        }
    }
}
