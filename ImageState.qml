import QtQuick 2.0
import QtQuick.Controls 2.14
import QtQuick.Dialogs 1.0

Item {
   id: _root

   property string name
   property string image

   width: 100
   height: 150

   Rectangle {
       anchors.fill: parent
       color: "blue"
       radius: 10
       border.width: 5
       border.color: "yellow"
       gradient: Gradient.NightFade

       Label {
           id: _header

           anchors.top: parent.top
           anchors.topMargin: 20
           anchors.left: parent.left
           anchors.leftMargin: 5
           text: _root.name
       }

       Image {
           id: name

           anchors.top: _header.bottom
           anchors.fill: parent
           source: _root.image

           fillMode: Image.PreserveAspectFit
           opacity: 1
       }
   }

   MouseArea {
       id: _ImageStateMauseArea

       anchors.fill: _root

       onDoubleClicked: {
           _fileDialog.visible = true;
       }

       onClicked: {
           _toolTip.visible = true;
       }
   }

   ToolTip {
       id: _toolTip
       visible: false
       text: "Double click for load image"
       timeout: Qt.styleHints.mousePressAndHoldInterval
   }

   FileDialog {
       id: _fileDialog
       title: "Please choose a file"
       folder: shortcuts.home
       onAccepted: {
           _originalImage.image = _fileDialog.fileUrl;
           _loadFile.text = _fileDialog.fileUrl
       }
   }
}
