//
//  AboutScreen.swift
//  OTUS HW04 API
//
//  Created by Александр Касьянов on 20.04.2023.
//

import SwiftUI

struct AboutScreen: View {
    
    @State var showLicenses: Bool = false
    
    var body: some View {
        VStack(spacing: 30) {
            Text("Демонстрация API")
            
            Button{
                showLicenses.toggle()
            } label: {
                Text("Информация")
            }
            .sheet(isPresented: $showLicenses, content: {
                LicensesScreen(isPresented: $showLicenses)
            })
        }
    }
}

struct AboutScreen_Previews: PreviewProvider {
    static var previews: some View {
        AboutScreen()
    }
}
