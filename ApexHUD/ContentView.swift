import SwiftUI
import Foundation
import CoreLocation

// MARK: - ContentView

struct ContentView: View {
    @State private var sensorVM = OfflineSensorViewModel()
    @State private var isShowingDebug = false
    @State private var isShowingSettings = false

    var body: some View {
        ZStack {
            // Premium dark background
            LinearGradient(
                gradient: Gradient(colors: [Color(uiColor: .secondarySystemBackground), Color(uiColor: .systemBackground)]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea()

            VStack(spacing: 24) {
                GameCompassView(heading: sensorVM.heading, headingText: sensorVM.headingText)
                    .padding(.top, 20)

                AltitudeHUDView(
                    state: convertComparisonState(sensorVM.comparisonState),
                    altitude: sensorVM.altitude,
                    mountainState: sensorVM.mountainState.map { convertMountainState($0) }
                )

                CoordinatesView(latitude: sensorVM.latitude, longitude: sensorVM.longitude)
                    .padding(.horizontal)

                OfflineIndicatorView()
                    .padding(.bottom, 20)
            }
            .padding(20)

            // Top-right Menu
            VStack {
                HStack {
                    Spacer()
                    Menu {
                        Button {
                            isShowingDebug.toggle()
                        } label: {
                            Label("Debug", systemImage: "hammer.fill")
                        }

                        Button {
                            isShowingSettings.toggle()
                        } label: {
                            Label("Settings", systemImage: "gearshape.fill")
                        }
                    } label: {
                        Image(systemName: "ellipsis.circle.fill")
                            .font(.title2)
                            .foregroundColor(.secondary)
                            .padding(10)
                            .background(.ultraThinMaterial)
                            .clipShape(Circle())
                    }
                    .padding()
                }
                Spacer()
            }
        }
        .sheet(isPresented: $isShowingDebug) {
            DebugOverlay(vm: sensorVM)
                .presentationDetents([.medium, .large])
                .presentationDragIndicator(.visible)
        }
        .sheet(isPresented: $isShowingSettings) {
            SettingsView()
        }
    }
}


#Preview {
    ContentView()
}
