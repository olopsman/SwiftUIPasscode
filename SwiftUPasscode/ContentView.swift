//
//  ContentView.swift
//  SwiftUPasscode
//
//  Created by Paulo Orquillo on 13/02/22.
//

import SwiftUI

struct ContentView: View {
    @State private var displayPasscode = false
    var body: some View {
        Button(action: {
            displayPasscode.toggle()
        }) {
            Text("Set Passcode")
        }
        .sheet(isPresented: $displayPasscode) {
            PasscodeView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
