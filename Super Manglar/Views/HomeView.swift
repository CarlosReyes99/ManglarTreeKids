//
//  HomeView.swift
//  Super Manglar
//
//  Created by ADMIN UNACH on 29/04/24.
//

import SwiftUI
import Lottie
import AVKit



struct HomeView: View {
    var body: some View {
        
        ZStack{
            
            Color.green
            VStack(alignment: .center, spacing: 8) {
                LottieView(animation: .named("homeAnimation"))
                    .playbackMode(.playing(.toProgress(1, loopMode: .loop)))
                    .frame(maxWidth: 1000, maxHeight: 3500)
                Button(action: {
                    playAudio()
                }) {
                    LottieView(animation: .named("playCardDeforestation"))
                        .playbackMode(.playing(.toProgress(1, loopMode: .loop)))
                        .frame(maxWidth:700, maxHeight: 700)
                    
                }
                    
                    
                    
                    
                }
            
            
            
        }
        
        
        
    }
}
func playAudio() {
    @State var isPlaying = false
    @State var player: AVAudioPlayer?
    guard let soundFileURL = Bundle.main.url(
            forResource: "popup1_audio",
            withExtension: "mp3"
        ) else {
            return
        }
        
        do {
            // Configure and activate the AVAudioSession
            try AVAudioSession.sharedInstance().setCategory(
                AVAudioSession.Category.playback
            )

            try AVAudioSession.sharedInstance().setActive(true)

            // Play a sound
            let player = try AVAudioPlayer(
                contentsOf: soundFileURL
            )

            player.play()
        }
        catch {
            // Handle error
        }
    
}

#Preview {
    HomeView()
}
