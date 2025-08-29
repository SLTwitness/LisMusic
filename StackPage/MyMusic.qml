import QtQuick
import QtQuick.Controls
import QtQuick.Controls.Material
import Config 1.0
import "qrc:/RightPage/StackPage/SettingSections/"
import "qrc:/Method"
import "qrc:/DataBase"
// import Qt.labs.platform
import QtQuick.Dialogs
import QtQuick.Layouts
import QtMultimedia
import musicinfo 1.0
import musicplay 1.0
import QtQuick.Effects

Rectangle{
    radius:8
    gradient: Gradient{
        GradientStop{position:0;color: "#F8E1E3"}
        GradientStop{position:1;color: "#F7F9FC"}
    }

    MouseArea{
        anchors.fill: parent
        onClicked: {
            Config.blankclick();
        }
    }

    Item{
        id:likeit
        Image {
            id:img
            source: "qrc:/Resrc/Pic/13.png"
            scale: 0.338
            anchors.left: parent.left
            anchors.top:parent.top
            anchors.leftMargin: -140
            anchors.topMargin: -140
        }
        Text{
            id:liketxt
            text:"我喜欢的音乐"
            font.pixelSize: 19
            font.family: "Microsoft YaHei UI"
            font.weight: 600
            color:"#283248"
            anchors.left:img.right
            anchors.leftMargin: -150
            anchors.top:parent.top
            anchors.topMargin: 20
        }
        Text {
            id:idtxt
            text: "未登录"
            font.pixelSize: 12
            font.family: "Microsoft YaHei UI"
            font.weight: 200
            color:"#525669"
            anchors.left: liketxt.left
            anchors.leftMargin: 35
            anchors.top: liketxt.bottom
            anchors.topMargin: 15
        }
        Text{
            text: "2020-03-15创建"
            font.pixelSize: 12
            font.family: "Microsoft YaHei UI"
            font.weight: 200
            color:"#908C99"
            anchors.left: idtxt.right
            anchors.leftMargin: 10
            anchors.verticalCenter: idtxt.verticalCenter
        }
        Rectangle{
            id:playrec
            width: 101
            height: 36
            radius: 8
            opacity:1
            anchors.top: idtxt.bottom
            anchors.topMargin: 80
            anchors.left: liketxt.left
            gradient: Gradient{
                orientation:Gradient.Horizontal
                GradientStop{position:0;color: "#E3364C"}
                GradientStop{position:1;color: "#FC3D49"}
            }
            Image {
                source: "qrc:/Resrc/Icon/28.png"
                anchors.verticalCenter: parent.verticalCenter
                anchors.right: playtxt.left
                anchors.rightMargin: 5
                scale: 0.9
            }
            Text{
                id:playtxt
                text:"播放全部"
                color:"white"
                font.pixelSize: 14
                font.family: "Microsoft YaHei UI"
                font.weight: 400
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: parent.left
                anchors.leftMargin: 33
            }
            MouseArea{
                anchors.fill: parent
                hoverEnabled: true
                onEntered: {
                    cursorShape=Qt.PointingHandCursor
                    parent.opacity=0.8
                }
                onExited: {
                    cursorShape=Qt.ArrowCursor
                    parent.opacity=1
                }
                onClicked: {

                }
            }
        }
        Rectangle{
            width: 81
            height: 36
            radius: 8
            opacity:1
            anchors.top: playrec.top
            anchors.left: playrec.right
            anchors.leftMargin: 12
            color:"#EAE0E4"
            border.width: 0.8
            border.color: "#DFD6DB"
            Image {
                source: "qrc:/Resrc/Icon/29.png"
                anchors.verticalCenter: parent.verticalCenter
                anchors.right: loadtxt.left
                anchors.rightMargin: 0
                scale: 0.8
            }
            Text{
                id:loadtxt
                text:"导入"
                color:"#3B4357"
                font.pixelSize: 14
                font.family: "Microsoft YaHei UI"
                font.weight: 400
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: parent.left
                anchors.leftMargin: 33
            }
            MouseArea{
                anchors.fill: parent
                hoverEnabled: true
                onEntered: {
                    cursorShape=Qt.PointingHandCursor
                    parent.opacity=0.8
                }
                onExited: {
                    cursorShape=Qt.ArrowCursor
                    parent.opacity=1
                }
                onClicked: {
                    musicfile.open()
                }
            }
        }
    }

    FileDialog{
        id:musicfile
        title:"选择导入的音乐"
        nameFilters: ["音乐文件(*.mp3 *.wav *.flac)","所有文件 (*)"]
        fileMode: FileDialog.OpenFiles
        onAccepted: {
            for(let i=0;i<selectedFiles.length;i++){
                reader.getdata(selectedFiles[i])
            }

            // console.log("选择的文件:",selectedFiles)
        }
    }

    Flow{
        id:selectflow
        anchors.left: likeit.left
        anchors.leftMargin: 30
        anchors.top:likeit.bottom
        anchors.topMargin: 220
        height: 20
        spacing: 15
        Repeater{
            id:selectrep
            anchors.fill: parent
            model:["歌曲","评论","收藏者"]
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
    TextField{
        id:seektxt
        anchors.right: parent.right
        anchors.rightMargin:40
        anchors.bottom: musicsort.top
        anchors.bottomMargin: 20
        placeholderText: "搜索"
        horizontalAlignment: Text.AlignRight
        width: 70
        height: 30
        Image {
            anchors.left: parent.left
            anchors.leftMargin: 3
            anchors.top: parent.top
            anchors.topMargin: -1
            source: "qrc:/Resrc/Icon/13.png"
            scale: 0.5
        }
        background: Rectangle{
            anchors.fill: parent
            color:"white"
            radius: 20
        }
        Behavior on width {
            NumberAnimation{
                duration: 500
                easing.type:Easing.OutBack
            }
        }
        onActiveFocusChanged: {
            if(activeFocus){
                width=140
            }
            else{
                width=70
            }
        }

        Keys.onReturnPressed:{
            musicmodel.clear()
            var data=reader.seekdata(seektxt.text)
            for(let i=0;i<data.length;i++){
                musicmodel.append(data[i])
            }
        }

        Connections{
            target: Config
            function onBlankclick(){
                seektxt.focus=false
            }
        }
    }

    Item {
        id:musicsort
        width: parent.width
        height: 30
        anchors.top: selectflow.bottom
        anchors.topMargin: 25
        anchors.left: parent.left
        Text {
            id: txt1
            text: "#"
            color: "#7B7E8D"
            font.pixelSize: 13
            font.family: "Microsoft YaHei UI"
            font.weight: 200
            anchors.left: parent.left
            anchors.leftMargin: 55
        }
        Text {
            id: txt2
            text: "标题"
            color: "#7B7E8D"
            font.pixelSize: 13
            font.family: "Microsoft YaHei UI"
            font.weight: 200
            anchors.left: txt1.right
            anchors.leftMargin: 25
        }
        Text {
            id: txt3
            text: "专辑"
            color: "#7B7E8D"
            font.pixelSize: 13
            font.family: "Microsoft YaHei UI"
            font.weight: 200
            anchors.left: txt2.right
            anchors.leftMargin: 350
        }
        Text {
            id: txt4
            text: "喜欢"
            color: "#7B7E8D"
            font.pixelSize: 13
            font.family: "Microsoft YaHei UI"
            font.weight: 200
            anchors.left: txt3.right
            anchors.leftMargin: 210
        }
        Text {
            id: txt5
            text: "时长"
            color: "#7B7E8D"
            font.pixelSize: 13
            font.family: "Microsoft YaHei UI"
            font.weight: 200
            anchors.left: txt4.right
            anchors.leftMargin: 30
        }
    }

    Rectangle{
        width: 770
        height: 1
        radius: 10
        color: "#E7E8E7"
        anchors.top: musicsort.bottom
        anchors.topMargin: 3
        anchors.left: musicsort.left
        anchors.leftMargin: 42
    }

    // MusicPlay{
    //     id:player
    // }
    MusicInfo{
        id:reader
        onChangedata: {
            musicmodel.clear()
            let data=reader.loaddata()
            for(let i=0;i<data.length;i++){
                musicmodel.append(data[i])
            }
        }
        Component.onCompleted: {
            musicmodel.clear()
            let data=reader.loaddata()
            for(let i=0;i<data.length;i++){
                musicmodel.append(data[i])
            }
        }
    }
    ListModel{
        id:musicmodel
        ListElement{
            title:""
            author:""
            album:""
            listime:""
            localpath:""
        }
    }

    ListView{
        anchors.top: musicsort.bottom
        anchors.topMargin: 8
        anchors.left: musicsort.left
        anchors.leftMargin: 30
        width: parent.width-30
        height: parent.height-musicsort.y-musicsort.height-20
        spacing: 10
        model: musicmodel
        clip: true

        add: Transition{
            NumberAnimation{
                property: "y"
                duration: 500
                easing.type: Easing.OutCubic
            }
            NumberAnimation{
                property: "opacity"
                from:0
                to:1
                easing.type: Easing.OutCubic
            }
        }
        removeDisplaced:Transition {
            NumberAnimation{
                property: "y"
                duration: 500
                easing.type: Easing.OutCubic
            }
        }
        remove: Transition{
            NumberAnimation{
                property: "y"
                duration: 500
                easing.type: Easing.OutCubic
            }
            NumberAnimation{
                property: "opacity"
                from:1
                to:0
                easing.type: Easing.OutCubic
            }
        }

        ScrollBar.vertical: ScrollBar{
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            anchors.right: parent.right
            anchors.rightMargin: 0
            width: 10
            policy: ScrollBar.AlwaysOn
            z:3
            contentItem: Rectangle{
                visible: parent.active
                implicitWidth:10
                radius: 10
                color: "#E2E2E8"
            }
            background: Rectangle{
                color: "transparent"
                radius:10
            }
        }

        delegate: Rectangle{
            width: 780
            height: 53
            color:"transparent"
            radius: 7
            opacity: 1
            ButtonHover {
                src: "qrc:/Resrc/Icon/30.png"
                anchors.left: parent.left
                anchors.leftMargin: 20
                anchors.verticalCenter: parent.verticalCenter
                scale: 0.8
                z:1
                onClicked: {
                    player.playmusic(model.localpath)
                    Config.played()
                }
            }
            Text {
                text: model.title===""?"未知":model.title
                anchors.left: parent.left
                anchors.leftMargin: 103
                anchors.top: parent.top
                anchors.topMargin: 6
                font.pixelSize: 14
                font.family: "Microsoft YaHei UI"
                color:"#FF3A3A"
                font.weight: 400
            }
            Rectangle{
                anchors.left: parent.left
                anchors.leftMargin: 103
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 9
                width: 25
                height: 13
                color: "transparent"
                border.color: "#DCB469"
                border.width: 0.8
                radius: 2
                Label {
                    anchors.left: parent.left
                    anchors.bottom: parent.bottom
                    anchors.leftMargin: 3
                    anchors.bottomMargin: 1
                    text:"原声"
                    color:"#DCB469"
                    font.weight: 200
                    font.pixelSize: 9
                    font.family: "Microsoft YaHei UI"
                }
            }
            Label {
                text: model.author===""?"未知":model.author
                anchors.left: parent.left
                anchors.leftMargin: 134
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 6
                font.pixelSize: 14
                font.family: "Microsoft YaHei UI"
                color:"#FF3A3A"
                font.weight: 400
            }
            Label {
                text: model.album===""?"未知":model.album
                anchors.verticalCenter: parent.verticalCenter
                anchors.right: parent.right
                anchors.rightMargin: 145
                color:"#51596B"
                font.pixelSize: 14
                font.family: "Microsoft YaHei UI"
                font.weight: 400
                elide: Text.ElideRight
                width: 210
            }
            CheckBox{
                anchors.verticalCenter: parent.verticalCenter
                anchors.right: parent.right
                anchors.rightMargin: 91
                width: 17
                height: 17
                onCheckedChanged:{
                    reader.deletedate(model.localpath)
                    musicmodel.remove(index, 1)
                }
                z:1
                indicator: Rectangle{
                    anchors.fill: parent
                    radius: 4
                    color: "transparent"
                    border.color: "#7B8290"
                    border.width: 1
                    Rectangle{
                        anchors.top:parent.top
                        anchors.left: parent.left
                        anchors.topMargin: 3.5
                        anchors.leftMargin: 3.5
                        color:"#FD3D4E"
                        width: 10
                        height: 10
                        scale:1
                        radius: 2
                        Behavior on scale {
                            NumberAnimation{
                                duration: 500
                                easing.type: Easing.OutBack
                            }
                        }
                    }
                }
            }
            Label {
                text: model.listime
                anchors.verticalCenter: parent.verticalCenter
                anchors.right: parent.right
                anchors.rightMargin: 18
                color:"#8F939F"
                font.pixelSize: 14
                font.family: "Microsoft YaHei UI"
                font.weight: 400
            }
            MouseArea{
                anchors.fill: parent
                hoverEnabled: true
                onEntered: {
                    parent.color="white"
                }
                onExited: {
                    parent.color="transparent"
                }
            }
        }
    }
}
