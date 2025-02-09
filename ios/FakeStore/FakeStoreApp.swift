//
//  FakeStoreApp.swift
//  FakeStore
//
//  Created by Malgorzata Mazurek on 29/07/2024.
//

import SwiftUI

@main
struct FakeStoreApp: App {
    @StateObject private var vm = HomeViewModel()
    var body: some Scene {
        WindowGroup {
            HomeView().environmentObject(vm)
        }
    }
}
