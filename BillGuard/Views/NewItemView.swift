//
//  NewItemView.swift
//  BillGuard
//
//  Created by Martin Navarro on 9/2/24.
//

import SwiftUI

struct NewItemView: View {
    @State var title: String
    @State var date: Date
    @State var prst: Bool
    
    //para el picker
    var type = ["Expense","Income"]
    @State private var selectedType = "Expense"
    
    //color picker
    @State var color: Color = .blue
    var body: some View {
        VStack{
            Text("New Item")
                .font(.system(size: 32))
                .bold()
                .padding(.top,100)
            
            
            Form{
                //Picker
                Picker("Please choose bill", selection: $selectedType) {
                               ForEach(type, id: \.self) {
                                   Text($0)
                               }
                           }
                //title
                TextField("Title", text: $title)
                //due date
                DatePicker("Due Date",selection: $date)
                    .datePickerStyle(GraphicalDatePickerStyle())
                ColorPicker("Color Categoria", selection: $color)

                //button
                Button{
                    //action to save
                }label: {
                    ZStack{
                        RoundedRectangle(cornerRadius: 10).foregroundColor(Color.red)
                        Text("Save")
                            .foregroundColor(Color.white)
                            .bold()
                    }
                }
                .padding()
            }.alert(isPresented: $prst){
                Alert(title: Text("Error"), message: Text("Please fill in all the fields and selected due date newer than today"))
            }
        }
    }
}

struct NewItemView_Previews: PreviewProvider {
    static var previews: some View {
        NewItemView(title: "", date: Date(), prst: false)
    }
}
