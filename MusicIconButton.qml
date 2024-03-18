import QtQuick 2.12
import QtQuick.Controls 2.5

Button{
    id: self
    property string iconSource: ""
     property string toolTip: ""
    property int iconWidth: 32
    property int iconHeight: 32
    // 能否被选中，选中的话则保持这种状态
    property bool isCheckable: false
    property bool isChecked: false


    icon.source:iconSource
    icon.width: iconWidth
    icon.height: iconHeight

    ToolTip.visible: hovered //悬停
    ToolTip.text: toolTip

    background: Rectangle{
        color: self.down||(isCheckable && self.checked)?"#497563":"#20e9f4ff" // 是否被按下，如果被按下，则是true， 没被按下，是false
        radius:3
    }

    icon.color: self.down||(isCheckable && self.checked)?"#ffffff":"#e2f0f8"

    checkable: isCheckable
    checked: isChecked



}

