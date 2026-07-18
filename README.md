# Apex HUD
### Real-time Offline Navigation & Telemetry
![iOS](https://img.shields.io/badge/iOS-15.0+-blue.svg)
![Swift](https://img.shields.io/badge/Swift-5.9-orange.svg)
![SwiftUI](https://img.shields.io/badge/SwiftUI-4.0-green.svg)
![License](https://img.shields.io/badge/license-MIT-lightgrey.svg)
**Apex HUD** is a high-performance, offline-first navigation tool designed for outdoor enthusiasts, pilots, and tech-savvy explorers. It combines real-time telemetry (altitude, GPS coordinates) with a digital compass, all wrapped in a fully interactive, gamified Heads-Up Display (HUD) interface.
Unlike standard map apps, **Apex HUD works completely offline** by leveraging your device's raw hardware sensors (GPS, Magnetometer, Gyroscope), ensuring reliability even in the most remote locations.
## ✨ Features
### 🏔️ Real-time Telemetry
*   **Precise Altitude**: Get accurate altitude readings (in meters) directly from GPS satellites.
*   **Contextual Awareness**: Visualizes altitude relative to real-world objects (e.g., "Building Height," "Cloud Layer," "Cruising Altitude") with smooth animated transitions.
*   **Live Coordinates**: Monitor your exact Latitude and Longitude with monospaced precision.
### 🧭 Digital Compass
*   **True North & Magnetic North**: Auto-switching for maximum accuracy.
*   **Tactical HUD Interface**: A sci-fi inspired compass rose with dynamic markers and degree readouts.
*   **Smooth Animations**: Fluid rotation matching your physical movement in real-time.
### 📶 100% Offline Capable
*   **Zero Dependencies**: No internet connection required.
*   **Hardware Accelerated**: Uses CoreLocation to access raw data from satellite chips and magnetometers.
*   **Adventure Ready**: Reliable whether you are in a dense forest, on a mountain peak, or in the air.
### 🎮 Gamified UI
*   **Immersive Design**: Dark-mode "Sci-Fi" aesthetic with neon accents and grid backgrounds.
*   **Spring Animations**: UI elements interact dynamically as your altitude changes.
*   **Visual Feedback**: Dynamic icons (Figures, Mountains, Airplanes) that scale and pulse based on your environment.
## 📸 Screenshots / Demo
*(Here you would typically add screenshots or a GIF of the app in action)*
> *The interface features a central compass, large altitude readout, and dynamic comparison icons floating in a dark tactical grid.*
## 🚀 Getting Started
### Prerequisites
*   **Xcode**: Version 15.0 or higher.
*   **iOS Device**: iPhone running iOS 15.0+ (Simulator works, but real sensors are recommended for full experience).
*   **Swift**: 5.9+
### Installation
1.  **Clone the repository**
    ```bash
    git clone https://github.com/yourusername/apex-hud.git
    cd apex-hud
    ```
2.  **Open the Project**
    Open `ApexHUD.xcodeproj` in Xcode.
3.  **Configure Permissions (Crucial)**
    Before running the app, you **must** add the following key to your project's `Info.plist` file to authorize location access:
    *   **Key**: `Privacy - Location When In Use Usage Description`
    *   **Value**: `We need access to your location to provide offline altitude and compass data.`
4.  **Run**
    Select your target device (iPhone) and hit `Cmd + R`.
## 🏗️ Technical Architecture
Apex HUD is built entirely using **SwiftUI** and follows an MVVM (Model-View-ViewModel) architecture pattern.
*   **CoreLocation**: Handles raw sensor data from GPS (Altitude/Coords) and Magnetometer (Heading).
*   **Combine Framework**: Used for reactive data binding between the Sensors and the UI.
*   **Custom Animations**: Extensive use of `.transition`, `.rotationEffect`, and `@State` to create the "game-like" feel.
### Key Components
*   `OfflineSensorViewModel`: The central brain that aggregates location and heading data.
*   `GameCompassView`: A custom SwiftUI view rendering the HUD compass.
*   `AltitudeHUDView`: Manages the dynamic altitude comparisons and state transitions.
## 📝 Usage Guide
1.  **Calibration**: On first launch, move your device in a figure-8 motion to calibrate the magnetometer for the compass.
2.  **Offline Mode**: Toggle your device to Airplane Mode. The app will continue to function perfectly using satellite signals.
3.  **Altitude States**: Watch as the central icon evolves from a person (ground level) to an airplane (high altitude) as you change elevation.
## 🤝 Contributing
Contributions, issues, and feature requests are welcome!
1. Fork the Project
2. Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
3. Commit your Changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the Branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request
## 📄 License
Distributed under the MIT License. See `LICENSE` for more information.
## 🙏 Acknowledgments
*   Apple CoreLocation Framework
*   SF Symbols for the high-quality icons
---
**Made with ❤️ and Code**

