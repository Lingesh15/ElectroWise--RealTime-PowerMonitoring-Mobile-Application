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

<div style="display: flex;">
    <img src="https://github.com/Lingesh15/RealTime-Flutter-Application/assets/93930313/25d65a10-274b-4249-ab35-20f31ae90f97" alt="Login" width="20%"  height="40%" style="margin: 5px;">
    <img src="https://github.com/Lingesh15/RealTime-Flutter-Application/assets/93930313/2159351a-dc3e-4e09-99b0-f4ab31cfa2e8" alt="Signup" width="20%" height="20%" style="margin: 5px;">
    <img src="https://github.com/Lingesh15/RealTime-Flutter-Application/assets/93930313/4f9793fb-2ea2-4b19-b5b0-30f121395939" alt="Homepage" width="20%" height="20%" style="margin: 5px;">
    <img src="https://github.com/Lingesh15/RealTime-Flutter-Application/assets/93930313/02770a55-5d02-4d2a-a06b-78f7edc1f994" alt="Bill Page" width="20%" height="20%" style="margin: 5px;">
</div>






## Tech Stack

**Client:** Flutter, Firebase Authentication, DART

**Server:** Node, Firebase Realtime Database, Firebase Messaging

## Used By

This project is used for the following:

- Individual Households
- Commercial Buildings


