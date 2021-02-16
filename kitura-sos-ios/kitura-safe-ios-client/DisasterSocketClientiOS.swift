//
//  WebsocketClient.swift
//  kitura-safe-lab-dashboard
//
//  Created by David Okun on 5/30/19.
//  Copyright © 2019 David Okun. All rights reserved.
//

import Foundation
import Starscream

protocol DisasterSocketClientiOSDelegate: class {
    func clientConnected(client: DisasterSocketClientiOS)
    func clientDisconnected(client: DisasterSocketClientiOS)
    func clientErrorOccurred(client: DisasterSocketClientiOS, error: Error)
    func clientReceivedToken(client: DisasterSocketClientiOS, token: RegistrationToken)
    func clientReceivedDisaster(client: DisasterSocketClientiOS, disaster: Disaster)
}

enum DisasterSocketError: Error {
    case badConnection
}

class DisasterSocketClientiOS {
    weak var delegate: DisasterSocketClientiOSDelegate?
    var address: String
    var person: Person?
    public var disasterSocket: WebSocket?
    
    init(address: String) {
        self.address = address
    }
    
    public func attemptConnection() {
        guard let url = URL(string: "ws://\(self.address)/disaster") else {
            delegate?.clientErrorOccurred(client: self, error: DisasterSocketError.badConnection)
            return
        }
        let socket = WebSocket(url: url)
        socket.delegate = self
        disasterSocket = socket
        disasterSocket?.connect()
    }
    
    public func disconnect() {
        disasterSocket?.disconnect()
    }
    
    public func reportStatus(for person: Person) {
        do {
            disasterSocket?.write(data: try JSONEncoder().encode(person))
        } catch let error {
            delegate?.clientErrorOccurred(client: self, error: error)
        }
    }
}

extension DisasterSocketClientiOS: WebSocketDelegate {
    func websocketDidConnect(socket: WebSocketClient) {
        delegate?.clientConnected(client: self)
    }
    
    func websocketDidDisconnect(socket: WebSocketClient, error: Error?) {
        delegate?.clientDisconnected(client: self)
    }
    
    func websocketDidReceiveMessage(socket: WebSocketClient, text: String) {
        print("websocket message received: \(text)")
    }
    
    func websocketDidReceiveData(socket: WebSocketClient, data: Data) {
        print("websocket message received: \(String(describing: String(data: data, encoding: .utf8)))")
        parse(data)
    }
    
    private func parse(_ data: Data) {
        
        if let token = try? JSONDecoder().decode(RegistrationToken.self, from: data) {
            print("registration token received: \(token.tokenID)")
            delegate?.clientReceivedToken(client: self, token: token)
        }
        
        else if let disaster = try? JSONDecoder().decode(Disaster.self, from: data) {
            print("disaster reported: \(disaster.name)")
            delegate?.clientReceivedDisaster(client: self, disaster: disaster)
        }
        
    }
}
