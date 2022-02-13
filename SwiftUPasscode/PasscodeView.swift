//
//  PasscodeView.swift
//  SwiftUPasscode
//
//  Created by Paulo Orquillo on 12/02/22.
//

import SwiftUI

struct PasscodeView: View {
    //MARK: Properties
    let numberPad = (1...9).map {"\($0)"}
    @State private var pin: [Character] = []
    @State private var matchPin: [Character] = []
    @State private var invalidPassword = false
    
    
    @Environment(\.presentationMode) var presentationMode
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    //MARK: Helper methods
    func addPin(_ item: Character) {
        if pin.count < 3 {
            invalidPassword = false
            pin.append(item)
        } else {
            if pin.count < 4 {
                pin.append(item)
            }
            //replacement with matching logic
            withAnimation {
                if matchPin.isEmpty {
                    matchPin = pin
                    pin = []
                } else {
                    if matchPin != pin {
                        invalidPassword = true
                        pin = []
                        print("Does not match!")
                    } else {
                        invalidPassword = false
                        //save the pin
                        presentationMode.wrappedValue.dismiss()
                    }
                }
                print(String(pin))
            }
        }
    }
    
    func deletePin() {
        if pin.count > 0 {
            pin.remove(at: pin.count - 1)
        }
        print(String(pin))

    }
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.blue
                    .edgesIgnoringSafeArea(.all)
                VStack(spacing: 10) {
                    Image(systemName: "lock.fill")
                    Text(matchPin.isEmpty ? "Enter New Passcode" : "Re-enter Passcode")
                    HStack {
                        ForEach(pin, id:\.self) { item in
                            Image(systemName: "circle.fill")
                        }
                    }.foregroundColor(.white)
                    .frame(width: 80, height: 80)
                    
                    if !matchPin.isEmpty && invalidPassword {
                        Text("Passcode didn't match! Try again.")
                            .padding(.bottom, 10)
                    }
                    
                    LazyVGrid(columns: columns, spacing: 20) {
                        ForEach(numberPad, id:\.self) { item in
                            PadButtonView(number: item) {
                                addPin(Character(item))
                            }.frame(width: 80, height: 80)
                        }
                        Spacer()
                        PadButtonView(number: "0") {
                            addPin("0")
                        }.padding(.top, 10)
                        Button(action: {
                            deletePin()
                        }) {
                            Image(systemName: "delete.backward.fill")
                            
                                .frame(width: 40, height: 40)
                        }
                    }
                    Spacer()
                }
                .foregroundColor(.white)
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        presentationMode.wrappedValue.dismiss()
                    }) {
                        Image(systemName: "xmark.circle")
                            .foregroundColor(.white)
                    }
                }
            }
        }
        
    }
}

struct PasscodeView_Previews: PreviewProvider {
    static var previews: some View {
        PasscodeView()
    }
}
