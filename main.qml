import QtQuick 2.12
import QtQuick.Controls 2.12

ApplicationWindow {
    id: window
    width: 640
    height: 480
    visible: true
    title: qsTr("ToDoList")

    ScrollView {
        id: scroll
        width: 600
        height: 380
        x: 20
        y: 10
        ScrollBar.horizontal.policy: ScrollBar.AlwaysOff

        ListView {
            id: listView
            width: parent.width

            delegate: ItemDelegate {
                text: note
                width: 450
                height: 50

                CheckBox {
                    id: cBox
                    anchors.left: parent.right
                    width: 50
                }

                Button {
                    anchors.left: cBox.right
                    width: 100
                    text: "Remove"

                    onClicked: {
                        if (cBox.checkState == Qt.Checked) {
                            listModel.remove(index)
                        }
                    }
                }
            }

            model: ListModel {
                id: listModel
            }
        }
    }

    TextField {
        id: inputField
        placeholderText: qsTr("Enter the note")
        anchors.top: scroll.bottom
        anchors.topMargin: 35
        width: 490
        height: 50
        x : 20
    }

    Button {
        text: qsTr("Add")
        anchors.left: inputField.right
        anchors.leftMargin: 10
        anchors.top: scroll.bottom
        anchors.topMargin: 35
        width: 100
        height: 50

        onClicked: {
            if (inputField.text !== "") {
                listModel.append({note : inputField.text})
                inputField.text = ""
            }
        }
    }
}
