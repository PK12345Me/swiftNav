Trying to understand how TabView and NavigationStack can work with each other, in addition to experimenting with NavigationBar and TabBar

Here's how our app structure looks:

# View0: TabView
##  View1 (NavigationStack - NV1)
  ###  View3 (TabView)
  ### View4 (TabView)
## View2 (NavigationStack - NV2)
  ### View5 (TabView)
  ### View6 (TabView)
  ### View7 (TabView)

1) TabView is more visible in comparison to NavigationStack which is more abstract in nature. In SwiftUI, each tab in a TabView is independent and can contain its own NavigationStack. This allows each tab to manage its own navigation flow without interfering with the others.
2) NavigationStack creates a stack of views(View()) while a user navigates thru the app and remembers it for the user to navigate back to the root view using navigation bar (back button in most cases)
3) In our example, we have a way to resent the NavigationStack (using : path1/2 = NavigationPath()) in view 7 and 4 - find an example below:

//changing Tab(from TabView) and Clearing the Navigation Stack together
              
              // example 1            
             Button("Go to View 2") {
                selectedTab = .view2
                path1 = NavigationPath()

            
            // example 2   
            Button("Home/Root # 1"){
                path1 = NavigationPath()
            }

4) @Binding property wrapper is used to bind the Original navigationPath() and Tab(enum variable) to their values on the child-views, such user can navigate with ease

5) in NavigationTestApp() view, have created a environment property using the init() method to have the same navigationBar appearance across the app
     
