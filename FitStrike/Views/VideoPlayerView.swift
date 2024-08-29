//
//  VideoPlayerView.swift
//  FitStrike
//
//  Created by Enzo Lizama on 26/08/24.
//

import AVKit
import SwiftUI

struct VideoPlayerView: View {
    let height: Double
    let videoName: String

    var body: some View {
        if let url = Bundle.main.url(forResource: videoName, withExtension: "mp4") {
            VideoPlayer(player: AVPlayer(url: url))
                .frame(height: height)
        } else {
            Text("Couldn't find \(videoName).mp4")
                .foregroundColor(.red)
        }
    }
}

#Preview {
    VideoPlayerView(height: 100, videoName: "")
}
