//
//  BasicAuthCredential.swift
//  edX
//
//  Created by Akiva Leffert on 11/6/15.
//  Copyright © 2015 edX. All rights reserved.
//

import Foundation

class BasicAuthCredential: NSObject {
    let host: NSURL
    let username: String
    let password: String
    
    init(host : NSURL, username : String, password : String) {
        self.host = host
        self.username = username
        self.password = password
    }
    
    init?(dictionary : [String:AnyObject]) {
        if let
            host = dictionary["HOST"] as? String,
            hostURL = NSURL(string:host),
            username = dictionary["USERNAME"] as? String,
            password = dictionary["PASSWORD"] as? String
        {
                self.host = hostURL
                self.username = username
                self.password = password
                super.init()
        }
        else {
            self.host = NSURL()
            self.username = ""
            self.password = ""
            super.init()
            return nil
        }
    }
    
    var URLCredential : NSURLCredential {
        // Return .ForSession since credentials may change between runs
        return NSURLCredential(user: username, password: password, persistence: .ForSession)
    }
}
