//
//  ToDone.swift
//  ToDone
//
//  Created by Bear Cahill on 7/17/24.
//

import Foundation
import SwiftUINavigation

class ToDoneListModel : ObservableObject {
    @Published var toDones : [ToDone]
    @Published var navDest : NavDestination?
    
    @CasePathable
    enum NavDestination {
        case add(ToDone)
        case selected(ToDone)
    }
    
    init(navDest : NavDestination? = nil,
        toDones : [ToDone] = []) {
        self.navDest = navDest
        self.toDones = toDones
    }
        
    func add() {
        let toDone = ToDone()
        toDones.append(toDone)
        navDest = .add(toDone)
    }
    
    func selected(selectedToDone : ToDone) {
        self.navDest = .selected(selectedToDone)
    }
}

struct ToDone : Equatable, Identifiable, Codable {
    var id = UUID()
    var name = ""
    var createdAt = Date.now
    var priority = Priority.med
    
    enum Priority : Codable {
        case low, med, high
    }
}

extension ToDone {
    static let mock = Self(name: "Mock ToDone")
}
