//
//  CircleMinutes.swift
//  timerRoatation
//
//  Created by Mathis Higuinen on 15/09/2022.
//

import SwiftUI

struct CircleMinutes: View {
    
    let width = UIScreen.main.bounds.width
    @State var isRotated = false
    var animation: Animation {
        withAnimation {
            Animation.linear(duration: 5)
            .repeatForever(autoreverses: true)
        }
       
    }
    
    var body: some View {
        ZStack{
            ForEach(0..<60,id:\.self){ i in
                
                Rectangle()
                    .frame(width: 5, height: i%5 == 0 ? 15 : 2)
                    .offset( y: (width-110)/2)
                    .rotationEffect(.init(degrees: Double(i) * 6))
                
            }
        }.frame(width: width-80, height: width-80)
            .background(.red)
            .rotation3DEffect(Angle(degrees: 80), axis: (x: 1, y: 0, z: 0))
            .rotationEffect(Angle(degrees: isRotated ? 360 : 0))
            .animation(animation)
            .onAppear {
                isRotated = true
            }
            
    }
}

struct CircleMinutes_Previews: PreviewProvider {
    static var previews: some View {
        CircleMinutes()
    }
}
