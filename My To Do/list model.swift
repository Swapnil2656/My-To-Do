//
//  list model.swift
//  My To Do
//
//  Created by student on 04/12/25.
//

import Foundation
import SwiftData

@Model
class Notes{
    var title: String
    
    init(title: String) {
        self.title = title
        
    }
}
