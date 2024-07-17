//
//  ContentView.swift
//  ToDone
//
//  Created by Bear Cahill on 7/17/24.
//

import SwiftUI
import SwiftUINavigation

struct ToDoneList: View {
    @ObservedObject var model : ToDoneListModel
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(model.toDones) { toDone in
                    Button {
                        model.selected(selectedToDone: toDone)
                    } label: {
                        Text(toDone.name)
                    }
                }
            }
            .toolbar {
              Button {
                  model.add()
              } label: {
                Image(systemName: "plus")
              }
            }
            .navigationTitle("To Dones")
            .sheet(item: self.$model.navDest.add) { $toDone in
                Text(toDone.name)
            }
            .navigationDestination(item: self.$model.navDest.selected) { $selectedToDone in
                Text(selectedToDone.name)
            }
        }
    }
}

#Preview {
    ToDoneList(model: ToDoneListModel(toDones: [ToDone.mock]))
}
