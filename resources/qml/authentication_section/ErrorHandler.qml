pragma Singleton
import QtQuick 2.14

Item {
    property var _errorCodes:                       //DEFAULT ERROR CODES WITH RESPECTIVE CONTENTS
    {
        "EMAIL_SHORT": qsTr("The email is too short!"),                    //The email is too short
        "EMAIL_NO_SNAIL": qsTr("The email doesn't contain a snail (@) !"),
        "EMAIL_NO_LOCAL_PART": qsTr("The email can't start with the snail (@) !"),
        "EMAIL_NO_DOMAIN": qsTr("The email can't end with the snail (@) !"),
        "PASSWORD_SHORT": qsTr("The password is too short!"),             //The password is too short
        "CONFIRM_PASSWORD_NOT_EQUAL": qsTr("The confirm password is not equal to the password!")          //The confirm password is not equal to the password
    }

    function validateEmail(email)
    {
        //If the email has less than 3 characters (minimum for a valid email)
        if (email.length < 3)
        {
            return _errorCodes["EMAIL_SHORT"]
        }
        if(email.split("@").length - 1 < 1)
        {
            return _errorCodes["EMAIL_NO_SNAIL"]
        }
        if(email[0] === "@")
        {
            return _errorCodes["EMAIL_NO_LOCAL_PART"]
        }
        if(email[email.length - 1] === "@")
        {
            return _errorCodes["EMAIL_NO_DOMAIN"]
        }

        return ""
    }

    function validatePassword(password)
    {
        //If the password has less than 6 characters (minimum for a valid password)
        if (password.length < 6)
        {
            return _errorCodes["PASSWORD_SHORT"]
        }

        return ""
    }

    function validateConfirmPassword(password, confirmPassword)
    {
        //If the confirm password is not equal to the password
        if (confirmPassword !== password)
        {
            return _errorCodes["CONFIRM_PASSWORD_NOT_EQUAL"]
        }

        return ""
    }
}
