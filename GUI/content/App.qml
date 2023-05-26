// Copyright (C) 2021 The Qt Company Ltd.
// SPDX-License-Identifier: LicenseRef-Qt-Commercial OR GPL-3.0

import QtQuick 6.4
import GUI


import QtQuick.Controls 2.12
import QtQuick.Controls.Universal 2.12

ApplicationWindow {
    id: mainWindow
    visible: true
    width: 400
    height: 500
    title: qsTr("Include Manager")
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
            height: 40
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
                                anchors.rightMargin: 105
                                anchors.leftMargin: 0
                                anchors.topMargin: 0

                                MouseArea{
                                    anchors{
                                        left: parent.left
                                        right: parent.right
                                        top: parent.top
                                        bottom: parent.bottom
                                    }
                                    onClicked: internal.maximizeRestore()
                                }

                                Image {
                                    id: iconApp
                                    width: 28
                                    anchors.left: parent.left
                                    anchors.top: parent.top
                                    anchors.bottom: parent.bottom
                                    #source: "images/svg_icons/WEG.png"
                                    anchors.topMargin: 0
                                    anchors.leftMargin: 5
                                    anchors.bottomMargin: 0
                                    fillMode: Image.PreserveAspectFit
                                }

                                Text {
                                    id: titleLabel
                                    color: "#e6e6e6"
                                    text: qsTr("Include Manager")
                                    anchors.left: iconApp.right
                                    anchors.right: parent.right
                                    anchors.top: parent.top
                                    anchors.bottom: parent.bottom
                                    verticalAlignment: Text.AlignVCenter
                                    font.pointSize: 10
                                    anchors.leftMargin: 5
                                }
                            }
        }

        Column {
            anchors.centerIn: parent

            RadioButton { text: qsTr("Small") }
            RadioButton { text: qsTr("Medium");  checked: true }
            RadioButton { text: qsTr("Large") }
            Button {
                text: qsTr("Button")
            }

        }
    }
}
