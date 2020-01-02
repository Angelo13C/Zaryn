import QtQuick 2.14
import QtQuick.Window 2.14

import "authentication_section"

Window {
    visible: true

    width: 1000; height: 600
    minimumWidth: 1000; minimumHeight: 600

    title: "Zaryn"

    Item                 //Sections manager
    {
        id: _sectionsID
        anchors.fill: parent

        //Default section is the AuthenticationSection
        state: "AuthenticationSection"
        states: [
            State { name: "AuthenticationSection" }
        ]

        Loader  //Dynamically load the AuthenticationSection
        {
            active: parent.state == "AuthenticationSection"

            sourceComponent:
                AuthenticationSection    //Authentication section
                {

                }

            anchors.fill: parent
        }
    }
}
