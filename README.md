# ToDone

ToDone is a basic "demo" project for navigation using the [SwiftUI Navigation library](https://github.com/pointfreeco/swiftui-navigation) from [Point Free](https://www.pointfree.co/).

## Usage

Move functionality and state into model classes (out of views)

* Observable Object - preferred over @State for testability and deep linking

Model holds @Published data (e.g., array of items)

* Navigation based on Enum Optional
* Enum is @CasePathable from SwiftUI Navigation library
* Cases based on event/action and associated value binding passed in
* Navigation destination property stored in optional of enum type
* Optional parameter to initializer for deep linking
* Model functions called based on actions (UI) for functionality and destination



View binds Model Destination property for navigation
* SwiftUI Navigation library adds sheet modifier based on enum
* .sheet modifier uses case path optional (set in functions in model) for navigation and binding
* Dismissing the sheet resets the navigation optional to nil
* .navigationDestination is similar
* Other [navigation documentation](https://swiftpackageindex.com/pointfreeco/swiftui-navigation/main/documentation/swiftuinavigation/navigation)

## License

[MIT](https://choosealicense.com/licenses/mit/)
