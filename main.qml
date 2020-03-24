import QtQuick 2.12
import QtQuick.Controls 2.5

ApplicationWindow {
    id: _root
    visible: true
    width: 640
    height: 480
    title: qsTr("Image Render")

    ImageState {
        id: _originalImage

        anchors.centerIn: _canvas
        z: 2
        name: "Original image"
    }

    Canvas {
        id: _canvas

        anchors.fill: parent

        property int lastX: 0
        property int lastY: 0

        function clear() {
            var context = getContext("2d");
            context.reset();
            _canvas.requestPaint();
        }

        MouseArea {
            id: _mouseArea
            anchors.fill: parent

            onPressed: {
                _canvas.lastX = mouseX;
                _canvas.lastY = mouseY;
            }

            onPositionChanged: {
                _canvas.requestPaint();
            }
        }

        onPaint: {
            var context = getContext("2d");
            context.beginPath();
            context.moveTo(_canvas.lastX, _canvas.lastY);
            _canvas.lastX = _mouseArea.mouseX;
            _canvas.lastY = _mouseArea.mouseY;
            context.lineTo(_canvas.lastX, _canvas.lastY);
            context.stroke();
        }
    }
}
