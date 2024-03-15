//
//  AIAndHumanCoexistenceView.swift
//  ChatUI
//
//  Created by Nishant sethi on 11/02/2024.
//

import SwiftUI

import SwiftUI

//struct AIAndHumanCoexistenceView: View {
//    var body: some View {
//        ZStack {
//            // Draw the outline of the "A" using paths
//            Path { path in
//                path.move(to: CGPoint(x: 50, y: 50))
//                path.addLine(to: CGPoint(x: 150, y: 50))
//                path.addLine(to: CGPoint(x: 150, y: 100))
//                path.addLine(to: CGPoint(x: 100, y: 100))
//                path.addLine(to: CGPoint(x: 100, y: 150))
//                path.addLine(to: CGPoint(x: 50, y: 150))
//                path.addLine(to: CGPoint(x: 50, y: 100))
//                path.closeSubpath()
//            }
//            .stroke(Color.blue)
//
//            Path { path in
//                path.move(to: CGPoint(x: 60, y: 80))
//                path.addLine(to: CGPoint(x: 90, y: 80))
//                path.addLine(to: CGPoint(x: 90, y: 120))
//                path.addLine(to: CGPoint(x: 60, y: 120))
//                path.closeSubpath()
//            }
//            .stroke(Color.black)
//
//            Path { path in
//                path.move(to: CGPoint(x: 140, y: 80))
//                path.addLine(to: CGPoint(x: 170, y: 80))
//                path.addLine(to: CGPoint(x: 170, y: 120))
//                path.addLine(to: CGPoint(x: 140, y: 120))
//                path.closeSubpath()
//            }
//            .stroke(Color.black)
//
//            // Draw the dots using circles
//            Circle()
//                .frame(width: 10, height: 10)
//                .position(x: 70, y: 70)
//                .foregroundColor(Color.black)
//            Circle()
//                .frame(width: 10, height: 10)
//                .position(x: 130, y: 70)
//                .foregroundColor(Color.black)
//            Circle()
//                .frame(width: 10, height: 10)
//                .position(x: 105, y: 105)
//                .foregroundColor(Color.black)
//
//            // Add the handshake icon
//            Image("handshake")
//                .resizable()
//                .aspectRatio(contentMode: .fit)
//                .frame(width: 50, height: 50)
//                .position(x: 105, y: 130)
//        }
//    }
//}

struct AIAndHumanCoexistenceView: View {
    var body: some View {
        ZStack {
            // Draw the robot using paths and shapes
            Path { path in
                path.move(to: CGPoint(x: 100, y: 50))
                path.addCurve(to: CGPoint(x: 100, y: 200), control1: CGPoint(x: 120, y: 100), control2: CGPoint(x: 120, y: 150))
                path.addArc(center: CGPoint(x: 100, y: 200), radius: 20, startAngle: Angle(degrees: -90), endAngle: Angle(degrees: 90), clockwise: true)
                path.addCurve(to: CGPoint(x: 100, y: 50), control1: CGPoint(x: 120, y: 250), control2: CGPoint(x: 120, y: 200))
            }
            .fill(Color.blue)

            Path { path in
                path.move(to: CGPoint(x: 100, y: 100))
                path.addLine(to: CGPoint(x: 100, y: 150))
            }
            .stroke(Color.black)

            Path { path in
                path.move(to: CGPoint(x: 80, y: 175))
                path.addLine(to: CGPoint(x: 100, y: 200))
                path.addLine(to: CGPoint(x: 120, y: 175))
            }
            .stroke(Color.black)

            // Draw the person using paths and shapes
            Path { path in
                path.move(to: CGPoint(x: 250, y: 150))
                path.addLine(to: CGPoint(x: 250, y: 200))
                path.addLine(to: CGPoint(x: 300, y: 200))
                path.addLine(to: CGPoint(x: 300, y: 150))
            }
            .stroke(Color.black)

            Circle()
                .frame(width: 10, height: 10)
                .position(x: 275, y: 175)
                .foregroundColor(Color.black)
        }
    }
}
#Preview {
    AIAndHumanCoexistenceView()
}
