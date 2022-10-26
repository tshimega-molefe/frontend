import Foundation



final class WebsocketClient: NSObject {
    
    var webSocket: URLSessionWebSocketTask?
    var opened = false
    let accessToken: String
    static let shared = WebsocketClient()
    
    private var urlString = "ws://localhost:8000"
    
    private override init() {
        if let data = KeychainHelper.standard.read(service: "access-token"){
            if let accessToken = String(data: data, encoding: .utf8){
                self.accessToken = accessToken
            }
            else {
                self.accessToken = ""
                print("DEBUG: Something went wrong setting access token string value")
            }
        }
        else {
            self.accessToken = ""
            print("DEBUG: No webSocket access token found in keychain")
        }
    }
    
    func openWebSocket() {
        if let url = URL(string: urlString) {
            var request = URLRequest(url: url)
            
            print("DEBUG: AccessToken for WebSocket is \(String(describing: accessToken))")
            request.addValue(accessToken, forHTTPHeaderField: "Authorization")
            let session = URLSession(configuration: .default, delegate: self, delegateQueue: nil)
            let webSocket = session.webSocketTask(with: request)
            self.webSocket = webSocket
            opened = true
            self.webSocket?.resume()
        }
        else {
            webSocket = nil
        }
    }
    
    func closeWebSocket() {
        self.webSocket!.cancel(with: .goingAway, reason: nil)
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
