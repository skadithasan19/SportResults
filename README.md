# SportResults

First of all, thank you so much for giving me the opportunity to work on this challenge. I enjoyed spending time on it. 

1. According the to question it did not mention anything about the language that’s why I picked SwiftUI. Although I could have done the same thing using UIKit. 
2. I used MVVM architecture and build custom extendable API layer for new request
3. Here I have SportInfoProtocol for abstraction of the sports and a SportModel enum I am using to access the real object as it maybe different for each Sports result. So every sports has to implement SportInfoProtocol


SportsViewModel: ViewModel
1. ViewModel Implement SportsResultProtocol for making API call and Loadable for loading results by states(loading, loaded, failed)
2. After getting the results I am sorting it by date right away before loading the results to UI. Most recent result on top


View
1. SportResultsApp setting up the landing page for showing the “Get Result” button. After tapping it user see the lists
2. In ContentView I am using Asyncloadableview for showing loading animation as per the design
3. According to the given design I build the text but I also added the time label to see the right order by time
4.   buildGameResultView: method build the Result cell by pulling right model data

Adding More types to sports

1. First we need create new Model like others and then set a new enum type in SportModel enum 
2. Parse new model like other and load it in the array in SportsBucket

<img width="661" alt="Screen Shot 2021-10-25 at 1 15 45 AM" src="https://user-images.githubusercontent.com/6060441/138643722-52b28d10-4865-4caa-a781-2f5134246ff3.png">
