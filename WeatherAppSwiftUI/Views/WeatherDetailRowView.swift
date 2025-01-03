//
//  WeatherDetailRow.swift
//  WeatherAppSwiftUI
//
//  Created by Sharky on 3/1/25.
//

import SwiftUI

struct WeatherDetailRowView: View {
    let label: String
    let value: String
    let icon: String
    let isHighlighted: Bool
    let isExpanded: Bool
    let description: String
    let onTap: () -> Void

    var body: some View {
        VStack {
            HStack {
                Image(systemName: icon)
                    .foregroundColor(isHighlighted ? .yellow : .white)
                    .font(.title2)
                Text(label)
                    .font(isHighlighted ? .title2.bold() : .body)
                    .foregroundColor(isHighlighted ? .yellow : .white)
                Spacer()
                Text(value)
                    .font(isHighlighted ? .title2.bold() : .body)
                    .foregroundColor(isHighlighted ? .yellow : .white)
            }
            .contentShape(Rectangle())
            .onTapGesture {
                onTap()
            }

            if isExpanded {
                Text(description)
                    .font(.subheadline)
                    .foregroundColor(.white.opacity(0.8))
                    .padding(.top, 5)
                    .lineLimit(nil)
                    .fixedSize(horizontal: false, vertical: true)
                    .transition(.opacity)
            }
        }
        .padding(.vertical, 5)
        .multilineTextAlignment(.leading)
    }
}

#Preview {
    WeatherDetailRowView(
        label: "1",
        value: "2",
        icon: "3",
        isHighlighted: true,
        isExpanded: false,
        description: "4",
        onTap: {
            
        }
    )
}
