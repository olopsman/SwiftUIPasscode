//
//  ContentView.swift
//  SwiftUPasscode
//
//  Created by Paulo Orquillo on 12/02/22.
//

import SwiftUI

struct ContentView: View {
    //MARK: Properties
    let numberPad = (1...9).map {"\($0)"}
    @State private var pin: [String] = []
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    //MARK: Helper methods
    func addPin(_ item: String) {
        if pin.count < 4 {
            pin.append(item)
        } else {
            //replacement with matching logic
            pin[3] = item
        }
    }
    
    func deletePin() {
        if pin.count > 0 {
            pin.remove(at: pin.count - 1)
        }
    }
        
    var body: some View {
        ZStack {
            Color.black.opacity(0.8)
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                HStack {
                    ForEach(pin, id:\.self) { item in
                        Image(systemName: "circle.fill")
                    }
                }.foregroundColor(.white)
                    .frame(width: 100, height: 100)
                
                LazyVGrid(columns: columns, spacing: 20) {
                    ForEach(numberPad, id:\.self) { item in
                        ButtonView(number: item) {
                            addPin(item)
                        }.frame(width: 100, height: 100)
                    }
                    Spacer()
                    ButtonView(number: "0") {
                        addPin("0")
                    }.padding(.top, 10)
                    Button(action: {
                        deletePin()
                    }) {
                        Image(systemName: "delete.backward.fill")
                            .resizable()
                            .frame(width: 40, height: 40)
                    }
                }
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
