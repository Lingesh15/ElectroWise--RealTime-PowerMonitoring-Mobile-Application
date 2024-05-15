
# Real-Time Power Consumption Prediction and Monitoring Application

This project is a comprehensive mobile application designed for real-time power consumption prediction, monitoring, and alerting. Built using Flutter for the frontend and Node.js for the backend, the app leverages advanced predictive analytics and cloud-based services to provide an intuitive and efficient solution for power management.


## Features

- Real-Time Monitoring: The application allows users to monitor power consumption in real-time through an interactive and visually appealing interface. The data is fetched from connected sensors and displayed using fl_charts.

- Power Consumption Prediction: Utilizing the Seasonal AutoRegressive Integrated Moving Average (SARIMA) model, the app predicts future power consumption based on historical data collected by the sensors.

- Alert System: An alert system is integrated to notify users when predicted power consumption exceeds actual values. This feature helps in identifying and mitigating potential power overuse issues promptly.

- Firebase Integration:
  Authentication: Secure user authentication is handled through Firebase Authentication.
  Database: Power consumption data is stored and retrieved from Firebase Database using HTTP operations.
  Push Notifications: The backend server sends push notifications through Firebase Messaging to alert users about critical power consumption predictions.


## Screenshots

![Login Page](https://photos.google.com/u/1/photo/AF1QipM1VFEQn91L7X7EogByP1K6q6wqSTyg0zlP86GY)
![SignUp Page](https://photos.google.com/u/1/photo/AF1QipMi1y-wGyei8PwrBXRY5_4FGRfpq2_tbE4RiRKz)
![Home Page](https://photos.google.com/u/1/photo/AF1QipP-i9KBk2eAh9P1ev2Ai3QyqGrjsEZ-_XgqK8Q7)
![Bill Page](https://photos.google.com/u/1/photo/AF1QipOaLNgaYsU4CDR12jD--ShpadDQM9Rsq7Xl7gOW)


## Tech Stack

**Client:** Flutter, Firebase Authentication, DART

**Server:** Node, Firebase realtime database, Firebase messaging


## Used By

This project is used for the following :

- Individual Households
- Commercial Buildings

