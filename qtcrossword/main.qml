import QtQuick 2.5
import QtQuick.Controls 1.2
import QtQuick.Dialogs 1.0


ApplicationWindow {
    id: myApplication
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")

    menuBar: MenuBar {
        Menu {
            title: qsTr("File")
            MenuItem {
                text: qsTr("&Open")
                onTriggered: fileDialog.open(); //console.log("Open action triggered");
            }
            MenuItem {
                text: qsTr("Exit")
                onTriggered: Qt.quit();
            }
        }
    }

    FileDialog {
        id: fileDialog
        title: "Please choose a file"
        folder: shortcuts.home
        onAccepted: {
            console.log("You chose: " + fileDialog.fileUrls)
        }
        onRejected: {
            console.log("Canceled")
        }
    }

    Rectangle {
        id: grid
        width: parent.width*0.75; height: parent.height*0.70
        color: "white"
        border.width: 1
        border.color: "steelblue"
    }


    ListModel {
        id: listModel
        ListElement {
            word: "ZACCHEAUS"
        }
        ListElement {
            word: "JAMESANDJOHN"
        }
        ListElement {
            word: "REVELATION"
        }
        ListElement {
            word: "CORINTHIANS"
        }
        ListElement {
            word: "EPHESIANS"
        }
        ListElement {
            word: "TIMOTHY"
        }
        ListElement {
            word: "SILVANUS"
        }
        ListElement {
            word: "JONATHAN"
        }
        ListElement {
            word: "MATTHIAS"
        }
        ListElement {
            word: "APOLLOS"
        }
        ListElement {
            word: "REPENTANCE"
        }
        ListElement {
            word: "CHARITY"
        }
        ListElement {
            word: "HOLYSPIRIT"
        }
    }


    Rectangle {
        id: rightSideBar
        anchors.left: grid.right; anchors.right: parent.right
        anchors.top: parent.top; anchors.bottom: parent.bottom

        color: "steelblue"

        Rectangle {
            id: optionsHeadingRect
            anchors.left: parent.left; anchors.right: parent.right; anchors.top: parent.top
            anchors.leftMargin: 3
            height: 20
            border.width: 1
            border.color: "steelblue"
            Label {
                id: topoptionsHeading
                anchors.left: parent.left; anchors.right: parent.right; anchors.top: parent.top
                anchors.centerIn: parent
                text: qsTr("Options")
            }
        }

        Rectangle {
            id: optionsRect

            anchors.left: parent.left; anchors.right: parent.right
            anchors.top: optionsHeadingRect.bottom
            anchors.leftMargin: 3

            height: parent.height*0.5


            ScrollView {
                anchors.left: parent.left; anchors.right: parent.right
                anchors.top: parent.top; anchors.bottom: parent.bottom

                ListView {
                    id: optionsList
                    model: ListModel {
                        id: optionsListModel
                        ListElement {
                            word: "ZACCHEAUS"
                        }
                        ListElement {
                            word: "JAMESANDJOHN"
                        }
                        ListElement {
                            word: "REVELATION"
                        }
                        ListElement {
                            word: "CORINTHIANS"
                        }
                        ListElement {
                            word: "EPHESIANS"
                        }
                        ListElement {
                            word: "TIMOTHY"
                        }
                        ListElement {
                            word: "SILVANUS"
                        }
                        ListElement {
                            word: "JONATHAN"
                        }
                        ListElement {
                            word: "MATTHIAS"
                        }
                        ListElement {
                            word: "APOLLOS"
                        }
                        ListElement {
                            word: "REPENTANCE"
                        }
                        ListElement {
                            word: "CHARITY"
                        }
                        ListElement {
                            word: "HOLYSPIRIT"
                        }
                    }
                    delegate: Component {
                        Item {
                            anchors.left: parent.left; anchors.right: parent.right
                            height: 16
                            Column {
                                Text { text: word }
                            }
                            MouseArea {
                                anchors.fill: parent
                                onClicked: optionsList.currentIndex = index
                            }
                        }
                    }

                    highlight: Rectangle { color: "lightsteelblue"; radius: 5 }
                    onCurrentItemChanged: console.log(optionsListModel.get(optionsList.currentIndex).word + ' selected')
                    focus: true
                }
            }
        }

        Rectangle {
            id: wordsToPlaceHeadingRect
            anchors.left:parent.left; anchors.right: parent.right
            anchors.top: optionsRect.bottom
            anchors.leftMargin: 3
            height: 20
            border.width: 1
            border.color: "steelblue"
            Label {
                id: wordsToPlaceHeading
                anchors.centerIn: parent
                text: qsTr("Words to place")
            }
        }


        Rectangle {
            id: wordsToPlaceRect

            anchors.left: parent.left; anchors.right: parent.right
            anchors.top: wordsToPlaceHeadingRect.bottom; anchors.bottom: addWordsButton.top
            anchors.leftMargin: 3

            ScrollView {
                anchors.left: parent.left; anchors.right: parent.right;
                anchors.top: parent.top; anchors.bottom: parent.bottom

                ListView {
                    model: listModel
                    delegate: Text {
                        text: word
                    }
                }
            }
        }

        Button {
            id: addWordsButton
            text: qsTr("Add Words")
            anchors.left: parent.left; anchors.right: parent.right;
            anchors.bottom: parent.bottom
            anchors.leftMargin: 3
            height: 20
            onClicked: console.log("Button Pressed.");
        }
    }

    Rectangle {
        id: bottomBar
        anchors.left: parent.left; anchors.right: rightSideBar.left
        anchors.top: grid.bottom; anchors.bottom: parent.bottom

        Rectangle {
            id: acrossWords
            anchors.left: parent.left
            width: parent.width*0.5
            anchors.top: parent.top; anchors.bottom: parent.bottom
            color: "steelblue"
            Rectangle {
                id: acrossWordsHeadingRect
                anchors.left: parent.left; anchors.right: parent.right
                anchors.top: parent.top
                anchors.leftMargin: 3
                height: 20
                border.width: 1
                border.color: "steelblue"
                Label {
                    id: acrossWordsHeading
                    anchors.centerIn: parent
                    text: qsTr("Across")
                }
            }

            Rectangle {
                id: acrossWordsRect

                anchors.left: parent.left; anchors.right: parent.right
                anchors.top: acrossWordsHeadingRect.bottom; anchors.bottom: parent.bottom
                anchors.leftMargin: 3
                ScrollView {
                    anchors.left: parent.left; anchors.right: parent.right
                    anchors.top: parent.top; anchors.bottom: parent.bottom

                    ListView {
                        model: listModel
                        delegate: Text {
                            text: word
                        }
                    }
                }
            }
        }

        Rectangle {
            id: downWords
            anchors.left: acrossWords.right; anchors.right: parent.right
            anchors.top: parent.top; anchors.bottom: parent.bottom
            color: "steelblue"

            Rectangle {
                id: downWordsHeadingRect
                anchors.left: parent.left; anchors.right: parent.right
                anchors.top: parent.top
                anchors.leftMargin: 3
                height: 20
                border.width: 1
                border.color: "steelblue"
                Label {
                    id: downWordsHeading
                    anchors.centerIn: parent
                    text: qsTr("Down")
                }
            }

            Rectangle {
                id: downWordsRect

                anchors.left: parent.left; anchors.right: parent.right
                anchors.top: downWordsHeadingRect.bottom; anchors.bottom: parent.bottom
                anchors.leftMargin: 3
                ScrollView {
                    anchors.left: parent.left; anchors.right: parent.right
                    anchors.top: parent.top; anchors.bottom: parent.bottom

                    ListView {
                        model: listModel
                        delegate: Text {
                            text: word
                        }
                    }
                }
            }
        }
    }
}

