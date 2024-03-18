import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.3
ApplicationWindow {
    width: 1200
    height: 800
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
