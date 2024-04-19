import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import QtQuick.Window 2.15

Window {
    visible: true
    width: 300
    height: 400
    title: "Number Flow"

    Timer {
        id: timer
        interval: 500 // Her 0.5 saniyede bir
        running: false
        repeat: true

        onTriggered: {
            // Rastgele bir sayı üret
            var randomNumber = Math.floor(Math.random() * 20) + 1;
            console.log("Random number:", randomNumber); // Eklendi

            var count = 1;
            if (numbersModel.count > 0 && numbersModel.get(numbersModel.count - 1).number === randomNumber) {
                count = numbersModel.get(numbersModel.count - 1).count + 1;
                numbersModel.setProperty(numbersModel.count - 1, "count", count);
            } else {
                numbersModel.append({number: randomNumber, count: 1});
            }

            // En alta kaydır
            scrollView.contentY = scrollView.contentHeight - scrollView.height;
        }
    }

    ColumnLayout {
        id: columnLayout
        anchors.fill: parent
        spacing: 5

        Button {
            text: timer.running ? "Stop" : "Start"
            onClicked: {
                timer.running = !timer.running;
            }
        }

        ScrollView {
            id: scrollView
            Layout.fillHeight: true
            Layout.fillWidth: true

            Column {
                Repeater {
                    id: repeater
                    model: numbersModel // Model'i Repeater'a bağla
                    delegate: RowLayout {
                        spacing: 5
                        Text {
                            text: model.number
                            font.pixelSize: 16
                            color: "black"
                        }
                        Text {
                            text: "x" + model.count
                            font.pixelSize: 16
                            color: "black"
                        }
                    }
                }
            }
        }
    }

    ListModel {
        id: numbersModel
    }
}
