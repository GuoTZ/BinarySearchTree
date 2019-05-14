//
//  BST.swift
//  BinarySearchTree
//
//  Created by DingYD on 2019/5/13.
//  Copyright © 2019 GuoTZ. All rights reserved.
//

import Cocoa


/// 二分搜索树的数据是具有比较性的
class BST<E>:CustomDebugStringConvertible  where E:Comparable {
    private var root:Node<E>?
    private var size:Int
    
    init() {
        self.size=0
        self.root=nil
    }
    
    public func getSize() -> Int {
        return self.size
    }
    
    public func isEmpty() -> Bool{
        return self.size == 0;
    }
    

    
    // 向二分搜索树中添加新的元素e
    public func add(e:E){
    
        root = add(node: self.root, e: e)
        
    }
    
    // 向以node为根的二分搜索树中插入元素e，递归算法
    private func add(node:Node<E>?, e:E) -> Node<E>?{
        if node == nil {
            size += 1
            return Node.init(e: e)
        }
        if e < node!.e {
            node?.left = add(node: node?.left, e: e)
        } else if e > node!.e {
            node?.right = add(node: node?.right, e: e)
        }
        return node
    }
    
    
    // 看二分搜索树中是否包含元素e
    public func contains(e:E) -> Bool{
        return self.contains(node: root, e: e)
    }
    
    // 看以node为根的二分搜索树中是否包含元素e, 递归算法
    private func contains(node:Node<E>?, e:E) -> Bool{
    
        if node==nil {
            return false;
        }
        if e == node!.e {
            return true
        } else if e < node!.e  {
            return contains(node: node?.left, e: e)
        } else {
            return contains(node: node?.right, e: e)
        }
    }
    
    
    // 二分搜索树的前序遍历
    public func preOrder(){
        self.preOrder(node: self.root);
    }
    
    // 前序遍历以node为根的二分搜索树, 递归算法
    private func preOrder(node:Node<E>?){
        if node==nil {
            return
        }
    
        print(node!.e);
        self.preOrder(node: node!.left);
        self.preOrder(node: node!.right);
    }
    
    // 二分搜索树的中序遍历//大小顺序排列
    public func inOrder(){
        self.inOrder(node: self.root);
    }
    
    // 中序遍历以node为根的二分搜索树选左再根再右节点, 递归算法
    private func inOrder(node:Node<E>?){
        if node==nil {
            return
        }
        
        self.inOrder(node: node!.left);
        print(node!.e);
        self.inOrder(node: node!.right);
    }
    
    // 二分搜索树的非递归前序遍历
    public func preOrderNR(){
    
        let stack = ListStack<Node<E>>()
        stack.push(e: root!)
        while(!stack.isEmpty()){
            let cur = stack.pop();
            print("\(String(describing: (cur?.e)!))")
        
            if(cur?.right != nil){
                stack.push(e: (cur?.right)!)
            }
            if(cur?.left != nil){
                stack.push(e: (cur?.left)!)
            }
        }
    }
    
    // 二分搜索树的层序遍历
    public func levelOrder(){
    
        let q = ListQueue<Node<E>>();
        if self.root==nil {
            return
        }
        q.enqueue(e: self.root!)
        while(!q.isEmpty()){
            let cur = q.dequeue()
            debugPrint("\(String(describing: (cur?.e)!))")
            
            if(cur?.left != nil){
                q.enqueue(e: (cur?.left)!)
            }
            if(cur?.right != nil){
                q.enqueue(e: (cur?.right)!)
            }
        }
    }
    
    /// 后序遍历
    public func postOrder() {
        self.postOrder(node: self.root)
    }
    
    private func postOrder(node:Node<E>?) {
        if node == nil {
            return
        }
        self.postOrder(node: node?.left)
        self.postOrder(node: node?.right)
        print(node!.e)
    }
    
    var debugDescription: String {
        var str = ""
        
        self.description(node: self.root, depth: 0,str: &str)
        return str
    }
    private func description(node:Node<E>?,depth:Int,str:inout String) {
        if node == nil {
            return
        }
        self.description(node: node?.left,depth:depth+1,str:&str)
        self.description(node: node?.right,depth:depth+1,str:&str)
        str.append(self.getDepthStr(depth: depth)+"\(node!.e)\n")
    }
    private func getDepthStr(depth:Int) -> String {
        var str = ""
        for _ in 0..<depth {
            str.append("--")
        }
        return str
    }
    
    
    
    // 寻找二分搜索树的最小元素
    public func minimum() ->E?{
        if(size == 0){
            return nil
        }
        
        let minNode = minimum(node: self.root);
        return minNode?.e;
    }
    
    // 返回以node为根的二分搜索树的最小值所在的节点
    private func minimum(node:Node<E>?) -> Node<E>?{
        if node == nil {
            return nil
        }
        if( node!.left == nil ){
            return node
        }
        return minimum(node: node?.left);
    }
    // 寻找二分搜索树的最da元素
    public func maxmum() ->E?{
        if(size == 0){
            return nil
        }
        
        let minNode = maxmum(node: self.root);
        return minNode?.e;
    }
    
    // 返回以node为根的二分搜索树的最大值所在的节点
    private func maxmum(node:Node<E>?) -> Node<E>?{
        if node == nil {
            return nil
        }
        if( node!.right == nil ){
            return node
        }
        return maxmum(node: node?.right);
    }
    
    // 从二分搜索树中删除最小值所在节点, 返回最小值
    public func removeMin() ->E?{
        let ret = minimum();
        root = removeMin(node: root);
        return ret;
    }
    
    // 删除掉以node为根的二分搜索树中的最小节点
    // 返回删除节点后新的二分搜索树的根
    private func removeMin(node:Node<E>?)->Node<E>?{
        if node == nil {
            return nil
        }
        if(node!.left == nil){
            let rightNode = node?.right;
            node!.right = nil;
            size -= 1;
            return rightNode;
        }
        
        node!.left = removeMin(node: node!.left);
        return node;
    }

    // 从二分搜索树中删除最大值所在节点, 返回最大值
    public func removeMax() ->E?{
        let ret = maxmum();
        root = removeMax(node: root);
        return ret;
    }
    
    // 删除掉以node为根的二分搜索树中的最大节点
    // 返回删除节点后新的二分搜索树的根
    private func removeMax(node:Node<E>?)->Node<E>?{
        if node == nil {
            return nil
        }
        if(node!.right == nil){
            let leftNode = node?.left;
            node!.left = nil;
            size -= 1;
            return leftNode;
        }
        
        node!.right = removeMax(node: node!.right);
        return node;
    }
    // 从二分搜索树中删除元素为e的节点
    public func remove(e:E){
        root = remove(node: root, e: e);
    }
    
    // 删除掉以node为根的二分搜索树中值为e的节点, 递归算法
    // 返回删除节点后新的二分搜索树的根
    private func remove(node:Node<E>?,e:E)->Node<E>?{
    
        if( node == nil ){
            return nil
        }
    
        if( e < node!.e ){
            node!.left = remove(node: node!.left , e: e)
            return node
        } else if(e > node!.e){
            node!.right = remove(node: node!.right, e: e)
            return node
        } else{   // e.compareTo(node.e) == 0
            
            // 待删除节点左子树为空的情况
            if(node!.left == nil){
                let rightNode = node!.right
                node!.right = nil
                size -= 1
                return rightNode
            }
            
            // 待删除节点右子树为空的情况
            if(node!.right == nil){
                let leftNode = node!.left
                node!.left = nil
                size -= 1
                return leftNode
            }
            
            // 待删除节点左右子树均不为空的情况
            
            // 找到比待删除节点大的最小节点, 即待删除节点右子树的最小节点
            // 用这个节点顶替待删除节点的位置
                let successor = Node(e: (minimum(node: node?.right)?.e)!)
            size += 1
            
            successor.right = removeMin(node: node?.right)
            successor.left = node!.left
            node!.left = nil
            node!.right = nil
            size -= 1
            
            return successor
        }
    }
}
