import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.3
ApplicationWindow {
    id: window
    property int mWindow_WIDTH: 1200 // 变量可以在其他程序块里使用， 原本属性， 当需要恢复到原始属性时
    property int mWindow_HEIGHT: 800
    property string mFONT_FAMILY: "微软雅黑" // 全局变量
    width: mWindow_WIDTH
    height: mWindow_HEIGHT

    visible: true // false: invisible of the window
    title: qsTr("Demo Cloud Music Player")



    ColumnLayout{
        anchors.fill: parent // when full screen, then the size changed according to the size of screen
        spacing:0  // ColumnLayout的边距
        // top part
        LayoutHeaderView{
            id:layoutHeaderView
        }

        // middle part

       PageHomeVIew{
            id: pageHomeView
       }

        // bottom tool bar

        LayoutBottomView{
            id: layoutBottomView
        }
    }

}
