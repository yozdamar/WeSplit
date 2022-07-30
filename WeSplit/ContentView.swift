//
//  ContentView.swift
//  WeSplit
//
//  Created by Yigit on 30.07.2022.
//

import SwiftUI

struct ContentView: View {
    @State private var tapCount = 0
    @State private var name = ""
    let students = ["Harry", "Ron", "Harmonie"]
    @State private var selectedStudent = "Harry"
    var body: some View {
        NavigationView {
            Form{
                Section{
                    Text("Text Number 1")
                    Text("Text Number 2")
                    Text("Text Number 3")
                    Group{
                        Text("Text Number 4")
                    }
                }
                Section{
                    Text("Here is another section")
                }
                .navigationTitle("SwiftUI")
                .navigationBarTitleDisplayMode(.inline)
                Button("Tap Count: \(tapCount)"){
                    tapCount += 1
                }
                TextField("Enter Your Name", text: $name)
                Text("Your name is \(name)")
                Section{
                    Picker("Select your student", selection: $selectedStudent){
                        ForEach(students, id: \.self){
                            Text($0)
                        }
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
