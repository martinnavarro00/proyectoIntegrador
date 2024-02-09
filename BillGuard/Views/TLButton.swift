//
//  TLButton.swift
//  BillGuard
//
//  Created by Martin Navarro on 24/2/24.
//

import SwiftUI

struct TLButton: View {
    let title: String
    let background: Color
    let action: ()->Void
    var body: some View {
        Button{
            //atempt log in
            action()
        }label: {
            ZStack{
                RoundedRectangle(cornerRadius: 10).foregroundColor(background)
                Text(title)
                    .foregroundColor(Color.white)
                    .bold()
            }
        }
        .padding()
    }
}

struct TLButton_Previews: PreviewProvider {
    static var previews: some View {
        TLButton(title: "Value", background: .pink){
            //Action
        }
    }
}
