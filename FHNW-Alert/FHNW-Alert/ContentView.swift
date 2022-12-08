//
//  ContentView.swift
//  FHNW-Alert
//
//  Created by Ingo Boehme on 08.12.22.
//

import SwiftUI

// MARK: - ContentView

struct ContentView: View {
    @State private var showAlert = false
    @State private var showAlert2 = false
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)

            Text("Hello, world!")
                .padding(.bottom, 48)

            Button("Show alert") {
                showAlert.toggle()
            }
            .alert(isPresented: $showAlert) {
                Alert(title: Text("I am the title"),
                      message: Text("I am the message"),
                      dismissButton: .destructive(Text("Destructive")))
            }

            Button("Show alert with two buttons") {
                showAlert2.toggle()
            }
            .alert(isPresented: $showAlert2) {
                Alert(title: Text("Title for 2 buttons"),
                      primaryButton: .default(Text("Default")),
                      secondaryButton: .destructive(Text("Kaputt")) {
                          print("Make it KAPUTTTTTTT")
                      })
            }

        }

        .padding()
    }
}

// MARK: - ContentView_Previews

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
