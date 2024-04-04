import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.3
import MyUtils 1.0
ApplicationWindow {
    id: window
    property int mWindow_WIDTH: 1200 // 变量可以在其他程序块里使用， 原本属性， 当需要恢复到原始属性时
    property int mWindow_HEIGHT: 800
    property string mFONT_FAMILY: "微软雅黑" // 全局变量
    width: mWindow_WIDTH
    height: mWindow_HEIGHT

    visible: true // false: invisible of the window
    title: qsTr("Demo Cloud Music Player")

    HttpUtils{
        id: http
    }

    Component.onCompleted: {
        textHttp()
    }
    function textHttp(){
        function onReply(reply){
            console.log(reply) //打印
            http.onReplySignal.disconnect(onReply)//断开连接
        }

        http.onReplySignal.connect(onReply) // 绑定.h里的RePlaySignal
        http.conNet("banner")
    }

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

/*网络请求qml提供了网络服务， 但是对本地环境有一定的要求，可以用c++来完成，然后完成c++和qml的通信*/
