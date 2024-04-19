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
            // Model'e ekle
            numbersModel.append({number: randomNumber});
            // En alta kaydır
            flickable.contentY += scrollView.contentHeight;
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
                // Başlatılırsa ScrollView'i en alta kaydır
                if (timer.running) {
                    flickable.contentY = flickable.contentHeight - flickable.height;
                }
            }
        }

        Flickable {
            id: flickable
            width: parent.width
            height: parent.height - button.height
            contentWidth: scrollView.width
            contentHeight: scrollView.contentHeight
            flickableDirection: Flickable.VerticalFlick

            ScrollView {
                id: scrollView
                width: flickable.width
                Layout.fillHeight: true

                Repeater {
                    id: repeater
                    model: numbersModel // Model'i Repeater'a bağla
                    delegate: Text {
                        text: model.number // Model verisini göster
                        font.pixelSize: 16
                        color: "black"
                    }
                }
            }
        }
    }

    ListModel {
        id: numbersModel
    }
}
