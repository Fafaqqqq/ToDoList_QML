import QtQuick 2.12
import QtQuick.Controls 2.5

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
            model: 20
            delegate: ItemDelegate {
                text: "Item " + (index + 1)
                width: listView.width
            }
        }
    }
}
