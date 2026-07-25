import SwiftUI

// MARK: - GameCompassView

struct GameCompassView: View {
    let heading: Double
    let headingText: String

    var body: some View {
        VStack(spacing: 16) {
            Text("COMPASS")
                .font(.caption)
                .fontWeight(.semibold)
                .foregroundColor(.secondary)
                .tracking(2)

            ZStack {
                // Outer Ring
                Circle()
                    .strokeBorder(Color.secondary.opacity(0.2), lineWidth: 1)
                    .frame(width: 140, height: 140)

                // Inner Ring (Rotating part)
                ZStack {
                    Circle()
                        .strokeBorder(Color.blue.opacity(0.5), lineWidth: 2)
                        .frame(width: 120, height: 120)

                    // Compass Dial
                    ZStack {
                        // North Marker
                        VStack {
                            Image(systemName: "location.north.fill")
                                .font(.system(size: 20))
                                .foregroundColor(.blue)
                            Spacer()
                        }
                        .padding(.top, 10)

                        // East Marker
                        HStack {
                            Spacer()
                            Text("E")
                                .font(.caption)
                                .fontWeight(.bold)
                                .foregroundColor(.secondary)
                        }
                        .padding(.trailing, 10)

                        // South Marker
                        VStack {
                            Spacer()
                            Text("S")
                                .font(.caption)
                                .fontWeight(.bold)
                                .foregroundColor(.secondary)
                        }
                        .padding(.bottom, 10)

                        // West Marker
                        HStack {
                            Spacer()
                            Text("W")
                                .font(.caption)
                                .fontWeight(.bold)
                                .foregroundColor(.secondary)
                        }
                        .padding(.leading, 10)
                    }
                    .rotationEffect(Angle(degrees: -heading))
                }
            }
            .frame(width: 140, height: 140)
            .background(.ultraThinMaterial)
            .clipShape(Circle())
            .shadow(color: .black.opacity(0.1), radius: 10, x: 0, y: 5)

            Text(headingText)
                .font(.system(.title2, design: .rounded))
                .fontWeight(.bold)
                .foregroundColor(.primary)
        }
    }
}

#Preview {
    ZStack {
        Color.gray.opacity(0.2).ignoresSafeArea()
        GameCompassView(heading: 90.0, headingText: "E")
    }
}
