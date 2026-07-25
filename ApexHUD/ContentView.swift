import SwiftUI
import Foundation
import CoreLocation

// MARK: - ContentView

struct ContentView: View {
    @State private var sensorVM = OfflineSensorViewModel()
    @State private var isShowingDebug = false

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

            // Top-right Debug Button
            VStack {
                HStack {
                    Spacer()
                    Button {
                        isShowingDebug.toggle()
                    } label: {
                        Image(systemName: "gearshape.fill")
                            .font(.title3)
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
    }
}


#Preview {
    ContentView()
}
