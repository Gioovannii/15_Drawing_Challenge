//
//  ContentView.swift
//  Drawing_Challenge
//
//  Created by Giovanni Gaffé on 2021/10/27.
//

import SwiftUI


struct ColorCyclingRectangle: View {
    var amount = 0.0
    var steps = 100
    
    var body: some View {
        ZStack {
            ForEach(0..<steps) { value in
                Rectangle()
                    .inset(by: CGFloat(value))
                    .strokeBorder(LinearGradient(gradient: Gradient(colors: [
                        self.color(for: value, brightness: 1),
                        self.color(for: value, brightness: 0.5)
                    ]), startPoint: .top, endPoint: .bottom), lineWidth: 2)
            }
        }
//        .drawingGroup()
    }
    
    func color(for value: Int, brightness: Double) -> Color {
        var targetHue = Double(value) / Double(self.steps) + self.amount
        
        if targetHue > 1 {
            targetHue -= 1
        }
        
        return Color(hue: targetHue, saturation: 1, brightness: brightness)
    }
}

struct Arrow: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        path.move(to: CGPoint(x: 200, y: 100))
        path.addLine(to: CGPoint(x: 100, y: 300))
        path.addLine(to: CGPoint(x: 300, y: 300))
        path.addLine(to: CGPoint(x: 200, y: 100))
        
        return path
    }
}

struct ContentView: View {
    @State private var thickness = 3.0
    @State private var colorCycle = 0.0
    
    var body: some View {
        VStack {
            Arrow()
                .stroke(Color.black, style: StrokeStyle(lineWidth: CGFloat(thickness), lineCap: .round, lineJoin: .round))
            
            ColorCyclingRectangle(amount: self.colorCycle)
                .frame(width: 100, height: 300)
                .border(.black, width: 3)
                .offset(x: -13, y: -87)
            
            
            Text("Thickness : \(thickness, specifier: "%.2g")")
            Slider(value: $thickness, in: 3...15)
                .padding([.horizontal, .bottom])
            
            Text("Color : \(colorCycle, specifier: "%.2g")")
            Slider(value: $colorCycle)
                .padding(.horizontal)
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
