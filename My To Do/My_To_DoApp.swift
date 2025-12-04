//
//  My_To_DoApp.swift
//  My To Do
//
//  Created by student on 04/12/25.
//

import SwiftUI
import SwiftData


@main
struct My_To_DoApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(for: Notes.self)
        }
    }
}

