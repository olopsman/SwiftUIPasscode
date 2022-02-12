//
//  ButtonView.swift
//  SwiftUPasscode
//
//  Created by Paulo Orquillo on 12/02/22.
//

import SwiftUI

struct ButtonView: View {
    var number: Int
    var body: some View {
        Button(action: {
            //
            print("button tapped")
        }) {
            ZStack {
                Circle()
                    .frame(width: 75)
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
        ButtonView(number: 3)
    }
}
