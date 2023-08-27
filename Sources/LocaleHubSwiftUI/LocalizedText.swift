import SwiftUI

public struct LocalizedText: View {
    @Environment(\.translate) private var tr
    
    private let translationKey: String
    private let variables: [String: CustomStringConvertible]
    
    public init(_ translationKey: String, _ variables: [String: any CustomStringConvertible] = [:]) {
        self.translationKey = translationKey
        self.variables = variables
    }
    
    public var body: some View {
        Text(verbatim: tr(translationKey, variables))
    }
}
