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
        Text("Details of \(shift.shiftId)")
    }
}

struct DetailsView_Previews: PreviewProvider {
    static var previews: some View {
        DetailsView(shift: Shift.makeTestInstance())
    }
}
