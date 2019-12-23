//
//  ItemDetail.swift
//  iDine
//
//  Created by Vinh Nguyen Dinh on 2019/12/19.
//  Copyright © 2019 Vinh Nguyen Dinh. All rights reserved.
//

import SwiftUI

struct ItemDetail: View {
    var item: MenuItem

    @EnvironmentObject var order: Order

    var body: some View {
        NavigationView {
            VStack {
                ZStack(alignment: .bottomTrailing) {
                    Image(item.mainImage)
                    Text("Photo: \(item.photoCredit)")
                        .padding(4)
                        .background(Color.black)
                        .font(.caption)
                        .foregroundColor(.white)
                        .offset(x: -15, y: -5)
                }

                Text(item.description)
                    .padding()

                Button("Order This") {
                    self.order.add(item: self.item)
                }
                .font(.headline)
                .padding(EdgeInsets(top: 10, leading: 30, bottom: 10, trailing: 30))
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(6)

                Spacer()
            }
        }
        .navigationBarTitle(Text(item.name), displayMode: .inline)
    }
}

struct ItemDetail_Previews: PreviewProvider {
    static let order = Order()

    static var previews: some View {
        ItemDetail(item: MenuItem.example).environmentObject(order)
    }
}
