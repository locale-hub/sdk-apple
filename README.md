## Locale Hub - Apple SDK

![](https://img.shields.io/github/v/release/locale-hub/sdk-apple)

### Table of Contents
* [Installation](#installation)
* [Usage](#usage)
* [Authors](#authors)

## Installation
To install Locale Hub Apple SDK using [Swift Package Manager](https://github.com/apple/swift-package-manager) you can follow the
[tutorial published by Apple](https://developer.apple.com/documentation/xcode/adding_package_dependencies_to_your_app)
using the URL for the Locale Hub SDK repo with the current version:

1. In Xcode, select “File” → “Add Packages...”
1. Enter https://github.com/locale-hub/sdk-apple.git

or you can add the following dependency to your `Package.swift`:

```swift
.package(url: "https://github.com/locale-hub/sdk-apple.git", from: "3.5.0"),
```

## Usage
In your main,
```swift
import SwiftUI
import LocaleHubSwiftUI

@main
struct YourAppName_iOSApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                // Offline Mode
                .withLocaleHub(try! LocaleHubSDK())
                // Remote Mode
                /*
                .withLocaleHub(try! LocaleHubSDK(config: LocaleHubSDKConfiguration(
                    endpoint: URL(string: "http://127.0.0.1:3002/")!,
                    projectId: "YOUR_PROJECT_ID",
                    apiKey: "YOUR_API_KEY"
                )))
                 */
        }
    }
}

```

In your views, you can then use `@Environment(\.translate)` variable or the `LocalizedText` view as follow:

```swift
import SwiftUI
import LocaleHubSwiftUI

struct ContentView: View {
    @Environment(\.translate) private var tr

    @State private var parameterValue: String = "John Doe"

    var body: some View {
        NavigationView {
            VStack {
                navigationRoot
            }
            .navigationTitle(tr("app.title"))
            // `tr` also receive variables as follow
            // tr("app.title", ["section.with_variables.text": parameterValue])
        }
    }

    private var navigationRoot: some View {
        List{
            Section(tr("section.static.title"))
            {
                LocalizedText("section.static.text")
            }

            Section(tr("section.with_variables.title"))
            {
                LocalizedText("section.with_variables.text", ["name": parameterValue])
                TextField("Parameter value", text: $parameterValue)
            }
        }
    }
}
```

## Authors

- Bidon Aurélien ([@abidon](https://github.com/abidon))
- Pichon Jeremy ([@Jeremy-Pichon](https://github.com/Jeremy-Pichon))
