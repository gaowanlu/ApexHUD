import SwiftUI

// MARK: - DebugOverlay

struct DebugOverlay: View {
    @Bindable var vm: OfflineSensorViewModel

    var body: some View {
        VStack(spacing: 0) {
            Divider().background(Color.green)

            HStack {
                Text("DEBUG MODE").font(.caption).bold().foregroundColor(.green)
                Spacer()
                Toggle("", isOn: $vm.isDebugging)
                    .labelsHidden()
                    .tint(.green)
            }
            .padding(.horizontal, 16)
            .padding(.vertical, 12)
            .background(.ultraThinMaterial)

            VStack(spacing: 20) {
                HStack {
                    Text("Altitude: \(Int(vm.altitude))m")
                        .font(.system(.body, design: .monospaced))
                        .foregroundColor(.green)
                    Spacer()
                }
                .padding(.horizontal, 16)

                Slider(value: $vm.altitude, in: -10000...20000) { _ in
                    vm.debugSetAltitude(vm.altitude)
                }
                .tint(.green)
                .padding(.horizontal, 16)

                VStack(spacing: 12) {
                    Text("Set Altitude State:").font(.caption).foregroundColor(.green.opacity(0.8))
                    HStack(spacing: 8) {
                        DebugButton(label: "None", value: 0, vm: vm)
                        DebugButton(label: "Person", value: 1, vm: vm)
                        DebugButton(label: "Bldg", value: 150, vm: vm)
                        DebugButton(label: "Mtn", value: 500, vm: vm)
                        DebugButton(label: "Cloud", value: 2000, vm: vm)
                        DebugButton(label: "Air", value: 5000, vm: vm)
                    }
                }
                .padding(.horizontal, 16)
            }
            .padding(.vertical, 24)
            .frame(maxWidth: .infinity)
        }
    }
}

struct DebugButton: View {
    let label: String
    let value: Double
    let vm: OfflineSensorViewModel

    var body: some View {
        Button(label) {
            vm.debugSetAltitude(value)
        }
        .buttonStyle(.bordered)
        .controlSize(.mini)
        .tint(Color.green.opacity(0.2))
        .foregroundColor(.green)
    }
}

#Preview {
    DebugOverlay(vm: OfflineSensorViewModel())
}
