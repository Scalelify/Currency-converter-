import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = CurrencyConverterViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                TextField("Amount", text: $viewModel.amount)
                    .keyboardType(.decimalPad)
                    .padding()
                    .border(Color.gray)
                
                Picker("From", selection: $viewModel.fromCurrency) {
                    ForEach(viewModel.currencies, id: \.self) { currency in
                        Text(currency)
                    }
                }
                .pickerStyle(MenuPickerStyle())
                
                Picker("To", selection: $viewModel.toCurrency) {
                    ForEach(viewModel.currencies, id: \.self) { currency in
                        Text(currency)
                    }
                }
                .pickerStyle(MenuPickerStyle())
                
                Button("Convert") {
                    viewModel.convert()
                }
                .padding()
                
                if let result = viewModel.result {
                    Text("Result: \(result)")
                        .padding()
                }
                
                NavigationLink("View History", destination: ConversionHistoryView(history: viewModel.history))
                    .padding()
            }
            .padding()
            .navigationTitle("Currency Converter")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}