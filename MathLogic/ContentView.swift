//
//  ContentView.swift
//  MathLogic
//
//  Created by mark me on 1/9/23.
//

import SwiftUI

struct ContentView: View {
    @State var num1 = Int.random(in: 1...10)
    @State var num2 = Int.random(in: 1...10)
    @State var num3 = Int.random(in: 1...10)
    @State var num4 = Int.random(in: 1...10)
    @State var result = 0
    @State var score = 0
    @State var message = ""
    @State var showAlert = false
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("What is the result of the following equation?")) {
                    Text("\(num1) - \(num2) + \(num3) ✕ \(num4) = ?")
                }
                
                Section(header: Text("Enter your answer:")) {
                    TextField("Result", value: $result, formatter: NumberFormatter())
                        .keyboardType(.numberPad)
                    
                }
                
                Section(header: Text("Your score is: \(score)")) {
                    Button(action: {
                        if self.result == (self.num1 - self.num2 + num3 * self.num4) {
                            self.score += 1
                            self.message = "Correct! Your score is now \(self.score)"
                        } else {
                            self.score -= 1
                            self.message = "Incorrect. The correct answer is \(self.num1 - self.num2 + self.num3 * self.num4). Your score is now \(self.score)"
                        }
                        self.num1 = Int.random(in: 1...10)
                        self.num2 = Int.random(in: 1...10)
                        self.num3 = Int.random(in: 1...10)
                        self.num4 = Int.random(in: 1...10)
                        self.result = 0
                        self.showAlert = true
                    }) {
                        Text("Check Answer")
                    }
                }
            }
            .navigationBarTitle("Math Equation")
            .alert(isPresented: $showAlert) {
                Alert(title: Text(self.message))
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        
    }
    
}
