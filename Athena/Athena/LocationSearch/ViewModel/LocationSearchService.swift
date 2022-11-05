//
//  LocationSearchViewModel.swift
//  Athena
//
//  Created by Tshimega Belmont on 2022/10/06.
//

import MapKit
import Combine

class LocationSearchService: NSObject, ObservableObject {
    // MARK: - Properties
    enum LocationStatus: Equatable {
        case idle
        case noResults
        case isSearching
        case error(String)
        case result
    }
    
    @Published var queryFragment = ""
    @Published var status: LocationStatus = .idle
    @Published var searchResults: [MKLocalSearchCompletion] = []
    
    @Published var selectedLocationCoordinate: CLLocationCoordinate2D?
    
    private var queryCancellable: AnyCancellable?
    private let searchCompleter: MKLocalSearchCompleter!

    
    // MARK: - Lifecycle
    init(searchCompleter: MKLocalSearchCompleter = MKLocalSearchCompleter()) {
        self.searchCompleter = searchCompleter
        super.init()
        searchCompleter.delegate = self
        queryCancellable = $queryFragment
                    .receive(on: DispatchQueue.main)
                    // we're debouncing the search, because the search completer is rate limited.
                    // feel free to play with the proper value here
                    .debounce(for: .milliseconds(250), scheduler: RunLoop.main, options: nil)
                    .sink(receiveValue: { fragment in
                        self.status = .isSearching
                        if !fragment.isEmpty {
                            self.searchCompleter.queryFragment = fragment
                        } else {
                            self.status = .idle
                            self.searchResults = []
                        }
                })
    }
    
    // MARK: - Helper functions
    
    func selectLocation(_ selectedResult: MKLocalSearchCompletion) {
        locationSearch(localSearchCompletion: selectedResult) { response, error in
            if let error = error {
                print("DEBUG: Location search failed with error \(error.localizedDescription)")
                self.status = .error("Something went wrong completing the search")
                return
            }
            
            if let item = response?.mapItems.first  {
                let coordinate = item.placemark.coordinate
                self.selectedLocationCoordinate = coordinate
                
                print("DEBUG: Location coordinates \(coordinate)")
            }
            else {
                self.status = .error("Something went wrong completing the search")
            }
            
        }
    }
    
    func locationSearch(localSearchCompletion: MKLocalSearchCompletion, completion: @escaping MKLocalSearch.CompletionHandler) {
        let searchRequest = MKLocalSearch.Request()
        searchRequest.naturalLanguageQuery = localSearchCompletion.title.appending(localSearchCompletion.subtitle)
        let search = MKLocalSearch(request: searchRequest)
        
        search.start(completionHandler: completion)
    }
    
}

// MARK: MKLocalSearchCompleterDelegate

extension LocationSearchService: MKLocalSearchCompleterDelegate {
    func completerDidUpdateResults(_ completer: MKLocalSearchCompleter) {
        // Depending on what you're searching, you might need to filter differently or
        // remove the filter altogether. Filtering for an empty Subtitle seems to filter
        // out a lot of places and only shows cities and countries.
        //self.searchResults = completer.results.filter({ $0.subtitle == "" })
        self.searchResults = completer.results
        self.status = completer.results.isEmpty ? .noResults : .result
    }

    func completer(_ completer: MKLocalSearchCompleter, didFailWithError error: Error) {
        self.status = .error(error.localizedDescription)
    }
}
