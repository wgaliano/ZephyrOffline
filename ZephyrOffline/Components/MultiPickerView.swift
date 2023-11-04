//
//  MultiplePickerView.swift
//  ZephyrTesting
//
//  Created by Viacheslav on 04/10/23.
//

import SwiftUI

struct MultiplePickerView: View {

    @Environment(\.presentationMode) var presentationMode
    @Binding var selection: String
    @State var selectionArray: [String]

    let list: [String]

    init(list: [String], selection: Binding<String>) {
        self.list = list
        self._selection = selection
        if selection.wrappedValue.isEmpty {
            self._selectionArray = State(initialValue: [])
        } else {
            self._selectionArray =  State(initialValue: selection.wrappedValue.components(separatedBy: ", "))
        }
    }

    var selectionToText: String {
        guard selectionArray.count > 1 else { return "-" }
        return selectionArray.filter { $0 != "-" }.sorted().joined(separator: ", ")
    }
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    if selectionArray.isEmpty {
                        Text("Nothing has been selected")
                            .foregroundColor(.gray)
                    } else {
                        Text(selectionToText)
                    }
                } header: {
                    Text("Selected")
                }
                
                Section(header: Text("Mark everything you need")) {
                    List(list, id: \.self) { item in
                        Toggle(item, isOn: Binding(
                            get: {
                                self.selectionArray.contains(item)
                            },
                            set: {_, _ in
                                if self.selectionArray.contains(item) {
                                    self.selectionArray.removeAll { $0 == item }
                                } else {
                                    self.selectionArray.append(item)
                                }
                            }
                        ))
                    }
                }
                Section {
                    Button {
                        selectionArray = []
                    } label: {
                        Text("Clear all")
                    }

                }
            }
            .navigationBarTitle("Select all necessary items", displayMode: .inline)
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button {
                        presentationMode.wrappedValue.dismiss()
                    } label: {
                        Text("Cancel")
                    }
                }
                ToolbarItem(placement: .confirmationAction) {
                    Button {
                        presentationMode.wrappedValue.dismiss()
                        selection = selectionToText
                    } label: {
                        Text("Save")
                    }
                    
                }
            }
        }
    }
}

struct MultiplePickerView_Previews: PreviewProvider {
    static var previews: some View {
        MultiplePickerView(list: Student.specialNeedsList, selection: Binding.constant("1, 2, 3"))
    }
}
