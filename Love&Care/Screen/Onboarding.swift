//
//  Onboarding.swift
//  Love&Care
//
//  Created by Develop on 13/06/2022.
//

import SwiftUI

struct Onboarding: View {
    @AppStorage("isOnboarding") var isOnboarding: Bool = true
    @State var isAnimating:Bool = false
    @State var imageOffset : CGSize = CGSize(width: 0.0, height: 0.0)
    @State var dragableCircleOffset : CGFloat = 0.0
    @State var buttonWidth : Double = UIScreen.main.bounds.width - 80
    var body: some View {
        ZStack{
            Color("ColorBlue")
                .ignoresSafeArea(.all)
            VStack{
                
                //MARK: Header
                VStack{
                    Text(abs(imageOffset.width) > 0.0 ? "Care." : "love.")
                        .foregroundColor(.white)
                        .font(.system(size: 60, weight: .bold, design: .default))
                    Text("Life dosen't come with a manua, it comes with a mather")
                        .foregroundColor(.white)
                        .font(.system(size: 24, weight: .light, design: .default))
                        .multilineTextAlignment(.center)
                    
                }//VStack (enf of Header)
                .offset( y: isAnimating ? 0 : -50)
                .animation(.easeOut(duration: 1), value: isAnimating)
                Spacer()
                //MARK: Center
                ZStack{
                    CircleGroupView(circleGroupColor: .white)
                        .offset(x: -(imageOffset.width) )
                        .blur(radius: abs(imageOffset.width)/10, opaque: false)
                    Image("happy-pregnant")
                        .resizable()
                        .scaledToFit()
                        .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.5), radius: 8, x: 3, y: 30)
                        .offset(x: imageOffset.width)
                        .rotationEffect(.degrees(imageOffset.width / 15))
                        .gesture(DragGesture()
                            .onChanged({ gesture in
                                if abs(gesture.translation.width ) <= 150 {
                                    imageOffset = gesture.translation
                                }
                            })
                                .onEnded({ _ in
                                    withAnimation(.easeOut(duration: 0.5)){
                                        imageOffset = .zero
                                    }
                                    
                                })
                                 
                        )
                        .overlay(
                            Image(systemName: "arrow.left.and.right.circle")
                                .font(.system(size: 40, weight: .ultraLight
                                              , design: .rounded))
                                .foregroundColor(.white)
                                .opacity(abs(imageOffset.width)>0 ? 0 : 1)
                            ,alignment: .bottom
                            
                        )
                        .frame(width: 300, alignment: .center)
                    
                    
                }//ZStack (end of Center)
                Spacer()
                
                //MARK: Footer
                ZStack{
                    //Capsule
                    Capsule()
                        .fill(.white.opacity(0.2))
                    Capsule()
                        .fill(.white.opacity(0.2))
                        .padding(8)
                    // Text of Capsule
                    Text("Start")
                        .font(.system(size: 30, weight: .bold, design: .default))
                        .foregroundColor(.white)
                    
                    //Dynamic Capsule
                    HStack {
                        Capsule()
                            .fill(Color("ColorRed"))
                            .frame(width: 80 + dragableCircleOffset)
                            //.offset(x: dragableCircleOffset)
                        Spacer()
                    }//HStack
                    
                    //Dragable Circle
                    HStack {
                        ZStack{
                            Circle()
                                .fill(Color("ColorRed"))
                            Circle()
                                .fill(.black.opacity(0.2))
                                .padding(8)
                            Image(systemName: "chevron.right.2")
                                .font(.system(size: 24, weight: .bold, design: .rounded))
                                .foregroundColor(.white)
                        }//ZStack
                        .frame(width: 80, alignment:.center)
                        .offset(x: dragableCircleOffset)
                        Spacer()
                    }//HStack
                    .gesture(DragGesture()
                        .onChanged({ gesture in
                            if (gesture.translation.width) > 0.0  && (gesture.translation.width) <= buttonWidth - 50 {
                                dragableCircleOffset =   gesture.translation.width
                            }
                            
                        })
                            .onEnded({ _ in
                                withAnimation(.easeOut(duration: 0.3)) {
                                    
                                    
                                    if (dragableCircleOffset) <= buttonWidth / 2 {
                                        dragableCircleOffset = .zero
                                    }else {
                                        dragableCircleOffset = buttonWidth - 50
                                        isOnboarding = false
                                    }
                                }
                            })
                             
                             
                    )
                    
                    
                }//ZStack (end of Footer)
                .frame(height: 80, alignment: .center)
                .padding(.horizontal,30)
                .offset( y: isAnimating ? 0 : 100)
                .animation(.easeOut(duration: 1), value: isAnimating)
                
            }//: VStack
            
            
            
        }//: ZStack
        .onAppear {
            isAnimating.toggle()
        }
        
        
    }
}

struct Onboarding_Previews: PreviewProvider {
    static var previews: some View {
        Onboarding()
    }
}
