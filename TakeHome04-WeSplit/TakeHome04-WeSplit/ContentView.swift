//
//  ContentView.swift
//  TakeHome04-WeSplit
//
//  Created by Tri Nguyen on 10/13/24.
//

import SwiftUI

struct ContentView: View {
    @State var amount = 0.0
    @State var amountPeople = 1.0
    @State var startTip = "0%"
    
    let tips = ["0%","10%", "15%", "18%", "20%"]
    
    var totalAmount: Double {
        switch startTip {
        case "0%":
            return amount
        case "10%":
            return amount * 1.10
        case "15%":
            return amount * 1.15
        case "18%":
            return amount * 1.18
        default:
            return amount * 1.20
        }
    }
    
    var amountPerPerson: Double {
        switch startTip {
        case "0%":
            return amount / amountPeople
        case "10%":
            return amount / amountPeople * 1.10
        case "15%":
            return amount / amountPeople * 1.15
        case "18%":
            return amount / amountPeople * 1.18
        default:
            return amount / amountPeople * 1.20
        }
    }
    
    var body: some View {
        NavigationStack{
            Form {
                TextField("Amount", value: $amount, format: .number)
                TextField("Number of people", value: $amountPeople, format: .number)
                Section("How much tip do you want to leave?") {
                    Picker("Tip Values", selection: $startTip) {
                        ForEach(tips, id: \.self) { tips in Text(tips)
                        }
                    } .pickerStyle(.segmented)
                }
                Section("Check total with tip") {
                    Text("$\(totalAmount, specifier: "%.2f")")
                }
                Section("Amount per person") {
                    Text("$\(amountPerPerson, specifier: "%.2f")")
                }
            }
            .navigationTitle("WeSplit")
        }
    }
}

#Preview {
    ContentView()
}
