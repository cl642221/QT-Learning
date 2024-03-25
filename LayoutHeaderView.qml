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

            onClicked: {
              Qt.openUrlExternally("https://www.hyz.cool") // open an external website
            }


        }
        MusicToolButton{
            id:smallWindow
            iconSource: "qrc:/images/small-window.png"
            toolTip: "小窗播放"

            onClicked: {


                setWindowSize(400, 650)

                normalWindow.visible=true
                smallWindow.visible=false
            }



        }

        MusicToolButton{
            id:normalWindow
            iconSource: "qrc:/images/exit-small-window.png"
            toolTip: "退出小窗播放"
            visible:false
            /* 设置和退出小窗播放按钮功能实现，
                点击function， onClicked: ,
                重新设置窗口大小，
                定位窗口位置，
                设置按钮可见性
             */
            onClicked: {
                setWindowSize()
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
            id: maxWindow
            iconSource: "qrc:/images/full-screen"
            toolTip: "全屏" // need an button to exit the fullscreen
            //visible: true

            onClicked:{
                window.visibility = Window.Maximized
                maxWindow.visible = false
                resize.visible = true
            }

        }

        /* bug，退出全屏之后无法全屏 */
        MusicToolButton{
            id: resize
            iconSource: "qrc:/images/small-screen"
            toolTip: "退出全屏" // need an button to exit the fullscreen
            visible: false
            onClicked:{
                setWindowSize()
                maxWindow.visible = true
                resize.visible = false

            }
        }

        MusicToolButton{
           iconSource: "qrc:/images/power"
           toolTip: "退出"


        }

        /* bug, 最小化之后程序隐藏，没办法找到并重新最大化*/
        MusicToolButton{
            iconSource: "qrc:/images/minimize-screen"
            toolTip: "最小化"

            onClicked: {
                window.hide()
            }

        }

    }

    function setWindowSize(width= window.mWindow_WIDTH, height=window.mWindow_HEIGHT) { //顺便定义了初始值width= window.mWindow_WIDTH

        window.height =height
        window.width = width
        window.x = (Screen.width-window.width )/2
        window.y = (Screen.height-window.height )/2

    }
}
