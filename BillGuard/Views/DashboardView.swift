//
//  DashboardView.swift
//  BillGuard
//

//  Created by Martin Navarro on 8/2/24.
//

import SwiftUI

struct DashboardView: View {
    @State private var selectedIndex: Int?
    let items = ["Jan.", "Feb.", "Mar.", "April.","May"]
    var body: some View {
        NavigationView{
            ScrollView(showsIndicators:true){
                ZStack{
                    Circle()
                        .stroke(lineWidth: 25)
                        .opacity(0.3)
                        .foregroundColor(.red)
                        .frame(height: 300)
                    Circle()
                        .trim(from: 0, to:CGFloat(0.05/0.1))
                                //CGFloat(min(progress,2.0)))
                        .stroke(style: StrokeStyle(lineWidth: 25, lineCap: .round))
                        .foregroundColor(.red)
                        .rotationEffect(Angle(degrees: 270.0))
                        .frame(height: 300)
                    VStack{
                        Text("Your goal is: 100")
                        Text(String(format: "%.0f %%", min(25, 100)*100.0))
                                        .font(.largeTitle)
                                        .bold()
                        Button("edit"){
                            
                        }

                    }
                }.padding()
                Divider()
                ScrollView(.horizontal, showsIndicators: false){
                    
                    HStack{
                        ForEach(items.indices, id: \.self) { index in
                            Text(items[index])
                                .frame(width: 80, height: 40)
                                .background(selectedIndex==index ? Color.green : Color.gray)
                                .cornerRadius(10)
                                .onTapGesture {
                                    selectedIndex = (selectedIndex == index) ? nil: index
                            }
                        }
                    }
                }
                ExpenseItemView()
                ExpenseItemView()
                ExpenseItemView()
                ExpenseItemView()
                ExpenseItemView()
                ExpenseItemView()
                ExpenseItemView()
                //ExpenseItemView()

                    //.frame(maxWidth: .infinity)

                


            }
            .frame(maxWidth: .infinity).navigationTitle("Dashboard")
        }
    }
}

struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardView()
    }
}
