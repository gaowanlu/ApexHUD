# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

**Apex HUD** is an iOS application built with SwiftUI that provides real-time offline navigation and telemetry. It displays altitude, GPS coordinates, and a digital compass in a gamified "Sci-Fi" Heads-Up Display interface.

**Platform:** iOS 26.5+ | **Language:** Swift 6.3.3 | **UI Framework:** SwiftUI

## Architecture

**Pattern:** MVVM-like with SwiftUI's `@Observable` pattern (SwiftUI 5+)

- **Model/ViewModel:** `OfflineSensorViewModel` (`ComparisonState.swift`)
  - Manages CoreLocation data (altitude, latitude, longitude)
  - Handles compass heading via magnetometer/gyroscope
  - Computes contextual altitude states (none, person, building, mountain, cloud, airplane)

- **Views:** SwiftUI view structs
  - `ContentView` - Main orchestrator with grid background
  - `AltitudeHUDView` - Altitude display with dynamic icons
  - `GameCompassView` - Tactical compass HUD
  - `GridBackground` - Green tactical grid overlay

### Data Flow
1. `OfflineSensorViewModel` (Observable) receives sensor data from CoreLocation
2. Altitude, coordinates, and heading are extracted and UI state computed
3. Views bind to the view model's state via `@State private var sensorVM`

## Building & Running

```bash
# Open in Xcode
open ApexHUD.xcodeproj

# Build from command line (requires Xcode with full developer tools)
xcodebuild -project ApexHUD.xcodeproj -scheme ApexHUD -configuration Debug

# Run tests
xcodebuild test -project ApexHUD.xcodeproj -scheme ApexHUD -configuration Debug
```

## Key Files

| File | Purpose |
|------|---------|
| `ApexHUDApp.swift` | App entry point with WindowGroup scene |
| `ContentView.swift` | Main view composing all HUD elements |
| `AltitudeHUDView.swift` | Altitude display with contextual state icons |
| `GameCompassView.swift` | Tactical compass with true/magnetic north |
| `ComparisonState.swift` | ViewModel + state enum for altitude context |
| `Assets.xcassets/` | App icon and accent color assets |

## Dependencies

- **SwiftUI** - UI framework
- **CoreLocation** - GPS and sensor data (CLLocationManager)

## Configuration

- **Bundle ID:** `org.duckdns.mfavant.ApexHUD`
- **Development Team:** `RYXR9XQPMV`
- **Architecture:** arm64 (iOS devices)
- **Target:** iPhone + iPad

## Notes

- The app works 100% offline using raw hardware sensors (GPS satellites, magnetometer, gyroscope)
- Requires location permissions (`NSLocationWhenInUseUsageDescription` in Info.plist)
- Uses SwiftUI 5+ features (`@Observable`, `.symbolEffect`)
