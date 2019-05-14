# BinarySearchTree

## 二分搜索树
### 定义
`二叉查找树（Binary Search Tree），也称有序二叉树（ordered binary tree）,排序二叉树（sorted binary tree），是指一棵空树或者具有下列性质的二叉树：`
- 若任意节点的左子树不空，则左子树上所有结点的值均小于它的根结点的值；
- 任意节点的右子树不空，则右子树上所有结点的值均大于它的根结点的值；
- 任意节点的左、右子树也分别为二叉查找树。
- 没有键值相等的节点（no duplicate nodes）。

### 二分搜索树的结构
```swift
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
```
<!-- more -->
### 二分搜索树的实现

```swift

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
    
    var debugDescription: String {
        return ""
    }
    
}

```
### 二分搜索树的添加节点
```swift
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


```
### 二分搜索树查询某节点
```swift

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

```

### 二分搜索树的遍历
#### 前序遍历
```swift
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
```
#### 中序遍历
`中序及由小到大的排序`
```swift

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
```
#### 后序遍历
```swift
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
```
#### 非递归前序遍历
`利用栈结构实现递归栈的结构`
```swift
// 二分搜索树的非递归前序遍历
public func preOrderNR(){

    let stack = ListStack<Node<E>>();
    stack.push(e: root!);
    while(!stack.isEmpty()){
        let cur = stack.pop();
        print("\(String(describing: (cur?.e)!))");
    
        if(cur?.right != nil){
            stack.push(e: (cur?.right)!);
        }
        if(cur?.left != nil){
            stack.push(e: (cur?.left)!);
        }
    }
}
```
#### 层序遍历
`利用队列的先进选出的原理，从跟节点遍历搜索树，依次将该节点的左右子树加入队列中，每处理完一个节点后都将其左右子树加入队列即可，**知道左右子树为nil**`
```swift
// 二分搜索树的层序遍历
public func levelOrder(){

    let q = ListQueue<Node<E>>();
    if self.root==nil {
        return
    }
    q.enqueue(e: self.root!)
    while(!q.isEmpty()){
        let cur = q.dequeue()
        print("\(String(describing: (cur?.e)!))")
        
        if(cur?.left != nil){
            q.enqueue(e: (cur?.left)!)
        }
        if(cur?.right != nil){
            q.enqueue(e: (cur?.right)!)
        }
    }
}
```

## 数据结构之二分搜索树2
### 查找最值
#### 查找最小值
```swift
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
```
<!-- more -->
#### 查找最大值
```swift
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
    if( node!.left == nil ){
        return node
    }
    return minimum(node: node?.right);
}

```
#### 调试
```swift
var bst = BST<Int>()
//var list = [1,4,6,2,3,4,55,67,8,9,10]
var list = [11,21,23,20,5,6,7,8,9,3,11,12,4,14,15,16,17,18,19]

for i in list {
    bst .add(e: i)
}

print("-------mini-----------")
print(bst.minimum())
print("-------max-----------")
print(bst.maxmum())
```
```swift
-------mini-----------
3
-------max-----------
23
Program ended with exit code: 0
```
### 删除最值
#### 删除最小值
```swift
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
```
#### 删除最大值
```swift
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
```

```swift
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
-------mini-----------
3
-------max-----------
23
-------删除最小值后-----------
4
-------删除最大值-----------
21
Program ended with exit code: 0
```


### 删除任意值
```swift
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
```