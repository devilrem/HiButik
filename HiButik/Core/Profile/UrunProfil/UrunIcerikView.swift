import SwiftUI

struct UrunIcerikView: View {
    @Environment(\.dismiss) var dismiss
    let urun: Urun

    var body: some View {
        VStack(spacing: 8) {
            // Üst satır: isim ortada, kapatma butonu sağda
            HStack {
                Spacer()

                Text(urun.isim.uppercased())
                    .font(.headline)
                    .fontWeight(.semibold)
                    .offset(x: 20) // Sağa kaydırma miktarı (deneme ile ayarla)

                Spacer()

                Button {
                    dismiss()
                } label: {
                    Image(systemName: "multiply.circle")
                        .fontWeight(.bold)
                        .imageScale(.large)
                        .foregroundColor(.red)
                        .padding(.trailing)
                }
            }

            // Alt satır: marka ve fiyat ortada yan yana
            HStack(spacing: 4) {
                Spacer()
                Text(urun.marka.uppercased())
                Text("| \(urun.fiyat) TL")
                Spacer()
            }

            // Resimler
            ScrollView {
                VStack(spacing: 16) {
                    ForEach(urun.profileImageURLs, id: \.self) { imageName in
                        Image(imageName)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .cornerRadius(8)
                            .shadow(radius: 4)
                            .padding(.horizontal)
                    }
                }
                .padding(.vertical)
            }
        }
    }
}

#Preview {
    UrunIcerikView(urun: MockData.urun[1])
}
