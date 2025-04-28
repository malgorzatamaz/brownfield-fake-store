
import SwiftUI

@main
struct FakeStoreApp: App {
    @StateObject private var vm = HomeViewModel()
    @StateObject private var sm = SearchViewModel()
    @StateObject private var cs = CartState()
    
    var body: some Scene {
        WindowGroup {
            HomeView().environmentObject(vm).environmentObject(cs).environmentObject(sm)
        }
    }
}
