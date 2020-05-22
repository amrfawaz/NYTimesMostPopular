# NYTimesMostPopular
A simple app to hit the NY Times Most Popular Articles API and show a list of articles.

- I used MVVM architectural pattern to make separation between business logic and UI
- Used Alamofire for network handling. And I parse My models using Codable with one generic function.
- I used XCUTest to make UI Test for only two functions (open article details and open read article view)
- I Used XCTest to make Unit Test for only one function (get most viewed articles)
- This application supports iOS 11 and later.


You need to run this app: 
Xcode 11


How to run:
1- Open terminal and and change your current directory to project directory ex: cd Downloads/NYTimesMostPopular
2- Run this command to download pods: pod install
3- Run this command to open the project using Xcode: open NYTimesMostPopular.xworkspace -a Xcode
4- Run the project




How to measure code coverage:
1- Enable code coverage date gathering. To do this, go to Product › Scheme › Edit Scheme... , and select Test from the left hand side menu. Under the Info section, check the Gather coverage data box.

2- To run all unit tests for a test target, in this case BikeProvider, first open the Test navigator in Xcode’s navigation pane. Then, select the small Run button next to your test target name.

3- Now open the Report navigator in Xcode’s navigation pane, and select the Test report from the list. This should open up a list of the tests that were just run and indicate which passed and failed. In this case, they all passed.

4- To view code coverage, select the Coverage tab under Test. Xcode will display the overall code coverage for each component, in my app.
