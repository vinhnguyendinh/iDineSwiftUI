//
//  ItemRow.swift
//  iDine
//
//  Created by Vinh Nguyen Dinh on 2019/12/19.
//  Copyright © 2019 Vinh Nguyen Dinh. All rights reserved.
//

import SwiftUI

struct ItemRow: View {
    var item: MenuItem
    
    static let colors: [String: Color] = ["D": .purple, "G": .black, "N": .red, "S": .blue, "V": .green]

    var body: some View {
        HStack {
            Image(item.thumbnailImage)
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.gray, lineWidth: 2))

            VStack(alignment: .leading) {
                Text(item.name)
                    .font(.headline)
                Text("$\(item.price)")
            }

            Spacer()

            ForEach(item.restrictions, id: \.self) { restriction in
                Text(restriction)
                    .font(.caption)
                    .fontWeight(.black)
                    .padding(5)
                    .foregroundColor(.white)
                    .background(Self.colors[restriction, default: .black])
                    .clipShape(Circle())
            }
        }
    }
}

struct ItemRow_Previews: PreviewProvider {
    static var previews: some View {
        ItemRow(item: MenuItem.example)
    }
}
