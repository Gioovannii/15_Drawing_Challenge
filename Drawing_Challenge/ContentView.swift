//
//  ContentView.swift
//  Drawing_Challenge
//
//  Created by Giovanni Gaffé on 2021/10/27.
//

import SwiftUI

struct Arrow: Shape {
    
    var thickNess: CGFloat
    
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
    @State private var thickness = 0.0
    var body: some View {
        VStack {
            Arrow(thickNess: thickness)
               
            
            Text("Thickness : \(thickness, specifier: "%.2g")")
        Slider(value: $thickness)
                .padding()
            
        }
        .background(Color.green)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
