//
//  LicensesScreen.swift
//  OTUS HW04 API
//
//  Created by Александр Касьянов on 20.04.2023.
//

import SwiftUI

struct LicensesScreen: View {
    
    @Binding var isPresented: Bool
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Приложение для демонстрации API")
            }
            .toolbar(content: {
                Button("Закрыть", action: {isPresented = false})
            })
        }
    }
}

struct LicensesScreen_Previews: PreviewProvider {
    static var previews: some View {
        LicensesScreen(isPresented: .constant(true))
    }
}
