/*
 *  To change this license header, choose License Headers in Project Properties.
 *  To change this template file, choose Tools | Templates
 *  and open the template in the editor.
 */
package Controller;

import Entity.Message;
import Model.MessageDecoder;
import Model.MessageEncoder;
import java.io.IOException;
import java.util.Collections;
import java.util.HashSet;
import java.util.Set;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.websocket.EncodeException;
import javax.websocket.OnClose;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

/**
 *
 * @author Asus
 */
@ServerEndpoint(value = "/chat", encoders = MessageEncoder.class, decoders = MessageDecoder.class)
public class ChatWebSocketEndPoint {
    
    private static Set<Session> sessions = Collections.synchronizedSet(new HashSet<Session>());
    
    @OnMessage
    public String onMessage(Session session, Message message) {
        System.out.println("Handling message: " + message);
        for (Session s : sessions) {
            try {
                s.getBasicRemote().sendObject(message);
            } catch (IOException ex) {
                Logger.getLogger(ChatWebSocketEndPoint.class.getName()).log(Level.SEVERE, null, ex);
            } catch (EncodeException ex) {
                Logger.getLogger(ChatWebSocketEndPoint.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return null;
    }
    
    @OnOpen
    public void onOpen(Session session) {
        System.out.println("On open: " + session.getId());
        sessions.add(session);
    }
    
    @OnClose
    public void onClose(Session session) {
        System.out.println("On close: " + session.getId());
        sessions.remove(session);
    }
    
}
