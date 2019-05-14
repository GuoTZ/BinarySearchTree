//
//  ListQueue.swift
//  BinarySearchTree
//
//  Created by DingYD on 2019/5/14.
//  Copyright © 2019 GuoTZ. All rights reserved.
//

import Cocoa

class ListQueue<E> {
    private var data:[E]
    init() {
        self.data = Array<E>()
    }
    func getSize() -> Int {
        return self.data.count
    }
    
    func isEmpty() -> Bool {
        return self.data.count == 0
    }
    
     func enqueue(e: E) {
        self.data.append(e)
    }
    
     func dequeue()  -> E? {
        let e = self.data.first
        if e == nil {
            return nil;
        }
        self.data.remove(at: 0)
        return e!
    }
    
    func getFront()  -> E? {
        let e = self.data.first
        if e == nil {
            return nil;
        }
        return e!
    }
}
