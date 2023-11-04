//
//  SearchBarView.swift
//  ZephyrTesting
//
//  Created by Walter Galiano on 31/10/23.
//

import SwiftUI

struct CustomToolbarView: View {
    @Binding var searchText: String
    @Binding var isTabToAddStudent: Bool
    var body: some View {
        HStack(spacing: 41) {
            CustomSearchBar(searchText: $searchText)
            
            CustomToolbarButton(symbolName: "chevron.down.circle.fill", title: "Filters", width: 121, height: 36)
            
            CustomToolbarButton(symbolName: "chevron.down.circle.fill", title: "Sort", width: 121, height: 36)
            
            NavigationLink {
                AddNewStudentView(isTabToAddStudent: isTabToAddStudent)
            } label: {
                CustomToolbarButton(symbolName: "plus", title: "", width: 36, height: 36)
                    .font(.system(size: 28))
            }
        }
        .padding(.horizontal)
    }
}

struct CustomSearchBar: View {
    @Binding var searchText: String
    
    var body: some View {
        HStack(spacing: -4) {
            Image(systemName: "magnifyingglass")
                .foregroundColor(.gray)
                .padding(8)
            
            CustomTextField("Search", text: $searchText)
        }
        .background(Color("Gray"))
        .cornerRadius(8)
    }
}

struct CustomToolbarButton: View {
    var symbolName: String
    var title: String
    var width: Int
    var height: Int
    
    var body: some View {
        HStack {
            Image(systemName: symbolName)
                .foregroundColor(Color("DarkTeal"))
            
            if !title.isEmpty {
                Text(title)
            }
        }
        .frame(minWidth: CGFloat(width), minHeight: CGFloat(height))
        .background(Color("Gray"))
        .cornerRadius(8)
    }
}

struct CustomToolbarView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            CustomToolbarView(searchText: .constant(""), isTabToAddStudent: .constant(false))
        }
    }
}
