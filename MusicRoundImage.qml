import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.3
import QtGraphicalEffects 1.0

//自定义圆角图片
Item {
    property string imgSrc: "qrc:/images/player.jpg" //初始值，默认值，可以改变

    property int borderRadius: 5
    Image{
        id: image
        anchors.centerIn: parent
        source: imgSrc
        smooth: true
        visible: false
        width: parent.width
        height: parent.height
        fillMode: Image.PreserveAspectCrop
        antialiasing: true

    }
    Rectangle{
        id: mask
        color: "black"
        anchors.fill: parent
        radius: borderRadius
        visible: false
        smooth: true
        antialiasing: true
    }

    OpacityMask{
        anchors.fill: image
        source: image
        maskSource: mask
        visible: true
        antialiasing: true
    }
}
