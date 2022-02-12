//
//  ButtonView.swift
//  SwiftUPasscode
//
//  Created by Paulo Orquillo on 12/02/22.
//

import SwiftUI

struct ButtonView: View {
    var number: String
    var action: () -> Void
    var body: some View {
        Button(action: {
            self.action()
        }) {
            ZStack {
                Circle()
                    .frame(width: 100, height: 100)
                    .foregroundColor(.black.opacity(0.5))
                Text("\(number)")
                    .font(.title)
                    .foregroundColor(.white)
            }
        }
    }
}

struct ButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonView(number: "3") {
            print("number")
        }
    }
}
