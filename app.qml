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
        anchors.fill: parent
        spacing:0  // ColumnLayout的边距
        ToolBar{
            id: top_Bar
            background: Rectangle{
                color: "#00000000"
            }

            width: parent.width
            Layout.fillWidth: true
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
                        text: qsTr("Invandus")
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
        // middle part

        Frame {
            Layout.preferredWidth: 200
            //Layout.fillWidth: true
            Layout.fillHeight: true
            background: Rectangle{
                color:"#f0f0f0"
            }

            padding: 0 // frame的内边距为0

        }

        // bottom part
        Rectangle{
            Layout.fillWidth: true //保证长度和layout的长度一致
            height: 60
            color: "#00AAAA"
        }
    }

}
