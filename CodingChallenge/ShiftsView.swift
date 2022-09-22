//
//  ShiftsView.swift
//  CodingChallenge
//
//  Created by Brady Miller on 4/7/21.
//

import SwiftUI

struct ShiftsView: View {
    @State internal var shiftsByDay: [DayShifts] = []

    //"The main view should include a list of shifts. If you tap on a shift it should show a modal shift details view. Be creative and show us your best work."
    var body: some View {
        VStack {
            Button("Reload shifts") {
                Task {
                    await loadData()
                }
            }

            List {
                ForEach(shiftsByDay, id: \.date) { day in
                    Section(header: Text(day.date ?? "")) {
                        ForEach(day.shifts, id: \.shiftId) { shift in
                            Text("\(shift.shiftId)")
                        }
                    }
                }
            }
        }
        .navigationTitle("Shifts")
    }

    // TODO: now for testing - add ViewModel later
    private func loadData() async {
        if let response = try? await ApiManager().fetchData() {
            self.shiftsByDay = response
        } else {
            self.shiftsByDay = []
        }
    }
}

struct ShiftsView_Previews: PreviewProvider {
    static var previews: some View {
        let view = ShiftsView(shiftsByDay: ShiftsResponse.makeTestInstance().data)
        view.shiftsByDay = ShiftsResponse.makeTestInstance().data
        return view
    }
}
