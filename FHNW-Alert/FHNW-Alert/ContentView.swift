//
//  ContentView.swift
//  FHNW-Alert
//
//  Created by Ingo Boehme on 08.12.22.
//

import SwiftUI

// MARK: - ContentView

struct ContentView: View {
    @State private var showingSheet = false

    var body: some View {
        Button("Show Action Sheet") {
            showingSheet = true
        }
        .actionSheet(isPresented: $showingSheet) {
            ActionSheet(
                title: Text("Options"),
                message: Text("Choose an option"),
                buttons: [
                    .default(Text("Option 1")) { /* Action for Option 1 */ },
                    .default(Text("Option 2")) { /* Action for Option 2 */ },
                    .cancel() // This adds a cancel button
                ]
            )
        }
    }
}

// MARK: - ContentView_Previews

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
