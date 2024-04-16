// MusicBannerView.qml
import QtQuick 2.12
import QtQuick.Controls 2.5
//轮播图，对图片的显示
Frame {  // 可以不用item， item时，显示不全， 用frame， frame默认带边框和内边距
    //id: bannerView
    // 参数，使外部可以传进来
    property int current: 0
    property var bannerList: []

    MusicRoundImage{
        id: leftImage
        width: parent.width*0.6
        height: parent.height*0.8
        anchors{
            left: parent.left
            bottom: parent.bottom
            bottomMargin: 20
        }

        imgSrc: getLeftImageSrc()

    }

    MusicRoundImage{
        id: certerImage
        width: parent.width*0.6
        height: parent.height
        z:2 // z给2，其他两个图片不给z值，则中间图片位于其他两个图片上面
        anchors.centerIn: parent
        imgSrc: getCenterImageSrc()

    }

    MusicRoundImage{
        id: rightImage
        width: parent.width*0.6
        height: parent.height*0.8
        anchors{
            right: parent.right
            bottom: parent.bottom
            bottomMargin: 20
        }
        imgSrc: getRightImageSrc()

    }

    function getLeftImageSrc(){
        // console.log(bannerList.length?bannerList[(current-1+bannerList.length)%bannerList.length].imageUrl:"")
        return bannerList.length?bannerList[(current-1+bannerList.length)%bannerList.length].imageUrl:""  //数组在js里为-1是有问题的,用这种方式实现了循环的过程
        //bannerList[(current-1+bannerList.length)%bannerList.length]只拿到对象属于，而无法访问器属性，用。操作
    }

    function getCenterImageSrc(){
        return bannerList.length?bannerList[current].imageUrl:"" // bannerList长度大于0时，则可以拿到图片的资源，为0是，会返回false，则返回""
    }

    function getRightImageSrc(){
        return bannerList.length?bannerList[(current+1+bannerList.length)%bannerList.length].imageUrl:""
    }
}

