import Foundation
import Combine

class CurrencyConverterViewModel: ObservableObject {
    @Published var amount: String = ""
    @Published var fromCurrency: String = "USD"
    @Published var toCurrency: String = "EUR"
    @Published var result: String?
    @Published var history: [String] = []
    
    let currencies = ["USD", "EUR", "GBP", "JPY", "AUD"]
    
    private var cancellables = Set<AnyCancellable>()
    
    func convert() {
        guard let amountValue = Double(amount) else {
            result = "Invalid amount"
            return
        }
        
        // Simulate an API call to get exchange rate
        let exchangeRate = 0.85 // This should be fetched from a real API
        
        let convertedAmount = amountValue * exchangeRate
        result = String(format: "%.2f", convertedAmount)
        
        let historyEntry = "\(amount) \(fromCurrency) = \(result!) \(toCurrency)"
        history.append(historyEntry)
    }
}