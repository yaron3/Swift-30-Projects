import WidgetKit
import SwiftUI

// This file helps ensure the widget extension is properly configured
// It doesn't contain any functional code, but helps with the build process

#if DEBUG
struct WidgetConfiguration_Previews: PreviewProvider {
    static var previews: some View {
        WeatherWidgetView(location: "San Francisco, U.S.")
            .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}
#endif 