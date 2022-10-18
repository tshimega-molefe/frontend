
import Foundation

class WebSocketClient: NSObject {
        
    static let shared = WebSocketClient()
    private var webSocket: URLSessionWebSocketTask?
    
    var opened = false
    
    private var urlString = "ws://localhost:8000"
    
    private override init() {
        // no-op
    }
    
    func subscribeToService(with completion: @escaping (String?) -> Void) {
        if !opened {
            openWebSocket()
        }
    }
    
    private func openWebSocket() {
        if let url = URL(string: urlString) {
            let request = URLRequest(url: url)
            let session = URLSession(configuration: .default, delegate: self, delegateQueue: nil)
            let webSocket = session.webSocketTask(with: request)
            self.webSocket = webSocket
            self.opened = true
            self.webSocket?.resume()
        } else {
            webSocket = nil
        }
    }

    func pingWebSocket() {
        
    }
    
    func closeWebSocket() {
        
    }
    
    func sendWebsocket() {
        
    }
    
    func receiveWebsocket() {
        
    }
    
    
    
}

extension WebSocketClient: URLSessionWebSocketDelegate {
    
    func urlSession(_ session: URLSession, webSocketTask: URLSessionWebSocketTask, didOpenWithProtocol protocol: String?) {
        opened = true
        print("DEBUG: Socket opened..")
    }

    
    func urlSession(_ session: URLSession, webSocketTask: URLSessionWebSocketTask, didCloseWith closeCode: URLSessionWebSocketTask.CloseCode, reason: Data?) {
        self.webSocket = nil
        self.opened = false
        print("DEBUG: Socket closed..")
    }
}


