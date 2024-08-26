//
//  ImageExtension.swift
//  FitStrike
//
//  Created by Enzo Lizama on 21/08/24.
//

import SwiftUI

extension Image {
    /// Resize an image with fill aspect ratio and specified frame dimensions.
    func resizedToFill(width: CGFloat, height: CGFloat) -> some View {
        self.resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: width, height: height)
    }
}
