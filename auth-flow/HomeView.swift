import SwiftUI

struct HomeView: View {
    @ObservedObject var vm = HomeViewModel()
    
    var body: some View {
        VStack {
            Text("Welcome")
                .font(.largeTitle)
            
            Spacer()
                .frame(height: 100)
            
            Button("Logout") {
                vm.logoutUser()
            }
            .padding()
            .frame(width: 100, height: 40, alignment: .center)
            .background(Color.green)
            .foregroundColor(.white)
            .cornerRadius(8)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
