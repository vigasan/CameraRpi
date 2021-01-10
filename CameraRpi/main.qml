import QtQuick 2.12
import QtQuick.Window 2.12

Window
{
    id: rootPage
    visible: true
    width: 800
    height: 480

    signal reqCameraPage()
    signal reqGalleryPage()

    onReqCameraPage:
    {
        cameraPage.visible = true
        galleryPage.visible = false
    }

    onReqGalleryPage:
    {
        cameraPage.visible = false
        galleryPage.visible = true
    }

    // Application Pages
    CameraPage
    {
        id: cameraPage
        width: parent.width
        height: parent.height
        visible: true
    }

    GalleryPage
    {
        id: galleryPage
        width: parent.width
        height: parent.height
        visible: false
    }

}
