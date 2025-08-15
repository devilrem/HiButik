import SwiftUI

// MARK: - Simple ViewModel (LOCAL ONLY)
@MainActor
final class SimpleSearchViewModel: ObservableObject {
    @Published var allProducts: [Urun] = []   // All products (injected)
    @Published var filtered: [Urun] = []      // Filtered results

    init(all: [Urun]) {
        self.allProducts = all
        self.filtered = all                   // Show all initially
    }

    /// Filter by name or brand (case-insensitive)
    func applySearch(_ text: String) {
        let q = text.trimmingCharacters(in: .whitespacesAndNewlines).lowercased()
        guard !q.isEmpty else {
            filtered = allProducts
            return
        }
        filtered = allProducts.filter { urun in
            urun.isim.lowercased().contains(q)
            || urun.marka.lowercased().contains(q)   // marka is NON-OPTIONAL
        }
    }
}

// MARK: - Simple Search View
struct SimpleSearchView: View {
    @StateObject private var vm: SimpleSearchViewModel
    @State private var searchText: String = ""   // bound to .searchable

    // Inject product list (e.g., MockData.urun)
    init(allProducts: [Urun]) {
        _vm = StateObject(wrappedValue: SimpleSearchViewModel(all: allProducts))
    }

    var body: some View {
        NavigationStack {
            // ✅ DIRECT if/else (no Group) so both branches are understood by ViewBuilder
            if vm.filtered.isEmpty {
                // Empty state
                VStack(spacing: 10) {
                    Image(systemName: "magnifyingglass")
                        .imageScale(.large)
                        .font(.system(size: 28))
                        .foregroundStyle(.secondary)
                    Text("Sonuç bulunamadı")
                        .font(.headline)
                    Text("Arama terimini değiştirin.")
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                }
                .padding(.top, 40)
                .navigationTitle("Ara")
                .navigationBarTitleDisplayMode(.inline)
            } else {
                // Results list
                List(vm.filtered, id: \.id) { urun in
                    NavigationLink {
                        UrunIcerikView(urun: urun)
                    } label: {
                        rowView(for: urun) // extracted for clarity
                    }
                }
                .listStyle(.plain)
                .navigationTitle("Ara")
                .navigationBarTitleDisplayMode(.inline)
            }
        }
        // iOS search field
        .searchable(text: $searchText, prompt: "Ürün veya marka ara")
        .onChange(of: searchText) { _, newValue in
            vm.applySearch(newValue)
        }
    }

    // MARK: - Row UI (Image + name/brand + price)
    @ViewBuilder
    private func rowView(for urun: Urun) -> some View {
        HStack(spacing: 12) {
            // First image (simple local asset version)
            if let first = urun.profileImageURLs.first {
                Image(first)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 60, height: 60)
                    .clipped()
                    .cornerRadius(8)
            } else {
                // Placeholder if no image
                RoundedRectangle(cornerRadius: 8)
                    .fill(Color.gray.opacity(0.15))
                    .frame(width: 60, height: 60)
                    .overlay(Image(systemName: "photo").foregroundStyle(.secondary))
            }

            VStack(alignment: .leading, spacing: 4) {
                Text(urun.isim.uppercased())
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .lineLimit(1)

                if !urun.marka.isEmpty {
                    Text(urun.marka.uppercased())
                        .font(.caption)
                        .foregroundStyle(.secondary)
                }
            }

            Spacer()

            Text("\(urun.fiyat) TL")
                .font(.footnote)
                .foregroundStyle(.secondary)
        }
        .contentShape(Rectangle()) // Makes the whole row tappable
    }
}

// MARK: - Preview
#Preview {
    SimpleSearchView(allProducts: MockData.urun)
}
