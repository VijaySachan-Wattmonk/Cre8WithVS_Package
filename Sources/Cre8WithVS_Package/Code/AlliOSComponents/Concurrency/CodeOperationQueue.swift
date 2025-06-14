//
//  OperationQueueCode.swift
//  iOS
//
//  Created by Vijay Sachan on 14/10/23.
//

import Foundation
class CodeOperationQueue{
    func detailOperationQueue(){
        let _="Default OperationQueue"
        OperationQueue.main.addOperation {
            // It will execute in main thread
        }
        
        let _="Custom OperationQueue"
        let queue = OperationQueue()
        
        queue.addOperation {
            // Closure
        }
        queue.addOperation(BlockOperation(block: {
            // BlockOperation
        }))
        queue.maxConcurrentOperationCount = 4
        queue.qualityOfService = .default
        queue.waitUntilAllOperationsAreFinished()
        queue.cancelAllOperations()
        queue.addBarrierBlock {
            
        }
        let _=queue.progress
        //  The default maximum number of operations to invoke concurrently in a queue
        //The operation queue determines this number dynamically based on current system conditions.
        let _=OperationQueue.defaultMaxConcurrentOperationCount //  Read only
        
    }
    func detailBlockOperation(){
        // BlockOperation.queuePriority : The execution priority of the operation in an operation queue.
        /**
         case veryLow
         Operations receive very low priority for execution.
         case low
         Operations receive low priority for execution.
         case normal
         Operations receive the normal priority for execution.
         case high
         Operations receive high priority for execution.
         case veryHigh
         Operations receive very high priority for execution.

         */
    }
}
