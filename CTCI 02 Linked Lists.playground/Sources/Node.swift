import Foundation

public class Node<T> {
    public var key: T!
    public var next: Node?
    
    public init() {}
    
    public init(key: T!) {
        self.key = key
    }
    
    public init(key: T!, next: Node?) {
        self.key = key
        self.next = next
    }
}
