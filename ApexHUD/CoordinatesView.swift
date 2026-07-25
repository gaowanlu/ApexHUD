import SwiftUI

// MARK: - CoordinatesView

struct CoordinatesView: View {
    let latitude: Double
    let longitude: Double

    var body: some View {
        VStack(spacing: 12) {
            HStack {
                Text("LAT")
                    .font(.caption)
                    .fontWeight(.semibold)
                    .foregroundColor(.secondary)
                Spacer()
                Text(String(format: "%.5f", latitude))
                    .font(.system(.body, design: .monospaced))
                    .foregroundColor(.primary)
            }

            Divider()

            HStack {
                Text("LON")
                    .font(.caption)
                    .fontWeight(.semibold)
                    .foregroundColor(.secondary)
                Spacer()
                Text(String(format: "%.5f", longitude))
                    .font(.system(.body, design: .monospaced))
                    .foregroundColor(.primary)
            }
        }
        .padding()
        .background(.ultraThinMaterial)
        .cornerRadius(16)
    }
}

#Preview {
    ZStack {
        Color.gray.opacity(0.2).ignoresSafeArea()
        CoordinatesView(latitude: 25.0330, longitude: 121.5654)
    }
}
