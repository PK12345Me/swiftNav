//
//  ContentView.swift
//  NavigationTest
//
//  Created by Kislay Panday on 9/27/24.
//

import SwiftUI

enum Tab {
    case view1
    case view2
}

struct ContentView: View {
    @State private var selectedTab: Tab = .view1
    var body: some View {
        VStack {
            TabView(selection: $selectedTab) {
                View1(selectedTab: $selectedTab)
                    .tabItem{Label("View-1", systemImage: "1.circle")}
                    .tag(Tab.view1)
                View2(selectedTab: $selectedTab)
                    .tabItem{Label("View-2", systemImage: "2.circle")}
                    .tag(Tab.view1)
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
struct View1: View{
    @State private var path1 = NavigationPath()
    @Binding var selectedTab: Tab
    var body: some View{
        NavigationStack(path: $path1){
            VStack{
                Text("This is Root# 1")
                Button("View 3 - Go to") {
                    path1.append(101)
                }.padding()
                Button("View 4 - Go to") {
                    path1.append(101)
                }.padding()
                    .navigationDestination(for: Int.self){i in
                        if i == 101 {
                            View3(path1: $path1)
                        } else if i == 102 {
                            View4(path1: $path1, selectedTab: $selectedTab)
                        }
                    }
            }
            
        }
    }
}


struct View2: View{
    @State private var path2 = NavigationPath()
    @Binding var selectedTab: Tab
    var body: some View{
        NavigationStack{
            
        }
    }
}

struct View3: View{
    var body: some View{
        VStack{
            Text("Hello View 3 Viewer")
        }
    }
}

struct View4: View{
    var body: some View{
        VStack{
            Text("Hello View 4 Viewer")
        }
    }
}
