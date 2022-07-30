//
//  ContentView.swift
//  WeSplit
//
//  Created by Yigit on 30.07.2022.
//

import SwiftUI

struct ContentView: View {
    @FocusState private var amountIsFocused: Bool
    @State private var checkAmount = 0.0
    @State private var numberOfPeople = 2
    @State private var tipPercantage = 20
    
    let localCurrency: FloatingPointFormatStyle<Double>.Currency = .currency(code: Locale.current.currencyCode ?? "USD")
    
    var totalPerPerson: Double {
        let peopleCount = Double(numberOfPeople + 2)
        let tipSelection = Double(tipPercantage)
        
        let tipValue = checkAmount / 100 * tipSelection
        let grandTotal = checkAmount + tipValue
        let amountPerPerson = grandTotal / peopleCount
        
        return amountPerPerson
    }
    
    var grandTotal: Double {
        checkAmount + (checkAmount / 100 * Double(tipPercantage))
    }
    
    var body: some View {
        NavigationView{
            Form{
                Section{
                    TextField("Amount", value: $checkAmount, format: localCurrency)
                        .keyboardType(.decimalPad)
                        .focused($amountIsFocused)
                    Picker("Number of People", selection: $numberOfPeople){
                        ForEach(2..<100){
                            Text("\($0) people")
                        }
                    }
                }
                Section{
                    Picker("Tip Percantage", selection: $tipPercantage){
                        ForEach(0..<101) {
                            Text($0, format: .percent)
                        }
                    }
                } header:{
                    Text("How much tıp do you want to leave?")
                }
                Section{
                    Text(grandTotal, format: localCurrency)
                } header:{
                    Text("Total Amount Including Tip")
                }
                Section{
                    Text(totalPerPerson, format: localCurrency)
                } header:{
                    Text("Amount per person")
                }
                
            }
            .navigationTitle("WeSplit 🤑")
            .toolbar{
                ToolbarItemGroup(placement: .keyboard){
                    Spacer()
                    Button("Done"){
                        amountIsFocused = false
                    }
                }
            }
        }
}
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
