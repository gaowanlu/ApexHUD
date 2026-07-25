import SwiftUI

// MARK: - OfflineIndicatorView

struct OfflineIndicatorView: View {
    var body: some View {
        HStack(spacing: 6) {
            Image(systemName: "wifi.slash")
                .font(.caption)
            Text("OFFLINE MODE")
                .font(.caption2)
                .fontWeight(.bold)
                .tracking(1)
        }
        .padding(.horizontal, 12)
        .padding(.vertical, 6)
        .foregroundColor(.secondary)
        .background(.ultraThinMaterial)
        .clipShape(Capsule())
    }
}

#Preview {
    ZStack {
        Color.gray.opacity(0.2).ignoresSafeArea()
        OfflineIndicatorView()
    }
}
