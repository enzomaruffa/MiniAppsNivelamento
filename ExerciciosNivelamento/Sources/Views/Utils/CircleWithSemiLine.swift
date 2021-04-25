//
//  CircleWithSemiLine.swift
//  ExerciciosNivelamento
//
//  Created by Vinícius Binder on 25/04/21.
//

import SwiftUI

struct CircleWithSemiLine: Shape {
    let radius: CGFloat

    func path(in rect: CGRect) -> Path {
        var path = Path()

        path.addArc(center: CGPoint(x: radius, y: radius), radius: radius, startAngle: .degrees(0), endAngle: .degrees(360), clockwise: false)

        path.addLine(to: CGPoint(x: radius , y: radius))

        return path
    }
}
