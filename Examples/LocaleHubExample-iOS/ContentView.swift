import Combine
import SwiftUI
import LocaleHubSwiftUI

struct ContentView: View {
    @Environment(\.localeHub) private var lh
    @Environment(\.translate) private var tr

    @State private var parameterValue: String = "John Doe"
    @State private var childrenCount: Int = 2
    @State private var supportedCultures: [Culture] = []
    @State private var preferredCulture: Culture = .en_GB
    
    var body: some View {
        NavigationView {
            VStack {
                navigationRoot
            }
            .navigationTitle(tr("app.title"))
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
            
            Section {
                Picker(tr("section.with_pluralization.param_name"), selection: $childrenCount) {
                    ForEach(0...3, id: \.self) { number in
                        Text("\(number)")
                    }
                }.pickerStyle(.segmented)
                
                LocalizedText("section.with_pluralization.text", ["count": childrenCount])
            } header: {
                LocalizedText("section.with_pluralization.title")
            } footer: {
                LocalizedText("section.with_pluralization.hint")
            }
            
            Section {
                Picker(tr("change_culture"), selection: $preferredCulture) {
                    ForEach(supportedCultures, id: \.self) { culture in
                        Text(culture.nativeDescription)
                    }
                }
                    .pickerStyle(.segmented)
                    .onChange(of: preferredCulture) {
                         lh.preferredCultures = [self.preferredCulture]
                    }
            } footer: {
                LocalizedText("change_culture.hint")
            }
        }
        .onReceive(lh.supportedCultures, perform: { supportedCultures in
            self.supportedCultures = supportedCultures
            if false == self.supportedCultures.contains(self.preferredCulture) {
                self.preferredCulture = self.supportedCultures.first ?? .en_GB
            }
        })
    }
}

//#Preview {
//    ContentView()
//}
