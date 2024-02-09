//
//  ContactCardView.swift
//  BillGuard
//
//  Created by Martin Navarro on 8/2/24.
//

import SwiftUI

struct ContactCardView: View {
    @State var account: String
    @State var type: String
    @State var bank: String
    
    @State private var editState:Bool = true
    var banks = ["Pichincha","Guayaquil"]
    @State private var selectedBank = "Pichincha"
    
    var body: some View {
        VStack{
            Text("Username")
                .font(.title3)
                .bold()
                .padding()
            HStack {
                Text("N. Account:")
                    .font(.body)
                    .bold()
                TextField("Bank account", text: $account)
            }.disabled(editState).padding()
            HStack {
                Text("Bank:")
                    .font(.body).bold()
                Picker("Please choose bill", selection: $selectedBank) {
                               ForEach(banks, id: \.self) {
                                   Text($0)
                               }
                           }
            }.disabled(editState).padding()
            Text("Banco Pichincha")
                .font(.headline)
                .padding()
            Button{
                //action to edit button
                editState.toggle()
            }label:{
                Text(editState ? "Edit" : "Save")
                    .foregroundColor(.blue)
                    .font(.body)
                    .padding()
            }
        }.background{
            RoundedRectangle(cornerRadius: 10)
                .fill(selectedBank == "Pichincha" ? .yellow : (selectedBank == "Guayaquil" ? .pink : .clear))

        }
    }
}

struct ContactCardView_Previews: PreviewProvider {
    static var previews: some View {
        ContactCardView(account: "", type: "",bank: "")
    }
}
