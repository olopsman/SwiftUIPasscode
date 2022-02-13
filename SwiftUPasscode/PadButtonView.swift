//
//  PadButtonView.swift
//  SwiftUPasscode
//
//  Created by Paulo Orquillo on 12/02/22.
//

import SwiftUI

struct PadButtonView: View {
    var number: String
    var action: () -> Void
    var body: some View {
        Button(action: {
            self.action()
        }) {
            ZStack {
                Circle()
                    .frame(width: 80, height: 80)
                    .foregroundColor(.black.opacity(0.5))
                Text("\(number)")
                    .font(.title)
                    .foregroundColor(.white)
            }
        }
    }
}

struct PadButtonView_Previews: PreviewProvider {
    static var previews: some View {
        PadButtonView(number: "3") {
            print("number")
        }
    }
}
