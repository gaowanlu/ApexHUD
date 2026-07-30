import SwiftUI

// MARK: - AppColorScheme
enum AppColorScheme: String, CaseIterable, Identifiable {
    case system = "System"
    case light = "Light"
    case dark = "Dark"

    var id: String { self.rawValue }

    var colorScheme: ColorScheme? {
        switch self {
        case .system: return nil
        case .light: return .light
        case .dark: return .dark
        }
    }
}

// MARK: - SettingsView
struct SettingsView: View {
    @AppStorage("app_color_scheme") private var selectedScheme: AppColorScheme = .system

    var body: some View {
        NavigationStack {
            Form {
                Section {
                    Picker(selection: $selectedScheme) {
                        ForEach(AppColorScheme.allCases) { scheme in
                            Text(scheme.rawValue).tag(scheme)
                        }
                    } label: {
                        Label("Color Scheme", systemImage: "paintbrush.fill")
                    }
                } header: {
                    Text("Appearance")
                }

                Section {
                    LabeledContent("Version", value: "1.0.0")
                    LabeledContent("Build", value: "2026.07.31")
                } header: {
                    Text("About")
                }
            }
            .navigationTitle("Settings")
            .navigationBarTitleDisplayMode(.inline)
        }
        .preferredColorScheme(selectedScheme.colorScheme)
    }
}

#Preview {
    SettingsView()
}
