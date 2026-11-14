import SwiftUI

// Prototipo visual: todos los nombres, valores y waveforms son datos simulados.
// No reproduce audio ni realiza análisis musical todavía.

private enum DemoPalette {
    static let background = Color(red: 0.035, green: 0.047, blue: 0.067)
    static let panel = Color(red: 0.075, green: 0.091, blue: 0.118)
    static let panelRaised = Color(red: 0.105, green: 0.126, blue: 0.157)
    static let border = Color.white.opacity(0.08)
    static let textMuted = Color(red: 0.60, green: 0.66, blue: 0.73)
    static let cyan = Color(red: 0.24, green: 0.76, blue: 0.96)
    static let violet = Color(red: 0.70, green: 0.52, blue: 0.98)
    static let amber = Color(red: 0.96, green: 0.70, blue: 0.32)
    static let green = Color(red: 0.34, green: 0.82, blue: 0.61)
}

private enum WorkspaceSection: String, Hashable {
    case library = "Biblioteca"
    case transition = "Transición"
    case analysis = "Análisis"
    case keys = "Tonalidades"
    case organize = "Organización"
    case export = "Exportación"
}

private struct DemoTrack: Identifiable, Hashable {
    let id: Int
    let title: String
    let artist: String
    let bpm: Int
    let musicalKey: String
    let camelot: String
    let duration: String
    let energy: Int
    let waveform: [CGFloat]
}

private let demoTracks: [DemoTrack] = [
    DemoTrack(
        id: 1,
        title: "Deep Signal",
        artist: "Demo A · Referencia visual",
        bpm: 128,
        musicalKey: "Fa♯ menor",
        camelot: "11A",
        duration: "06:42",
        energy: 64,
        waveform: [0.18,0.32,0.48,0.26,0.62,0.74,0.42,0.31,0.56,0.82,0.68,0.38,0.24,0.45,0.71,0.88,0.52,0.34,0.61,0.77,0.46,0.28,0.55,0.69,0.84,0.48,0.36,0.58,0.76,0.91,0.63,0.39,0.22,0.47,0.67,0.82,0.54,0.31,0.49,0.73,0.88,0.58,0.34,0.52,0.79,0.65,0.42,0.24,0.46,0.69,0.83,0.57,0.35,0.61,0.76,0.49,0.28,0.44,0.66,0.38]
    ),
    DemoTrack(
        id: 2,
        title: "Night Pattern",
        artist: "Demo B · Referencia visual",
        bpm: 129,
        musicalKey: "Sol♯ menor",
        camelot: "1A",
        duration: "07:08",
        energy: 71,
        waveform: [0.25,0.42,0.67,0.51,0.31,0.58,0.82,0.63,0.39,0.22,0.46,0.72,0.91,0.66,0.43,0.28,0.54,0.79,0.61,0.37,0.56,0.84,0.69,0.44,0.26,0.48,0.74,0.88,0.59,0.35,0.57,0.81,0.65,0.41,0.23,0.47,0.69,0.86,0.62,0.38,0.55,0.77,0.93,0.64,0.42,0.27,0.49,0.73,0.87,0.58,0.36,0.54,0.78,0.66,0.43,0.25,0.46,0.68,0.84,0.52]
    ),
    DemoTrack(
        id: 3,
        title: "Static Motion",
        artist: "Demo C · Referencia visual",
        bpm: 127,
        musicalKey: "Si menor",
        camelot: "10A",
        duration: "06:55",
        energy: 58,
        waveform: [0.14,0.25,0.39,0.52,0.34,0.21,0.45,0.61,0.42,0.28,0.49,0.72,0.53,0.32,0.18,0.37,0.58,0.76,0.49,0.29,0.43,0.65,0.48,0.31,0.17,0.36,0.56,0.69,0.47,0.27,0.41,0.63,0.46,0.30,0.19,0.38,0.57,0.73,0.51,0.33,0.45,0.67,0.49,0.29,0.16,0.35,0.55,0.71,0.48,0.28,0.42,0.64,0.47,0.30,0.18,0.37,0.59,0.74,0.50,0.32]
    )
]

struct ContentView: View {
    @State private var section: WorkspaceSection? = .library
    @State private var selectedTrackID = 1

    private var selectedTrack: DemoTrack {
        demoTracks.first(where: { $0.id == selectedTrackID }) ?? demoTracks[0]
    }

    var body: some View {
        NavigationSplitView {
            List(selection: $section) {
                Section("Biblioteca") {
                    Label("Biblioteca", systemImage: "music.note.list")
                        .tag(WorkspaceSection.library)
                }

                Section("Comparación") {
                    Label("Transición", systemImage: "arrow.left.arrow.right")
                        .tag(WorkspaceSection.transition)
                }

                Section("Próximamente") {
                    Label("Análisis", systemImage: "waveform.path")
                        .tag(WorkspaceSection.analysis)
                        .disabled(true)
                    Label("Tonalidades", systemImage: "circle.grid.3x3")
                        .tag(WorkspaceSection.keys)
                        .disabled(true)
                    Label("Organización", systemImage: "folder")
                        .tag(WorkspaceSection.organize)
                        .disabled(true)
                    Label("Exportación", systemImage: "square.and.arrow.up")
                        .tag(WorkspaceSection.export)
                        .disabled(true)
                }
            }
            .listStyle(.sidebar)
            .navigationTitle("Analizador")
            .navigationSplitViewColumnWidth(min: 180, ideal: 205)
        } detail: {
            Group {
                switch section ?? .library {
                case .library:
                    LibraryScreen(
                        selectedTrack: selectedTrack,
                        onSelectTrack: { selectedTrackID = $0.id },
                        onOpenTransition: { section = .transition }
                    )
                case .transition:
                    TransitionScreen()
                case .analysis, .keys, .organize, .export:
                    ComingSoonScreen(section: section ?? .analysis)
                }
            }
            .background(DemoPalette.background)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Text("PROTOTIPO VISUAL")
                        .font(.caption2.weight(.bold))
                        .tracking(1.2)
                        .foregroundStyle(DemoPalette.amber)
                }
            }
        }
        .navigationSplitViewStyle(.balanced)
        .preferredColorScheme(.dark)
    }
}

private struct LibraryScreen: View {
    let selectedTrack: DemoTrack
    let onSelectTrack: (DemoTrack) -> Void
    let onOpenTransition: () -> Void

    var body: some View {
        GeometryReader { geometry in
            ScrollView {
                VStack(alignment: .leading, spacing: 18) {
                    pageHeading

                    if geometry.size.width > 930 {
                        HStack(alignment: .top, spacing: 18) {
                            mainColumn
                                .frame(maxWidth: .infinity)
                            TrackInspector(track: selectedTrack, onOpenTransition: onOpenTransition)
                                .frame(width: 270)
                        }
                    } else {
                        mainColumn
                        TrackInspector(track: selectedTrack, onOpenTransition: onOpenTransition)
                    }
                }
                .padding(20)
                .frame(maxWidth: 1500)
                .frame(maxWidth: .infinity)
            }
        }
        .background(DemoPalette.background)
        .navigationTitle("Biblioteca")
    }

    private var pageHeading: some View {
        HStack(alignment: .center) {
            VStack(alignment: .leading, spacing: 4) {
                Text("Biblioteca musical")
                    .font(.largeTitle.bold())
                Text("Explora, analiza y compara tu colección local")
                    .font(.subheadline)
                    .foregroundStyle(DemoPalette.textMuted)
            }
            Spacer()
            Text("DATOS DE DEMOSTRACIÓN")
                .font(.caption2.weight(.bold))
                .tracking(0.8)
                .foregroundStyle(DemoPalette.amber)
                .padding(.horizontal, 10)
                .padding(.vertical, 7)
                .background(DemoPalette.amber.opacity(0.12), in: Capsule())
        }
    }

    private var mainColumn: some View {
        VStack(alignment: .leading, spacing: 16) {
            selectedTrackCard
            WaveformCard(track: selectedTrack)
            LibraryTable(selectedTrack: selectedTrack, onSelectTrack: onSelectTrack)
        }
    }

    private var selectedTrackCard: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                Label("PISTA SELECCIONADA", systemImage: "waveform")
                    .font(.caption.weight(.bold))
                    .tracking(1)
                    .foregroundStyle(DemoPalette.textMuted)
                Spacer()
                Text("MUESTRA")
                    .font(.caption2.weight(.bold))
                    .foregroundStyle(DemoPalette.amber)
            }

            HStack(alignment: .center, spacing: 16) {
                RoundedRectangle(cornerRadius: 14)
                    .fill(
                        LinearGradient(
                            colors: [DemoPalette.cyan.opacity(0.35), DemoPalette.violet.opacity(0.22)],
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                    )
                    .frame(width: 62, height: 62)
                    .overlay {
                        Image(systemName: "waveform")
                            .font(.title2)
                            .foregroundStyle(.white)
                    }

                VStack(alignment: .leading, spacing: 5) {
                    Text(selectedTrack.title)
                        .font(.title2.bold())
                    Text(selectedTrack.artist)
                        .font(.subheadline)
                        .foregroundStyle(DemoPalette.textMuted)
                }

                Spacer(minLength: 8)

                VStack(alignment: .trailing, spacing: 5) {
                    Text("\(selectedTrack.bpm) BPM")
                        .font(.headline.monospacedDigit())
                    Text(selectedTrack.camelot + " · " + selectedTrack.musicalKey)
                        .font(.subheadline)
                        .foregroundStyle(DemoPalette.cyan)
                }
            }
        }
        .padding(18)
        .background(DemoPalette.panel, in: RoundedRectangle(cornerRadius: 18))
        .overlay(RoundedRectangle(cornerRadius: 18).stroke(DemoPalette.border))
    }
}

private struct WaveformCard: View {
    let track: DemoTrack

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                Text("WAVEFORM")
                    .font(.caption.weight(.bold))
                    .tracking(1)
                    .foregroundStyle(DemoPalette.textMuted)
                Spacer()
                Text("PISTA COMPLETA · SIMULADA")
                    .font(.caption2)
                    .foregroundStyle(DemoPalette.amber)
            }

            WaveformPlot(amplitudes: track.waveform, tint: DemoPalette.cyan)
                .frame(height: 86)

            HStack {
                Text("00:00")
                Spacer()
                Text(track.duration)
            }
            .font(.caption.monospacedDigit())
            .foregroundStyle(DemoPalette.textMuted)

            HStack(spacing: 8) {
                Image(systemName: "info.circle")
                Text("La forma de onda real se calculará desde el MP3 local.")
            }
            .font(.caption)
            .foregroundStyle(DemoPalette.textMuted)
        }
        .padding(18)
        .background(DemoPalette.panel, in: RoundedRectangle(cornerRadius: 18))
        .overlay(RoundedRectangle(cornerRadius: 18).stroke(DemoPalette.border))
    }
}

private struct LibraryTable: View {
    let selectedTrack: DemoTrack
    let onSelectTrack: (DemoTrack) -> Void

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                Text("COLECCIÓN")
                    .font(.caption.weight(.bold))
                    .tracking(1)
                    .foregroundStyle(DemoPalette.textMuted)
                Spacer()
                Text("\(demoTracks.count) pistas de ejemplo")
                    .font(.caption)
                    .foregroundStyle(DemoPalette.textMuted)
            }

            HStack {
                Text("TÍTULO")
                Spacer()
                Text("BPM")
                    .frame(width: 55, alignment: .trailing)
                Text("KEY")
                    .frame(width: 76, alignment: .trailing)
                Text("DURACIÓN")
                    .frame(width: 72, alignment: .trailing)
            }
            .font(.caption2.weight(.bold))
            .foregroundStyle(DemoPalette.textMuted)
            .padding(.horizontal, 10)

            ForEach(demoTracks) { track in
                Button {
                    onSelectTrack(track)
                } label: {
                    HStack(spacing: 10) {
                        VStack(alignment: .leading, spacing: 3) {
                            Text(track.title)
                                .font(.subheadline.weight(.semibold))
                                .foregroundStyle(.white)
                            Text(track.artist)
                                .font(.caption)
                                .foregroundStyle(DemoPalette.textMuted)
                        }
                        Spacer(minLength: 8)
                        Text("\(track.bpm)")
                            .frame(width: 55, alignment: .trailing)
                        Text(track.camelot)
                            .frame(width: 76, alignment: .trailing)
                            .foregroundStyle(DemoPalette.cyan)
                        Text(track.duration)
                            .frame(width: 72, alignment: .trailing)
                    }
                    .font(.subheadline.monospacedDigit())
                    .padding(12)
                    .background(
                        selectedTrack.id == track.id ? DemoPalette.cyan.opacity(0.13) : DemoPalette.panel,
                        in: RoundedRectangle(cornerRadius: 12)
                    )
                    .overlay {
                        RoundedRectangle(cornerRadius: 12)
                            .stroke(selectedTrack.id == track.id ? DemoPalette.cyan.opacity(0.4) : DemoPalette.border)
                    }
                    .contentShape(RoundedRectangle(cornerRadius: 12))
                }
                .buttonStyle(.plain)
            }
        }
        .padding(16)
        .background(DemoPalette.panel.opacity(0.7), in: RoundedRectangle(cornerRadius: 18))
    }
}

private struct TrackInspector: View {
    let track: DemoTrack
    let onOpenTransition: () -> Void

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            VStack(alignment: .leading, spacing: 12) {
                Text("DATOS MUSICALES")
                    .font(.caption.weight(.bold))
                    .tracking(1)
                    .foregroundStyle(DemoPalette.textMuted)

                InspectorValue(title: "Tempo", value: "\(track.bpm) BPM")
                InspectorValue(title: "Tonalidad", value: track.musicalKey)
                InspectorValue(title: "Camelot", value: track.camelot)
                InspectorValue(title: "Duración", value: track.duration)

                Divider().overlay(DemoPalette.border)

                HStack {
                    Text("Energía de ejemplo")
                        .font(.subheadline)
                    Spacer()
                    Text("\(track.energy)%")
                        .font(.subheadline.monospacedDigit().bold())
                        .foregroundStyle(DemoPalette.cyan)
                }

                ProgressView(value: Double(track.energy), total: 100)
                    .tint(DemoPalette.cyan)

                Text("Valor ilustrativo; el mapa real se calculará por segmentos.")
                    .font(.caption)
                    .foregroundStyle(DemoPalette.textMuted)
            }
            .padding(16)
            .background(DemoPalette.panel, in: RoundedRectangle(cornerRadius: 18))
            .overlay(RoundedRectangle(cornerRadius: 18).stroke(DemoPalette.border))

            VStack(alignment: .leading, spacing: 10) {
                Text("SIGUIENTE PASO")
                    .font(.caption.weight(.bold))
                    .tracking(1)
                    .foregroundStyle(DemoPalette.textMuted)
                Text("Compara esta pista con otra para revisar una posible transición.")
                    .font(.subheadline)
                    .foregroundStyle(DemoPalette.textMuted)

                Button(action: onOpenTransition) {
                    Label("Comparar transición", systemImage: "arrow.left.arrow.right")
                        .font(.subheadline.weight(.semibold))
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 12)
                }
                .buttonStyle(.borderedProminent)
                .tint(DemoPalette.cyan)
            }
            .padding(16)
            .background(DemoPalette.panel, in: RoundedRectangle(cornerRadius: 18))
            .overlay(RoundedRectangle(cornerRadius: 18).stroke(DemoPalette.border))
        }
    }
}

private struct InspectorValue: View {
    let title: String
    let value: String

    var body: some View {
        HStack {
            Text(title)
                .foregroundStyle(DemoPalette.textMuted)
            Spacer()
            Text(value)
                .fontWeight(.medium)
        }
        .font(.subheadline)
    }
}

private struct TransitionScreen: View {
    @State private var candidateID = 2
    @State private var showAlternatives = false

    private let trackA = demoTracks[0]

    private var trackB: DemoTrack {
        demoTracks.first(where: { $0.id == candidateID }) ?? demoTracks[1]
    }

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 18) {
                VStack(alignment: .leading, spacing: 5) {
                    Text("Comparación de transición")
                        .font(.largeTitle.bold())
                    Text("Revisa dos canciones y una ventana sugerida de salida y entrada.")
                        .font(.subheadline)
                        .foregroundStyle(DemoPalette.textMuted)
                }

                HStack {
                    Label("DATOS SIMULADOS", systemImage: "info.circle")
                        .font(.caption.weight(.bold))
                        .tracking(0.8)
                        .foregroundStyle(DemoPalette.amber)
                    Spacer()
                    Picker("Candidata B", selection: $candidateID) {
                        ForEach(demoTracks.filter { $0.id != trackA.id }) { track in
                            Text(track.title).tag(track.id)
                        }
                    }
                    .pickerStyle(.menu)
                    .tint(DemoPalette.cyan)
                }

                HStack(spacing: 12) {
                    TransitionTrackCard(track: trackA, label: "PISTA A · REFERENCIA", tint: DemoPalette.cyan)
                    TransitionTrackCard(track: trackB, label: "PISTA B · CANDIDATA", tint: DemoPalette.violet)
                }

                VStack(alignment: .leading, spacing: 16) {
                    HStack {
                        Text("VENTANA DE TRANSICIÓN")
                            .font(.caption.weight(.bold))
                            .tracking(1)
                            .foregroundStyle(DemoPalette.textMuted)
                        Spacer()
                        Text("VISTA COMPARATIVA")
                            .font(.caption2)
                            .foregroundStyle(DemoPalette.textMuted)
                    }

                    TransitionLane(
                        track: trackA,
                        tint: DemoPalette.cyan,
                        markerPosition: 0.76,
                        markerLabel: "SALIDA ESTIMADA A"
                    )

                    Rectangle()
                        .fill(DemoPalette.border)
                        .frame(height: 1)

                    TransitionLane(
                        track: trackB,
                        tint: DemoPalette.violet,
                        markerPosition: 0.28,
                        markerLabel: "ENTRADA SUGERIDA B"
                    )

                    HStack(spacing: 8) {
                        Circle().fill(DemoPalette.cyan).frame(width: 8, height: 8)
                        Text("Pista A")
                        Spacer()
                        Circle().fill(DemoPalette.violet).frame(width: 8, height: 8)
                        Text("Pista B")
                        Spacer()
                        Rectangle().fill(DemoPalette.amber).frame(width: 2, height: 13)
                        Text("Marcador")
                    }
                    .font(.caption)
                    .foregroundStyle(DemoPalette.textMuted)
                }
                .padding(18)
                .background(DemoPalette.panel, in: RoundedRectangle(cornerRadius: 18))
                .overlay(RoundedRectangle(cornerRadius: 18).stroke(DemoPalette.border))

                CompatibilityCard(trackA: trackA, trackB: trackB)

                Button {
                    showAlternatives.toggle()
                } label: {
                    Label(
                        showAlternatives ? "Ocultar alternativas" : "Ver otras candidatas",
                        systemImage: "list.bullet"
                    )
                    .font(.subheadline.weight(.semibold))
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 12)
                }
                .buttonStyle(.bordered)
                .tint(DemoPalette.cyan)

                if showAlternatives {
                    VStack(alignment: .leading, spacing: 8) {
                        Text("OTRAS OPCIONES DE DEMOSTRACIÓN")
                            .font(.caption.weight(.bold))
                            .tracking(1)
                            .foregroundStyle(DemoPalette.textMuted)

                        ForEach(demoTracks.filter { $0.id != trackA.id && $0.id != candidateID }) { track in
                            Button {
                                candidateID = track.id
                            } label: {
                                HStack {
                                    VStack(alignment: .leading, spacing: 3) {
                                        Text(track.title)
                                            .foregroundStyle(.white)
                                        Text("\(track.bpm) BPM · \(track.camelot)")
                                            .font(.caption)
                                            .foregroundStyle(DemoPalette.textMuted)
                                    }
                                    Spacer()
                                    Image(systemName: "arrow.up.left")
                                        .foregroundStyle(DemoPalette.cyan)
                                }
                                .padding(12)
                                .background(DemoPalette.panel, in: RoundedRectangle(cornerRadius: 12))
                            }
                            .buttonStyle(.plain)
                        }
                    }
                }

                Text("Los marcadores y la compatibilidad son ilustrativos. El análisis real deberá calcularlos y mostrar su confianza.")
                    .font(.caption)
                    .foregroundStyle(DemoPalette.textMuted)
                    .padding(.top, 4)
            }
            .padding(20)
            .frame(maxWidth: 1200)
            .frame(maxWidth: .infinity)
        }
        .background(DemoPalette.background)
        .navigationTitle("Transición")
    }
}

private struct TransitionTrackCard: View {
    let track: DemoTrack
    let label: String
    let tint: Color

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(label)
                .font(.caption2.weight(.bold))
                .tracking(0.7)
                .foregroundStyle(DemoPalette.textMuted)
            Text(track.title)
                .font(.headline)
                .lineLimit(1)
            Text("\(track.bpm) BPM · \(track.camelot) · \(track.musicalKey)")
                .font(.caption)
                .foregroundStyle(tint)
                .lineLimit(1)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(14)
        .background(DemoPalette.panel, in: RoundedRectangle(cornerRadius: 14))
        .overlay(RoundedRectangle(cornerRadius: 14).stroke(tint.opacity(0.3)))
    }
}

private struct TransitionLane: View {
    let track: DemoTrack
    let tint: Color
    let markerPosition: CGFloat
    let markerLabel: String

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                Text(track.title)
                    .font(.subheadline.weight(.semibold))
                Spacer()
                Text(track.duration)
                    .font(.caption.monospacedDigit())
                    .foregroundStyle(DemoPalette.textMuted)
            }

            WaveformPlot(
                amplitudes: track.waveform,
                tint: tint,
                markerPosition: markerPosition,
                markerTint: DemoPalette.amber
            )
            .frame(height: 72)

            HStack {
                Text("00:00")
                Spacer()
                Text(markerLabel)
                    .fontWeight(.bold)
                    .foregroundStyle(DemoPalette.amber)
                Spacer()
                Text(track.duration)
            }
            .font(.caption2.monospacedDigit())
            .foregroundStyle(DemoPalette.textMuted)
        }
    }
}

private struct CompatibilityCard: View {
    let trackA: DemoTrack
    let trackB: DemoTrack

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                Text("LECTURA DE COMPATIBILIDAD")
                    .font(.caption.weight(.bold))
                    .tracking(1)
                    .foregroundStyle(DemoPalette.textMuted)
                Spacer()
                Text("EJEMPLO")
                    .font(.caption2.weight(.bold))
                    .foregroundStyle(DemoPalette.amber)
            }

            HStack {
                Text("Relación tonal")
                Spacer()
                Text("\(trackA.camelot) → \(trackB.camelot)")
                    .foregroundStyle(DemoPalette.cyan)
            }
            HStack {
                Text("Diferencia de tempo")
                Spacer()
                Text("\(abs(trackA.bpm - trackB.bpm)) BPM")
            }
            HStack {
                Text("Frases y estructura")
                Spacer()
                Text("Pendiente de análisis")
                    .foregroundStyle(DemoPalette.amber)
            }
            HStack {
                Text("Evolución de energía")
                Spacer()
                Text("Comparación pendiente")
                    .foregroundStyle(DemoPalette.amber)
            }

            Divider().overlay(DemoPalette.border)

            Label("No se asigna una puntuación real en esta demostración.", systemImage: "exclamationmark.circle")
                .font(.caption)
                .foregroundStyle(DemoPalette.textMuted)
        }
        .font(.subheadline)
        .padding(18)
        .background(DemoPalette.panel, in: RoundedRectangle(cornerRadius: 18))
        .overlay(RoundedRectangle(cornerRadius: 18).stroke(DemoPalette.border))
    }
}

private struct WaveformPlot: View {
    let amplitudes: [CGFloat]
    let tint: Color
    var markerPosition: CGFloat? = nil
    var markerTint: Color = .white

    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                Canvas { context, size in
                    guard !amplitudes.isEmpty else { return }
                    let step = size.width / CGFloat(amplitudes.count)

                    for index in amplitudes.indices {
                        let amplitude = min(max(amplitudes[index], 0.04), 1)
                        let barHeight = amplitude * size.height * 0.88
                        let barWidth = max(1, step * 0.58)
                        let rect = CGRect(
                            x: CGFloat(index) * step + step * 0.21,
                            y: (size.height - barHeight) / 2,
                            width: barWidth,
                            height: barHeight
                        )
                        let path = Path(roundedRect: rect, cornerRadius: barWidth / 2)
                        context.fill(path, with: .color(tint.opacity(0.92)))
                    }
                }

                if let markerPosition {
                    Rectangle()
                        .fill(markerTint)
                        .frame(width: 2)
                        .offset(x: min(max(0, geometry.size.width * markerPosition), geometry.size.width - 2))
                }
            }
        }
    }
}

private struct ComingSoonScreen: View {
    let section: WorkspaceSection

    var body: some View {
        VStack(spacing: 12) {
            Image(systemName: "square.stack.3d.up")
                .font(.system(size: 34))
                .foregroundStyle(DemoPalette.cyan)
            Text(section.rawValue)
                .font(.title.bold())
            Text("Esta sección se conectará después de validar el shell visual y la biblioteca local.")
                .font(.subheadline)
                .foregroundStyle(DemoPalette.textMuted)
                .multilineTextAlignment(.center)
                .frame(maxWidth: 420)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(DemoPalette.background)
        .navigationTitle(section.rawValue)
    }
}

#Preview {
    ContentView()
}
