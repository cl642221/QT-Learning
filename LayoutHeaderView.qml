import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.3


ToolBar{
    id: top_Bar
    background: Rectangle{
        color: "#00AAAA"
    }

    width: parent.width
    Layout.fillWidth: true // flexible adjustment of height and width
    RowLayout{

        anchors.fill: parent
        //spacing: 4
        MusicToolButton{

            iconSource: "qrc:/images/music"
            toolTip:"当前播放"


        }
        MusicToolButton{
            iconSource: "qrc:/images/about"
            toolTip: "关于"


        }
        MusicToolButton{
            id:smallWindow
            iconSource: "qrc:/images/small-window.png"
            toolTip: "小窗播放"

            onClicked: {
                window.height = 650
                window.width = 400
                window.x = (Screen.width-window.width )/2
                window.y = (Screen.height-window.height )/2
                normalWindow.visible=true
                smallWindow.visible=false
            }



        }

        MusicToolButton{
            id:normalWindow
            iconSource: "qrc:/images/exit-small-window.png"
            toolTip: "退出小窗播放"
            visible:false

            onClicked: {
                window.height = window.mWindow_HEIGHT
                window.width = window.mWindow_WIDTH
                window.x = (Screen.width-window.width)/2
                window.y = (Screen.height-window.height )/2
                normalWindow.visible=false
                smallWindow.visible=true
            }



        }
        // 弹性布局，，可以填充满剩下的部分，把前面的icon挤到开始处
        Item {
            Layout.fillWidth: true
            height: 32
            Text {
                anchors.centerIn: parent
                text: qsTr("Music +")
                font.bold: true
                font.pointSize: 24
                font.family: "Arial"
                color: "#ffffff"
            }
        }
        MusicToolButton{
            iconSource: "qrc:/images/full-screen"
            toolTip: "全屏"


        }
        MusicToolButton{
           iconSource: "qrc:/images/power"
           toolTip: "退出"


        }
        MusicToolButton{
            iconSource: "qrc:/images/minimize-screen"
            toolTip: "最小化"


        }

    }
}
