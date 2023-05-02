//
//  ContentView.swift
//  Restart
//
//  Created by Hassan Assiry on 18/03/2023.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("onboarding") var isOnbardingViewActive : Bool = true
    
    var body: some View {
        if isOnbardingViewActive {
            OnboardingView()
        }else{
            HomeView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
