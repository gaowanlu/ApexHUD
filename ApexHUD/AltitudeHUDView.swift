import SwiftUI
import Foundation
import CoreLocation

// MARK: - MountainDetailView

public struct MountainDetailView: View {
    let mountainState: HUDMountainState
    let currentAltitude: Double
    @State private var showFullDetails = false

    var mountain: HUDMountain {
        mountainState.mountain
    }

    public var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack {
                VStack(alignment: .leading, spacing: 8) {
                    Text(mountain.name)
                        .font(.title2)
                        .bold()
                        .foregroundColor(.primary)

                    HStack(spacing: 12) {
                        Label(mountain.heightCategory, systemImage: "mountain.2.fill")

                        if mountainState.altitudeDifference > 0 {
                            Label("海拔差 \(String(format: "%.0f", abs(mountainState.altitudeDifference)))m", systemImage: "arrow.down")
                                .foregroundColor(.orange)
                        } else if mountainState.altitudeDifference < 0 {
                            Label("海拔差 \(String(format: "%.0f", abs(mountainState.altitudeDifference)))m", systemImage: "arrow.up")
                                .foregroundColor(.blue)
                        } else {
                            Label("同海拔", systemImage: "arrow.left.and.right")
                                .foregroundColor(.green)
                        }
                    }
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                }
                Spacer()
                Image(systemName: mountain.iconName)
                    .font(.system(size: 40))
                    .foregroundColor(mountain.height > 6000 ? .blue : .green)
            }

            Divider()

            VStack(alignment: .leading, spacing: 12) {
                infoRow(icon: "location.circle", text: mountain.location)
                infoRow(icon: "list.bullet", text: mountain.range)
                infoRow(icon: "info.circle", text: mountain.summary)
            }
            .font(.subheadline)
            .foregroundColor(.secondary)

            GroupBox(
                label: Button(action: { showFullDetails.toggle() }) {
                    HStack {
                        Text(showFullDetails ? "收起详细信息" : "查看详细信息")
                        Spacer()
                        Image(systemName: showFullDetails ? "chevron.up" : "chevron.down")
                    }
                    .font(.headline)
                }
            ) {
                if showFullDetails {
                    Text(mountain.details)
                        .font(.body)
                        .foregroundColor(.secondary)
                        .padding(.top, 8)
                }
            }

            Spacer()
        }
        .padding()
        .background(.ultraThinMaterial)
        .cornerRadius(16)
    }

    private func infoRow(icon: String, text: String) -> some View {
        HStack(alignment: .top, spacing: 8) {
            Image(systemName: icon)
                .foregroundColor(.accentColor)
                .frame(width: 20)
            Text(text)
                .foregroundColor(.secondary)
        }
    }
}

// MARK: - AltitudeHUDView

public struct AltitudeHUDView: View {
    let state: HUDComparisonState
    let altitude: Double
    let mountainState: HUDMountainState?

    @State private var isFloating = false
    @State private var showMountainDetail = false

    public var body: some View {
        VStack(spacing: 15) {
            Image(systemName: state.iconName)
                .font(.system(size: 60))
                .foregroundColor(getIconColor())
                .symbolEffect(.pulse, options: .repeating)
                .rotationEffect(Angle(degrees: isFloating ? -5 : 5))
                .animation(.easeInOut(duration: 2).repeatForever(autoreverses: true), value: isFloating)

            Text(String(format: "%.1f", altitude) + " M")
                .font(.system(size: 34, weight: .bold, design: .rounded))
                .foregroundColor(.primary)

            VStack(spacing: 8) {
                if let mountainState = mountainState {
                    if showMountainDetail {
                        MountainDetailView(
                            mountainState: mountainState,
                            currentAltitude: altitude
                        )
                    } else {
                        Text(mountainState.mountain.name)
                            .font(.headline)
                            .foregroundColor(.accentColor)
                            .multilineTextAlignment(.center)

                        Text(mountainState.description)
                            .font(.caption)
                            .foregroundColor(.secondary)
                            .multilineTextAlignment(.center)

                        Text("点击查看详情")
                            .font(.caption2)
                            .foregroundColor(.accentColor.opacity(0.7))
                            .padding(.top, 4)
                    }
                } else {
                    VStack(spacing: 4) {
                        Text(state.title)
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .foregroundColor(.primary)
                        Text(state.description)
                            .font(.caption)
                            .foregroundColor(.secondary)
                            .multilineTextAlignment(.center)
                    }
                    .padding(.horizontal, 12)
                    .padding(.vertical, 6)
                    .background(.ultraThinMaterial)
                    .clipShape(Capsule())
                }
            }
        }
        .frame(maxWidth: .infinity)
        .padding(.vertical, 24)
        .background(.ultraThinMaterial)
        .cornerRadius(24)
        .shadow(color: .black.opacity(0.1), radius: 10, x: 0, y: 5)
        .onAppear { isFloating = true }
        .onTapGesture {
            if mountainState != nil {
                showMountainDetail.toggle()
            }
        }
    }

    private func getIconColor() -> Color {
        state.color
    }
}

struct AltitudeHUDView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.gray.opacity(0.2).ignoresSafeArea()
            AltitudeHUDView(
                state: .none,
                altitude: 100.0,
                mountainState: nil
            )
        }
    }
}
