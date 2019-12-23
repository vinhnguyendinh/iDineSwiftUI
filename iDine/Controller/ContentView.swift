//
//  ContentView.swift
//  iDine
//
//  Created by Vinh Nguyen Dinh on 2019/12/19.
//  Copyright © 2019 Vinh Nguyen Dinh. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    let menuSections = Bundle.main.decode([MenuSection].self, from: "menu.json")

    var body: some View {
        NavigationView {
            List {
                ForEach(menuSections) { section in
                    Section(header: Text(section.name)) {
                        ForEach(section.items) { item in
                            NavigationLink(destination: ItemDetail(item: item)) {
                                ItemRow(item: item)
                            }
                        }
                    }
                }
            }
            .navigationBarTitle("Menu")
            .listStyle(GroupedListStyle())
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
