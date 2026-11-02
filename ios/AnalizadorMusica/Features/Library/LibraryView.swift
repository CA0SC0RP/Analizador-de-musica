import SwiftUI

struct LibraryView: View {
    @State private var tracks = MusicTrack.previewLibrary
    @State private var selectedTrackID: UUID?
    @State private var searchText = ""

    private var selectedTrack: MusicTrack {
        tracks.first(where: { $0.id == selectedTrackID }) ?? tracks[0]
    }

    private var filteredTracks: [MusicTrack] {
        guard !searchText.isEmpty else { return tracks }
        return tracks.filter {
            $0.title.localizedCaseInsensitiveContains(searchText) ||
            $0.artist.localizedCaseInsensitiveContains(searchText) ||
            $0.genre.localizedCaseInsensitiveContains(searchText)
        }
    }

    var body: some View {
        VStack(spacing: 18) {
            header
            HStack(alignment: .top, spacing: 16) {
                VStack(spacing: 16) {
                    TrackOverviewCard(track: selectedTrack)
                    WaveformPanel(track: selectedTrack)
                    libraryTable
                }
                .frame(maxWidth: .infinity, alignment: .topLeading)

                VStack(spacing: 16) {
                    PlayerPanel(track: selectedTrack)
                    FrequencySummaryPanel()
                    CompatibilityPanel(track: selectedTrack)
                }
                .frame(width: 265)
            }
        }
        .padding(22)
        .background(StudioTheme.background)
        .onAppear {
            if selectedTrackID == nil { selectedTrackID = tracks.first?.id }
        }
    }

    private var header: some View {
        HStack(alignment: .center) {
            VStack(alignment: .leading, spacing: 5) {
                Eyebrow(title: "Music workspace")
                Text("Biblioteca")
                    .font(.system(size: 29, weight: .bold, design: .rounded))
                    .foregroundStyle(StudioTheme.text)
            }
            Spacer()
            HStack(spacing: 8) {
                Image(systemName: "magnifyingglass")
                    .foregroundStyle(StudioTheme.muted)
                TextField("Buscar pista, artista o género", text: $searchText)
                    .font(.system(size: 13))
                    .textFieldStyle(.plain)
                    .frame(width: 210)
            }
            .padding(.horizontal, 12)
            .padding(.vertical, 10)
            .background(StudioTheme.surface, in: RoundedRectangle(cornerRadius: 11))
            Button {} label: {
                Label("Importar MP3", systemImage: "plus")
                    .font(.system(size: 12, weight: .bold))
                    .padding(.horizontal, 14)
                    .padding(.vertical, 11)
                    .background(StudioTheme.accent, in: RoundedRectangle(cornerRadius: 11))
                    .foregroundStyle(StudioTheme.background)
            }
            .buttonStyle(.plain)
            .disabled(true)
            .opacity(0.65)
            .accessibilityLabel("Importación aún no implementada")
        }
    }

    private var libraryTable: some View {
        VStack(spacing: 0) {
            HStack {
                Eyebrow(title: "Colección")
                Text("\(filteredTracks.count) pistas de demostración")
                    .font(.system(size: 11, weight: .medium))
                    .foregroundStyle(StudioTheme.muted)
                Spacer()
                Text("TÍTULO                         KEY       CAMELOT       DURACIÓN")
                    .font(.system(size: 9, weight: .bold, design: .monospaced))
                    .foregroundStyle(StudioTheme.muted)
            }
            .padding(16)

            Rectangle().fill(StudioTheme.line).frame(height: 1)

            ForEach(filteredTracks) { track in
                Button {
                    selectedTrackID = track.id
                } label: {
                    HStack(spacing: 10) {
                        RoundedRectangle(cornerRadius: 7)
                            .fill(StudioTheme.raised)
                            .frame(width: 34, height: 34)
                            .overlay {
                                Image(systemName: "waveform")
                                    .font(.system(size: 13))
                                    .foregroundStyle(StudioTheme.accent)
                            }
                        VStack(alignment: .leading, spacing: 3) {
                            Text(track.title)
                                .font(.system(size: 12, weight: .semibold))
                                .foregroundStyle(StudioTheme.text)
                            Text(track.artist + " · " + track.genre)
                                .font(.system(size: 10))
                                .foregroundStyle(StudioTheme.muted)
                        }
                        Spacer(minLength: 8)
                        Text(track.key)
                            .frame(width: 65, alignment: .leading)
                        Text(track.camelot)
                            .font(.system(size: 11, weight: .bold, design: .rounded))
                            .foregroundStyle(StudioTheme.accent)
                            .frame(width: 65, alignment: .leading)
                        Text(track.duration)
                            .monospacedDigit()
                            .frame(width: 55, alignment: .trailing)
                    }
                    .font(.system(size: 11, weight: .medium))
                    .foregroundStyle(StudioTheme.muted)
                    .padding(.horizontal, 16)
                    .padding(.vertical, 11)
                    .background(selectedTrackID == track.id ? StudioTheme.raised : .clear)
                    .contentShape(Rectangle())
                }
                .buttonStyle(.plain)
                Rectangle().fill(StudioTheme.line).frame(height: 1)
            }
        }
        .background(StudioTheme.surface, in: RoundedRectangle(cornerRadius: 16))
        .overlay(RoundedRectangle(cornerRadius: 16).stroke(StudioTheme.line, lineWidth: 1))
    }
}

private struct TrackOverviewCard: View {
    let track: MusicTrack

    var body: some View {
        VStack(alignment: .leading, spacing: 13) {
            HStack {
                Eyebrow(title: "Pista seleccionada")
                Spacer()
                Text("DEMO DATA")
                    .font(.system(size: 9, weight: .bold, design: .monospaced))
                    .foregroundStyle(StudioTheme.accent)
                    .padding(.horizontal, 8)
                    .padding(.vertical, 5)
                    .background(StudioTheme.accent.opacity(0.1), in: Capsule())
            }
            Text(track.title)
                .font(.system(size: 23, weight: .bold, design: .rounded))
                .foregroundStyle(StudioTheme.text)
            Text(track.artist + "  /  " + track.album)
                .font(.system(size: 12))
                .foregroundStyle(StudioTheme.muted)
            HStack(spacing: 9) {
                MetricPill(label: "KEY", value: track.key)
                MetricPill(label: "CAMELOT", value: track.camelot)
                MetricPill(label: "GENRE", value: track.genre)
                MetricPill(label: "BITRATE", value: track.bitrate)
            }
        }
        .padding(18)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(StudioTheme.panel())
    }
}

private struct MetricPill: View {
    let label: String
    let value: String

    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Eyebrow(title: label)
            Text(value)
                .font(.system(size: 12, weight: .semibold))
                .foregroundStyle(StudioTheme.text)
        }
        .padding(.horizontal, 10)
        .padding(.vertical, 8)
        .background(StudioTheme.raised, in: RoundedRectangle(cornerRadius: 9))
    }
}

private struct WaveformPanel: View {
    let track: MusicTrack

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                Eyebrow(title: "Waveform")
                Spacer()
                Text("FORMA DE ONDA ILUSTRATIVA · NO ES AUDIO ANALIZADO")
                    .font(.system(size: 8, weight: .bold, design: .monospaced))
                    .foregroundStyle(StudioTheme.muted)
            }
            Canvas { context, size in
                let count = 150
                let mid = size.height / 2
                for index in 0..<count {
                    let x = CGFloat(index) / CGFloat(count) * size.width
                    let envelope = 0.18 + 0.72 * abs(sin(Double(index) * 0.071) * cos(Double(index) * 0.019))
                    let height = CGFloat(envelope) * size.height * 0.42
                    let rect = CGRect(x: x, y: mid - height, width: 2, height: height * 2)
                    context.fill(Path(roundedRect: rect, cornerRadius: 1), with: .color(StudioTheme.accent.opacity(index < 38 ? 0.95 : 0.55)))
                }
                var playhead = Path()
                playhead.move(to: CGPoint(x: size.width * 0.26, y: 0))
                playhead.addLine(to: CGPoint(x: size.width * 0.26, y: size.height))
                context.stroke(playhead, with: .color(.white.opacity(0.8)), lineWidth: 1)
            }
            .frame(height: 78)
            HStack {
                Text("00:00")
                Spacer()
                Text(track.duration)
            }
            .font(.system(size: 10, weight: .medium, design: .monospaced))
            .foregroundStyle(StudioTheme.muted)
        }
        .padding(18)
        .background(StudioTheme.panel())
    }
}

private struct PlayerPanel: View {
    let track: MusicTrack

    var body: some View {
        VStack(alignment: .leading, spacing: 13) {
            Eyebrow(title: "Reproductor")
            HStack(spacing: 12) {
                Button {} label: {
                    Image(systemName: "play.fill")
                        .font(.system(size: 13, weight: .bold))
                        .foregroundStyle(StudioTheme.background)
                        .frame(width: 38, height: 38)
                        .background(StudioTheme.accent, in: Circle())
                }
                .disabled(true)
                VStack(alignment: .leading, spacing: 3) {
                    Text("Escucha local")
                        .font(.system(size: 12, weight: .semibold))
                        .foregroundStyle(StudioTheme.text)
                    Text("Motor pendiente")
                        .font(.system(size: 10))
                        .foregroundStyle(StudioTheme.muted)
                }
            }
            ProgressView(value: 0.26)
                .tint(StudioTheme.accent)
            HStack {
                Text("00:00")
                Spacer()
                Text(track.duration)
            }
            .font(.system(size: 9, design: .monospaced))
            .foregroundStyle(StudioTheme.muted)
        }
        .padding(16)
        .background(StudioTheme.panel())
    }
}

private struct FrequencySummaryPanel: View {
    private let bands: [(String, CGFloat)] = [("SUB", 0.68), ("LOW", 0.84), ("MID", 0.52), ("HIGH", 0.31)]

    var body: some View {
        VStack(alignment: .leading, spacing: 13) {
            HStack {
                Eyebrow(title: "Frequency analysis")
                Spacer()
                Image(systemName: "arrow.up.right.and.arrow.down.left")
                    .font(.system(size: 10, weight: .bold))
                    .foregroundStyle(StudioTheme.muted)
            }
            ForEach(0..<bands.count, id: \.self) { index in
                let band = bands[index]
                HStack(spacing: 9) {
                    Text(band.0)
                        .font(.system(size: 9, weight: .bold, design: .monospaced))
                        .foregroundStyle(StudioTheme.muted)
                        .frame(width: 34, alignment: .leading)
                    GeometryReader { proxy in
                        ZStack(alignment: .leading) {
                            Capsule().fill(StudioTheme.raised)
                            Capsule().fill(StudioTheme.secondaryAccent.opacity(0.85))
                                .frame(width: proxy.size.width * band.1)
                        }
                    }
                    .frame(height: 5)
                }
            }
            Text("Visualización de ejemplo")
                .font(.system(size: 9))
                .foregroundStyle(StudioTheme.muted)
        }
        .padding(16)
        .background(StudioTheme.panel())
    }
}

private struct CompatibilityPanel: View {
    let track: MusicTrack

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Eyebrow(title: "Compatibilidad")
            HStack(alignment: .firstTextBaseline) {
                Text(track.camelot)
                    .font(.system(size: 25, weight: .bold, design: .rounded))
                    .foregroundStyle(StudioTheme.accent)
                Text("Camelot")
                    .font(.system(size: 11))
                    .foregroundStyle(StudioTheme.muted)
            }
            Text("Las relaciones armónicas y sus explicaciones aparecerán aquí cuando exista análisis real.")
                .font(.system(size: 10))
                .foregroundStyle(StudioTheme.muted)
                .fixedSize(horizontal: false, vertical: true)
        }
        .padding(16)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(StudioTheme.panel())
    }
}
