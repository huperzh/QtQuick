import QtQuick 2.0

Rectangle {
    width: 240; height: 230

    ListModel {
        id: nameModel
        ListElement { file: "../images/rocket.svg"
                      name: "rocket" }
        ListElement { file: "../images/clear.svg"
                      name: "clear" }
        ListElement { file: "../images/arrow.svg"
                      name: "arrow" }
        ListElement { file: "../images/book.svg"
                      name: "book" }
    }

    Component {
        id: nameDelegate
        Column {
            Image {
                id: delegateImage
                anchors.horizontalCenter: delegateText.horizontalCenter
                source: file; width: 64; height: 64; smooth: true
                fillMode: Image.PreserveAspectFit
            }
            Text {
                id: delegateText
                text: name; font.pixelSize: 24
            }
        }
    }

    GridView {
        anchors.fill: parent
        anchors.margins: 20
        model: nameModel
        delegate: nameDelegate
        focus: true
        clip: true
        header: Rectangle {
            width: parent.width; height: 10
            color: "pink"
        }
        footer: Rectangle {
            width: parent.width; height: 10
            color: "lightblue"
        }
        highlight: Rectangle {
            width: parent.width
            color: "lightblue"; opacity: 0.5
        }
        Image {
            anchors.fill: parent
            source: "images/background.png"
            fillMode: Image.Tile
            z: -1
        }
    }
}
