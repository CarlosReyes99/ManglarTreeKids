import SwiftUI

extension UIColor {
    convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        
        self.init(
            red: CGFloat(red) / 255.0,
            green: CGFloat(green) / 255.0,
            blue: CGFloat(blue) / 255.0,
            alpha: 1.0
        )
    }
    
    convenience init(rgb: Int) {
        self.init(
            red: (rgb >> 16) & 0xFF,
            green: (rgb >> 8) & 0xFF,
            blue: rgb & 0xFF
        )
    }
}


struct ContentView: View {
    let ColorFromRGB = UIColor(rgb: 0x07CAFF)
    var body: some View {
        
        NavigationStack {
            TabView {
                HomeView()
                    .tabItem {
                        Image(systemName: "house.fill")
                        Text("Home")
                            .bold()
                    }
                
                DeforestationView()
                    .tabItem {
                        Image(systemName: "tree.fill")
                        Text("Deforestation")
                            .bold()
                    }
                
                HabitatView()
                    .tabItem {
                        Image(systemName: "pawprint.fill")
                        Text("Habitat")
                            .bold()
                    }
                
                Ecosystem()
                    .tabItem {
                        Image(systemName: "globe.americas")
                        Text("Ecosystem")
                            .bold()
                    }
            }
            .accentColor(Color.red) // Color de los iconos de la TabView
            .navigationBarTitle("Super Manglar", displayMode: .inline)
            
            .onAppear {
                UITabBar.appearance().backgroundColor = ColorFromRGB // Color de fondo de la TabView
                UINavigationBar.appearance().backgroundColor = ColorFromRGB // Color de fondo del top bar
            }
            .tint(.black)
        }
    }
}

#Preview {
    ContentView()
}
