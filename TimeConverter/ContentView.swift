//
//  ContentView.swift
//  TimeConverter
//
//  Created by Денис Денисов on 31.10.2023.
//
/*
 В-третьих, поскольку у нас здесь три значения пользователя - их входное число, их входная единица и их выходная единица - вам нужно будет иметь три свойства @State, чтобы сохранить их все. Вам понадобится TextField, два пикера и текстовое представление для отображения выходных данных, и это все. Вы можете разделить свою форму на секции, если хотите, но это не обязательно.
 В-четвертых, самый простой способ сохранить ваши единицы преобразования - это иметь простой массив строк, который можно перебрать с помощью чего-то вроде ForEach(units, id: \.self).
 Наконец, если вы хотите немного украсить отображаемое вами выходное число, попробуйте вызвать .formatted() на нем - например, someDouble.formatted(). Это заставит iOS форматировать число для печати, добавляя разделитель тысяч и удаляя много избыточных десятичных знаков.
 Приступайте к работе прямо сейчас. Не волнуйтесь, если вам нужно обратиться к проекту WeSplit - это совершенно нормально и является частью процесса обучения.
 */

enum TimeUnit: String, CaseIterable, Identifiable {
    var id: Int {
        switch self {
        case .sec:
            return self.hashValue
        case .min:
            return self.hashValue
        case .hour:
            return self.hashValue
        }
    }
    
    case sec
    case min
    case hour
}

import SwiftUI

struct ContentView: View {
    
    @FocusState private var userInputIsFocus: Bool
    @State private var inputValue: Double = 0
    @State private var inputUnit: TimeUnit = .hour
    @State private var outputUnit: TimeUnit = .min
    
    private let timeUnits = TimeUnit.allCases
    private var inputInSeconds: Double {
        switch inputUnit {
        case .sec:
            return inputValue
        case .min:
            return inputValue * 60
        case .hour:
            return inputValue * 60 * 60
        }
    }
    
    private var calculetedValue: Double {
        switch outputUnit {
        case .sec:
            return inputInSeconds
        case .min:
            return inputInSeconds/60
        case .hour:
            return inputInSeconds/3600
        }
    }
    
    var body: some View {
        NavigationStack{
            Form {
                Section("Input Zone") {
                    HStack {
                        TextField(
                            "value",
                            value: $inputValue,
                            format: .number
                        )
                        .keyboardType(.decimalPad)
                        .focused($userInputIsFocus)
                        Picker("", selection: $inputUnit) {
                            ForEach(timeUnits, id: \.self) {
                                Text($0.rawValue)
                            }
                        }
                    }
                }
                Section("Output Zone") {
                    HStack {
                        Text(calculetedValue, format: .number)
                        Picker("", selection: $outputUnit) {
                            ForEach(timeUnits, id: \.self) {
                                Text($0.rawValue)
                            }
                        }
                    }
                }

            }
            .navigationTitle("Time Converter")
            .toolbar {
                if userInputIsFocus {
                    Button("Done") {
                        userInputIsFocus = false
                    }
                }
            }
        }
    }
}
#Preview {
    ContentView()
}
