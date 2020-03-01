//
//  ContentView.swift
//  SwiftUI-FitListHeight
//
//  Created by Daisuke TONOSAKI on 2020/03/01.
//  Copyright © 2020 Daisuke TONOSAKI. All rights reserved.
//

import SwiftUI

struct RowView: View {
    var name: String
    
    var body: some View {
        HStack {
            Spacer().frame(width: 10)
            
            Image(systemName: name).foregroundColor(.white)
            
            Text(name).foregroundColor(.white)
            
            Spacer()
        }.listRowBackground(Color.blue)
    }
}

struct ContentView: View {
    let rows = [
        "sun.min",
        "sun.min.fill",
        "sun.max",
        "sun.max.fill",
        "sunrise",
        "sunrise.fill",
        "sunset",
        "sunset.fill",
        "sun.dust",
        "sun.dust.fill",
        "sun.haze",
        "sun.haze.fill",
        "moon",
        "moon.fill",
        "moon.circle",
        "moon.circle.fill",
    ]
    static let rowHeight: CGFloat = 50
    static let rowMargin: CGFloat = 0.5 // I don't want to use fixed value. But i don't know right way.
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: true) {
            VStack {
                Text("Weather Symbols").font(.largeTitle)

                Spacer().frame(height: 10)
                
                List {
                    ForEach(0..<rows.count) { (i) in
                        RowView(name: self.rows[i]).frame(height: ContentView.rowHeight)
                    }
                    .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))  // Important!
                }
                .frame(height: CGFloat(rows.count) * (ContentView.rowHeight + ContentView.rowMargin))
                
                Spacer()
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
