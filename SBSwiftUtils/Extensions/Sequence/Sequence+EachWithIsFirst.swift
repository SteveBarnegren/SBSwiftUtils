import Foundation

public struct EachWithIsFirstSequence<Base> where Base: IteratorProtocol {

    private var base: Base
    private var isFirst = true

    init(_ baseSequence: Base) {
        self.base = baseSequence
    }
}

extension EachWithIsFirstSequence: Sequence, IteratorProtocol {

    public mutating func next() -> (Base.Element, Bool)? {
        defer { self.isFirst = false }
        if let next = base.next() {
            return (next, isFirst)
        } else {
            return nil
        }
    }
}

public extension Sequence {

    func eachWithIsFirst() -> EachWithIsFirstSequence<Self.Iterator> {
        return EachWithIsFirstSequence(self.makeIterator())
    }
}
