import Foundation

final class WebsocketClient: NSObject {
        
    static let shared = WebsocketClient()
    var webSocket: URLSessionWebSocketTask?
    
    var opened = false
    
    private var urlString = "ws://localhost:8000"
    
    private override init() {}
    
    func openWebSocket() {
        if let url = URL(string: urlString) {
            var request = URLRequest(url: url)
            
            // The value here is an access token from my local backend, needs to be replaced with value from keychain. 
            request.addValue("eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNjY3MTQzNjM0LCJpYXQiOjE2NjYyNzk2MzQsImp0aSI6ImY4MTBiNjQ2ZjY4OTQ0MTdhZDYyOWQyZTgyNzVkNzRmIiwidXNlcl9pZCI6ImI2ZjQwOGViLWM2ZTctNGY3My05ZmJmLTE4MDA4NGU5NWRlYSJ9.zrw32pRNWvZ6BXEPtuqhYHU2tRg7AB0wgvTnGmr0kcE", forHTTPHeaderField: "Authorization")
            let session = URLSession(configuration: .default, delegate: self, delegateQueue: nil)
            let webSocket = session.webSocketTask(with: request)
            self.webSocket = webSocket
            self.opened = true
            self.webSocket?.resume()
        } else {
            webSocket = nil
        }
    }
}

extension WebsocketClient: URLSessionWebSocketDelegate {
    func urlSession(_ session: URLSession, webSocketTask: URLSessionWebSocketTask, didOpenWithProtocol protocol: String?) {
        print("DEBUG: Opened websocket connection")
        opened = true
    }

    
    func urlSession(_ session: URLSession, webSocketTask: URLSessionWebSocketTask, didCloseWith closeCode: URLSessionWebSocketTask.CloseCode, reason: Data?) {
        print("DEBUG: Closed websocket connection.")
        self.webSocket = nil
        self.opened = false
    }
}
