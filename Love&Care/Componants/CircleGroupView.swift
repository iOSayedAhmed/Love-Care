//
//  CircleGroupView.swift
//  Love&Care
//
//  Created by Develop on 13/06/2022.
//

import SwiftUI

struct CircleGroupView: View {
    @State var isAnimating:Bool = false
    var circleGroupColor : Color = .cyan
    var body: some View {
        ZStack{
            Circle()
                .stroke(circleGroupColor.opacity(0.2),lineWidth: 40)
                .frame(width: 260, height: 260, alignment: .center)
            Circle()
                .stroke(circleGroupColor.opacity(0.2), lineWidth: 80)
                .frame(width: 260, height: 260, alignment: .center)
        }//: ZStack
        .scaleEffect(isAnimating ? 1 : 0.5)
        .animation(.easeInOut(duration: 1), value: isAnimating)
        .onAppear {
            isAnimating.toggle()
        }
    }
}

struct CircleGroupView_Previews: PreviewProvider {
    static var previews: some View {
        CircleGroupView()
    }
}
