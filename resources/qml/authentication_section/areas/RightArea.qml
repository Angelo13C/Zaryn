import QtQuick 2.0

Rectangle   //Background
{
    color: "#006CDF"

    Column
    {
        anchors.centerIn: parent
        spacing: 20

        Row     //Join other people
        {
            spacing: 30

            Image
            {
                source: "qrc:/IMAGES/images/authentication_section/right_area/group.svg"

                sourceSize: "50x50"
            }
            Text {
                text: qsTr("Join other people")
                color: "#FFFFFF"

                font
                {
                    pointSize: 20
                    bold: true
                }

                anchors.verticalCenter: parent.verticalCenter
            }
        }

        Row     //Keep your privacy
        {
            spacing: 30

            Image
            {
                source: "qrc:/IMAGES/images/authentication_section/right_area/padlock.svg"

                sourceSize: "50x50"
            }
            Text {
                text: qsTr("Keep your privacy")
                color: "#FFFFFF"

                font
                {
                    pointSize: 20
                    bold: true
                }

                anchors.verticalCenter: parent.verticalCenter
            }
        }
    }
}

/*##^##
Designer {
    D{i:0;autoSize:true;height:480;width:640}
}
##^##*/
