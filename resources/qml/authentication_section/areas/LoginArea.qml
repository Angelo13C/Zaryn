import QtQuick 2.14
import QtQuick.Controls 2.14

import "../"

Item {
    id: _rootID

    //When the user presses forgottenPassword
    signal forgottenPassword()
    //When the user presses register
    signal registration()

    Column
    {
        anchors.centerIn: parent
        spacing: 100

        Text    //LOGIN INTO YOUR ACCOUNT header
        {
            text: qsTr("LOGIN INTO YOUR ACCOUNT")

            font
            {
                pointSize: 20
                bold: true
            }
        }

        Column
        {
            spacing: 15
            anchors.horizontalCenter: parent.horizontalCenter

            TextFieldAuthentication       //Email TextField
            {
                id: _emailTextFieldID
                _type: TextFieldAuthentication.Type.Email
            }

            Column
            {
                spacing: 10

                TextFieldAuthentication       //Password TextField
                {
                    id: _passwordTextFieldID
                    _type: TextFieldAuthentication.Type.Password
                }

                Text        //Forgotten password button
                {
                    text: qsTr("Forgotten password?")

                    font
                    {
                        pointSize: 12
                        underline: _mouseAreaID.containsMouse
                    }

                    color: "#9B9B9B"

                    MouseArea   //Detect mouse / touch click on the Text
                    {
                        id: _mouseAreaID
                        //How the cursor looks if is hover this area
                        cursorShape: Qt.PointingHandCursor
                        //Contains mouse is true also if button not clicked
                        hoverEnabled: true

                        anchors.fill: parent

                        onPressed: _rootID.forgottenPassword()
                    }
                }
            }
        }

        Column       //Login/Register buttons
        {
            spacing: 10
            anchors.horizontalCenter: parent.horizontalCenter

            ButtonAuthentication    //Login button
            {
                _type: ButtonAuthentication.Type.Login
                _filling: ButtonAuthentication.Filling.Filled

                onClicked: _rootID.login()
            }

            ButtonAuthentication    //Registration button
            {
                _type: ButtonAuthentication.Type.Registration
                _filling: ButtonAuthentication.Filling.Unfilled

                onClicked: _rootID.registration()
            }
        }
    }

    //Try to login
    function login()
    {
        var email = _emailTextFieldID._text
        var password = _passwordTextFieldID._text

        var errorEmail = ErrorHandler.validateEmail(email)
        var errorPassword = ErrorHandler.validatePassword(password)

        _emailTextFieldID.showError(errorEmail)
        _passwordTextFieldID.showError(errorPassword)

        if(errorEmail !== "" || errorPassword !== "")
        {
            _emailTextFieldID._text = ""
            _passwordTextFieldID._text = ""
        }
    }
}

/*##^##
Designer {
    D{i:0;autoSize:true;height:480;width:640}
}
##^##*/
