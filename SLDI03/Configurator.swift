//
//  Configurator.swift
//  SLDI03
//
//  Created by Anna Ershova on 09.04.2022.
//

import Foundation
import Networking

class Configurator {
    static let shared = Configurator()
    
    func register() {
        ServiceLocator.shared.addServices(service: NetworkService())
    }
}
