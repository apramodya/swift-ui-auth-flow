import SwiftUI

struct ContentView: View {
    @State var isAuthenticated = AppManager.IsAuthenticated()
    
    var body: some View {
        Group {
            isAuthenticated ? AnyView(HomeView()) : AnyView(LoginView())
        }
        .onReceive(AppManager.Authenticated, perform: {
            isAuthenticated = $0
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
