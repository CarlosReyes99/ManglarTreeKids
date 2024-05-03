import SwiftUI

extension UIColor {
    convenience init(hex: String) {
        var codeHex = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        if codeHex.hasPrefix("#") {
            codeHex.remove(at: codeHex.startIndex)
        }
        
        if codeHex.count != 6 {
            self.init(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            return
        }
        
        var rgbValue: UInt64 = 0
        Scanner(string: codeHex).scanHexInt64(&rgbValue)
        
        self.init(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: 1.0
        )
    }
}

struct DeforestationView: View {
    
    let colorBackground = UIColor(hex: "#E0F4FF")
    @State private var showingPopup = false
    @State private var popupTitle = ""
    @State private var popupImage = ""
    
    var body: some View {
        
        ZStack{
            Color(colorBackground)
                .ignoresSafeArea()
                
            
            ScrollView{
                VStack(alignment: .center, spacing: 32){
                    CartaDeslizable(
                        audioPath: "popup1_audio", lottiePath: "p1", imagePopup: "popup1", titlePopup: "Dato impactante", descPopup: "Cada año se pierden alrededor de 1.67 millones de acres de manglar en todo el mundo debido a la deforestación y el desarrollo costero", title: "Bienvenido", description: "¡Empecemos!", width: 800, height: 400, myColor: Color(UIColor(hex: "#CBFFA9"))
                    )
                    CartaDeslizable(
                        audioPath: "popup1_audio", lottiePath: "p1", imagePopup: "popup2", titlePopup: "Consecuencias", descPopup: "La deforestación de los manglares pone en riesgo a cientos de especies de peces, aves y otros animales que dependen de este ecosistema. También reduce la protección natural contra tormentas, inundaciones y erosión costera", title: "Consecuencias", description: "¿Qué desencadena?", width: 800, height: 400, myColor: Color(UIColor(hex: "#F3CCF3"))
                    )
                    CartaDeslizable(
                        audioPath: "popup1_audio", lottiePath: "p1", imagePopup: "popupTala", titlePopup: "Causas principales", descPopup: "La deforestación de manglares se debe principalmente a la tala para obtener madera, el desarrollo turístico y residencial en zonas costeras, la acuacultura y la contaminación.", title: "Causas principales", description: "Los orígenes", width: 800, height: 400, myColor: Color(UIColor(hex: "#F6FA70"))
                    )
                    CartaDeslizable(
                        audioPath: "popup1_audio", lottiePath: "p1", imagePopup: "popup4", titlePopup: "Llamado a la acción", descPopup: "¡Tú puedes ayudar a detener la deforestación de los manglares! Reduce tu huella de carbono, apoya organizaciones que trabajan en la conservación de estos ecosistemas y educa a otros sobre su importancia", title: "¡Hagamos el cambio!", description: "Nosotros podemos hacer la diferencia", width: 800, height: 400, myColor: Color(UIColor(hex: "#B4BDFF"))
                    )
                    CartaDeslizable(
                        audioPath: "popup1_audio", lottiePath: "p1", imagePopup: "popup5", titlePopup: "Datos esperanzadores", descPopup: "Gracias a los esfuerzos de conservación, algunas áreas de manglar están siendo restauradas y protegidas. ¡Con tu ayuda podemos seguir recuperando estos valiosos ecosistemas!", title: "Los buenos somos más", description: "Pequeños cambios mueven al mundo", width: 800, height: 400, myColor: Color(UIColor(hex: "#FFD9C0"))
                    )
                }
            }
            
            if showingPopup {
                PopupOverlay(title: popupTitle, description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam at urna auctor, malesuada urna ut, interdum orci. Sed vel tincidunt velit. Integer eget eros eget nulla lacinia bibendum. ", imageName: popupImage, isPresented: $showingPopup)
                                    .zIndex(1)
                
            }
        }
        
    }
}

struct PopupOverlay: View {
    let title: String
    let description: String
    let imageName: String
    @Binding var isPresented: Bool
    
    var body: some View {
        ZStack {
            Color.black.opacity(0.3)
                .ignoresSafeArea()
            
            VStack {
                Spacer()
                
                VStack(spacing: 16) {
                    Image(imageName)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(maxWidth: 300)
                    
                    Text(title)
                        .font(.title)
                        .bold()
                    
                    Text(description)
                        .multilineTextAlignment(.center)
                    
                    Button(action: {
                        isPresented = false
                    }) {
                        Text("Cerrar")
                            .foregroundColor(.white)
                            .padding(.horizontal, 16)
                            .padding(.vertical, 8)
                            .background(Color.blue)
                            .cornerRadius(8)
                    }
                }
                .padding()
                .background(Color.white)
                .cornerRadius(16)
                
                Spacer()
            }
        }
    }
}

struct ContentView_Preview: PreviewProvider {
    static var previews: some View {
        DeforestationView()
    }
}

