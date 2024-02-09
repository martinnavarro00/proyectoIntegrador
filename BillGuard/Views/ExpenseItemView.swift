//
//  ExpenseItemView.swift
//  BillGuard
//
//  Created by Martin Navarro on 8/2/24.
//

import SwiftUI

struct ExpenseItemView: View {
    var body: some View {
        HStack{
            VStack(alignment: .leading){
                Text("Compras")
                    .bold()
                    .font(.headline)
                Text("$ 150.00")
                    .font(.footnote)
            }
        }
        .background{RoundedRectangle(cornerRadius:10)
                .fill(.green)
                .frame(width: 310, height: 50)
        }.padding()
    }
}

struct ExpenseItemView_Previews: PreviewProvider {
    static var previews: some View {
        ExpenseItemView()
    }
}
