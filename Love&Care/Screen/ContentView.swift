//
//  ContentView.swift
//  Love&Care
//
//  Created by Develop on 13/06/2022.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("isOnboarding") var isOnboarding:Bool = true
    var body: some View {
        if isOnboarding {
            Onboarding()
        }else {
            Home()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
