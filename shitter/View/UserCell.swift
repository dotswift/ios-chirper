//
//  UserCell.swift
//  shitter
//
//  Created by derek quinn on 1/5/21.
//

import SwiftUI

struct UserCell: View {
    var body: some View {
        // Need an HStack because we have image and text next to eachother (left /right)
        HStack(spacing: 12){
            Image("shilling")
                .resizable()
                .scaledToFill()
                .clipped()
                .frame(width: 56, height: 56)
                .cornerRadius(28)
            VStack(alignment: .leading, spacing: 4){
                Text("Robert Lolli, Jr")
                    .font(.system(size: 14, weight: .semibold))
                
                Text("Chef Bobby Lolli")
                    .font(.system(size: 14))
                
            }
        }
    }
}

struct UserCell_Previews: PreviewProvider {
    static var previews: some View {
        UserCell()
    }
}
