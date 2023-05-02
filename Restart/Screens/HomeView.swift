//
//  HomeView.swift
//  Restart
//
//  Created by Hassan Assiry on 18/03/2023.
//

import SwiftUI

struct HomeView: View {
    @AppStorage("onboarding") var isOnboardingActive: Bool = false
    @State private var isAnimating : Bool = false


//    @available(iOS 15.0, *)
    var body: some View {
        VStack(spacing: 20) {
            //: Header
            Spacer()
            
            ZStack {
                CircleViewTube(ShapeColor: .gray, Shapeopacity: 0.1)
                
                Image("character-2")
                    .resizable()
                    .scaledToFit()
                    .padding()
                    .offset(y: isAnimating ? 35 : -35)
                    .animation(Animation
                    .easeInOut(duration: 4)
                    .repeatForever()
                   , value: isAnimating)
            }
            // : center
            Text("The time that leads to mastery is dependent on the intensity of our focus.")
                .font (.title3)
                .fontWeight(.light)
                .foregroundColor (.secondary)
                .multilineTextAlignment (.center)
                .padding()
            
            Spacer()
            //: footer
            Button(action:{
                withAnimation{
                    playSound(sound: "success", type: "m4a")
                    isOnboardingActive = true
                    
                }
            }){
                Image(systemName: "arrow.triangle.2.circlepath.circle.fill")
                    .imageScale(.large)
                
                Text("Restart")
                    .font(.system(.title3,design: .rounded))
                    .fontWeight(.bold)
            }
            .buttonStyle(.borderedProminent)
            .buttonBorderShape(.capsule)
            .controlSize(.large)
        }// Vstack
        .onAppear(perform:{
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5 , execute: {
                isAnimating = true
            })
        })
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
