import QtQuick 2.15
import QtQuick.Controls 2.15
import "qrc:/resources/"
import QtQuick.Controls.Universal 2.12

ApplicationWindow {
    id: infoWindow
    visible: false
    width: 320

    //REMOVE TITLE BAR
    flags: Qt.Window | Qt.FramelessWindowHint

    Rectangle{
        color: '#363636'
        anchors.fill: parent

        DragHandler {
            onActiveChanged: if(active){
                                 infoWindow.startSystemMove()
                             }
        }

        Rectangle {
            id: titleBar
            width: parent.width
            height: 35
            color: "#1c1d20"



            Image {
                id: iconApp
                width: 28
                anchors.left: parent.left
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                source: "qrc:/resources/logo3.png"
                anchors.topMargin: 5
                anchors.leftMargin: 5
                anchors.bottomMargin: 5
                fillMode: Image.PreserveAspectFit
            }

            Text {
                id: titleLabel
                color: "#e6e6e6"
                text: qsTr("contato")
                anchors.left: iconApp.right
                anchors.right: parent.right
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                verticalAlignment: Text.AlignVCenter
                font.pointSize: 10
                anchors.leftMargin: 5
            }


            TopBarBtn {
                id: btnClose
                anchors.right: parent.right
                btnColorClicked: "#ff007f"
                btnIconSource: "qrc:/resources/close.svg"
                onClicked: infoWindow.close()
            }

        }

        Image {
            id: logoApp
            width: 40
            height: 40
            anchors{
                top: parent.top
                topMargin: 60
                left: parent.left
                leftMargin: 10
            }
            source: "qrc:/resources/mail.svg"
            fillMode: Image.PreserveAspectFit
        }

        Column{
            anchors{
                top: parent.top
                topMargin: 60
                left: parent.left
                leftMargin: 70
                right: parent.right
                bottom: parent.bottom
            }
            spacing: 8

            Text{
                color: 'white'
                text: "para sugestões/ideias/orçamentos/etc"
                height: 15
                font.bold: true
                font.pointSize: 10
            }

            Text{
                color: 'white'
                text: " contatar:"
                height: 15
                font.bold: true
                font.pointSize: 10
            }


            TextEdit {
                readOnly: true
                color: 'white'
                text: 'email: gabriel.heat97@gmail.com'
                height: 15
                font.pointSize: 10
                selectByMouse: true
            }


            Text {
                text: '<html><style type="text/css"></style><a href="https://github.com/gabmachado97">GitHub</a></html>'
                onLinkActivated: Qt.openUrlExternally(link)
                height: 15
                font.pointSize: 10
            }




        }
    }
}
