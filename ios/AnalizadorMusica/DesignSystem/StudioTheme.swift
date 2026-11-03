import SwiftUI

enum StudioTheme {
    static let background = Color(red: 0.035, green: 0.043, blue: 0.058)
    static let surface = Color(red: 0.075, green: 0.086, blue: 0.105)
    static let raised = Color(red: 0.105, green: 0.12, blue: 0.145)
    static let line = Color.white.opacity(0.075)
    static let accent = Color(red: 0.36, green: 0.82, blue: 0.72)
    static let secondaryAccent = Color(red: 0.53, green: 0.62, blue: 0.98)
    static let text = Color(red: 0.92, green: 0.94, blue: 0.97)
    static let muted = Color(red: 0.53, green: 0.58, blue: 0.66)

    static func panel(cornerRadius: CGFloat = 18) -> some View {
        RoundedRectangle(cornerRadius: cornerRadius, style: .continuous)
            .fill(surface)
            .overlay {
                RoundedRectangle(cornerRadius: cornerRadius, style: .continuous)
                    .stroke(line, lineWidth: 1)
            }
    }
}

struct Eyebrow: View {
    let title: String

    var body: some View {
        Text(title.uppercased())
            .font(.system(size: 10, weight: .bold, design: .rounded))
            .tracking(1.35)
            .foregroundStyle(StudioTheme.muted)
    }
}
