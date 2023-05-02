//
//  CircleViewTube.swift
//  Restart
//
//  Created by Hassan Assiry on 19/03/2023.
//

import SwiftUI

struct CircleViewTube: View {
    @State var ShapeColor : Color
    @State var Shapeopacity : Double
    @State private var isAnimating : Bool = false

    var body: some View {
        ZStack{
            Circle()
                .stroke(ShapeColor.opacity(Shapeopacity),lineWidth: 40)
                .frame(width: 260, height: 260,alignment: .center)
            Circle()
                .stroke(ShapeColor.opacity(Shapeopacity),lineWidth: 80)
                .frame(width: 260, height: 260,alignment: .center)
        }
        .blur(radius: isAnimating ? 0 : 10)
        .opacity(isAnimating ? 1 : 0)
        .scaleEffect(isAnimating ? 1 : 0.5)
        .animation(.easeOut(duration: 1), value: isAnimating)
        .onAppear(perform: {
            isAnimating = true
        })
    }
}

struct CircleViewTube_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color("ColorBlue").ignoresSafeArea(.all , edges: .all)
            CircleViewTube(ShapeColor: .white, Shapeopacity: 0.2)
        }
    }
}
