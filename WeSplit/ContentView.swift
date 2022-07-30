//
//  ContentView.swift
//  WeSplit
//
//  Created by Yigit on 30.07.2022.
//

import SwiftUI

struct ContentView: View {
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
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
