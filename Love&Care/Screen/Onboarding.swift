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
                
            }//: VStack
          
           
            
        }//: ZStack
    
        
    }
}

struct Onboarding_Previews: PreviewProvider {
    static var previews: some View {
        Onboarding()
    }
}
