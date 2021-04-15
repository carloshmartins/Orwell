//
//  UserSettings.swift
//  Orwell
//
//  Created by carlos.henrique.martrins on 14/04/21.
//

import Combine

class UserSettings: ObservableObject {
    @Published var shape = Shape.circle
    @Published var isMirroring = false
    
    enum Shape {
        case circle
        case rectangle
    }
    
}
