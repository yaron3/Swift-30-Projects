import SwiftUI

struct ContentView: View {
    @State private var user = FBMeUser(name: "BayMax", education: "CMU")
    
    var body: some View {
        NavigationView {
            List {
                ForEach(tableData, id: \.title) { section in
                    Section(header: sectionHeader(section.title)) {
                        ForEach(section.rows, id: \.title) { row in
                            if row.title == "Profile" {
                                profileRow(row)
                            } else if row.title == "Logout" {
                                logoutRow(row)
                            } else if row.title == "Settings" || row.title == "Privacy" || row.title == "Help" {
                                specialRow(row)
                            } else {
                                standardRow(row)
                            }
                        }
                    }
                }
            }
            .listStyle(GroupedListStyle())
            .navigationBarTitle("Facebook", displayMode: .inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {}) {
                        Image(systemName: "person.fill")
                            .foregroundColor(Specs.color.tint)
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {}) {
                        Image(systemName: "message.fill")
                            .foregroundColor(Specs.color.tint)
                    }
                }
            }
        }
    }
    
    private func sectionHeader(_ title: String) -> some View {
        Text(title)
            .font(.system(size: Specs.fontSize.small, weight: .bold))
            .foregroundColor(Specs.color.tint)
    }
    
    private func profileRow(_ row: TableRow) -> some View {
        HStack {
            Image(systemName: "person.circle.fill")
                .resizable()
                .frame(width: 60, height: 60)
                .foregroundColor(Specs.color.tint)
            
            VStack(alignment: .leading) {
                Text(user.name)
                    .font(.system(size: 20, weight: .semibold))
                Text(user.education)
                    .font(.system(size: 15))
                    .foregroundColor(Specs.color.gray)
            }
        }
        .padding(.vertical, 8)
    }
    
    private func standardRow(_ row: TableRow) -> some View {
        HStack {
            Image(systemName: row.imageName)
                .resizable()
                .frame(width: 20, height: 20)
                .foregroundColor(Specs.color.tint)
            
            Text(row.title)
                .font(.system(size: 17))
            
            Spacer()
            
            if let detailText = row.detailText {
                Text(detailText)
                    .font(.system(size: 17))
                    .foregroundColor(Specs.color.gray)
            }
            
            Image(systemName: "chevron.right")
                .font(.system(size: 14, weight: .semibold))
                .foregroundColor(Specs.color.gray)
        }
    }
    
    private func specialRow(_ row: TableRow) -> some View {
        HStack {
            Image(systemName: row.imageName)
                .resizable()
                .frame(width: 20, height: 20)
                .foregroundColor(Specs.color.tint)
            
            Text(row.title)
                .font(.system(size: 17))
            
            Spacer()
            
            Image(systemName: "chevron.right")
                .font(.system(size: 14, weight: .semibold))
                .foregroundColor(Specs.color.gray)
        }
        .foregroundColor(Specs.color.tint)
    }
    
    private func logoutRow(_ row: TableRow) -> some View {
        HStack {
            Image(systemName: row.imageName)
                .resizable()
                .frame(width: 20, height: 20)
                .foregroundColor(Specs.color.tint)
            
            Text(row.title)
                .font(.system(size: 17))
                .foregroundColor(Specs.color.tint)
            
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
} 