//
//  StudentDetaiRowView.swift
//  ZephyrTesting
//
//  Created by Walter Galiano on 20/09/23.
//

import SwiftUI

struct StudentDetailRowView: View {

    let symbol: String
    let title: String
    let bodyInfo: String

    var body: some View {
        VStack {
            HStack {
                Image(systemName: symbol)
                Text(title)
                Spacer()
            }
            .foregroundColor( Color("DarkTeal"))
            .padding((.vertical), 3)

            HStack {
                Text(bodyInfo)
                Spacer()
            }
        }
    }
}

struct StudentDetailEditRowMultiPickView: View {

    let symbol: String
    let title: String
    @Binding var parameter: String
    @Binding var isShowingButton: Bool

    var body: some View {
        VStack {
            HStack {
                Image(systemName: symbol)
                Text(title)
                Spacer()
            }
            .foregroundColor(Color("DarkTeal"))
            .padding(.vertical, 3)
            HStack {
                Text(parameter)
                Spacer()
                Button {
                    isShowingButton.toggle()
                } label: {
                    Text("Choose special needs")
                }
            }
        }
    }
}

struct StudentDetailEditRowPickView: View {

    let symbol: String
    let title: String
    let array: [String]
    @Binding var parameter: String

    var body: some View {
        VStack {
            HStack {
                Image(systemName: symbol)
                Text(title)
                Spacer()
            }
            .foregroundColor(Color("DarkTeal"))
            .padding(.vertical, 3)
            HStack {
                Text(parameter)
                Spacer()
                Picker(parameter, selection: $parameter) {
                    ForEach(array, id: \.self) {
                        Text($0)
                    }
                }
            }
        }
    }
}

struct StudentDetailEditRowDateView: View {

    let symbol: String
    let title: String

    @Binding var parameter: String
    @State private var selectedDate: Date = Date()

    private var isToday: Bool {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        if let parsedDate = formatter.date(from: parameter) {
            return Calendar.current.isDateInToday(parsedDate)
        }
        return false
    }

    init(symbol: String, title: String, parameter: Binding<String>) {
        self.symbol = symbol
        self.title = title
        self._parameter = parameter

        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        if let parsedDate = formatter.date(from: parameter.wrappedValue) {
            self._selectedDate = State(initialValue: parsedDate)
        } else {
            self._selectedDate = State(initialValue: Date())
        }
    }

    var body: some View {
        VStack {
            HStack {
                Image(systemName: symbol)
                Text(title)
                Spacer()
            }
            .foregroundColor(isToday ? Color("RedTextfield") : Color("DarkTeal")) // Set text color
            .padding(.vertical, 3)
            DatePicker(parameter, selection: $selectedDate, in: ...Date(), displayedComponents: .date)
                .onChange(of: selectedDate) { newDate in
                    let formatter = DateFormatter()
                    formatter.dateFormat = "yyyy-MM-dd"
                    parameter = formatter.string(from: newDate)
                }
        }
    }
}

struct StudentDetailEditRowTextWithoutSymbolsView: View {
    let symbol: String
    let title: String
    @Binding var parameter: String

    var body: some View {
        VStack {
            HStack {
                Image(systemName: symbol)
                Text(title)
                Spacer()
            }
            .foregroundColor(parameter.isEmpty ? Color("RedTextfield") : Color("DarkTeal"))
            .padding(.vertical, 3)
            CustomTextField(parameter, text: $parameter)
                .lettersAndSpacesOnly(input: $parameter)
        }
    }
}

struct StudentDetailEditRowTextWithSymbolsView: View {
    let symbol: String
    let title: String
    @Binding var parameter: String

    var body: some View {
        VStack {
            HStack {
                Image(systemName: symbol)
                Text(title)
                Spacer()
            }
            .foregroundColor(Color("DarkTeal"))
            .padding(.vertical, 3)
            CustomTextField(parameter, text: $parameter)
        }
    }
}

struct StudentDetailEditRowIntView: View {
    let symbol: String
    let title: String
    @Binding var parameter: String

    var body: some View {
        VStack {
            HStack {
                Image(systemName: symbol)
                Text(title)
                Spacer()
            }
            .foregroundColor(Color("DarkTeal"))
            .padding(.vertical, 3)
            CustomTextField(parameter, text: $parameter)
                .numericOnly(input: $parameter)
        }
    }
}

// struct StudentDetailEditRowTextView<T>: View where T: LosslessStringConvertible {
//
//    let symbol: String
//    let title: String
//    @Binding var parameter: T
//
//    var body: some View {
//        VStack {
//            HStack {
//                Image(systemName: symbol)
//                Text(title)
//                Spacer()
//            }
//            .foregroundColor(Color("DarkTeal"))
//            .padding(.vertical, 3)
//            CustomTextField(String(parameter), text: Binding(
//                get: {
//                    String(parameter)
//                },
//                set: { newValue in
//                    if let convertedValue = T(newValue) {
//                        parameter = convertedValue
//                    }
//                }
//            ))
//        }
//    }
// }
