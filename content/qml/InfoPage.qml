import QtQuick 2.15
import QtQuick.Controls 2.15
import "./controls"
import QtQuick.Controls.Universal 2.12


ApplicationWindow {
    id: infoWindow
    visible: false
    width: 320
    height: 310

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
                source: "../images/includio_logo3.png"
                anchors.topMargin: 5
                anchors.leftMargin: 5
                anchors.bottomMargin: 5
                fillMode: Image.PreserveAspectFit
            }

            Text {
                id: titleLabel
                color: "#e6e6e6"
                text: qsTr("sobre includ.IO")
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
                btnIconSource: "../../images/svg_icons/close.svg"
                onClicked: infoWindow.close()
            }

        }

        Image {
            id: logoApp
            width: 60
            height: 50
            anchors{
                top: parent.top
                topMargin: 60
                left: parent.left
                leftMargin: 10
            }
            source: "../images/includio_logo3.png"
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
            spacing: 15

            Text{
                color: 'white'
                text: "includ.IO 1.0.0"
                height: 15
                font.bold: true
                font.pointSize: 10
            }

            Text{
                color: 'white'
                text: "desenvolvido por Gabriel Machado"
                height: 15
                font.pointSize: 10
            }

            Text{
                color: 'white'
                text: "distribuição permitida"
                height: 15
                font.pointSize: 10
            }

            Text{
                color: 'white'
                text: "instruções:"
                height: 15
                font.bold: true
                font.pointSize: 10
            }

            Text{
                color: 'white'
                text: "1. selecione a pasta raíz dos dats (bd/dados)"
                height: 15
                font.pointSize: 8
            }

            Text{
                color: 'white'
                text: "2. digite a pasta que deseja add/excluir da raíz"
                height: 15
                font.pointSize: 8
            }

            Text{
                color: 'white'
                text: "3. seja feliz!"
                height: 15
                font.pointSize: 8
            }

            Text{
                color: 'white'
                text: "obs.: o app não apaga a pasta, apenas remove \n o #include"
                height: 15
                font.pointSize: 8
            }


        }
    }
}
