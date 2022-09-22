//
//  DetailsView.swift
//  CodingChallenge
//
//  Created by Konrad Leszczyński on 22/09/2022.
//

import SwiftUI

struct DetailsView: View {
    let shift: Shift

    var body: some View {
        NavigationView {
            VStack (alignment: .leading, spacing: 16) {
                VStack (alignment: .center, spacing: 32) {
                    Text("Shift number \(shift.shiftId)")
                        .font(.footnote)

                    Text(shift.facilityType.name)
                        .font(.title)

                    HStack {
                        Text("Time:")
                        Text(shift.startHour)
                        Text("to")
                        Text(shift.endHour)
                    }
                    .font(.title2)
                    .foregroundColor(.red)
                }

                Spacer()

                HStack {
                    Image(systemName: "cross.case.fill")
                        .font(.largeTitle)
                        .foregroundColor(Color(hex: shift.skill.color))
                    Spacer()
                    Text("Skil: \(shift.skill.name)")
                }

                HStack {
                    Image(systemName: "cross.circle.fill")
                        .font(.largeTitle)
                        .foregroundColor(Color(hex: shift.facilityType.color))
                    Spacer()
                    Text(shift.facilityType.name)
                }

                Group {
                    Text(shift.shiftKind)
                        .font(.largeTitle)

                    if shift.covid {
                        Label("covid", systemImage: "facemask.fill")
                            .font(.largeTitle)
                    }

                    if shift.premiumRate {
                        Label("Premium rate", systemImage: "dollarsign.circle.fill")
                            .font(.largeTitle)
                    }
                }

                Spacer()
                Spacer()
            }
            .padding(16)
            .navigationTitle(shift.localizedSpecialty.name)
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct DetailsView_Previews: PreviewProvider {
    static var previews: some View {
        DetailsView(shift: Shift.makeTestInstance())
    }
}
