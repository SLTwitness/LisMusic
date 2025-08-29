pragma Singleton
import QtQuick

QtObject {
    signal blankclick();    //空白区域点击

    signal startlogin();    //登录窗口

    signal opencolordialog()    //颜色选择

    readonly property string fontfmy: "Microsoft YaHei UI"

    property color musicclrup: "#E1C474"
    property color musicclrdown: "#FFFED5"
    property color musicclrborder: "#FFEF89"
    property color musicclrup1: "#EEEEEE"
    property color musicclrdown1: "#EEEEEE"
    property color musicclrborder1: "#FCC0C0"
    property bool showmusicplay:true

    property var stackstate: [] //行为栈

    property var leftindex: [0]  //记录左侧index
    signal changepage();

    signal tomymusic();     //压栈我的音乐
    signal tomusicshow();   //压栈主页

    signal played();    //音乐播放
}
