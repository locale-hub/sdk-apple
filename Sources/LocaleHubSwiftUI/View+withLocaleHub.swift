import SwiftUI

// MARK: - Environment values
fileprivate struct SwiftUILocaleHub_SDK: EnvironmentKey {
    static var defaultValue: LocaleHubSDK = LocaleHubSDK.null
}

fileprivate struct SwiftUILocaleHub_Translate: EnvironmentKey {
    static var defaultValue: CultureManifest = CultureManifest()
}

public extension EnvironmentValues {
    var localeHub: LocaleHubSDK {
        get { self[SwiftUILocaleHub_SDK.self] }
        set { self[SwiftUILocaleHub_SDK.self] = newValue }
    }
    
    var translate: CultureManifest {
        get { self[SwiftUILocaleHub_Translate.self] }
        set { self[SwiftUILocaleHub_Translate.self] = newValue }
    }
}

// MARK: - View modifier
fileprivate struct LocaleHubModifier: ViewModifier {
    @State private var manifest: CultureManifest = CultureManifest()
    private let sdk: LocaleHubSDK
    
    public init(_ sdk: LocaleHubSDK?) {
        self.sdk = sdk ?? LocaleHubSDK.null
    }
    
    func body(content: Content) -> some View {
        content
            .environment(\.localeHub, sdk)
            .environment(\.translate, manifest)
            .onReceive(sdk.currentManifest.compactMap { $0 }) { newManifest in
                self.manifest = newManifest
            }
    }
}

public extension View {
    func withLocaleHub(_ sdk: LocaleHubSDK?) -> some View {
        modifier(LocaleHubModifier(sdk))
    }
}
