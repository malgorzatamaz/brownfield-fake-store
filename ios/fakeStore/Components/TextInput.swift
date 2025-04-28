import SwiftUI

struct TextInput: View {
    // Properties for customization
    var label: String
    var placeholder: String
    var icon: String?
    @Binding var text: String

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(label)
                .font(.headline)
                .foregroundColor(.primary)
            HStack {
                if icon != nil {
                    Image(systemName: icon!)
                       .foregroundColor(.gray)
                }
                TextField("", text: $text, prompt: Text(placeholder).foregroundStyle(.gray))
                    .font(.body)
            }
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(Color.gray, lineWidth: 1)
            )
        }
        .padding()
    }
}

struct TextInput_Previews: PreviewProvider {
    @State static var text = "Your Name"

    static var previews: some View {
        TextInput(
            label: "Name *",
            placeholder: "Enter your name",
            icon: "person",
            text: $text
        )
        .previewLayout(.sizeThatFits)
        .padding()
    }
}
