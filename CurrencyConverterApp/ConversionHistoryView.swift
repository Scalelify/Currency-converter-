import SwiftUI

struct ConversionHistoryView: View {
    let history: [String]
    
    var body: some View {
        List(history, id: \.self) { entry in
            Text(entry)
        }
        .navigationTitle("Conversion History")
    }
}

struct ConversionHistoryView_Previews: PreviewProvider {
    static var previews: some View {
        ConversionHistoryView(history: ["100 USD = 85.00 EUR", "50 GBP = 57.50 EUR"])
    }
}