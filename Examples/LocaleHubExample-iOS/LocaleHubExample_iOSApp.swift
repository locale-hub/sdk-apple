import SwiftUI
import LocaleHubSwiftUI

@main
struct LocaleHubExample_iOSApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
            // Offline Mode
                .withLocaleHub(try! LocaleHubSDK())
            // Remote Mode
                /*
                 .withLocaleHub(try! LocaleHubSDK(config: LocaleHubSDKConfiguration(
                     endpoint: URL(string: "https://localehub.example.com/api/1")!,
                     projectId: "YOUR_PROJECT_ID",
                     deploymentTag: "YOUR_DEPLOYMENT_TAG",
                     apiKey: "YOUR_API_KEY"
                 )))
                 */
        }
    }
}
