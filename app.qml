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

        // bottom tool bar
        Rectangle{
            Layout.fillWidth: true //保证长度和layout的长度一致
            height: 60
            color: "#00AAAA"

            RowLayout{
                anchors.fill: parent
                Item { // 只是用来占位的
                    Layout.preferredWidth: parent.width/10
                    //Layout.fillHeight: true
                    Layout.fillWidth: true // 可伸缩，解决屏幕大小变化时工具栏大小的变化

                }
                Button{
                    Layout.preferredWidth:50
                    icon.width:32
                    icon.height: 32
                    icon.source: "qrc:/images/previous.png"
                }
                Button{
                    Layout.preferredWidth:50
                    icon.width:32
                    icon.height: 32
                    icon.source: "qrc:/images/stop.png"
                }
                Button{
                    Layout.preferredWidth:50
                    icon.width:32
                    icon.height: 32
                    icon.source: "qrc:/images/next.png"
                }
                Item { // 只是用来占位的
                    Layout.preferredWidth: parent.width/2
                    Layout.fillHeight: true
                    Layout.topMargin: 25
                    Text {
                        id: nameText
                        //mix layout. and anchors. , maybe problem occurs
                        anchors.left: slider.left
                        anchors.bottom: slider.top
                        //anchors.bottomMargin: 5 //Layout.bottomargin文字出头， 和slider不对齐
                        anchors.leftMargin: 5
                        text: "周杰伦-稻香"
                        font.family: "微软雅黑"
                        color: "#ffffff"
                    }
                    Text {
                        id: timeText
                        anchors.right: slider.right
                        anchors.bottom: slider.top
                        //anchors.bottomMargin: 5
                        anchors.rightMargin: 5
                        text: "00:00/05:30"
                        font.family: "微软雅黑"
                        color: "#ffffff"
                    }
                    Slider{
                        id: slider

                        width: parent.width
                        Layout.fillWidth: true
                        height: 25
                        background: Rectangle{
                            x: slider.leftPadding
                            y: slider.topPadding+(slider.availableHeight-height)/2

                            width: slider.availableWidth
                            height:4
                            radius:2
                            color: "#e9f4ff"
                            Rectangle{
                                width:slider.visualPosition*parent.width
                                height: parent.height
                                color: "#73a7ab"
                                radius:2
                            }
                        }
                        handle: Rectangle{
                            width:15
                            height:15
                           radius:5 // 只有前三句话，滑块无法居中，无法拖动， 需要x,y定位
                           x: slider.leftPadding +(slider.availableWidth-width)*slider.visualPosition
                           y: slider.topPadding+(slider.availableHeight-height)/2
                           color: "#f0f0f0"
                           border.color: "#73a7ab" //边界颜色
                           border.width: 0.5

                        }

                    }

                }
                Button{
                    Layout.preferredWidth:50
                    icon.width:32
                    icon.height: 32
                    icon.source: "qrc:/images/favorite.png"
                }

                Button{
                    Layout.preferredWidth:50
                    icon.width:32
                    icon.height: 32
                    icon.source: "qrc:/images/repeat.png"
                }

                Item { // 只是用来占位的
                    Layout.preferredWidth: parent.width/10
                    //Layout.fillHeight: true
                    Layout.fillWidth: true

                }

            }

        }
    }

}
