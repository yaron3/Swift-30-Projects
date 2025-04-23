import SwiftUI

struct ContactView: View {
    var body: some View {
        ScrollView {
            VStack {
                Image("header-contact")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                
                Text("About Us")
                    .font(.title)
                    .fontWeight(.bold)
                
                Text("Whether you are looking for a turn-of-the-century wall set or a Zack Morris Special, we've got you covered. Give us a ring, and we will get you connected.")
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
                
                Text("*Hands-free phones available")
                    .font(.subheadline)
                    .italic()
                
                Text("Contact")
                    .font(.title)
                    .fontWeight(.bold)
                
                VStack(alignment: .leading, spacing: 15) {
                    ContactRow(icon: "icon-about-email", text: "good-as-old@example.com")
                    ContactRow(icon: "icon-about-phone", text: "412-888-9028")
                    ContactRow(icon: "icon-about-website", text: "www.example.com")
                }
                .padding()
            }
        }
    }
}

struct ContactRow: View {
    let icon: String
    let text: String
    
    var body: some View {
        HStack(spacing: 15) {
            Image(icon)
                .resizable()
                .frame(width: 34, height: 34)
            
            Text(text)
                .font(.body)
        }
    }
} 
