//
//  ConcurrencyCode.swift
//  iOS
//
//  Created by Vijay Sachan on 14/10/23.
//

import Foundation
class ConcurrencyCode{
    func _1_dispatchQueue(){
        let _={
            let _="--------------- Main thread --------------------------"
            /**
             Use below func to execute code in main thread
             */
            DispatchQueue.main.async {
                
            }
        }
        let _={
            let _="--------------- Background thread --------------------------"
            /**
             Use below func to execute code in background thread
             
             */
            DispatchQueue.global(qos: .default).async {
                
            }
            let _="List of (qos:quality-of-service) sorted by highest priority"
            let qosArr:[QualityOfService]=[.userInteractive,.userInitiated,.default,.utility,.background]
        }
        let _={
            let _="Types of DispatchQueue"
            let _="1. Serial"
            let _="2. Concurrent"
            // If you omit "attribute" parameter, the dispatch queue executes tasks serially.
            let serial=DispatchQueue(label: "Serial",qos: .default)
            let concurrent=DispatchQueue(label: "Concurrent",qos: .default,attributes:.concurrent)
        }
        
    }
}
