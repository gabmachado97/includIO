// Copyright (C) 2021 The Qt Company Ltd.
// SPDX-License-Identifier: LicenseRef-Qt-Commercial OR GPL-3.0

import QtQuick 6.4
import GUI
import QtQuick.Dialogs
import "qml/controls"
import "qml"
import QtQuick.Controls 2.12
import QtQuick.Controls.Universal 2.12

ApplicationWindow {
    id: mainWindow
    visible: true
    width: 400
    height: 500
    title: qsTr("includ.IO")
    Universal.theme: Universal.Dark
    Universal.accent: Universal.Violet

    //REMOVE TITLE BAR
    flags: Qt.Window | Qt.FramelessWindowHint


    Rectangle {
        id: background
        color: "transparent"
        border.color: "#383e4c"
        border.width: 1
        anchors.fill: parent



        Rectangle {
            id: topBar
            height: 35
            color: "#1c1d20"
            anchors{
                left: parent.left
                right: parent.right
                top: parent.top
            }
            DragHandler {
                onActiveChanged: if(active){
                                     mainWindow.startSystemMove()
                                 }
            }

            Rectangle {
                id: titleBar
                width: 200
                height: 35
                color: "#00ffffff"
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: parent.top
                anchors.rightMargin: 0
                anchors.leftMargin: 0
                anchors.topMargin: 0

                //                MouseArea{
                //                    anchors{
                //                        left: parent.left
                //                        right: parent.right
                //                        top: parent.top
                //                        bottom: parent.bottom
                //                    }
                //                    onClicked: internal.maximizeRestore()
                //                }

                Image {
                    id: iconApp
                    width: 28
                    anchors.left: parent.left
                    anchors.top: parent.top
                    anchors.bottom: parent.bottom
                    source: "./images/includio_logo3.png"
                    anchors.topMargin: 5
                    anchors.leftMargin: 5
                    anchors.bottomMargin: 5
                    fillMode: Image.PreserveAspectFit
                }

                Text {
                    id: titleLabel
                    color: "#e6e6e6"
                    text: qsTr("includ.IO")
                    anchors.left: iconApp.right
                    anchors.right: parent.right
                    anchors.top: parent.top
                    anchors.bottom: parent.bottom
                    verticalAlignment: Text.AlignVCenter
                    font.pointSize: 10
                    anchors.leftMargin: 5
                }

                Row {
                    id: rowBtns
                    x: 1690
                    y: 0
                    width: 105
                    height: 35
                    anchors.right: parent.right
                    anchors.top: parent.top
                    anchors.rightMargin: 0
                    anchors.topMargin: 0

                    TopBarBtn{
                        id: btnMinimize
                        onClicked: mainWindow.showMinimized()

                    }

//                    TopBarBtn {
//                        id: btnMaximizeRestore
//                        btnIconSource: "./images/svg_icons/maximize.svg"
//                        onClicked: internal.maximizeRestore()
//                    }

                    TopBarBtn {
                        id: btnClose
                        btnColorClicked: "#ff007f"
                        btnIconSource: "./images/svg_icons/close.svg"
                        onClicked: mainWindow.close()
                    }
                }
            }
        }
        Rectangle {
            id: titleBg
            width: 100
            height: 60
            color: "transparent"
            anchors{
                left: parent.left
                top: topBar.bottom
            }

            Text{
                id: title1
                text: 'includ.'
                color: 'white'
                font.pointSize: 16
                anchors.fill: parent
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignRight
            }

            Text{
                text: 'IO'
                color: 'white'
                font.pointSize: 16
                anchors.left: title1.right
                height: parent.height
                verticalAlignment: Text.AlignVCenter
                font.bold: true
            }

            Canvas{
                anchors{
                    left: parent.left
                    top: parent.top
                }
                width: parent.width + 40
                height: parent.height - 10
                onPaint: {
                    var ctx = getContext("2d")
                    ctx.strokeStyle = "#AA00FF"
                    ctx.lineWidth = 2
                    ctx.beginPath()
                    ctx.moveTo(0, height)
                    ctx.lineTo(width, height)
                    ctx.stroke()
                }
            }
            Canvas{
                anchors{
                    left: parent.left
                    top: parent.top
                }
                width: parent.width + 40
                height: parent.height - 10
                onPaint: {
                    var ctx = getContext("2d")
                    ctx.strokeStyle = "#AA00FF"
                    ctx.lineWidth = 2
                    ctx.beginPath()
                    ctx.moveTo(width, height-20)
                    ctx.lineTo(width, height)
                    ctx.stroke()
                }
            }

        }


        Rectangle{
            color: 'transparent'
            anchors{
                left: parent.left
                right: parent.right
                bottom: parent.bottom
                top: titleBg.bottom
            }


            Column {
                anchors.fill: parent
                anchors.topMargin: 10
                spacing: 10

                Row{
                    height: 30
                    width: 350
                    anchors{
                        horizontalCenter: parent.horizontalCenter
                    }
                    spacing: 10

                    Rectangle{
                        width: 100
                        height: 30
                        color: 'transparent'
                        Text{
                            color: "white"
                            anchors.fill: parent
                            text: "tipo:"
                            //font.bold: true
                            font.pointSize: 12
                            verticalAlignment: Text.AlignVCenter
                            horizontalAlignment: Text.AlignRight
                        }
                    }
                    Rectangle{
                        width: 80
                        height: 30
                        color: 'transparent'
                        RadioButton { id: add ; text: qsTr("add") ; checked: true; onClicked: remove.checked=false}
                    }
                    Rectangle{
                        width: 50
                        height: 30
                        color: 'transparent'
                        RadioButton { id: remove ; text: qsTr("remover"); onClicked: add.checked=false }
                    }
                }

                Row{
                    height: 30
                    width: 350
                    spacing: 10
                    anchors{
                        horizontalCenter: parent.horizontalCenter
                    }

                    Rectangle{
                        width: 100
                        height: 30
                        color: 'transparent'
                        Text{
                            color: "white"
                            anchors.fill: parent
                            text: "root path:"
                            //font.bold: true
                            font.pointSize: 12
                            verticalAlignment: Text.AlignVCenter
                            horizontalAlignment: Text.AlignRight
                        }
                    }

                    Rectangle{
                        width: 230
                        height: 30
                        color: 'transparent'
                        TextField{
                            id: rootPath
                            anchors.fill: parent
                            text: "busque/insira a pasta raíz da base"
                            horizontalAlignment: Text.AlignLeft
                            verticalAlignment: Text.AlignVCenter
                            font.pointSize: 10
                            color: 'white'
                            background: Rectangle{
                                width: parent.width
                                radius: 5
                                border.width: 1
                                border.color: '#383a42'
                                color: "#18191d"
                            }
                        }

                        TopBarBtn {
                            id: btnFilePicker1
                            anchors.left: parent.right
                            height: parent.height
                            width: 30
                            radiusValue: 5
                            btnColorBorder: '#383a42'
                            btnIconSource: "./images/svg_icons/file.svg"
                            onClicked: folderDialog.open()
                        }
                    }
                }


                Row{
                    height: 30
                    width: 350
                    spacing: 10
                    anchors{
                        horizontalCenter: parent.horizontalCenter
                    }

                    Rectangle{
                        width: 100
                        height: 30
                        color: 'transparent'
                        Text{
                            color: "white"
                            anchors.fill: parent
                            text: "pasta include:"
                            //font.bold: true
                            font.pointSize: 12
                            verticalAlignment: Text.AlignVCenter
                            horizontalAlignment: Text.AlignRight
                        }
                    }

                    Rectangle{
                        width: 230
                        height: 30
                        color: 'transparent'
                        TextField{
                            id: folderName
                            anchors.fill: parent
                            text: "insira o nome da pasta de include"
                            horizontalAlignment: Text.AlignLeft
                            verticalAlignment: Text.AlignVCenter
                            font.pointSize: 10
                            color: 'white'
                            background: Rectangle{
                                width: parent.width
                                radius: 5
                                border.width: 1
                                border.color: '#383a42'
                                color: "#18191d"
                            }
                        }
                    }
                }

                Button{
                    id: btnExecute
                    text: "executar"
                    anchors{
                        horizontalCenter: parent.horizontalCenter
                    }

                }
            }
        }


        Rectangle {
            id: botBar
            height: 35
            color: "#171917"
            anchors{
                left: parent.left
                right: parent.right
                bottom: parent.bottom
            }

            Row{
                TopBarBtn {
                    btnIconSource: "./images/svg_icons/info.svg"
                    onClicked: infoPage.show()
                }
                TopBarBtn {
                    btnIconSource: "./images/svg_icons/mail.svg"
                    onClicked: contactPage.show()
                }
                Text{
                    color: 'white'
                    height: 35
                    text: '   desenvolvido por Gabriel Machado'
                    verticalAlignment: Text.AlignVCenter
                    font.pointSize: 8
                }
            }

            DescBtn{
                anchors.right: parent.right
                text: "doar"
                btnIconSource: "./images/svg_icons/star.svg"
                font.bold: true
                font.pointSize: 10
                onClicked: { donatePage.show() }
            }
        }
    }


    FolderDialog {
        id: folderDialog
        title: "Selecione uma pasta"
        onAccepted: {
            rootPath.text = selectedFolder
        }
    }

    InfoPage{id: infoPage}
    ContactPage{id: contactPage}
    DonatePage{id: donatePage}

    //    Popup {
    //            id: popupInfo
    //            width: 200
    //            height: 300
    //            x: 30
    //            y: 50
    //            modal: false
    //            focus: true
    //            background: null
    //            //closePolicy: Popup.CloseOnEscape | Popup.CloseOnPressOutside
    //            contentItem: InfoPage{
    //                anchors.fill: parent;
    //                onClosePopup: popupInfo.close()
    //            }
    //    }
}
