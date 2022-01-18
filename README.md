# Thermosat-Display

As part of this assignment I have created a sample iOS application. I named it as Thermostat display. 
This is two screen application, which are Login and Humidity Data screen.

I have used MVP(clean) architecture for designing this sample application.

As soon as you open the application you will see the login screen. On tap of the google login button you will be navigated to google login page. Where you need to enter the google login credentials. After successful login you will be navigated to the humidity data screen.
On the humidity screen you can see the ambient Humidity Percent, but as we don’t have device Id the API will fail.

For implementing the google login feature, I have used the GoogleSignIn sdk. I have integrated it using cocoapods.

For Networking call I have used NSUrlSession.


