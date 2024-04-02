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
            onClicked: {
                // 弹窗
                aboutPop.open()
            }



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
                window.visibility = Window.Maximized //退出全屏时没有如果重新设置window.visibility,则会出现无法重新全屏的bug
                //setWindowSize(Screen.width, Screen.height) // /* bug: 这种方式让最上面的原始toolbar超出屏幕尺寸范围*/
                maxWindow.visible = false
                resize.visible = true
            }

        }

        /* !已解决bug，退出全屏之后无法全屏 */
        MusicToolButton{
            id: resize
            iconSource: "qrc:/images/small-screen"
            toolTip: "退出全屏" // need an button to exit the fullscreen
            visible: false // 当visible为false时，按钮不会占位
            onClicked:{
                /*
                    setWindowSize()
                    window.visibility = Window.AutomaticVisibility
                    这两句调换顺序的话，会出现bug，在小窗情况下全屏，
                    再退出全屏，会回到初始窗口大小，而不是小窗
                    ！！！！！！！逻辑暂时无法理解
                */
                setWindowSize()
                window.visibility = Window.AutomaticVisibility
                /*etting the window's visibility to AutomaticVisibility means the window's visibility state is automatically managed.
This typically depends on the window's current state or the application's state, such as responding to being minimized, maximized, or restored.
If you change the window size after setting it to AutomaticVisibility, there's a possibility that this new size is not properly registered as the "restore" size for when the window exits fullscreen mode.
Instead, the window management system might revert the window to the size it had when AutomaticVisibility was first applied, ignoring subsequent size adjustments.*/


                maxWindow.visible = true
                resize.visible = false

            }
        }

        MusicToolButton{
            iconSource: "qrc:/images/power"
            toolTip: "退出"
            onClicked: {
                Qt.quit() // 关闭程序
            }


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
    //弹窗
    Popup{

        id: aboutPop
        //        topInset: 0
        //        leftInset: -2
        //        rightInset: 0
        //        bottomInset: 0
        parent: Overlay.overlay //下面的示例使用附加的 Overlay.overlay 属性将弹出窗口定位在窗口中央，而不考虑打开弹出窗口的按钮的位置
        x: (parent.width -width)/2
        y: (parent.height -height)/2

        width: 250
        height: 230

        background: Rectangle{
            color: "#e9f4ff"
            radius:5
            border.color:"#2273a7ab"
        }

        contentItem: ColumnLayout{
            width: parent.width
            height: parent.height

            Layout.alignment: Qt.AlignHCenter
            Image{
                Layout.preferredHeight: 60
                fillMode: Image.PreserveAspectFit
                Layout.fillWidth: true /*没有加这句话之前，图片和文字不在弹窗中心， 文字不能占位，加上这句，用图片占位使图片和文字置于中心位置*/
                source: "qrc:/images/music"

            }
            Text{
                text: qsTr("Music +")
                Layout.fillWidth: true
                horizontalAlignment: Text.AlignHCenter
                font.pixelSize: 18
                color: "#8573a7ab"
                font.family: "微软雅黑"
                font.bold: true
            }

            Text{
                text: qsTr("这是我的Cloud Music Player")
                Layout.fillWidth: true
                horizontalAlignment: Text.AlignHCenter
                font.pixelSize: 16
                color: "#8573a7ab"
                font.family: "微软雅黑"
                font.bold: true
            }

            Text{
                text: qsTr("www.hzy.cool")
                Layout.fillWidth: true
                horizontalAlignment: Text.AlignHCenter
                font.pixelSize: 18
                color: "#8573a7ab"
                font.family: "微软雅黑"
                font.bold: true
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
