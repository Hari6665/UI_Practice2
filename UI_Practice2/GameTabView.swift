//
//  GameTabView.swift
//  UI_Practice2
//
//  Created by Harikrishnan K M on 13/09/23.
//

import SwiftUI

struct GameTabView: View {
    var body: some View {
        TabView{
            VehicleView()
                .tabItem {
                    Image(systemName: "car")
                    Text("Vehicle")
                }
            Theme2View()
                .tabItem {
                    Image(systemName: "questionmark.circle")
                    Text("Theme 2")
                }
            Theme3View()
                .tabItem {
                    Image(systemName: "questionmark.circle")
                    Text("Theme 3")
                }
        }
    }
}

struct GameTabView_Previews: PreviewProvider {
    static var previews: some View {
        GameTabView()
    }
}
