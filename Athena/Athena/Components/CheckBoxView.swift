//
//  CheckboxFieldView.swift
//  Athena
//
//  Created by Tshimega Belmont on 2022/09/25.
//

import SwiftUI

struct CheckBoxView: View {
    
    @Binding var checked: Bool
    
    var body: some View {
        Image(systemName: checked ? "checkmark.square.fill" : "square")
            .foregroundColor(checked ? Color.theme.red : Color.theme.accent)
            .onTapGesture {
                self.checked.toggle()
            }
    }
}

struct CheckboxFieldView_Previews: PreviewProvider {
    struct CheckBoxViewHolder: View {
        @State var checked = false
        
        var body: some View {
            CheckBoxView(checked: $checked)
        }
    }
    
    static var previews: some View {
        CheckBoxViewHolder()
    }
}
