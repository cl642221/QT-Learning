// DetailRecommendPageView.qml
import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.3

ScrollView{
    clip: true // 当子元素超出范围时，进行自动裁剪
    ColumnLayout { //超出屏幕限制的内容无法滚动，无法显示， 可以先用scrollView
        Text {
            text: qsTr("推荐内容")
            font.family: window.mFONT_FAMILY
            font.pointSize: 18

        }

        MusicBannerView{
            id: bannerView
            Layout.preferredHeight: (window.width - 200)*0.3
            Layout.preferredWidth: (window.width - 200)
            Layout.fillHeight: true
            Layout.fillWidth: true
        }
    }

    Component.onCompleted: {
        getBannerList()
    }
    function getBannerList(){
        function onReply(reply){
            //console.log(reply) //打印
            http.onReplySignal.disconnect(onReply)//断开连接
            // 请求拿到的是对象数组，对象数组有很多属性，想要访问其中一个属性是， 需要用.操作
            var banners = JSON.parse(reply).banners // 将string类型转成json类型数据
            bannerView.bannerList = banners
        }

        http.onReplySignal.connect(onReply) // 绑定.h里的RePlaySignal
        http.conNet("banner")
    }
}


