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
        ToolButton{

            icon.source: "qrc:/images/music"
            width: 32
            height:32

        }
        ToolButton{
            icon.source: "qrc:/images/about"
            width: 32
            height:32

        }
        ToolButton{
            icon.source: "qrc:/images/small-screen.png"
            width: 32
            height:32

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
            }
        }
        ToolButton{
            icon.source: "qrc:/images/full-screen"
            width: 32
            height:32

        }
        ToolButton{
            icon.source: "qrc:/images/power"
            width: 32
            height:32

        }
        ToolButton{
            icon.source: "qrc:/images/minimize-screen"
            width: 32
            height:32

        }

    }
}
