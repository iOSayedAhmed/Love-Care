//
//  Home.swift
//  Love&Care
//
//  Created by Develop on 13/06/2022.
//

import SwiftUI

struct Home: View {
    @AppStorage("isOnboarding") var isOnboarding:Bool = false
    @State var isAnimating:Bool = false
    var body: some View {
        
            VStack(alignment: .center, spacing: 100){
                //MARK: Header
                ZStack{
                    CircleGroupView(circleGroupColor: .gray)
                    Image("baby-boy")
                        .resizable()
                        .scaledToFit()
                        .shadow(color: Color( red: 0, green: 0, blue: 0, opacity: 0.5), radius: 8, x: 2, y: 20)
                        .offset( y: isAnimating ? 30 : -30)
                        .animation(.easeOut(duration: 1).repeatForever(autoreverses: true), value: isAnimating)
                    
                }//CircleGroupView (end header)
                 .frame( width: 300, alignment: .center)
                
                
                //MARK: Center
                Text(" Having Children just puts the whole world into perspective. EveryTthing else just disappears.")
                
                
                        .font(.system(size: 22, weight: .regular, design: .rounded))
                        .multilineTextAlignment(.center)
                        .foregroundColor(.black.opacity(0.6))
                        .padding(.horizontal,8)
                        
                
                
                //MARK: Footer
                
                Button {
                    isOnboarding.toggle()
                } label: {
                    Image(systemName:"arrow.2.circlepath.circle.fill")
                        .imageScale(.large)
                    Text("Restart")
                        .foregroundColor(.white)
                        .font(.system(size: 25, weight: .bold, design: .rounded))
                    
                }
                .buttonStyle(.borderedProminent)
                .buttonBorderShape(.capsule)
            }//: VStack
            .onAppear{
                isAnimating.toggle()
            }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
