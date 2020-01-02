import QtQuick 2.14
import QtQuick.Layouts 1.14
import QtGraphicalEffects 1.14

import "areas"

Item {
    width: 800

    RowLayout
    {
        anchors.fill: parent

        Rectangle
        {
            Layout.fillHeight: true
            Layout.minimumWidth: 500
            //40% of the width of the application
            Layout.preferredWidth: parent.width * 0.4

            StackLayout           //Areas manager
            {
                id: _areasManagerID
                anchors.fill: parent

                LoginArea    //LoginArea
                {

                }

                RegistrationArea    //RegistrationArea
                {

                }


                OpacityAnimator
                {
                    id: _dullingAnimationID
                    target: _areasManagerID
                    from: 1; to: 0
                    duration: 200
                    //When the animation end, change the area and start the other animation
                    onFinished:
                    {
                        _areasManagerID.currentIndex = !_areasManagerID.currentIndex
                        _undullingAnimationID.start()
                    }
                }
                OpacityAnimator
                {
                    id: _undullingAnimationID
                    target: _areasManagerID
                    from: 0; to: 1
                    duration: 200
                }
            }
        }

        RightArea
        {
            Layout.fillHeight: true
            Layout.fillWidth: true
        }
    }
}
