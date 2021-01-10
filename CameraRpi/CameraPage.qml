import QtQuick 2.0
import QtMultimedia 5.12

Item
{
    Camera
    {
        id: camera

        viewfinder
        {
            resolution: Qt.size(640, 480)
            maximumFrameRate: 15
        }

        imageCapture
        {
            id: cameracapture
            onImageCaptured:
            {
                photoPreview.visible = true;
                photoPreview.source = preview;
                timerPreview.restart();
            }
        }

    }

    VideoOutput
    {
        id: videoOut
        source: camera
        anchors.fill: parent
        fillMode: VideoOutput.PreserveAspectCrop
    }

    Image
    {
        id: photoPreview
        anchors.fill: parent
        fillMode: Image.PreserveAspectCrop
    }

    Timer
    {
        id: timerPreview
        interval: 2000
        onTriggered:
        {
            photoPreview.visible = false;
        }
    }

    Image
    {
        id: shutterButton
        anchors.top: parent.top
        anchors.topMargin: 20
        anchors.right: parent.right
        anchors.rightMargin: 20
        source: "qrc:images/circle-64.png"

        MouseArea
        {
            anchors.fill: parent
            onClicked:
            {
                camera.imageCapture.capture();
            }
        }
    }

    Image
    {
        id: galleryButton
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 20
        anchors.right: parent.right
        anchors.rightMargin: 20
        source: "qrc:images/images-64.png"

        MouseArea
        {
            anchors.fill: parent
            onClicked:
            {
                rootPage.reqGalleryPage();
            }
        }
    }




}
