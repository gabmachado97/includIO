import QtQuick 2.15
import QtQuick.Controls 2.15
import "qrc:/resources/"
import QtQuick.Controls.Universal 2.12

ApplicationWindow {
    id: infoWindow
    visible: false
    width: 250
    height: 350

    //REMOVE TITLE BAR
    flags: Qt.Window | Qt.FramelessWindowHint

    Rectangle{
        color: 'black'
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
                text: qsTr("contribuição")
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

        Text{
            anchors{
                horizontalCenter: parent.horizontalCenter
                top: parent.top
                topMargin: 60
            }
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            color: 'white'
            text: "se o app é útil pra você, \n envie um PIX (qualquer valor) \n nos dados abaixo 😄"
            width: titleBar.width
            font.bold: true
            font.pointSize: 9
            textFormat: TextEdit.RichText
            wrapMode: Text.WordWrap
            font.family: "Segoe UI Emoji"
        }

        Image {
            id: qrcode
            width: 120
            height: 120
            anchors{
                horizontalCenter: parent.horizontalCenter
                verticalCenter: bgBottom.top
            }
            source: "qrc:/resources/qrcode.png"
            fillMode: Image.PreserveAspectFit
            z: 1
        }



        Rectangle{
            id: bgBottom
            color: 'white'
            anchors{
                top:parent.top
                topMargin: 170
                left: parent.left
                right: parent.right
                bottom: parent.bottom
            }
            z: 0


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
                    color: 'black'
                    text: "Nome: Gabriel Machado"
                    height: 15
                    font.bold: true
                    font.pointSize: 10
                }

                Text{
                    color: 'black'
                    text: "chave pix:"
                    height: 15
                    font.bold: true
                    font.pointSize: 10
                }


                TextEdit {
                    id: pixKey
                    readOnly: true
                    color: 'black'
                    text: '+5547997591885'
                    height: 15
                    font.pointSize: 10
                    selectByMouse: true

                    //                    TopBarBtn {
                    //                        id: btnCopy
                    //                        anchors.left: parent.right
                    //                        height: 20
                    //                        width: 30
                    //                        radiusValue: 5
                    //                        btnColorBorder: 'transparent'
                    //                        btnColorDefault: 'white'
                    //                        iconColor: 'black'
                    //                        btnColorMouseOver:"gray"
                    //                        btnIconSource: "../images/svg_icons/copy.svg"
                    //                        onClicked: {
                    //                            pixKey.copy()
                    //                        }

                    //                    }
                }

            }

        }
    }
}
