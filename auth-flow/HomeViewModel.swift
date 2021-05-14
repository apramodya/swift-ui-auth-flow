import Foundation
import Combine

class HomeViewModel: ObservableObject {
    func logoutUser() {
        UserDefaults.standard.removeObject(forKey: "token")
        AppManager.Authenticated.send(false)
    }
}
