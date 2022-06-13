//
//  Home.swift
//  Love&Care
//
//  Created by Develop on 13/06/2022.
//

import SwiftUI

struct Home: View {
    @AppStorage("isOnboarding") var isOnboarding:Bool = false
    var body: some View {
       
        VStack{
            Text("Home")
            Button {
                isOnboarding.toggle()
            } label: {
                Text("Restart")
                    .font(.system(size: 20))
                    .fontWeight(.bold)
                
            }

            
        }//: VStack
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
