import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.3
import QtQml 2.12

RowLayout{
    spacing: 0
    // 定义一个数组属性，包含每个菜单项的图标、文本和对应的QML视图页面
    property var qmlList: [
        {icon: "recommend-white", value: "推荐内容", qml: "DetailRecommendPageView"},
        {icon: "cloud-white", value: "搜索音乐", qml: "DetailSearchPageView"},
        {icon: "local-white", value: "本地音乐", qml: "DetailLocalPageView"},
        {icon: "history-white", value: "播放历史", qml: "DetailHistoryPageView"},
        {icon: "favorite-big-white", value: "我喜欢的", qml: "DetailFavoritePageView"},
        // {icon: "video-white", value: "专辑&歌单", qml: "DetailPlayListPageView"},
    ]
    Frame { // 使用Frame作为根元素，创建一个框架，用于包含整个侧边菜单的内容和布局



        Layout.preferredWidth: 200 // 设置框架的首选宽度为200像素
        Layout.fillHeight: true // 设置框架填充其父容器的高度

        // 设置框架的背景，这里是一个颜色为#f0f0f0的矩形
        background: Rectangle{
            color:"#aa00AAAA"
        }

        padding: 0 // 设置框架的内边距为0

        ColumnLayout{
            anchors.fill: parent
            Item{
                Layout.fillWidth: true
                Layout.preferredHeight: 150
                MusicRoundImage{
                    borderRadius: 100
                    anchors.centerIn: parent
                    height: 100
                    width: 100

                }
            }

            ListView{ // 使用ListView展示菜单项
                id: menuView
                height: parent.height
                Layout.fillHeight: true
                Layout.fillWidth: true
                model: ListModel{ // 动态填充ListView的内容
                    id: menuViewModel
                }
                delegate: menuViewDelegate // 使用自定义的delegate来定义如何展示每个菜单项
                highlight: Rectangle{
                    color: "#aa73a7ab"
                }
                highlightMoveDuration: 0
                highlightResizeDuration: 0
            }
        }
        Component{ // 定义ListView的delegate，即每个菜单项的视觉表示
            id: menuViewDelegate
            Rectangle{
                id: menuViewDelegateItem
                height: 50
                width: 200
                color: "#aa00AAAA"

                RowLayout{ // 使用RowLayout来组织每个菜单项的图标和文本
                    Item {
                        width: 30
                    }
                    anchors.fill: parent
                    anchors.centerIn: parent
                    spacing: 15
                    Image{
                        source: "qrc:/images/" + icon // 设置图标源
                        Layout.preferredHeight: 20
                        Layout.preferredWidth: 20
                    }

                    Text{
                        text: value // 设置文本内容
                        Layout.fillWidth: true
                        height: 50
                        font.family: window.mFONT_FAMILY
                        font.pointSize: 12
                        color: "#ffffff"
                    }
                }

                MouseArea{
                    anchors.fill: parent
                    hoverEnabled: true
                    onEntered: {

                        color= "#aa73a7ab"
                    }
                    onExited: {
                        color= "#aa00AAAA"
                    }
                    onClicked: {
                        repeater.itemAt(menuViewDelegateItem.ListView.view.currentIndex).visible = false
                        menuViewDelegateItem.ListView.view.currentIndex = index
                        var loader = repeater.itemAt(index)
                        loader.visible = true
                        loader.source = qmlList[index].qml +".qml"

                    }
                }
            }
        }

        Component.onCompleted: {
            menuViewModel.append(qmlList) // 在组件加载完成后，将qmlList数组中的数据添加到menuViewModel中
            var loader = repeater.itemAt(0)
            loader.visible = true
            loader.source = qmlList[0].qml +".qml"
        }

    }

    Repeater{ // 重复显示子组件
        id: repeater
        model: qmlList.length
        Loader{  // also can use strike to display it
            visible: false
            Layout.fillWidth: true
            Layout.fillHeight: true
        }

    }


}


