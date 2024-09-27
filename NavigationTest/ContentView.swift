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
                    .tag(Tab.view2)
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
                    path1.append(102)
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
            VStack{
                Text("This is Root# 2")
                Button("View 5 - Go to") {
                    path2.append(201)
                }.padding()
                Button("View 6 - Go to") {
                    path2.append(202)
                }.padding()
                Button("View 7 - Go to") {
                    path2.append(203)
                }.padding()
                    .navigationDestination(for: Int.self){i in
                        if i == 201 {
                            View5(path2: $path2)
                        } else if i == 202 {
                            View6(path2: $path2, selectedTab: $selectedTab)
                        }
                        else if i == 203 {
                            View7(path2: $path2)
                        }
                    }
            }

            
        }
    }
}

// Root 1 /View 1- child views
struct View3: View{
    @Binding var path1: NavigationPath
    var body: some View{
        VStack{
            Text("Hello View 3 Viewer")
        }
    }
}

struct View4: View{
    @Binding var path1: NavigationPath
    @Binding var selectedTab: Tab
    var body: some View{
        VStack{
            Text("Hello View 4 Inside View 1")
            Button("Go to View 2") {
                selectedTab = .view2
                path1 = NavigationPath()

            }
//changing Tab(from TabView) and Clearing the Navigation Stack together
                            
            .padding()
            Button("Home/Root # 1"){
                path1 = NavigationPath()
            }
        }
    }
}

// Root 2/View 2- child views
struct View5: View{
    @Binding var path2: NavigationPath
    var body: some View{
        VStack{
            Text("Hello View 5 Viewer")
        }
    }
}

struct View6: View{
    @Binding var path2: NavigationPath
    @Binding var selectedTab: Tab
    var body: some View{
        VStack{
            Text("Hello View 6 Viewer")
        }
    }
}
