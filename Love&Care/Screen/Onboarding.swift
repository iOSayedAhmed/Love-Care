//
//  Onboarding.swift
//  Love&Care
//
//  Created by Develop on 13/06/2022.
//

import SwiftUI

struct Onboarding: View {
    @AppStorage("isOnboarding") var isOnboarding: Bool = true
    var body: some View {
        ZStack{
            Color("ColorBlue")
                .ignoresSafeArea(.all)
            VStack{
                
                //MARK: Header
                VStack{
                    Text("Love.")
                        .foregroundColor(.white)
                        .font(.system(size: 60, weight: .bold, design: .default))
                    Text("Life dosen't come with a manua, it comes with a mather")
                        .foregroundColor(.white)
                        .font(.system(size: 24, weight: .light, design: .default))
                        .multilineTextAlignment(.center)
                    
                }//VStack (enf of Header)
                Spacer()
                //MARK: Center
                ZStack{
                    CircleGroupView(circleGroupColor: .white)
                    Image("happy-pregnant")
                        .resizable()
                        .scaledToFit()
                        .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.5), radius: 8, x: 3, y: 30)
                        .overlay(
                    Image(systemName: "arrow.left.and.right.circle")
                        .font(.system(size: 40, weight: .ultraLight
                                      , design: .rounded))
                        .foregroundColor(.white)
                    ,alignment: .bottom
                        
                    
                    )
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
                        .frame(width: 80)
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
                        Spacer()
                    }//HStack
                    
                }//ZStack (end of Footer)
                .frame(height: 80, alignment: .center)
                .padding(.horizontal,10)
                
            }//: VStack
          
           
            
        }//: ZStack
    
        
    }
}

struct Onboarding_Previews: PreviewProvider {
    static var previews: some View {
        Onboarding()
    }
}
