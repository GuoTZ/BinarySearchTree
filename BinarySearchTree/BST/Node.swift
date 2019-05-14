//
//  Node.swift
//  BinarySearchTree
//
//  Created by DingYD on 2019/5/13.
//  Copyright © 2019 GuoTZ. All rights reserved.
//

import Cocoa

/// 元查找树的节点
class Node<E>:CustomDebugStringConvertible {
    ///数据域
    public var e:E
    /// 左子树
    public var left: Node<E>?
    /// 右子树
    public var right: Node<E>?
    
    init(e:E) {
        self.e = e
        self.left = nil
        self.right = nil
    }
    var debugDescription: String {
        return "\(e)"
    }
}
