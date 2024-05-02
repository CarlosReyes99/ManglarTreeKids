import SwiftUI
import AVKit
import Lottie

struct CartaDeslizable: View {
    var audioPath: String
    var lottiePath: String
    var imagePopup: String
    var titlePopup: String
    var descPopup: String
    var title: String
    var description: String
    var width: CGFloat
    var height: CGFloat
    var myColor: Color
    
    @State private var isPlaying = false
    @State private var player: AVAudioPlayer?
    @State private var showingPopup = false
    
    var body: some View {
        ZStack {
            Card(width: width, height: height, color: myColor) {
                VStack(alignment: .center, spacing: 8) {
                    LottieView(animation: .named(lottiePath))
                        .playbackMode(.playing(.toProgress(1, loopMode: .loop)))
                        .frame(maxWidth: width * 0.8, maxHeight: height * 0.3)
                    
                    Text(title)
                        .font(.title)
                        .fontWeight(.bold)
                    
                    Text(description)
                    
                    Button(action: {
                        playAudio()
                        showPopup()
                    }) {
                        LottieView(animation: .named("playCardDeforestation"))
                            .playbackMode(.playing(.toProgress(1, loopMode: .loop)))
                            .frame(maxWidth: width * 0.8, maxHeight: height * 0.3)
                    }
                }
            }
        }
        .sheet(isPresented: $showingPopup) {
            CustomPopup(
                imagePopup: self.imagePopup,
                title: self.titlePopup,
                description: self.descPopup,
                isPresented: self.$showingPopup
            )
        }
    }
    
    func playAudio() {
        guard let soundFileURL = Bundle.main.url(
            forResource: audioPath,
            withExtension: "mp3"
        ) else {
            return
        }
        
        do {
            try AVAudioSession.sharedInstance().setCategory(
                AVAudioSession.Category.playback
            )
            try AVAudioSession.sharedInstance().setActive(true)
            
            let player = try AVAudioPlayer(contentsOf: soundFileURL)
            player.play()
        }
        catch {
            print("Error playing audio:", error.localizedDescription)
        }
    }
    
    func showPopup() {
        showingPopup = true
    }
}

struct Card<Content: View>: View {
    var width: CGFloat
    var height: CGFloat
    var color: Color
    @ViewBuilder var content: () -> Content
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .fill(color)
                .frame(width: width, height: height)
                .shadow(radius: 5)
            
            content()
        }
    }
}

struct ContentView_Previews_mypopup: PreviewProvider {
    static var previews: some View {
        CartaDeslizable(
            audioPath: "popup1_audio",
            lottiePath: "p1",
            imagePopup: "popup1",
            titlePopup: "Inicio",
            descPopup: "Descripción del Popup 1",
            title: "Título de la Carta 1",
            description: "Descripción de la Carta 1",
            width: 300,
            height: 400,
            myColor: Color.blue
        )
    }
}

