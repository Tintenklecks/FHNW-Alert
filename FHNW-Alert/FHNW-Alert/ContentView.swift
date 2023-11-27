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

    @State private var text = ""

    @State private var showError = false
    @State private var errorText = ""

    var body: some View {
        VStack {
            // MARK: - Button 1 -

            Button("Show alert") {
                showAlert.toggle()
            }.alert(isPresented: $showAlert) {
                Alert(title: Text("I am the title"),
                      message: Text("I am the message"),
                      dismissButton: .destructive(Text("Destructive")))
            }

            // MARK: - Button 2 -

            Button("Show alert with two buttons") {
                showAlert2.toggle()
            }.alert(isPresented: $showAlert2) {
                Alert(title: Text("Title for 2 buttons"),
                      primaryButton: .default(Text("Default")),
                      secondaryButton: .destructive(Text("Kaputt")) {
                          print("Make it KAPUTTTTTTT")
                      })
            }

            // MARK: - Button 3 -

            Divider()
                .padding()

            TextField("Enter some error text", text: $text, axis: .vertical)
                .padding()
                .background(Color.white)
                .cornerRadius(10)
                .overlay(RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.black, lineWidth: 0.5))
                .shadow(radius: 5)

            Button("Simulate change of error text") {
                errorText = text
            }.alert(isPresented: $showError) {
                Alert(title: Text("Error: "),
                      message: Text(errorText))
            }
        }
        .buttonStyle(BorderedProminentButtonStyle())

        .padding()
        .onChange(of: errorText) { newValue in
            showError = newValue != ""
        }
    }
}

// MARK: - ContentView_Previews

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
