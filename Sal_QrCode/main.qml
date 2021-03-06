import QtQuick 2.12
import QtQuick.Controls 2.3
import QtQuick.Layouts 1.3
import QtQuick.Controls.Material 2.12
import QZXing 2.3


ApplicationWindow {
    id: applicationWindow

    property alias app_toolbar: app_toolbar
    property alias applicationWindow: applicationWindow
    property alias reader: reader
    property alias wrl: wrl
    property alias list: list
    property alias resim2: resim2

    title: qsTr("ŞAL Karekod")
    visible: true
    width: 480
    height: 640

    Start {
           id: start

           Timer {
               id: timer
               interval: 3000
               repeat: false
               running: true
               onTriggered: {
                   start.visible = false
                   app_toolbar.visible = true
                   qrcode_button.visible = true
                   list_button.visible = true
               }
           }
       }



    header: ToolBar {
        id: app_toolbar
        visible: false
        ToolButton {

            Image {
                id: back_tool
                source: "qrc:/media/icon_resim/back.png"
                anchors.fill: parent
            }

            onClicked: {
                if (reader.a.visible == true) {
                    reader.a.visible = false
                }
                if (list.list_page.visible == true) {
                    list.list_page.visible = false
                }
                if (wrl.wrl_page.visible == true ) {
                    wrl.wrl_page.visible = false
                    list.list_page.visible = true
                }
                if (resim2.agac2.visible == true ) {
                    resim2.agac2.visible = false
                    wrl.wrl_page.visible = true
                }

            }

        }

        ToolButton {
            id:toolb1

            anchors.right :parent.right
            Image {
                id: close_tool
                source: "qrc:/media/icon_resim/close.png"
                anchors.fill: parent
            }
            onClicked: {
                Qt.quit()
            }
        }

    }

    Button {
        visible: false
        id:qrcode_button

        width: parent.width / 3.6
        height: parent.height / 5
        anchors.horizontalCenter:  parent.horizontalCenter
        anchors.bottom: parent.verticalCenter

        text: "QR Code"
        onClicked : {

            reader.a.visible = true


        }
    }

    Button {
        visible: false
        id:list_button

        y:( qrcode_button.y + qrcode_button.height ) +20

        anchors.horizontalCenter:  parent.horizontalCenter

        width: qrcode_button.width
        height: qrcode_button.height

        text:"Listele"

        onClicked : {

            list.list_page.visible = true
        }
    }

    Reader {
        id: reader

    }
    List {
        id: list
    }
    Wrl {
        id: wrl
    }
    Resim2 {
        id: resim2
    }

}
