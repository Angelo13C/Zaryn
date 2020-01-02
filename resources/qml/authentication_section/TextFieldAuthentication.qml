import QtQuick 2.14
import QtQuick.Controls 2.14
import QtQuick.Layouts 1.14

ColumnLayout
{
    spacing: 10

    enum Type       //Type of TextFieldAuthentication
    {
        Email,
        Password,
        ConfirmPassword
    }
    property int _type      //Type variable
    property alias _text: _textFieldID.text

    Row       //Password TextField
    {
        spacing: 30

        TextField
        {
            id: _textFieldID
            width: 240; height: 40

            font.pointSize: 14
            selectByMouse: true     //Selectable by mouse

            property var _placeholderTexts: //Placeholder texts based on _type
            [
                qsTr("Email"),
                qsTr("Password"),
                qsTr("Confirm password")
            ]

            placeholderText: _placeholderTexts[_type]

            echoMode:           //Display as plain text or as password
                if(_type === 0 || _hidePasswordID._showingPassword)
                    TextInput.Normal
                else
                    TextInput.Password

            validator: RegularExpressionValidator     //Input validator
            {
                property var _validators: //Validators strings based on _type
                [
                    /[A-Za-z0-9_@.]{3,50}/,
                    /[A-Za-z0-9@_!#$%&'*+-/=?^_`{|}~]{6,50}/
                ]

                regularExpression: _validators[_type]
            }
        }

        Image       //Hide/Show password
        {
            id: _hidePasswordID
            anchors.verticalCenter: parent.verticalCenter
            sourceSize: "25x25"

            property bool _showingPassword: false

            property var _path:
            [
                "qrc:/IMAGES/images/authentication_section/show_password.svg",
                "qrc:/IMAGES/images/authentication_section/hided_password.svg"
            ]

            source:     //Load only if it is a password field
                if(_type === 1)
                    _path[_showingPassword ? 1 : 0]
                else
                    ""

            MouseArea       //Button
            {
                anchors.fill: parent
                //How the cursor looks if is hover this area
                cursorShape: Qt.PointingHandCursor

                onClicked: parent._showingPassword = !parent._showingPassword
            }
        }
    }

    function showError(error)
    {
        _errorTextID.text = error
    }

    Text        //Error text
    {
        id: _errorTextID

        font.pointSize: 12

        color: "#d41313"
    }
}


