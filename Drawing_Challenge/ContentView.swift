//
//  ContentView.swift
//  Drawing_Challenge
//
//  Created by Giovanni Gaffé on 2021/10/27.
//

import SwiftUI

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
    var body: some View {
        VStack {
            Arrow()
                .stroke(Color.black, style: StrokeStyle(lineWidth: CGFloat(thickness), lineCap: .round, lineJoin: .round))
            
            Rectangle()
                .frame(width: 100, height: 300)
                .border(.black, width: 3)
                .foregroundColor(.white)
                .offset(x: -13, y: -143)
    
            Text("Thickness : \(thickness, specifier: "%.2g")")
            Slider(value: $thickness, in: 3...15)
                .padding()
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

// 1. Create an Arrow shape made from a rectangle and a triangle – having it point straight up is fine.
// 2. Make the line thickness of your Arrow shape animatable.
// 3. Create a ColorCyclingRectangle shape that is the rectangular cousin of ColorCyclingCircle, allowing us to control the position of the gradient using a property.
