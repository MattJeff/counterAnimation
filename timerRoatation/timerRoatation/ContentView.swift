//
//  ContentView.swift
//  timerRoatation
//
//  Created by Mathis Higuinen on 14/09/2022.
//

import SwiftUI


struct ContentView: View {
    
    var size = UIScreen.main.bounds
    var width = UIScreen.main.bounds.width
    var animation: Animation {
        withAnimation {
            Animation.linear(duration: 5)
            .repeatForever(autoreverses: false)
        }
       
    }
    
    var animation2: Animation {
        withAnimation {
            Animation.linear(duration: 10)
            .repeatForever(autoreverses: false)
        }
       
    }
    
    var animation3: Animation {
        withAnimation {
            Animation.linear(duration: 2)
            .repeatForever(autoreverses: true)
        }
       
    }
    
    let timer = Timer.publish(every: 0.3, on: .main, in: .common).autoconnect()
    @State var predicat = 0.0
    
    
    
    var degree:CGFloat = 80
    
    @State var isRotated = false
    
    var body: some View {
        VStack(spacing: 20) {
            ZStack{
                Color(.black).ignoresSafeArea()
                ZStack{
                    
                    
                    Circle()
                        .trim(from:0,to:1)
                        .frame(width: 80, height: 80)
                        .foregroundColor(.white)
                        .rotation3DEffect(Angle(degrees: degree), axis: (x: 1, y:0, z: 0))
                        .offset(y:-50)
                        .offset(y:isRotated ? 0 : 100)
                        .animation(animation3)
                        .foregroundColor(.black)
                        .onReceive(timer) { _ in
                            
                        }
                    
                        .opacity(0.5)
                    
                    Text("\(predicat,specifier: "%.0f")")
                        .font(.custom("VarelaRound-Regular", size: 100).bold())
                        .onReceive(timer, perform: { _ in
                            
                            if predicat < 100{
                                predicat += 1.0
                                
                                if predicat > 100 {
                                    predicat = 0
                                }
                            }
                            
                        })
                        .offset(y:-100)
                    
                    Circle()
                        .trim(from:0,to:1)
                    
                        .stroke(style: StrokeStyle(lineWidth: 30, lineCap: .square, lineJoin: .round, miterLimit: 0, dash: [50], dashPhase: 0))
                        .frame(width: 190, height: 190)
                        .rotationEffect(Angle(degrees: isRotated ? 360 : 0))
                        .animation(animation)
                        .rotation3DEffect(Angle(degrees: degree), axis: (x: 1, y:0, z: 0))
                    
                    
                    Circle()
                        .trim(from:0,to:1)
                    
                        .stroke(style: StrokeStyle(lineWidth: 5, lineCap: .square, lineJoin: .round, miterLimit: 0, dash: [20], dashPhase: 0))
                        .frame(width: 230, height: 230)
                        .rotationEffect(Angle(degrees: isRotated ? -360 : 0))
                        .animation(animation)
                        .rotation3DEffect(Angle(degrees: degree), axis: (x: 1, y:0, z: 0))
                        .offset(y:30)
                    
                    ZStack{
                        ForEach(0..<60,id:\.self){ i in
                            
                            Rectangle()
                                .frame(width: 5, height: i%5 == 0 ? 15 : 2)
                                .offset( y: (width-110)/2)
                                .rotationEffect(.init(degrees: Double(i) * 6))
                            
                        }
                    }.frame(width: width-80, height: width-80)
                        .clipShape(Circle())
                        .rotationEffect(Angle(degrees: isRotated ? 360 : 0))
                        .animation(animation)
                        .rotation3DEffect(Angle(degrees: degree), axis: (x: 1, y: 0, z: 0))
                        .offset(y:-30)
                    
                    Circle()
                        .trim(from:0,to:1)
                    
                        .stroke(style: StrokeStyle(lineWidth: 10, lineCap: .square, lineJoin: .round, miterLimit: 0, dash: [50], dashPhase: 0))
                        .frame(width: 300, height: 300)
                        .rotationEffect(Angle(degrees: isRotated ? -360 : 0))
                        .animation(animation)
                        .rotation3DEffect(Angle(degrees: degree), axis: (x: 1, y:0, z: 0))
                        .offset(y:-40)
                        .foregroundColor(.gray)
                    
                    
                    
                    
                    
                }
                .offset(y:-150)
                .foregroundColor(.white)
            }
               
        }.onAppear{
            isRotated = true
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


