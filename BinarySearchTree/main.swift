//
//  main.swift
//  BinarySearchTree
//
//  Created by DingYD on 2019/5/13.
//  Copyright © 2019 GuoTZ. All rights reserved.
//

import Foundation

print("Hello, World!")

var bst = BST<Int>()
//var list = [1,4,6,2,3,4,55,67,8,9,10]
var list = [11,21,23,20,5,6,7,8,9,3,11,12,4,14,15,16,17,18,19]

for i in list {
    bst .add(e: i)
}

print("-------mini-----------")
print(bst.minimum() ?? -1)
print("-------max-----------")
print(bst.maxmum() ?? -1)
bst.removeMin()
bst.removeMax()
print("-------删除最小值后-----------")
print(bst.minimum() ?? -1)
print("-------删除最大值-----------")
print(bst.maxmum() ?? -1)

bst.remove(e: 4)
bst.remove(e: 21)
print("-------删除最小值后-----------")
print(bst.minimum() ?? -1)
print("-------删除最大值-----------")
print(bst.maxmum() ?? -1)
//print("-------前序-----------")
//bst.preOrder()
//print("-------非递归前序-----------")
//bst.preOrderNR()
//print("-------层序-----------")
//bst.levelOrder()
//print("-------中序-----------")
//bst.inOrder()
//print("-------后序-----------")
//bst.postOrder()
