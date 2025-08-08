import SwiftUI

struct UrunIcerikView: View {
    @Environment(\.dismiss) var dismiss
    let urun: Urun

    var body: some View {
        
        //yazıları yazar
        VStack {
            HStack {
                
                Text(urun.isim.uppercased())
                    .font(.headline)
                    .fontWeight(.semibold)
                
                //sayfa kapama duğmesi
                Button {
                    dismiss()
                } label: {
                    Image(systemName: "arrow.down.circle.fill")
                        .imageScale(.large)
                        .fontWeight(.bold)
                        .foregroundColor(.red)
                }

            }

            // Alt satır: Marka (sol alt), Fiyat (sağ alt)
            HStack {
                Text(urun.marka.uppercased())
               // Spacer()
                Text("| \(urun.fiyat) TL")
            }
        }
    
    //resimleri sıralar
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



#Preview {
    UrunIcerikView(urun: MockData.urun[1])
}
