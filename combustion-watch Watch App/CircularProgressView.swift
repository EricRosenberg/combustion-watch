//
//  CircularProgressView.swift
//  combustion-watch Watch App
//
//  Taken from https://sarunw.com/posts/swiftui-circular-progress-bar/
//
//  Created by Eric Rosenberg on 12/21/22.
//

import SwiftUI

struct CircularProgressView: View {
    let progress: Double
    
    var body: some View {
        ZStack {
            Circle()
                .stroke(
                    Color.yellow.opacity(0.5),
                    lineWidth: 10
                )
            Circle()
                .trim(from: 0, to: progress)
                .stroke(
                    Color.yellow,
                    style: StrokeStyle(
                        lineWidth: 10,
                        lineCap: .round
                    )
                )
                .rotationEffect(.degrees(-90))
                // 1
                .animation(.easeOut, value: progress)
        }
    }
}

struct CircularProgressView_Previews: PreviewProvider {
    static var previews: some View {
        CircularProgressView(progress: 0.8)
    }
}
