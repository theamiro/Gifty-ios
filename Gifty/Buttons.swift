//
//  PrimaryButton.swift
//  Gifty
//
//  Created by Michael Amiro on 12/07/2022.
//

import SwiftUI

enum CustomButtonStyle {
    case bordered
    case filled
}
struct CustomButton: View {
    var title: String
    var buttonColor: Color = Color("AccentColor")
    var buttonStyle: CustomButtonStyle = .filled
    var disabled: Bool = false
    var action: () -> Void = { print("Default Action fired") }

    var body: some View {
        Button {
            action()
        } label: {
            Text(title)
                .foregroundColor(buttonStyle == CustomButtonStyle.filled ? (buttonColor == Color("TertiaryColor") ? Color("AccentColor") : .white) : (buttonColor == Color("TertiaryColor") ? Color("AccentColor") : buttonColor))
                .padding()
                .frame(maxWidth: .infinity, maxHeight: 46)
                .background(
                    buttonStyle == CustomButtonStyle.filled ?
                    (disabled ? Color.gray : buttonColor) :
                    .clear
                )
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(buttonStyle == .bordered ? buttonColor : .clear, lineWidth: 5)
                )
        }
        .disabled(disabled)
        .cornerRadius(8)
    }
}

struct PrimaryButton_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            CustomButton(title: "Primary Filled").previewLayout(.sizeThatFits)
            CustomButton(title: "Primary Bordered", buttonStyle: .bordered).previewLayout(.sizeThatFits)
            CustomButton(title: "Secondary Filled", buttonColor: Color("SecondaryColor"), buttonStyle: .filled).previewLayout(.sizeThatFits)
            CustomButton(title: "Secondary Bordered", buttonColor: Color("SecondaryColor"), buttonStyle: .bordered).previewLayout(.sizeThatFits)
            CustomButton(title: "Tertiary Filled", buttonColor: Color("TertiaryColor"), buttonStyle: .filled).previewLayout(.sizeThatFits)
            CustomButton(title: "Tertiary Bordered", buttonColor: Color("TertiaryColor"), buttonStyle: .bordered).previewLayout(.sizeThatFits)
        }
    }
}
