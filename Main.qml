import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import QtQuick.Window 2.15

Window {
    visible: true
    width: 300
    height: 400
    title: "Number Flow"

    ListModel {
        id: numbersModel
    }

    Timer {
        id: timer
        interval: 500 // Her 0.5 saniyede bir
        running: false
        repeat: true

        onTriggered: {
            // Rastgele bir sayı üret
            var randomNumber = Math.floor(Math.random() * 20) + 1;
            console.log("Random number:", randomNumber); // Eklendi
            // ScrollView'e ekle
            column.addItem({number: randomNumber});
            // En alta kaydır
            scrollView.contentItem.children[0].y += scrollView.contentHeight;
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
                    scrollView.contentItem.children[0].y += scrollView.contentHeight;
                }
            }
        }

        ScrollView {
            id: scrollView
            Layout.fillHeight: true
            Layout.fillWidth: true

            Repeater {
                model: numbersModel // Değişiklik yapıldı
                delegate: Text {
                    text: modelData.number // Sıradaki model verisini göster
                    font.pixelSize: 16
                    color: "black"
                }
            }
        }
    }
}
