import QtQuick 2.15
import QtQuick.Controls 2.15
import Qt5Compat.GraphicalEffects
import "qrc:/resources/"

Button{
    id: btnTopBar

    //CUSTOM PROPERTIES
    property url btnIconSource: "qrc:/resources/chevron-down.svg"
    property color btnColorDefault: "#1c1d20"
    property color btnColorMouseOver:"#23272E"
    property color btnColorClicked:"#00a1f1"
    property color btnColorBorder:"transparent"
    property color iconColor:"white"
    property int radiusValue: 0


    QtObject{
        id: internal

        // MOUSE OVER AND CLICK CHANGE COLOR
        property var dynamicColor: if(btnTopBar.down){
                                       btnTopBar.down ? btnColorClicked : btnColorDefault
                                   } else {
                                       btnTopBar.hovered ? btnColorMouseOver : btnColorDefault
                                   }
    }

    height: 35
    width: 35

    background: Rectangle{
        id: bgBtn
        color: internal.dynamicColor
        radius: radiusValue
        border.width: btnColorBorder !== 'transparent' ? 1 : 0
        border.color: btnColorBorder
    }

    contentItem: Item{
        id: content
        Image {
            id: iconBtn
            source: btnIconSource
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
            height:16
            width: 16
            fillMode: Image.PreserveAspectFit
            visible: true
            antialiasing: false

        }

        ColorOverlay{
            source: iconBtn
            color: iconColor
            anchors.fill: iconBtn
            antialiasing: false
            width: iconBtn.width
            height: iconBtn.height
        }


        //            ColorOverlay{
        //                anchors.fill: iconBtn
        //                source: iconBtn
        //                color: "#ffffff"
        //                antialiasing: false
        //            }

    }
}
/*##^##
Designer {
    D{i:0;height:35;width:35}
}
##^##*/
