import QtQuick 2.14
import QtQuick.Controls 2.14

import "../"

Item {
    id: _rootID

    //When the user presses login
    signal login()

    Column
    {
        anchors.centerIn: parent
        spacing: 60

        Text    //REGISTER NOW YOUR ACCOUNT header
        {
            text: qsTr("REGISTER NOW YOUR ACCOUNT")

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

            TextFieldAuthentication       //Password TextField
            {
                id: _passwordTextFieldID
                _type: TextFieldAuthentication.Type.Password
            }

            TextFieldAuthentication       //Confirm Password TextField
            {
                id: _confirmPasswordTextFieldID
                _type: TextFieldAuthentication.Type.ConfirmPassword
            }

        }

        Column       //Login/Register buttons
        {
            spacing: 10
            anchors.horizontalCenter: parent.horizontalCenter

            ButtonAuthentication    //Registration button
            {
                _type: ButtonAuthentication.Type.Registration
                _filling: ButtonAuthentication.Filling.Filled

                onClicked: _rootID.register()
            }

            ButtonAuthentication    //Login button
            {
                _type: ButtonAuthentication.Type.Login
                _filling: ButtonAuthentication.Filling.Unfilled

                onClicked: _rootID.login()
            }
        }
    }

    //Try to login
    function register()
    {
        var email = _emailTextFieldID._text
        var password = _passwordTextFieldID._text
        var confirmPassword = _confirmPasswordTextFieldID._text

        var errorEmail = ErrorHandler.validateEmail(email)
        var errorPassword = ErrorHandler.validatePassword(password)
        var errorConfirmPassword = ErrorHandler.validateConfirmPassword(confirmPassword)

        _emailTextFieldID.showError(errorEmail)
        _passwordTextFieldID.showError(errorPassword)
        _confirmPasswordTextFieldID.showError(errorConfirmPassword)

        if(errorEmail !== "" || errorPassword !== "" || errorConfirmPassword !== "")
        {
            _emailTextFieldID._text = ""
            _passwordTextFieldID._text = ""
            errorConfirmPassword._text = ""
        }
    }
}
