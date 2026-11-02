import SwiftUI

enum StudioSection: String, CaseIterable, Identifiable {
    case library = "Biblioteca"
    case analysis = "Análisis"
    case keys = "Tonalidades"
    case organization = "Organización"
    case export = "Exportación"

    var id: String { rawValue }

    var symbol: String {
        switch self {
        case .library: return "square.stack.3d.up"
        case .analysis: return "waveform.path"
        case .keys: return "circle.grid.cross"
        case .organization: return "folder"
        case .export: return "arrow.up.doc"
        }
    }
}

struct ContentView: View {
    @State private var selection: StudioSection? = .library

    var body: some View {
        NavigationSplitView {
            VStack(alignment: .leading, spacing: 22) {
                VStack(alignment: .leading, spacing: 5) {
                    Text("AUDIO")
                        .font(.system(size: 11, weight: .bold, design: .rounded))
                        .tracking(3)
                        .foregroundStyle(StudioTheme.accent)
                    Text("ANALYZER")
                        .font(.system(size: 21, weight: .black, design: .rounded))
                        .tracking(1.2)
                        .foregroundStyle(StudioTheme.text)
                }
                .padding(.horizontal, 12)
                .padding(.top, 18)

                VStack(alignment: .leading, spacing: 7) {
                    Eyebrow(title: "Workspace")
                        .padding(.horizontal, 12)
                    ForEach(StudioSection.allCases) { section in
                        Button {
                            selection = section
                        } label: {
                            HStack(spacing: 12) {
                                Image(systemName: section.symbol)
                                    .font(.system(size: 16, weight: .semibold))
                                    .frame(width: 22)
                                Text(section.rawValue)
                                    .font(.system(size: 14, weight: .semibold))
                                Spacer()
                                if selection == section {
                                    Circle()
                                        .fill(StudioTheme.accent)
                                        .frame(width: 6, height: 6)
                                }
                            }
                            .foregroundStyle(selection == section ? StudioTheme.text : StudioTheme.muted)
                            .padding(.horizontal, 12)
                            .padding(.vertical, 12)
                            .background(selection == section ? StudioTheme.raised : .clear, in: RoundedRectangle(cornerRadius: 11))
                        }
                        .buttonStyle(.plain)
                    }
                }

                Spacer()

                VStack(alignment: .leading, spacing: 7) {
                    Eyebrow(title: "Estado del sistema")
                    Label("Motor de audio pendiente", systemImage: "circle.dashed")
                        .font(.system(size: 11, weight: .medium))
                        .foregroundStyle(StudioTheme.muted)
                }
                .padding(12)
                .background(StudioTheme.surface, in: RoundedRectangle(cornerRadius: 13))
            }
            .padding(14)
            .frame(minWidth: 220)
            .background(StudioTheme.background)
            .toolbar(.hidden, for: .navigationBar)
        } detail: {
            Group {
                switch selection ?? .library {
                case .library:
                    LibraryView()
                case .analysis:
                    PlaceholderSection(title: "Análisis musical", subtitle: "Waveform, Energy Map y análisis espectral.")
                case .keys:
                    PlaceholderSection(title: "Tonalidades", subtitle: "Tonalidad, modo y rueda Camelot.")
                case .organization:
                    PlaceholderSection(title: "Organización", subtitle: "Clasificación y compatibilidad armónica.")
                case .export:
                    PlaceholderSection(title: "Exportación", subtitle: "Copiar MP3 originales a carpetas organizadas.")
                }
            }
            .background(StudioTheme.background)
        }
        .tint(StudioTheme.accent)
    }
}

struct PlaceholderSection: View {
    let title: String
    let subtitle: String

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(title)
                .font(.system(size: 30, weight: .bold, design: .rounded))
                .foregroundStyle(StudioTheme.text)
            Text(subtitle)
                .font(.system(size: 14))
                .foregroundStyle(StudioTheme.muted)
            Text("Sección de interfaz en preparación")
                .font(.system(size: 11, weight: .semibold))
                .foregroundStyle(StudioTheme.accent)
                .padding(.top, 10)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
        .padding(32)
    }
}
