import QtQuick 2.0

Rectangle       //ButtonAuthentication
{
    width: 160; height: 50
    radius: 10
    //The color is based on the filling
    color: _filling === 0 ? "#006CDF" : "#FFFFFF"

    //If there is no filling show the borders
    border
    {
        width: _filling === 0 ? 0 : 3
        color: "#006CDF"
    }

    enum Type       //Type of ButtonAuthentication
    {
        Login,
        Registration
    }
    property int _type  //Type variable

    enum Filling       //Filling of ButtonAuthentication
    {
        Filled,
        Unfilled
    }
    property int _filling  //Filling variable

    signal clicked()

    MouseArea       //Pressable area
    {
        anchors.fill: parent
        //How the cursor looks if is hover this area
        cursorShape: Qt.PointingHandCursor
        //Contains mouse is true also if button not clicked
        hoverEnabled: true

        onClicked: parent.clicked()
        //Highlights the button when hovered
        onEntered: parent.color = Qt.darker(parent.color, 1.2)
        onExited: parent.color = Qt.lighter(parent.color, 1.2)
    }

    Text            //Text inside button
    {
        id: _textID

        text: qsTr(_type === 0 ? "Login" : "Sign up")
        color: _filling === 0 ? "#FFFFFF" : "#006CDF"
        anchors.fill: parent
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        font
        {
            pointSize: 18
            bold: true
        }
    }
}
