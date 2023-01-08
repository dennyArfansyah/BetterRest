//
//  ContentView.swift
//  BetterRest
//
//  Created by Denny Arfansyah on 07/01/23.
//

import CoreML
import SwiftUI

struct ContentView: View {
    @State private var stepAmount = 8.0
    @State private var selectionDate = Date.now
    let tomorrow = Date.now.addingTimeInterval(86400)
    
    var body: some View {
        NavigationView {
            VStack {
                Stepper("\(stepAmount.formatted()) hour", value: $stepAmount, in: 4...12, step: 0.5)
                    .padding()
                DatePicker("Please enter a date", selection: $selectionDate, in: Date.now...tomorrow, displayedComponents: .date)
                    .padding()
                Text(Date.now.formatted(date: .complete, time: .complete))
            }
            .padding()
            .navigationTitle("BetterRest")
            .toolbar {
                Button("Tapp Me", action: calculateBedtime)
            }
        }
    }
    
    private func calculateBedtime() {
        do {
            let config = MLModelConfiguration()
            let model = try SleepCalculator(configuration: config)
            let component = Calendar.current.dateComponents([.hour, .minute], from: selectionDate)
            
            // more code
        } catch {
            // got some error
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
