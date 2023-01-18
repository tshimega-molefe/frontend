//
//  SearchView.swift
//  Athena
//
//  Created by Tshimega Belmont on 2022/09/26.
//

import SwiftUI


/* We're going to redesign this page to be an interface where the user can interact with OpenAI models (ChatGPT etc) to have a chat functionaloty with Athena's AI Tool that provides the user with contextual information about their current location, and any helpful advice on how to stay safe in that specific area... User should have prompts avaiable -  to feed to chatGPT... eg. Am I safe where I am?, Places I should be careful of in Jhb CBD, Places to avoid in PTA, or "I've just landed in Qatar, where am I safe? etc..
 
    We need to plug into OpenAI's open source API, to have access to its language models, and then send it contextual prompts - where they're simple on the frontend - but in the POST request, we send a more detailed tailored prompt to ChatGPT, where we then FETCH the prompt output, and present it to the user in a chat like feature on this screen.
 
 I want the user to feel like they have a helpful AI assistant in their pocket that can give them tips on how to safely navigate their environment if they feel unsafe. They can ask Athena any questions about their current situation, and it can give them useful advice on how to deal with trauma, abuse, navigation, safety, etc..
 
 It's going to be the only App in this niche that offers this functionality - and ChatGPT allows us to provide that functionality FIRST, in this inidustry. It's going to be the one differentiator of us from others.
 
 We had conceptualised this earlier at first, but it would prvioe to be too labour intensive and time consuming, within the limited budget and team size, this seems like the optimal solution, at least for now, to deliver what was promised.
 
 The user's own personal security assistant.
 
 
 To break the fourth wall, We're going to use ChatGPT itself to help us design this one page and it's entire functionality, within Athena.
 */

struct SearchView: View {
    
    @State private var searchText = ""
    let names = ["Alice", "Bob", "Charlie", "David", "Eve", "Frank", "Timmy"]
    
    var body: some View {
        VStack {
            SearchBar(text: $searchText)
                .padding(.horizontal)
            
            List(names.filter { searchText.isEmpty ? true : $0.localizedCaseInsensitiveContains(searchText) }, id: \.self) { name in
                Text(name)
            }
        }
    }
}


struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
