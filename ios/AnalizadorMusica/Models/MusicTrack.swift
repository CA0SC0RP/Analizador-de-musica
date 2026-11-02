import Foundation

struct MusicTrack: Identifiable, Hashable {
    let id: UUID
    let title: String
    let artist: String
    let album: String
    let duration: String
    let key: String
    let camelot: String
    let genre: String
    let bitrate: String
    let isDemo: Bool

    init(
        id: UUID = UUID(),
        title: String,
        artist: String,
        album: String,
        duration: String,
        key: String,
        camelot: String,
        genre: String,
        bitrate: String,
        isDemo: Bool = true
    ) {
        self.id = id
        self.title = title
        self.artist = artist
        self.album = album
        self.duration = duration
        self.key = key
        self.camelot = camelot
        self.genre = genre
        self.bitrate = bitrate
        self.isDemo = isDemo
    }

    static let previewLibrary: [MusicTrack] = [
        MusicTrack(title: "Obsidian Current", artist: "Demo Artist", album: "Night Structures", duration: "06:42", key: "F minor", camelot: "4A", genre: "Minimal Techno", bitrate: "320 kbps"),
        MusicTrack(title: "Static Bloom", artist: "Demo Artist", album: "Night Structures", duration: "07:18", key: "A minor", camelot: "8A", genre: "Deep Techno", bitrate: "320 kbps"),
        MusicTrack(title: "Low Orbit", artist: "Demo Artist", album: "Signal Forms", duration: "05:56", key: "C major", camelot: "8B", genre: "Deep House", bitrate: "320 kbps"),
        MusicTrack(title: "Pressure Lines", artist: "Demo Artist", album: "Signal Forms", duration: "08:03", key: "D minor", camelot: "7A", genre: "Techno", bitrate: "320 kbps")
    ]
}
