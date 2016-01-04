import QtQuick 2.5
import QtQuick.Controls 1.2
import QtQuick.Dialogs 1.0

import CrossWord 1.0
import DataFile 1.0


ApplicationWindow {
    id: myApplication
    visible: true
    width: 640
    height: 480
    title: qsTr("CrossWord")

    DataFile {
        id: dataFile
        objectName: "dataFile"
        filename: "<unset>"
    }

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
                    objectName: "optionsList"
                    id: optionsList
                    model: ListModel {
                        objectName: "optionsListModel"
                        id: optionsListModel
                        ListElement {
                            name: "ZACCHEUS"; pcolor: "black"
                        }
                        ListElement {
                            name: "MATTHIAS"; pcolor: "blue"
                        }
                        ListElement {
                            name: "BARNABUS"; pcolor: "green"
                        }
                    }
                    function append(newElement) {
                        optionsListModel.append(newElement)
                    }
                    delegate: Component {
                        Item {
                            anchors.left: parent.left; anchors.right: parent.right
                            height: 16
                            Column {
                                Text { text: name; color: pcolor }
                            }
                            MouseArea {
                                anchors.fill: parent
                                onClicked: optionsList.currentIndex = index
                            }
                        }
                    }

                    highlight: Rectangle { color: "lightsteelblue"; radius: 5 }
                    onCurrentItemChanged: console.log(optionsListModel.get(optionsList.currentIndex).name + ' selected')
                    focus: false
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
            anchors.top: wordsToPlaceHeadingRect.bottom; anchors.bottom: deleteWordsButton.top
            anchors.leftMargin: 3

            ScrollView {
                anchors.fill: parent

                ListView {
                    objectName: "wordsList"
                    id: wordsList
                    model: ListModel {
                        objectName: "wordsListModel"
                        id: wordsListModel
                        ListElement {
                            word: "ZACCHEUS"; pcolor: "black"
                        }
                        ListElement {
                            word: "MATTHIAS"; pcolor: "blue"
                        }
                        ListElement {
                            word: "BARNABUS"; pcolor: "green"
                        }
                    }
                    function append(newElement) {
                        wordsListModel.append(newElement)
                    }
                    function deleteWord() {
                        wordsListModel.remove(currentIndex)
                    }
                    function addWord(newWord) {
                        wordsListModel.append({"word":newWord, "pcolor":"black"})
                    }

                    delegate: Component {
                        Item {
                            anchors.left: parent.left; anchors.right: parent.right
                            height: 16
                            Column {
                                Text { text: word; color: pcolor }
                            }
                            MouseArea {
                                anchors.fill: parent
                                onClicked: wordsList.currentIndex = index
                            }
                        }
                    }

                    highlight: Rectangle { color: "lightsteelblue"; radius: 5 }
                    onCurrentItemChanged: console.log(wordsListModel.get(wordsList.currentIndex).word + ' selected')
                    focus: true
                }
            }
        }

        Button {
            id: deleteWordsButton
            text: qsTr("Delete")
            anchors.left: parent.left; anchors.right: parent.right;
            anchors.bottom: addRect.top
            anchors.leftMargin: 3
            height: 20
            onClicked: wordsList.deleteWord();
        }
        Rectangle {
            id: addRect
            anchors.left: parent.left; anchors.right: parent.right
            anchors.bottom: parent.bottom
            height: 24
            border.width: 2
            border.color: "steelblue"
            color: "steelblue"
            Label {
                id: addLabel
                anchors.left: parent.left; anchors.bottom: parent.bottom
                anchors.leftMargin: 3
                text: qsTr("Add:")
                width: 30
                color: "white"
            }
            TextInput {
                id: addWordsInput
                anchors.left: addLabel.right; anchors.right: parent.right
                anchors.bottom: parent.bottom
                anchors.leftMargin: 3
                onAccepted: wordsList.addWord(text)
            }
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
                        objectName: "acrossList"
                        id: acrossList
                        model: ListModel {
                            objectName: "acrossListModel"
                            id: acrossListModel
                            ListElement {
                                word: "MATTHIAS"; pcolor: "blue"
                            }
                        }
                        function append(newElement) {
                            acrossListModel.append(newElement)
                        }
                        function deleteWord() {
                            acrossListModel.remove(currentIndex)
                        }
                        function addWord(newWord) {
                            acrossListModel.append({"word":newWord, "pcolor":"black"})
                        }

                        delegate: Component {
                            Item {
                                anchors.left: parent.left; anchors.right: parent.right
                                height: 16
                                Column {
                                    Text { text: word; color: pcolor }
                                }
                                MouseArea {
                                    anchors.fill: parent
                                    onClicked: acrossList.currentIndex = index
                                }
                            }
                        }

                        highlight: Rectangle { color: "lightsteelblue"; radius: 5 }
                        onCurrentItemChanged: console.log(acrossListModel.get(acrossList.currentIndex).word + ' selected')
                        focus: false
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
                        objectName: "downList"
                        id: downList
                        model: ListModel {
                            objectName: "downListModel"
                            id: downListModel
                        }
                        function append(newElement) {
                            downListModel.append(newElement)
                        }
                        function deleteWord() {
                            downListModel.remove(currentIndex)
                        }
                        function addWord(newWord) {
                            downListModel.append({"word":newWord, "pcolor":"black"})
                        }

                        delegate: Component {
                            Item {
                                anchors.left: parent.left; anchors.right: parent.right
                                height: 16
                                Column {
                                    Text { text: word; color: pcolor }
                                }
                                MouseArea {
                                    anchors.fill: parent
                                    onClicked: downList.currentIndex = index
                                }
                            }
                        }

                        highlight: Rectangle { color: "lightsteelblue"; radius: 5 }
                        onCurrentItemChanged: console.log(downListModel.get(downList.currentIndex).word + ' selected')
                        focus: false
                    }
                }
            }
        }
    }
}

