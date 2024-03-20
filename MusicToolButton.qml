import QtQuick 2.12
import QtQuick.Controls 2.5

ToolButton{
    id: self
    property string iconSource: ""
     property string toolTip: ""

    // 能否被选中，选中的话则保持这种状态
    property bool isCheckable: false
    property bool isChecked: false


    icon.source:iconSource


    ToolTip.visible: hovered //悬停
    ToolTip.text: toolTip

    background: Rectangle{
        color: self.down||(isCheckable && self.checked)?"#eeeeee":"#00000000" // 是否被按下，如果被按下，则是true， 没被按下，是false

    }

    icon.color: self.down||(isCheckable && self.checked)?"#00000000":"#eeeeee"

    checkable: isCheckable
    checked: isChecked



}

