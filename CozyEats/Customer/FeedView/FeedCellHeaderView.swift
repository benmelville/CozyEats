//
//  FeedCellHeaderView.swift
//  Workouts
//
//  Created by Benjamin Melville on 11/2/23.
//

import SwiftUI

struct FeedCellHeaderView: View {
    
    let menuItem: MenuItem
    let dateFormatter = DateFormatter()

    func createFormatter() {
        dateFormatter.dateStyle = .long
        dateFormatter.timeStyle = .short
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            HStack {
                Image(systemName: "person")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 40, height: 40)
                    .clipShape(Circle())
                if let seller = menuItem.seller {
                    Text("\(seller.firstName ?? "") \(seller.lastName ?? "")")
                        .font(.system(.subheadline, design: .serif))
                        .fontWeight(.semibold)
                }
                
                Image(systemName: "checkmark.seal.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 15, height: 15)
                    .foregroundStyle(.blue)
                
                
                Spacer()
                
                HStack {
                    if let seller = menuItem.seller {
                        Text(seller.dateCreated ?? Date(), style: .date)
                        Text(seller.dateCreated ?? Date(), style: .time)
                    }
                }
                .font(.system(.footnote, design: .serif))
                .foregroundStyle(.secondary)
                
                
            }
            .frame(height: 45)
//            .background(.green)
//            .padding(.top)

            
            VStack(alignment: .leading) {
                Text("\(menuItem.name )")
                    .font(.system(.title3, design: .serif))
                    .fontWeight(.semibold)
                
                Text("\(menuItem.description ?? "")")
                    .font(.system(.caption, design: .serif))
                    .lineLimit(2)
                    .fixedSize(horizontal: false, vertical: true)
            }
            .frame(height: 60)
//            .background(.orange)
            
        }
        .onAppear(perform: {
            createFormatter()
        })
//        .frame(height: 200)
//        .background(.yellow)
        
    }
}

#Preview {
    FeedCellHeaderView(menuItem: MenuItem(name: "Lasagana", price: 12, description: "TASTY LASAGNA", cuisine: "italian", images: [], seller: Seller(firstName: "ben", lastName: "melville", userId: UUID().uuidString, dateCreated: Date(), email: "ben@gmail.com", photoUrl: nil, menu: nil, soldItems: nil)))
}

//TODO: This is an optional listing, I think it is too crowded with this but would be willing to add back in if people want
//                    VStack {
//                        Text("Exercises")
//                            .font(.footnote)
//                        Text("5")
//                            .fontWeight(.semibold)
//                    }
//                    .padding(.horizontal, 8)
//
//
//                    Rectangle()
//                        .frame(width: 0.5)
//                        .frame(maxHeight: .infinity)
//                        .foregroundStyle(.gray)
//
//
//                    VStack {
//                        Text("Sets")
//                            .font(.footnote)
//                        Text("52")
//                            .fontWeight(.semibold)
//                    }
//                    .padding(.horizontal, 8)
