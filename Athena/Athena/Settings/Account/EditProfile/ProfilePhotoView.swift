//
//  ProfilePhotoView.swift
//  Athena
//
//  Created by Tshimega Belmont on 2023/01/19.
//

import SwiftUI

struct ProfilePhotoView: View {
    var image: Image
    
    var body: some View {
        ZStack {
            GeometryReader { geometry in
                
                self.image
                    .resizable()
                    .scaledToFit()
                    .frame(width: geometry.size.width, height: geometry.size.height)
                    .clipped()
            }
        }
        
    }
}

struct ProfilePhotoView_Previews: PreviewProvider {
    static var previews: some View {
        ProfilePhotoView(image: Image("sabrina"))
    }
}
