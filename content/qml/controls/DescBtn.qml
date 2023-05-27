import QtQuick 2.15
import QtQuick.Controls 2.15
import Qt5Compat.GraphicalEffects

Button{
    id: btnLeftMenu
    text: qsTr("Description")
    font.pointSize: 9
    font.bold: false

    //CUSTOM PROPERTIES
    property url btnIconSource: "./images/svg_icons/star.svg"
    property color btnColorDefault: "#AA00FF"
    property color btnColorMouseOver:"#8a02cf"
    property color btnColorClicked:"#be02cf"
    property color iconColor:"white"
    property int iconWidth: 18
    property int iconHeight: 18

    QtObject{
        id: internal

        // MOUSE OVER AND CLICK CHANGE COLOR
        property var dynamicColor: if(btnLeftMenu.down){
                                       btnLeftMenu.down ? btnColorClicked : btnColorDefault
                                   } else {
                                       btnLeftMenu.hovered ? btnColorMouseOver : btnColorDefault
                                   }
    }

    implicitHeight: 35
    implicitWidth: 80

    background: Rectangle{
        id: bgBtn
        color: internal.dynamicColor
    }
    contentItem: Item{
        anchors.fill: parent
        id: content
        Image {
            id: iconBtn
            source: btnIconSource
            anchors.leftMargin: 10
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: parent.left
            sourceSize.width: iconWidth
            sourceSize.height: iconHeight
            height:iconWidth
            width:iconHeight
            fillMode: Image.PreserveAspectFit
            visible: true
            antialiasing: false

        }



        Text{
            color: "#ffffff"
            text: btnLeftMenu.text
            font: btnLeftMenu.font
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: iconBtn.right
            anchors.leftMargin: 10
        }

    }
}
