# Real-Time Power Consumption Prediction and Monitoring Application

This project is a comprehensive mobile application designed for real-time power consumption prediction, monitoring, and alerting. Built using Flutter for the frontend and Node.js for the backend, the app leverages advanced predictive analytics and cloud-based services to provide an intuitive and efficient solution for power management.

## Features

- Real-Time Monitoring: The application allows users to monitor power consumption in real-time through an interactive and visually appealing interface. The data is fetched from connected sensors and displayed using fl_charts.

- Power Consumption Prediction: Utilizing the Seasonal AutoRegressive Integrated Moving Average (SARIMA) model, the app predicts future power consumption based on historical data collected by the sensors.

- Alert System: An alert system is integrated to notify users when predicted power consumption exceeds actual values. This feature helps in identifying and mitigating potential power overuse issues promptly.

- Firebase Integration:
  - **Authentication:** Secure user authentication is handled through Firebase Authentication.
  - **Database:** Power consumption data is stored and retrieved from Firebase Database using HTTP operations.
  - **Push Notifications:** The backend server sends push notifications through Firebase Messaging to alert users about critical power consumption predictions.

## Pages

![Screenshot 2024-07-10 155641](https://github.com/Lingesh15/RealTime-PowerMonitoring-Mobile-Application/assets/93930313/df3aa8bd-3df4-4693-99b8-4e3b459b0986)



## Tech Stack

**Client:** Flutter, Firebase Authentication, DART

**Server:** Node, Firebase Realtime Database, Firebase Messaging

## Used By

This project is used for the following:

- Individual Households
- Commercial Buildings


