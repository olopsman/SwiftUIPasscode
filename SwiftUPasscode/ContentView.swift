//
//  ContentView.swift
//  SwiftUPasscode
//
//  Created by Paulo Orquillo on 12/02/22.
//

import SwiftUI

struct ContentView: View {
    
    var digits: Int = 4
    var label = "Enter Passcode"
    
    var body: some View {
        ZStack {
            Color.black.opacity(0.8)
                .edgesIgnoringSafeArea(.all)
                
            
            VStack {
                Text("Enter Passcode")
                    .padding()
                ZStack {
                    HStack {
                        Spacer()
                        ForEach(0..<digits) { index in
                            Image(systemName: "circle")
                            Spacer()
                        }
                    }
                }
                .padding()
                
                VStack {
                    HStack {
                        ButtonView(number: 1)
                        Spacer()
                        ButtonView(number: 2)
                        Spacer()
                        ButtonView(number: 3)
                    }
                    HStack {
                        ButtonView(number: 4)
                        Spacer()
                        ButtonView(number: 5)
                        Spacer()
                        ButtonView(number: 6)
                    }
                    HStack {
                        ButtonView(number: 7)
                        Spacer()
                        ButtonView(number: 8)
                        Spacer()
                        ButtonView(number: 9)
                    }
                    HStack {
                        ButtonView(number: 0)

                    }
                }
                .padding()
                
                HStack {
                    Spacer()
                    Button(action: {
                        //
                        print("cancel")
                    }) {
                        Text("Cancel")
                    }
                }
                .padding()
            }
            .foregroundColor(.white)
        }.background(.ultraThinMaterial)

    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
