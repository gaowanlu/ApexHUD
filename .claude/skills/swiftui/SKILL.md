### static let start: SensoryFeedback

Source: https://developer.apple.com/documentation/swiftui/sensoryfeedback

Indicates that an activity started.

```APIDOC
## static let start: SensoryFeedback

### Description
Indicates that an activity started.

### Type
Static Property

### Signature
`static let start: SensoryFeedback`

### Return Value
- **SensoryFeedback** - A feedback instance indicating an activity started.
```

--------------------------------

### Example: Indenting a Leading Alignment Guide in SwiftUI

Source: https://developer.apple.com/documentation/swiftui/layout/explicitalignment%28of%3Ain%3Aproposal%3Asubviews%3Acache%3A%29

Implement this method to customize the position of a specific alignment guide. This example indents the leading edge of a custom `BasicVStack` by 10 points.

```Swift
extension BasicVStack {
    func explicitAlignment(
        of guide: HorizontalAlignment,
        in bounds: CGRect,
        proposal: ProposedViewSize,
        subviews: Subviews,
        cache: inout ()
    ) -> CGFloat? {
        if guide == .leading {
            return bounds.minX + 10
        }
        return nil
    }
}
```

--------------------------------

### MeshGradient Initialization Example

Source: https://developer.apple.com/documentation/swiftui/meshgradient

An example demonstrating how to initialize a `MeshGradient` with explicit points and colors.

```APIDOC
## MeshGradient Initialization Example

### Description
This example shows a basic initialization of a `MeshGradient` with a 3x3 grid, specifying points and an array of colors.

### Code
```swift
MeshGradient(width: 3, height: 3, points: [
    .init(0, 0), .init(0.5, 0), .init(1, 0),
    .init(0, 0.5), .init(0.5, 0.5), .init(1, 0.5),
    .init(0, 1), .init(0.5, 1), .init(1, 1)
], colors: [
    .red, .purple, .indigo,
    .orange, .white, .blue,
    .yellow, .green, .mint
])
```
```

--------------------------------

### init(action: () -> Void)

Source: https://developer.apple.com/documentation/swiftui/helplink

Constructs a new help link with the specified action.

```APIDOC
## HelpLink.init(action: () -> Void)

### Description
Constructs a new help link with the specified action.

### Parameters
- **action** (`() -> Void`) - The closure to execute when the help link is activated.

### Example
```swift
HelpLink {
    print("Help link tapped!")
}
```
```

--------------------------------

### Alignment Gallery Example

Source: https://developer.apple.com/documentation/swiftui/alignment

A comprehensive example demonstrating all built-in alignment guides using overlay modifiers. This example shows how each alignment positions content relative to a background view with text and color elements.

```APIDOC
## Alignment Gallery Example

### Description
Complete example demonstrating all built-in alignment guides and their visual positioning.

### Code
```swift
struct AlignmentGallery: View {
    var body: some View {
        BackgroundView()
            .overlay(alignment: .topLeading) { box(".topLeading") }
            .overlay(alignment: .top) { box(".top") }
            .overlay(alignment: .topTrailing) { box(".topTrailing") }
            .overlay(alignment: .leading) { box(".leading") }
            .overlay(alignment: .center) { box(".center") }
            .overlay(alignment: .trailing) { box(".trailing") }
            .overlay(alignment: .bottomLeading) { box(".bottomLeading") }
            .overlay(alignment: .bottom) { box(".bottom") }
            .overlay(alignment: .bottomTrailing) { box(".bottomTrailing") }
            .overlay(alignment: .leadingLastTextBaseline) { box(".leadingLastTextBaseline") }
            .overlay(alignment: .trailingFirstTextBaseline) { box(".trailingFirstTextBaseline") }
    }

    private func box(_ name: String) -> some View {
        Text(name)
            .font(.system(.caption, design: .monospaced))
            .padding(2)
            .foregroundColor(.white)
            .background(.blue.opacity(0.8), in: Rectangle())
    }
}

private struct BackgroundView: View {
    var body: some View {
        Grid(horizontalSpacing: 0, verticalSpacing: 0) {
            GridRow {
                Text("Some text in an upper quadrant")
                Color.gray.opacity(0.3)
            }
            GridRow {
                Color.gray.opacity(0.3)
                Text("More text in a lower quadrant")
            }
        }
        .aspectRatio(1, contentMode: .fit)
        .foregroundColor(.secondary)
        .border(.gray)
    }
}
```

### Key Concepts
- Uses `overlay(alignment:content:)` modifier with different alignment values
- Demonstrates visual positioning of content relative to background
- Shows text baseline alignments (leadingLastTextBaseline, trailingFirstTextBaseline)
- Text baseline alignments align with top-most and bottom-most lines of text respectively
```

--------------------------------

### init(anchor: NSHelpManager.AnchorName, book: NSHelpManager.BookName)

Source: https://developer.apple.com/documentation/swiftui/helplink

Constructs a new help link with the specified anchor and book.

```APIDOC
## HelpLink.init(anchor: NSHelpManager.AnchorName, book: NSHelpManager.BookName)

### Description
Constructs a new help link with the specified anchor and book.

### Parameters
- **anchor** (`NSHelpManager.AnchorName`) - The name of the anchor within the specified help book.
- **book** (`NSHelpManager.BookName`) - The name of the help book.

### Example
```swift
HelpLink(anchor: "advancedSettings", book: "MyCustomHelpBook")
```
```

--------------------------------

### GET Alignment.trailing

Source: https://developer.apple.com/documentation/swiftui/alignment/trailing

A guide that marks the trailing edge of the view. This alignment combines the trailing horizontal guide and the center vertical guide.

```APIDOC
## GET Alignment.trailing

### Description
A guide that marks the trailing edge of the view. This alignment combines the trailing horizontal guide and the center vertical guide.

### Method
GET

### Endpoint
/Alignment/trailing

### Parameters
#### Path Parameters
- None

### Request Example
```swift
Text("Hello World").frame(alignment: .trailing)
```

### Response
#### Success Response (200)
- **Alignment** (Object) - The trailing alignment guide.

#### Response Example
```swift
Alignment.trailing
```
```

--------------------------------

### init(content:)

Source: https://developer.apple.com/documentation/swiftui/uihostingconfiguration/init%28content%3A%29

Creates a hosting configuration with the given contents. This initializer is available when `Content` conforms to `View` and `Background` is `EmptyView`.

```APIDOC
## init(content:)

### Description
Creates a hosting configuration with the given contents. This initializer is available when `Content` conforms to `View` and `Background` is `EmptyView`.

### Signature
init(@ContentBuilder content: () -> Content)

### Parameters
#### Function Parameters
- **content** (()->Content) - Required - The contents of the SwiftUI hierarchy to be shown inside the cell.
```

--------------------------------

### GET SwiftUI.Alignment.topLeading

Source: https://developer.apple.com/documentation/swiftui/alignment/topleading

A guide that marks the top and leading edges of the view. It combines the leading horizontal guide and the top vertical guide for precise layout control.

```APIDOC
## GET SwiftUI.Alignment.topLeading

### Description
A guide that marks the top and leading edges of the view. This alignment combines the leading horizontal guide and the top vertical guide.

### Method
STATIC PROPERTY

### Endpoint
SwiftUI.Alignment.topLeading

### Parameters
#### Path Parameters
- **None**

#### Query Parameters
- **None**

#### Request Body
- **None**

### Request Example
```swift
// Usage in a SwiftUI View
Text("Example")
    .frame(width: 100, height: 100, alignment: .topLeading)
```

### Response
#### Success Response (200)
- **topLeading** (Alignment) - A static constant representing the top-leading alignment guide.

#### Response Example
{
  "type": "Alignment",
  "identifier": "topLeading",
  "platforms": ["iOS 13.0+", "macOS 10.15+", "tvOS 13.0+", "watchOS 6.0+"]
}
```

--------------------------------

### Define Custom Vertical Alignment Guide

Source: https://developer.apple.com/documentation/swiftui/viewdimensions

This example demonstrates how to implement a custom `AlignmentID` to create a `VerticalAlignment` that positions a view's guide at one-third of its height using `ViewDimensions`.

```swift
private struct FirstThirdAlignment: AlignmentID {
    static func defaultValue(in context: ViewDimensions) -> CGFloat {
        context.height / 3
    }
}

extension VerticalAlignment {
    static let firstThird = VerticalAlignment(FirstThirdAlignment.self)
}
```

--------------------------------

### GET Alignment.center

Source: https://developer.apple.com/documentation/swiftui/alignment/trailing

A guide that marks the center of the view.

```APIDOC
## GET Alignment.center

### Description
A guide that marks the center of the view.

### Method
GET

### Endpoint
/Alignment/center

### Parameters
#### Path Parameters
- None

### Request Example
```swift
Text("Hello World").frame(alignment: .center)
```

### Response
#### Success Response (200)
- **Alignment** (Object) - The center alignment guide.

#### Response Example
```swift
Alignment.center
```
```

--------------------------------

### init()

Source: https://developer.apple.com/documentation/swiftui/settingslink/init%28%29

Creates a settings link with the default system label.

```APIDOC
## init()

### Description
Creates a settings link with the default system label.

### Method Signature
```swift
nonisolated
init() where Label == DefaultSettingsLinkLabel
```

### Availability
macOS 14.0+

### Discussion
The display of the label may be customized using the `labelStyle(_:)` modifier.
```

--------------------------------

### init()

Source: https://developer.apple.com/documentation/swiftui/settingslink/init%28label%3A%29

Creates a settings link with the default system label.

```APIDOC
## Initializer: init()

### Description
Creates a settings link with the default system label.
```

--------------------------------

### GET Alignment.leading

Source: https://developer.apple.com/documentation/swiftui/alignment/trailing

A guide that marks the leading edge of the view.

```APIDOC
## GET Alignment.leading

### Description
A guide that marks the leading edge of the view.

### Method
GET

### Endpoint
/Alignment/leading

### Parameters
#### Path Parameters
- None

### Request Example
```swift
Text("Hello World").frame(alignment: .leading)
```

### Response
#### Success Response (200)
- **Alignment** (Object) - The leading alignment guide.

#### Response Example
```swift
Alignment.leading
```
```

--------------------------------

### Getting Indices

Source: https://developer.apple.com/documentation/swiftui/sectionedfetchresults

Properties to access the start and end indices of the sections collection.

```APIDOC
## Property: startIndex

### Description
The index of the first section in the results collection.

### Type
`var startIndex: Int`

## Property: endIndex

### Description
The index that’s one greater than that of the last section.

### Type
`var endIndex: Int`
```

--------------------------------

### init()

Source: https://developer.apple.com/documentation/swiftui/settingslink

Creates a settings link with the default system label.

```APIDOC
## init()

### Description
Creates a settings link with the default system label.

### Type
Initializer

### Parameters
This initializer takes no parameters.

### Example Usage
```swift
SettingsLink()
```
```

--------------------------------

### init(destination: URL)

Source: https://developer.apple.com/documentation/swiftui/helplink

Constructs a new help link that opens the specified destination URL.

```APIDOC
## HelpLink.init(destination: URL)

### Description
Constructs a new help link that opens the specified destination URL.

### Parameters
- **destination** (`URL`) - The URL to open when the help link is activated.

### Example
```swift
if let url = URL(string: "https://example.com/help") {
    HelpLink(destination: url)
}
```
```

--------------------------------

### Creating a TextEditor with Custom Styling

Source: https://developer.apple.com/documentation/swiftui/texteditor/init%28text%3A%29

An example demonstrating how to create a TextEditor and apply basic styling like foreground color, font, and line spacing.

```swift
struct TextEditingView: View {
    @State private var fullText: String = "This is some editable text..."


    var body: some View {
        TextEditor(text: $fullText)
            .foregroundColor(Color.gray)
            .font(.custom("HelveticaNeue", size: 13))
            .lineSpacing(5)
    }
}
```

--------------------------------

### init(destination:)

Source: https://developer.apple.com/documentation/swiftui/helplink/init%28destination%3A%29

Constructs a new help link that opens the specified destination URL. Use this initializer for a standard help button appearance that links to a website.

```APIDOC
## Method: init(destination:)

### Description
Constructs a new help link that opens the specified destination URL.

### Signature
```swift
@MainActor @preconcurrency
init(destination: URL)
```

### Parameters
- **destination** (URL) - Required - The URL to open when the button is clicked.

### Discussion
Use this initializer when you want the standard help button appearance that opens a link to a website.
You can override the default behavior when the button is clicked by setting the `openURL` environment value with a custom `OpenURLAction`.
```

--------------------------------

### Apply Alignment Guide Offset Adjustment in SwiftUI

Source: https://developer.apple.com/documentation/swiftui/viewdimensions/subscript%28_%3A%29

Demonstrates using the subscript to access and modify a horizontal alignment guide value. This example shows how to read the leading guide value from the context and adjust it by subtracting 10 points. The subscript enables dynamic layout adjustments based on guide positions.

```swift
.alignmentGuide(.leading) { context in
    context[.leading] - 10
}
```

--------------------------------

### init(anchor:book:)

Source: https://developer.apple.com/documentation/swiftui/helplink/init%28anchor%3Abook%3A%29

Constructs a new help link with the specified anchor and book.

```APIDOC
## init(anchor:book:)

### Description
Constructs a new help link with the specified anchor and book.

### Method Signature
```swift
@MainActor @preconcurrency
init(
    anchor: NSHelpManager.AnchorName,
    book: NSHelpManager.BookName
)
```

### Parameters
- **anchor** (`NSHelpManager.AnchorName`) - The anchor within the help book to open to.
- **book** (`NSHelpManager.BookName`) - The specific book name to open.

### Availability
macOS 14.0+
```

--------------------------------

### ViewDimensions3D subscript(_:) - Get Depth Guide Value

Source: https://developer.apple.com/documentation/swiftui/viewdimensions3d/subscript%28_%3A%29

Accesses the value of a given depth guide in ViewDimensions3D. This subscript method allows you to retrieve the offset of a particular alignment guide by using it as an index to read from the view context.

```APIDOC
## subscript(_:)

### Description
Gets the value of the given depth guide from ViewDimensions3D. This subscript enables access to depth alignment guide values within a view context.

### Method
Instance Subscript (Getter)

### Availability
- **Platform**: visionOS 1.0+

### Syntax
```swift
subscript(guide: DepthAlignment) -> CGFloat { get }
```

### Parameters
#### Subscript Parameters
- **guide** (DepthAlignment) - Required - The depth alignment guide to retrieve the value for

### Return Value
- **CGFloat** - The offset value of the specified depth guide

### Usage Example
```swift
.alignmentGuide(.front) { context in
    context[.front] - 10
}
```

### Description
Find the offset of a particular guide in the corresponding view by using that guide as an index to read from the context. The subscript allows you to access depth guide values directly from the ViewDimensions3D context.

### Related Documentation
- For information about using subscripts in Swift to access member elements of a collection, list, or sequence, see Subscripts in _The Swift Programming Language_
```

--------------------------------

### Get initial drag start location in SwiftUI

Source: https://developer.apple.com/documentation/swiftui/draggesture/value/location

The startLocation property provides the CGPoint where the drag gesture first originated, allowing for calculations relative to the starting point.

```swift
var startLocation: CGPoint
```

--------------------------------

### Creating a Basic Preview

Source: https://developer.apple.com/documentation/swiftui/previewprovider

Conform a structure to PreviewProvider and implement the previews property to return the view you want to preview.

```swift
struct CircleImage_Previews: PreviewProvider {
    static var previews: some View {
        CircleImage()
    }
}
```

--------------------------------

### Access Depth Guide Value with subscript in SwiftUI

Source: https://developer.apple.com/documentation/swiftui/viewdimensions3d/subscript%28_%3A%29

Gets the value of the given depth guide using subscript notation. This instance subscript takes a DepthAlignment parameter and returns a CGFloat representing the offset. Use this to read depth guide values from a view's context, such as when configuring alignment guides.

```swift
subscript(guide: DepthAlignment) -> CGFloat { get }
```

```swift
.alignmentGuide(.front) { context in
    context[.front] - 10
}
```

--------------------------------

### init(_:for:contentType:prepareDocument:)

Source: https://developer.apple.com/documentation/swiftui/newdocumentbutton/init%28_%3Afor%3Acontenttype%3Apreparedocument%3A%29

Initializes a button that allows users to create a new document, with an optional preparation step.

```APIDOC
## init(_:for:contentType:prepareDocument:)

### Description
Creates a button that initiates the creation of a new document of a specified type. This initializer is available when the button's label is a Text view.

### Signature
```swift
init<D>(
    _ title: LocalizedStringResource,
    for documentType: D.Type = D.self,
    contentType: UTType? = nil,
    prepareDocument: @escaping () async throws -> D? = { nil }
) where D : FileDocument
```

### Parameters
#### Arguments
- **title** (LocalizedStringResource) - A localized string resource used as the title for the button.
- **documentType** (D.Type) - The type of the document to be created. Defaults to the inferred type `D.self`.
- **contentType** (UTType?) - An optional uniform type identifier (UTType) for the document to create.
- **prepareDocument** (escaping () async throws -> D?) - A closure executed when the user interacts with the button. This closure can be used to present a template picker or other UI. Return a prepared document object, `nil` to create a default empty document, or throw an error to indicate failure.
```

--------------------------------

### Custom Depth Alignment Guide Implementation

Source: https://developer.apple.com/documentation/swiftui/depthalignmentid/defaultvalue%28in%3A%29

Example implementation of a custom DepthAlignmentID that positions a guide at one-third of the view's depth. The context parameter provides access to the view's dimensions for calculating the offset.

```Swift
private struct FirstThirdAlignment: DepthAlignmentID {
    static func defaultValue(in context: ViewDimensions3D) -> CGFloat {
        context.depth / 3
    }
}
```

--------------------------------

### init(_:systemImage:content:)

Source: https://developer.apple.com/documentation/swiftui/menu/init%28_%3Asystemimage%3Acontent%3A%29

Creates a menu that generates its label from a localized string key and system image.

```APIDOC
## init(_:systemImage:content:)

### Description
Creates a menu that generates its label from a localized string key and system image.

### Signature
```swift
init(
    _ titleKey: LocalizedStringKey,
    systemImage: String,
    @ContentBuilder content: () -> Content
)
```

### Parameters
- **titleKey** (LocalizedStringKey) - The key for the link’s localized title, which describes the contents of the menu.
- **systemImage** (String) - The name of the image resource to lookup.
- **content** (() -> Content) - A closure that returns the menu items.

### Requirements
Available when `Label` is `Label<Text, Image>` and `Content` conforms to `View`.

### Platform Support
- iOS 14.0+
- iPadOS 14.0+
- Mac Catalyst 14.0+
- macOS 11.0+
- tvOS 17.0+
- visionOS 1.0+
```

--------------------------------

### init(_:_:background:)

Source: https://developer.apple.com/documentation/swiftui/documentgrouplaunchscene/init%28_%3A_%3Abackground%3A%29-2iefz

Creates a launch scene for document-based applications with a title, a set of actions, and a background.

```APIDOC
## Initializer: init(_:_:background:)

### Description
Creates a launch scene for document-based applications with a title, a set of actions, and a background.

### Method Signature
```swift
nonisolated
init(
    _ title: some StringProtocol,
    @ContentBuilder _ actions: () -> Actions,
    @ContentBuilder background: () -> some View
)
```

### Parameters
- **title** (some StringProtocol) - A string to use for the view title.
- **actions** (@ContentBuilder () -> Actions) - A content builder for returning the view’s actions.
- **background** (@ContentBuilder () -> some View) - The background of the scene.

### Discussion
Use a `DocumentGroupLaunchScene` alongside any `DocumentGroup` scenes. If you don’t implement a `DocumentGroup` in the app declaration, you can get the same design by implementing a `DocumentLaunchView`.
```

--------------------------------

### Using periodic schedule with TimelineView

Source: https://developer.apple.com/documentation/swiftui/timelineschedule/periodic%28from%3Aby%3A%29

Example of a TimelineView that updates every three seconds starting from a specified date.

```swift
TimelineView(.periodic(from: startDate, by: 3.0)) { context in
    Text(context.date.description)
}
```

--------------------------------

### GET SwiftUI.UnitCurve.easeIn

Source: https://developer.apple.com/documentation/swiftui/unitcurve/easein

Accesses a predefined bezier curve that starts out slowly, then speeds up as it finishes.

```APIDOC
## GET SwiftUI.UnitCurve.easeIn

### Description
A bezier curve that starts out slowly, then speeds up as it finishes. This property is used to define timing curves for SwiftUI animations.

### Method
GET

### Endpoint
SwiftUI.UnitCurve.easeIn

### Parameters
#### Path Parameters
- None

#### Query Parameters
- None

#### Request Body
- None

### Request Example
```swift
// Accessing the easeIn curve property
static let easeIn: UnitCurve
```

### Response
#### Success Response (200)
- **UnitCurve** (Object) - A bezier curve instance with specific control points.

#### Response Example
{
  "type": "UnitCurve",
  "controlPoints": {
    "start": {"x": 0.42, "y": 0.0},
    "end": {"x": 1.0, "y": 1.0}
  },
  "platforms": [
    "iOS 17.0+",
    "macOS 14.0+",
    "tvOS 17.0+",
    "watchOS 10.0+",
    "visionOS 1.0+"
  ]
}
```

--------------------------------

### Create custom VerticalAlignment guide using AlignmentID in SwiftUI

Source: https://developer.apple.com/documentation/swiftui/verticalalignment

Demonstrates how to create a custom vertical alignment guide by conforming to the AlignmentID protocol and extending VerticalAlignment with a static property. The example creates a FirstThirdAlignment that positions the guide at one-third of the view's height, calculated via the defaultValue(in:) method.

```swift
private struct FirstThirdAlignment: AlignmentID {
    static func defaultValue(in context: ViewDimensions) -> CGFloat {
        context.height / 3
    }
}


extension VerticalAlignment {
    static let firstThird = VerticalAlignment(FirstThirdAlignment.self)
}
```

--------------------------------

### init(_:backgroundStyle:_:)

Source: https://developer.apple.com/documentation/swiftui/documentgrouplaunchscene/init%28_%3Abackgroundstyle%3A_%3A%29

Creates a launch scene for document-based applications with a title, a background style, and a set of actions.

```APIDOC
## init(_:backgroundStyle:_:)

### Description
Creates a launch scene for document-based applications with a title, a background style, and a set of actions.

### Declaration
```swift
@export(implementation) nonisolated
init<B>(
    _ title: LocalizedStringResource,
    backgroundStyle: B = BackgroundStyle(),
    @ContentBuilder _ actions: () -> Actions = { DefaultDocumentGroupLaunchActions() }
) where B : ShapeStyle
```

### Parameters
- **title** (`LocalizedStringResource`) - A resource to use for the view title.
- **backgroundStyle** (`B`) - A background style of the view. Defaults to `BackgroundStyle()` where `B` conforms to `ShapeStyle`.
- **actions** (`() -> Actions`) - A content builder for returning the view’s actions. Defaults to `{ DefaultDocumentGroupLaunchActions() }`.
```

--------------------------------

### Create Custom Alignment with Horizontal and Vertical Guides - SwiftUI

Source: https://developer.apple.com/documentation/swiftui/alignment/init%28horizontal%3Avertical%3A%29

Initializes a custom Alignment by combining a HorizontalAlignment and VerticalAlignment. This initializer enables creation of custom alignments that can be used with SwiftUI layout containers. The example demonstrates combining a custom vertical guide 'firstThird' with the built-in 'center' horizontal guide for use in a ZStack.

```swift
init(
    horizontal: HorizontalAlignment,
    vertical: VerticalAlignment
)
```

```swift
ZStack(alignment: Alignment(horizontal: .center, vertical: .firstThird)) {
    // ...
}
```

--------------------------------

### init(configuration:)

Source: https://developer.apple.com/documentation/swiftui/blurreplacetransition/configuration-swift.property

Creates a new transition with the specified configuration.

```APIDOC
## init(configuration:)

### Description
Creates a new transition.

### Declaration
```swift
init(configuration: BlurReplaceTransition.Configuration)
```

### Parameters
- **configuration** (BlurReplaceTransition.Configuration) - The configuration properties for the transition.
```

--------------------------------

### init(_:)

Source: https://developer.apple.com/documentation/swiftui/wkapplicationdelegateadaptor

Initializes a new `WKApplicationDelegateAdaptor` instance.

```APIDOC
## init(_:)

### Description
Creates an `WKApplicationDelegateAdaptor` using a WatchKit Application Delegate.

### Declaration
```swift
init(_:)
```
```

--------------------------------

### Aligning Subviews with depthAlignment

Source: https://developer.apple.com/documentation/swiftui/layout/depthalignment%28_%3Acontent%3A%29

This example demonstrates how to use `depthAlignment` with an `HStackLayout` to align a button to the `.front` of the layout, specifying a depth guide for its subviews.

```Swift
   HStackLayout().depthAlignment(.front) {
       RobotModel()
       Button("Play animation") {
           playRobotAnimation()
       }
       .glassBackgroundEffect()
   }
```

--------------------------------

### dimensions(in:) - Get Subview Dimensions

Source: https://developer.apple.com/documentation/swiftui/layoutsubview

Queries the subview for its dimensions and alignment guides. Returns information about the subview's size and layout characteristics.

```APIDOC
## func dimensions(in:) -> ViewDimensions

### Description
Asks the subview for its dimensions and alignment guides.

### Method
Instance Method

### Parameters
- **in** (ProposedViewSize) - Required - The proposed size to query dimensions for

### Returns
- **ViewDimensions** - The dimensions and alignment guides of the subview
```

--------------------------------

### init(configuration:)

Source: https://developer.apple.com/documentation/SwiftUI/ReferenceFileDocument/init%28configuration%3A%29

Creates a document and initializes it with the contents of a file.

```APIDOC
## init(configuration:)

### Description
Creates a document and initializes it with the contents of a file. SwiftUI calls this initializer when someone opens a file type that matches one of those that your document type supports.

### Signature
```swift
init(configuration: Self.ReadConfiguration) throws
```

### Parameters
- **configuration** (`Self.ReadConfiguration`) - Required. Information about the file that you read document data from.

### Discussion
Use the `file` property of the `configuration` input to get document’s data. Deserialize the data, and store it in your document’s data structure.

### Example
```swift
init(configuration: ReadConfiguration) throws {
    guard let data = configuration.file.regularFileContents
    else { /* Throw an error. */ }
    model = try JSONDecoder().decode(Model.self, from: data)
}
```
```

--------------------------------

### init(rootView: Content)

Source: https://developer.apple.com/documentation/swiftui/nshostingmenu

Creates a hosting menu object that wraps the specified SwiftUI view.

```APIDOC
## Initializer: init(rootView: Content)

### Description
Creates a hosting menu object that wraps the specified SwiftUI view.

### Method
Initializer

### Parameters
#### Function Parameters
- **rootView** (Content) - Required - The SwiftUI view hierarchy to be managed by this menu.
```

--------------------------------

### Get entries from EveryMinuteTimelineSchedule in Swift

Source: https://developer.apple.com/documentation/swiftui/everyminutetimelineschedule

Retrieves a sequence of per-minute dates starting from a given date using the entries(from:mode:) method. This function returns an EveryMinuteTimelineSchedule.Entries sequence that provides dates for timeline updates, accepting a start date and TimelineScheduleMode parameter.

```swift
func entries(from: Date, mode: TimelineScheduleMode) -> EveryMinuteTimelineSchedule.Entries
```

--------------------------------

### init()

Source: https://developer.apple.com/documentation/swiftui/accessorybarbuttonstyle

Creates an accessory toolbar style.

```APIDOC
## Method: `init()`

### Description
Creates an accessory toolbar style.

### Signature
```swift
init()
```
```

--------------------------------

### Get 3D Start Location of Drag Gesture in SwiftUI

Source: https://developer.apple.com/documentation/swiftui/draggesture/value/startlocation3d

This property provides the initial 3D coordinate where a drag gesture began. It is a read-only property that returns a `Point3D` value, indicating the starting position in a 3D space, typically used in visionOS applications.

```swift
var startLocation3D: Point3D { get }
```

--------------------------------

### OpenSettingsAction Usage Example

Source: https://developer.apple.com/documentation/swiftui/opensettingsaction

A practical example demonstrating how to use OpenSettingsAction to create a button that opens the app's settings window to a specific tab. This example shows integration with SwiftUI views and environment values.

```APIDOC
## OpenSettingsAction Usage Example

### Description
Demonstrates how to use OpenSettingsAction to open the settings window to a particular tab.

### Example Code

#### App Structure
```swift
@main
struct MyApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        #if os(macOS)
        Settings {
            SettingsView()
        }
        #endif
    }
}
```

#### Settings View
```swift
struct SettingsView: View {
    @AppStorage("selectedSettingsTab")
    private var selectedSettingsTab = SettingsTab.general

    var body: some View {
        TabView(selection: $selectedSettingsTab) {
            GeneralSettings()
            AdvancedSettings()
        }
    }
}
```

#### Button Implementation
```swift
struct AdvancedSettingsButton: View {
    @AppStorage("selectedSettingsTab")
    private var selectedSettingsTab = SettingsTab.general

    @Environment(\.openSettings) private var openSettings

    var body: some View {
        Button("Open Advanced Settings…") {
            selectedSettingsTab = .advanced
            openSettings()
        }
    }
}
```

#### Settings Tab Enumeration
```swift
enum SettingsTab: Int {
    case general
    case advanced
}
```
```

--------------------------------

### init()

Source: https://developer.apple.com/documentation/swiftui/emptycommands/init%28%29

Creates an empty command hierarchy.

```APIDOC
## init()

### Description
Creates an empty command hierarchy.

### Method Signature
```swift
nonisolated
init()
```

### Availability
iOS 14.0+, iPadOS 14.0+, Mac Catalyst 14.0+, macOS 11.0+, visionOS 1.0+
```

--------------------------------

### GET UnitCurve.circularEaseOut

Source: https://developer.apple.com/documentation/swiftui/unitcurve/circulareaseout

Accesses the circularEaseOut property, which provides a circular curve that starts quickly and slows down as it finishes.

```APIDOC
## GET UnitCurve.circularEaseOut

### Description
A circular curve that starts out quickly, then slows down as it approaches the end. The shape of the curve is equal to the second (top left) quadrant of a unit circle.

### Method
GET

### Endpoint
UnitCurve.circularEaseOut

### Parameters
#### Path Parameters
- None

#### Query Parameters
- None

#### Request Body
- None

### Request Example
```swift
let curve = UnitCurve.circularEaseOut
```

### Response
#### Success Response (200)
- **circularEaseOut** (UnitCurve) - A predefined easing curve property.

#### Response Example
```swift
static let circularEaseOut: UnitCurve
```

### Platform Support
- **iOS**: 17.0+
- **iPadOS**: 17.0+
- **macOS**: 14.0+
- **tvOS**: 17.0+
- **visionOS**: 1.0+
- **watchOS**: 10.0+
```

--------------------------------

### init()

Source: https://developer.apple.com/documentation/swiftui/accessorybarbuttonstyle/init%28%29

Creates an accessory toolbar style.

```APIDOC
## init()

### Description
Creates an accessory toolbar style.

### Signature
```swift
nonisolated
init()
```

### Availability
macOS 14.0+
```

--------------------------------

### ScrollView with Default Scroll Anchor Bottom

Source: https://developer.apple.com/documentation/swiftui/scrollview

This example shows how to set a ScrollView to start with its content aligned to the bottom, useful when the primary scroll direction is vertical.

```swift
ScrollView {
    // initially bottom aligned content
}
.defaultScrollAnchor(.bottom)
```

--------------------------------

### init(_:systemImage:selection:content:)

Source: https://developer.apple.com/documentation/swiftui/picker/init%28_%3Asystemimage%3Aselection%3Acontent%3A%29

Creates a picker that generates its label from a localized string key and system image.

```APIDOC
## init(_:systemImage:selection:content:)

### Description
Creates a picker that generates its label from a localized string key and system image.

### Declaration
```swift
init(
    _ titleKey: LocalizedStringKey,
    systemImage: String,
    selection: Binding<SelectionValue>,
    @ContentBuilder content: () -> Content
)
```

### Parameters
- **titleKey** (LocalizedStringKey) - A localized string key that describes the purpose of selecting an option.
- **systemImage** (String) - The name of the image resource to lookup.
- **selection** (Binding<SelectionValue>) - A binding to a property that determines the currently-selected option.
- **content** (ContentBuilder) - A view closure that contains the set of options.

### Requirements
- **Label**: Must be `Label<Text, Image>`
- **SelectionValue**: Must conform to `Hashable`
- **Content**: Must conform to `View`

### Discussion
This initializer creates a `Text` view on your behalf and treats the localized key similar to `init(_:tableName:bundle:comment:)`. It is available on iOS 14.0+, macOS 11.0+, tvOS 14.0+, and watchOS 7.0+.
```

--------------------------------

### Example EllipticalGradient with Custom Stops

Source: https://developer.apple.com/documentation/swiftui/ellipticalgradient/init%28stops%3Acenter%3Astartradiusfraction%3Aendradiusfraction%3A%29

Use this example to create an elliptical gradient with specific color stops, a custom center, and defined start and end radius fractions. This gradient is centered on the top-leading corner with extra green area, demonstrating how to control color distribution and gradient extent.

```swift
EllipticalGradient(
    stops: [
        .init(color: .blue, location: 0.0),
        .init(color: .green, location: 0.9),
        .init(color: .green, location: 1.0),
    ],
    center: .topLeading,
    startRadiusFraction: 0,
    endRadiusFraction: 1)
```

--------------------------------

### init(rootView: Content)

Source: https://developer.apple.com/documentation/swiftui/uihostingcontroller

Creates a hosting controller object that wraps the specified SwiftUI view.

```APIDOC
## init(rootView: Content)

### Description
Creates a hosting controller object that wraps the specified SwiftUI view.

### Signature
`init(rootView: Content)`

### Parameters
- **rootView** (Content) - The SwiftUI view to use as the root view for this view controller.
```

--------------------------------

### Example of focusSection() for Directional Focus

Source: https://developer.apple.com/documentation/swiftui/view/focussection%28%29

This tvOS example demonstrates applying `focusSection()` to a `VStack` containing buttons. It enables directional focus movement from an adjacent group of buttons, allowing the `VStack` to receive focus and pass it to its first focusable child, thereby guiding focus across UI sections.

```swift
var body: some View {
    HStack {
        VStack {
            Button ("1") {}
            Button ("2") {}
            Button ("3") {}
            Spacer()
        }
        .border(Color.white, width: 2)


        Spacer()
        VStack {
            Spacer()
            Button ("A") {}
            Button ("B") {}
            Button ("C") {}
        }
        .border(Color.white, width: 2)
        .focusSection()
    }
}
```

--------------------------------

### Example: Dynamic Table Columns with TableColumnForEach

Source: https://developer.apple.com/documentation/swiftui/tablecolumnforeach

Illustrates how to use `TableColumnForEach` to create dynamic columns in a `Table` based on a collection of `AudioChannel`s, alongside a static timestamp column. This setup is useful for displaying data with a variable number of attributes.

```swift
struct AudioChannel: Identifiable {
    let name: String
    let id: UUID
}


struct AudioSample: Identifiable {
    let id: UUID
    let timestamp: TimeInterval
    func level(channel: AudioChannel.ID) -> Double
}


@Observable
class AudioSampleTrack {
    let channels: [AudioChannel]
    var samples: some RandomAccessCollection<AudioSample> { get }
}


struct ContentView: View {
    var track: AudioSampleTrack


    var body: some View {
        Table(track.samples) {
            TableColumn("Timestamp (ms)") { sample in
                Text(sample.timestamp, format: .number.scale(1000))
                    .monospacedDigit()
            }
            TableColumnForEach(track.channels) { channel in
                TableColumn(channel.name) { sample in
                    Text(sample.level(channel: channel.id),
                         format: .number.precision(.fractionLength(2))
                    )
                    .monospacedDigit()
                }
                .width(ideal: 70)
                .alignment(.numeric)
            }
        }
    }
}
```

--------------------------------

### Implement defaultValue(in:) for Custom AlignmentID

Source: https://developer.apple.com/documentation/swiftui/alignmentid/defaultvalue%28in%3A%29

Defines a custom alignment guide by implementing the required defaultValue(in:) method. This example creates a FirstThirdAlignment that positions a guide at one-third of the view's height. The method receives a ViewDimensions context parameter and returns a CGFloat offset value.

```swift
private struct FirstThirdAlignment: AlignmentID {
    static func defaultValue(in context: ViewDimensions) -> CGFloat {
        context.height / 3
    }
}
```

```swift
static func defaultValue(in context: ViewDimensions) -> CGFloat
```

--------------------------------

### init(_:_:background:overlayAccessoryView:)

Source: https://developer.apple.com/documentation/swiftui/documentgrouplaunchscene/init%28_%3A_%3Abackground%3Aoverlayaccessoryview%3A%29-1143c

Creates a launch scene for document-based applications with a title, a set of actions, a background, and an overlay accessory view.

```APIDOC
## Initializer: init(_:_:background:overlayAccessoryView:)

### Description
Creates a launch scene for document-based applications with a title, a set of actions, a background, and an overlay accessory view.

### Signature
```swift
nonisolated
init(
    _ title: some StringProtocol,
    @ContentBuilder _ actions: () -> Actions,
    @ContentBuilder background: () -> some View,
    @ContentBuilder overlayAccessoryView: @escaping (DocumentLaunchGeometryProxy) -> some View
)
```

### Parameters
- **title** (some StringProtocol) - A string to use for the view title.
- **actions** (() -> Actions) - A content builder for returning the view’s actions.
- **background** (() -> some View) - The background of the scene.
- **overlayAccessoryView** ((DocumentLaunchGeometryProxy) -> some View) - A content builder for returning the view’s overlay accessory view.

### Discussion
Use a `DocumentGroupLaunchScene` alongside any `DocumentGroup` scenes. If you don’t implement a `DocumentGroup` in the app declaration, you can get the same design by implementing a `DocumentLaunchView`.
```

--------------------------------

### init()

Source: https://developer.apple.com/documentation/swiftui/importfromdevicescommands/init%28%29

Creates a new set of device import commands.

```APIDOC
## init()

### Description
Creates a new set of device import commands.

### Signature
```swift
nonisolated
init()
```

### Availability
macOS 12.0+

### Parameters
This initializer takes no parameters.
```

--------------------------------

### GET Alignment3D.bottom

Source: https://developer.apple.com/documentation/swiftui/alignment3d/bottom

Retrieves a 3D alignment guide representing a point at the center of the horizontal axis, bottom of the vertical axis, and center of the depth axis.

```APIDOC
## GET Alignment3D.bottom

### Description
A guide representing a point at the center of the horizontal axis, bottom of the vertical axis, and center of the depth axis.

### Method
GET (Static Property)

### Endpoint
SwiftUI.Alignment3D.bottom

### Parameters
#### Path Parameters
- **None**

### Request Example
```swift
// Usage in SwiftUI visionOS
static let bottom: Alignment3D
```

### Response
#### Success Response (200)
- **bottom** (Alignment3D) - A guide representing the specified 3D alignment point.

#### Response Example
{
  "type": "Alignment3D",
  "value": "bottom",
  "availability": "visionOS 1.0+"
}
```

--------------------------------

### Create Custom Horizontal Alignment Guide

Source: https://developer.apple.com/documentation/swiftui/horizontalalignment

Demonstrates creating a custom horizontal alignment by conforming to the AlignmentID protocol and extending HorizontalAlignment with a static property. The example creates a OneQuarterAlignment that positions guides at one quarter of the view's width, automatically supporting right-to-left layout reversal.

```swift
private struct OneQuarterAlignment: AlignmentID {
    static func defaultValue(in context: ViewDimensions) -> CGFloat {
        context.width / 4
    }
}


extension HorizontalAlignment {
    static let oneQuarter = HorizontalAlignment(OneQuarterAlignment.self)
}
```

--------------------------------

### init(anchor: NSHelpManager.AnchorName)

Source: https://developer.apple.com/documentation/swiftui/helplink

Constructs a new help link with the specified anchor in the main app bundle’s book.

```APIDOC
## HelpLink.init(anchor: NSHelpManager.AnchorName)

### Description
Constructs a new help link with the specified anchor in the main app bundle’s book.

### Parameters
- **anchor** (`NSHelpManager.AnchorName`) - The name of the anchor within the help book.

### Example
```swift
HelpLink(anchor: "accountSetupHelp")
```
```

--------------------------------

### GET DragGesture.Value Position Properties

Source: https://developer.apple.com/documentation/swiftui/draggesture/value/predictedendlocation

Accesses various 2D position and translation data points for a DragGesture event, including start and current locations.

```APIDOC
## GET DragGesture.Value Position Properties

### Description
Properties providing spatial information about the drag gesture, including start, current, and predicted translations.

### Method
GET (Property Accessors)

### Endpoint
DragGesture.Value

### Parameters
None

### Response
#### Success Response (200)
- **startLocation** (CGPoint) - The location of the drag gesture’s first event.
- **location** (CGPoint) - The location of the drag gesture’s current event.
- **translation** (CGSize) - The total translation from the start of the drag gesture to the current event.
- **predictedEndTranslation** (CGSize) - A prediction, based on the current drag velocity, of what the final translation will be if dragging stopped now.

### Response Example
{
  "startLocation": { "x": 10.0, "y": 10.0 },
  "location": {"x": 50.0, "y": 60.0 },
  "translation": { "width": 40.0, "height": 50.0 },
  "predictedEndTranslation": { "width": 45.0, "height": 55.0 }
}
```

--------------------------------

### init(_:systemImage:selection:content:)

Source: https://developer.apple.com/documentation/swiftui/picker

Creates a picker that generates its label from a localized string key and a system image.

```APIDOC
## init(_:systemImage:selection:content:)

### Description
Creates a picker that generates its label from a localized string key and a system image.

### Signature
`init(_ titleKey: LocalizedStringKey, systemImage: String, selection: Binding<SelectionValue>, content: () -> Content)`

### Parameters
- **titleKey** (LocalizedStringKey) - The key for the picker's localized title.
- **systemImage** (String) - The name of the system image to display in the label.
- **selection** (Binding<SelectionValue>) - A binding to the selected value.
- **content** (Closure) - A view builder that produces the content of the picker.
```

--------------------------------

### Animate a Circle's scale with easeIn in SwiftUI

Source: https://developer.apple.com/documentation/swiftui/animation/easein

This example demonstrates how to apply an `easeIn` animation to a `Circle`'s scale property. The animation starts slowly and increases speed as the circle scales.

```Swift
struct ContentView: View {
    @State private var scale = 0.5


    var body: some View {
        VStack {
            Circle()
                .scale(scale)
                .animation(.easeIn, value: scale)
            HStack {
                Button("+") { scale += 0.1 }
                Button("-") { scale -= 0.1 }
            }
        }
    }
}
```

--------------------------------

### init(path:root:)

Source: https://developer.apple.com/documentation/swiftui/navigationstack/init%28path%3Aroot%3A%29

Creates a navigation stack with homogeneous navigation state that you can control.

```APIDOC
## Initializer: init(path:root:)

### Description
Creates a navigation stack with homogeneous navigation state that you can control.

### Availability
iOS 16.0+, iPadOS 16.0+, Mac Catalyst 16.0+, macOS 13.0+, tvOS 16.0+, visionOS 1.0+, watchOS 9.0+

### Signature
```swift
nonisolated
init(
    path: Binding<Data>,
    @ContentBuilder root: () -> Root
) where Data : MutableCollection, Data : RandomAccessCollection, Data : RangeReplaceableCollection, Data.Element : Hashable
```

### Parameters
- **path** (`Binding<Data>`) - A `Binding` to the navigation state for this stack.
- **root** (`() -> Root`) - The view to display when the stack is empty.
```

--------------------------------

### DisplayProxy Usage Example

Source: https://developer.apple.com/documentation/swiftui/displayproxy

Example demonstrating how to use DisplayProxy with custom window layouts to position windows relative to display bounds.

```APIDOC
## DisplayProxy Usage Example

### Description
This example shows how to use DisplayProxy with a custom window layout to position a window 140 points from the bottom of the screen's visible area.

### Code Example
```swift
Window("Status", id: "status") {
    StatusView()
}
.windowResizability(.contentSize)
.defaultWindowPlacement { content, context in
    let displayBounds = context.defaultDisplay.visibleRect
    let size = content.sizeThatFits(.unspecified)
    let position = CGPoint(
        x: displayBounds.midX - (size.width / 2),
        y: displayBounds.maxY - size.height - 140)
    return WindowPlacement(position: position, size: size)
}
```

### Explanation
- Access the display's visible rectangle via `context.defaultDisplay.visibleRect`
- Calculate the window size using `content.sizeThatFits()`
- Position the window using the display bounds and desired offset
- Return a WindowPlacement with the calculated position and size
```

--------------------------------

### init(path:root:)

Source: https://developer.apple.com/documentation/swiftui/navigationstack

Creates a navigation stack with homogeneous navigation state that you can control.

```APIDOC
## `init(path: Binding<Data>, root: () -> Root)`

### Description
Creates a navigation stack with homogeneous navigation state that you can control.

### Signature
`init(path: Binding<Data>, root: () -> Root)`

### Parameters
- **path** (`Binding<Data>`) - A binding to a collection of data values that represents the navigation path.
- **root** (`() -> Root`) - A closure that returns the root view of the navigation stack.

### Example Usage (Swift)
```swift
@State private var presentedItems: [String] = []

NavigationStack(path: $presentedItems) {
    // Your root view content here
    Text("Root View with Path")
}
```
```

--------------------------------

### Start In-App Purchase on Button Tap

Source: https://developer.apple.com/documentation/swiftui/environmentvalues/purchase

Example SwiftUI view that retrieves the purchase action from the environment and calls it within a Task when a button is tapped. The purchase result is processed asynchronously with optional error handling.

```swift
struct PurchaseExample: View {
    @Environment(\.purchase) private var purchase
    let product: Product
    let purchaseOptions: [Product.PurchaseOption]


    var body: some View {
        Button {
            Task {
                let purchaseResult = try? await purchase(product, options: purchaseOptions)
                // Process purchase result.
            }
        } label: {
            Text(product.displayName)
        }
    }
}
```

--------------------------------

### Push a Window with an ID in SwiftUI

Source: https://developer.apple.com/documentation/swiftui/environmentvalues/pushwindow

This example defines an App with two `WindowGroup` scenes and demonstrates how to use the `@Environment(\.pushWindow)` property wrapper to get the action and call it with a window identifier to push a new window.

```swift
@main
struct VideoEditor: App {
    var body: some Scene {
        WindowGroup(id: "editor") {
            EditorView()
        }


        WindowGroup(id: "viewer") {
            VideoView()
        }
    }
}


struct EditorView: View {
    @Environment(\.pushWindow) private var pushWindow


    var body: some View {
        Button("Play", systemImage: "play.fill") {
            pushWindow(id: "viewer")
        }
    }
}
```