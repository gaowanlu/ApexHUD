# Apex HUD

### Real-time Offline Navigation & Telemetry

**Apex HUD** is a high-performance, offline-first navigation tool designed for outdoor enthusiasts, pilots, and tech-savvy explorers. It combines real-time telemetry (altitude, GPS coordinates) with a digital compass, all wrapped in a fully interactive, gamified "Sci-Fi" Heads-Up Display (HUD) interface.

Unlike standard map apps, **Apex HUD works completely offline** by leveraging your device's raw hardware sensors (GPS, Magnetometer, Gyroscope), ensuring reliability even in the most remote locations.

---

## 🚀 Features

### Real-time Telemetry
* **Precise Altitude**: Get accurate altitude readings (in meters) directly from GPS satellites.
* **Contextual Awareness**: Visualizes altitude relative to real-world objects (e.g., "Building Height," "Cloud Layer," "Cruising Altitude") with smooth animated transitions.
* **Live Coordinates**: Monitor your exact Latitude and Longitude with monospaced precision.

### Digital Compass
* **True North & Magnetic North**: Auto-switching for maximum accuracy.
* **Tactical HUD Interface**: A sci-fi inspired compass rose with dynamic markers and degree readouts.
* **Smooth Animations**: Fluid rotation matching your physical movement in real-time.

### 100% Offline Capable
* **Zero Dependencies**: No internet connection required.
* **Hardware Accelerated**: Uses `CoreLocation` to access raw data from satellite chips and magnetometers.
* **Adventure Ready**: Reliable whether you are in a dense forest, on a mountain peak, or in the air.

### Gamified UI
* **Immersive Design**: Dark-mode "Sci-Fi" aesthetic with neon accents and grid backgrounds.
* **Spring Animations**: UI elements interact dynamically as your altitude changes.
* **Visual Feedback**: Dynamic icons (Figures, Mountains, Airplanes) that scale and pulse based on your environment.

---

## 🛠 Technical Architecture

Apex HUD is built using modern Swift and SwiftUI principles, adhering to a reactive MVVM-like architecture.

### Stack
* **Platform**: iOS 26.5+
* **Language**: Swift 6.3.3
* **Framework**: SwiftUI (using the `@Observable` pattern)
* **Core Technologies**: `CoreLocation`, `CoreMotion`

### Data Flow
1. **Sensor Input**: `CLLocationManager` provides raw GPS and altitude data.
2. **State Management**: `OfflineSensorViewModel` (managed via `@Observable`) processes raw data and computes contextual states (e.g., altitude relative to clouds or buildings).
3. **UI Binding**: SwiftUI views bind directly to the view model's state, enabling highly responsive, animated updates.

### Key Components
| Component | Description |
| :--- | :--- |
| `OfflineSensorViewModel` | The central hub managing sensor data and altitude context. |
| `AltitudeHUDView` | Displays altitude with dynamic, context-aware icons. |
| `GameCompassView` | Tactical compass HUD with true/magnetic north support. |
| `GridBackground` | A tactical green grid overlay that enhances the sci-fi aesthetic. |

---

## 💻 Getting Started

### Prerequisites
* Xcode with full developer tools installed.
* An iOS device (required for testing real-time sensor data).

### Building & Running

**Open in Xcode:**
```bash
open ApexHUD.xcodeproj
```

**Build from command line:**
```bash
xcodebuild -project ApexHUD.xcodeproj -scheme ApexHUD -configuration Debug
```

**Run tests:**
```bash
xcodebuild test -project ApexHUD.xcodeproj -scheme ApexHUD -configuration Debug
```

---

## 📂 Project Structure

| File | Purpose |
| :--- | :--- |
| `ApexHUDApp.swift` | App entry point with `WindowGroup` scene. |
| `ContentView.swift` | Main view composing all HUD elements. |
| `AltitudeHUDView.swift` | Altitude display with contextual state icons. |
| `GameCompassView.swift` | Tactical compass with true/magnetic north. |
| `ComparisonState.swift` | ViewModel + state enum for altitude context. |
| `Assets.xcassets/` | App icon and accent color assets. |

---

## ⚙️ Configuration

* **Bundle ID:** `org.duckdns.mfavant.ApexHUD`
* **Development Team:** `RYXR9XQPMV`
* **Architecture:** `arm64` (iOS devices)

---

## 📄 License

Distributed under the MIT License.
