import QtQuick 2.0
import Qt.labs.folderlistmodel 2.12

Item
{
    property string path: "file:///home/pi/Pictures/"

    GridView
    {
        id: gridView
        anchors.fill:parent
        anchors.margins: 4
        clip: true
        cellWidth: 198
        cellHeight: 149

        FolderListModel
        {
            id: folderModel
            showDirs: false
            folder: path
            nameFilters: [ "*.png", "*.jpg" ]
        }

        model: folderModel
        delegate: delegateGridImage

        Component
        {
            id: delegateGridImage

            Item
            {
                width: 196
                height: 147

                Image
                {
                    anchors.fill: parent
                    source: path + fileName
                    asynchronous: true
                }

                Text
                {
                    id: imgFileName
                    text: fileName
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.bottom: parent.bottom
                    anchors.bottomMargin: 5
                    color: "green"
                }

                MouseArea // Add a MouseArea in each element that hide the gallery and show the selected picture
                {
                    anchors.fill: parent
                    onClicked:
                    {
                        imagePreview.source = path + fileName
                        gridView.visible = false
                        backToCamera.visible = false
                        backToGallery.visible = true
                    }
                }

            }
        }

    }

    Image
    {
        id: imagePreview
        visible: !gridView.visible
        anchors.fill: parent
    }

    Image
    {
        id: backToCamera
        anchors.top: parent.top
        anchors.topMargin: 20
        anchors.right: parent.right
        anchors.rightMargin: 20
        source: "qrc:images/camera-64.png"

        MouseArea
        {
            anchors.fill: parent
            onClicked:
            {
                rootPage.reqCameraPage();
            }
        }
    }

    Image
    {
        id: backToGallery
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 20
        anchors.right: parent.right
        anchors.rightMargin: 20
        source: "qrc:images/back-64.png"
        visible: false

        MouseArea
        {
            anchors.fill: parent
            onClicked:
            {
                backToGallery.visible = false;
                backToCamera.visible = true;
                gridView.visible = true;
            }
        }
    }







}
