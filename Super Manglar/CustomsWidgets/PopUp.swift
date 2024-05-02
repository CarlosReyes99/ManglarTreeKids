import SwiftUI

struct CustomPopup: View {
    let imagePopup: String
    let title: String
    let description: String
    @Binding var isPresented: Bool
    
    var body: some View {
        ZStack {
            Image(imagePopup)
                .resizable()
                .scaledToFill()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 20) {
                Text(title)
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                
                Text(description)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.white)
                
                Button(action: {
                    self.isPresented = false
                }) {
                    Text("Cerrar")
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(8)
                }
            }
            .padding()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.black.opacity(0.7).edgesIgnoringSafeArea(.all))
    }
}

struct ContentView_Popup: View {
    @State private var showingPopup = false
    
    var body: some View {
        VStack {
            Button("Mostrar Popup") {
                self.showingPopup.toggle()
            }
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(8)
        }
        .sheet(isPresented: $showingPopup) {
            CustomPopup(imagePopup: "popup1",
                        title: "Título del Popup",
                        description: "Descripción detallada del popup",
                        isPresented: self.$showingPopup)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView_Popup()
    }
}

