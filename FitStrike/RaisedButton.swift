//
//  RaisedButton.swift
//  FitStrike
//
//  Created by Enzo Lizama on 3/11/24.
//

import SwiftUI

struct RaisedButton: View {
    var body: some View {
        Button(action: {}, label: {
            Text("Get Started").raisedButtonTextStyle()
        })
    }
}

extension Text {
    func raisedButtonTextStyle() -> some View {
        self.font(.body)
            .fontWeight(.bold)
    }
}

#Preview {
    RaisedButton()
}
