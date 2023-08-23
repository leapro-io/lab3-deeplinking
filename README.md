
# Lab 3 :  Deep Linking Tutorial

This lab provides a step-by-step tutorial on how to implement deep linking in a Flutter Android application using deep links. The tutorial consists of two Android apps and a Java Spring web app. The main Android app serves as the host application, while the secondary app and web app act as slaves for receiving data via deep links. In this project we will *not* be using an app links implementation.



## Getting Started

- Clone this repository to your local machine.

        git clone git@github.com:leapro-io/lab3-deeplinking.git


- Navigate to the mobile_host directory and run the Flutter app. This app contains two buttons for redirecting to the slave app and slave web app.



        cd Mobile_host
        flutter run

- In the Mobile_slave directory, run the Flutter apps to simulate slave application. This app allow you to input text and then redirect back to the main app with the entered data.


        cd slave_app
        flutter run


- Open the spring_web_app directory in your preferred Java Spring development environment.

- Build and run the Spring web app. The app should start and listen on the specified port.

- The Spring web app provides an endpoint that can be accessed via deep links. Make sure the web app is running and accessible from devices on the same network.


- Ensure that your mobile device and pc  are connected to the same network.


## Configuration

The project uses the uni_links package for handling deep links. Make sure to add the required dependencies in your pubspec.yaml file.

The .env file contains the URL of the Spring web app. Replace this URL with the actual URL of your web app server.


## Note

When accessing the Spring web app from a mobile device, use the IP address of your laptop, as both devices should be connected to the same network.

Remember to replace the URL and IP addresses with the actual values specific to your project.


## Testing

In the mobile_host app, press the "Redirect to mobile" button to launch the slave app on your device. Similarly, press the "Redirect to web " button to launch the slave web app.

Enter text in either the slave app or the slave web app, then press the "Redirect Back to Main App" button to return to the main app with the entered data.
    



## Additional Resources

For more information on deep linking with Flutter for Android, refer to the following resources:

[uni_links package](https://pub.dev/packages/uni_links)

[Flutter Official Documentation - Deep Linking](https://docs.flutter.dev/cookbook/navigation/set-up-app-links)
