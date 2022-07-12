//
//  ContentView.swift
//  TabViewAutoScrolling
//
//  Created by marco rodriguez on 12/07/22.
//

import SwiftUI

struct ContentView: View {
    @State private var currentIndex = 0
    private let numberOfImages = 10
    
    private let timer = Timer.publish(every: 2, on: .main, in: .common).autoconnect()
    
    var body: some View {
        GeometryReader { proxy in
            TabView(selection: $currentIndex) {
                ForEach(0..<10) { num in
                    Image("\(num)")
                        .resizable()
                        .scaledToFill()
                        .tag(num)
                }
            }.tabViewStyle(PageTabViewStyle())
                .clipShape(RoundedRectangle(cornerRadius: 12))
                .padding()
                .frame(width: proxy.size.width, height: proxy.size.height / 3, alignment: .center)
                .onReceive(timer, perform: { _ in
                    //animation
                    withAnimation {
                        //Set the page to be next index
                        currentIndex = currentIndex < numberOfImages ? currentIndex + 1 : 0
                    }
                })
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
