//
//  ListStack.swift
//  BinarySearchTree
//
//  Created by DingYD on 2019/5/14.
//  Copyright © 2019 GuoTZ. All rights reserved.
//

import Cocoa

class ListStack<E> {
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
    
    func push(e: E){
        self.data.insert(e, at: 0)
    }
    
    func pop() -> E? {
        let e = self.data.first
        if e != nil {
            self.data.remove(at: 0)
        }
        return e
    }
}
