//
//  ShiftsView.swift
//  CodingChallenge
//
//  Created by Brady Miller on 4/7/21.
//

import SwiftUI

struct ShiftsView: View {
    var body: some View {
        NavigationView {
            Group {
                Text("The main view should include a list of shifts. If you tap on a shift it should show a modal shift details view. Be creative and show us your best work.")
                    .multilineTextAlignment(.center)
                    .padding()
            }
            .navigationTitle("Shifts")
            .onAppear(perform: loadData)
        }
    }

    // TODO: now for testing - add ViewModel later
    private func loadData() {
        Task {
            let res = await try? ApiManager().fetchData()
            print("loaded")
        }
    }
}

struct ShiftsView_Previews: PreviewProvider {
    static var previews: some View {
        ShiftsView()
    }
}
