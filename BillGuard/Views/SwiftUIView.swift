//
//  SwiftUIView.swift
//  BillGuard
//
//  Created by Martin Navarro on 21/2/24.
//

import SwiftUI

/*struct SwiftUIView: View {
    @State private var selectedItem: FriendListItemView? = nil
        @State private var isOverlayVisible = false

        let items = [FriendListItemView(), FriendListItemView(),]

        var body: some View {
            ZStack {
                // Main content

                List {
                    ForEach(0..<items.count) { index in
                        items[index]
                            .onTapGesture {
                                // Set the selected item and toggle overlay visibility
                                selectedItem = items[index]
                                isOverlayVisible.toggle()
                            }
                            .swipeActions{
                                Button("Delete"){

                                }.tint(.red)
                            }
                    }.listStyle(PlainListStyle())
                }

                // Overlay
                if isOverlayVisible {
                    Color.black.opacity(0.5)
                        .ignoresSafeArea()

                    VStack {
                        ContactCardView(account: "", type: "", bank: "")
                            .onTapGesture {
                                // Hide the overlay when tapped
                                isOverlayVisible = false
                            }
                    }
                }
            }
        }
    }


struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView()
    }
}*/
