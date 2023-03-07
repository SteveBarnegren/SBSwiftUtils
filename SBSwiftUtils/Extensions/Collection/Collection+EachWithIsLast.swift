import Foundation

public struct EachWithIsLastCollection<Base> where Base: Collection {

    let base: Base

    init(_ baseCollection: Base) {
        self.base = baseCollection
    }
}

extension EachWithIsLastCollection: Collection {

    public subscript(position: Base.Index) -> (Base.Element, Bool) {
        return (base[position], position == self.index(startIndex, offsetBy: count-1))
    }

    public var startIndex: Base.Index {
        return base.startIndex
    }

    public var endIndex: Base.Index {
        return base.endIndex
    }

    public func index(after i: Base.Index) -> Base.Index {
        return base.index(after: i)
    }

    public func index(before i: Base.Index) -> Base.Index {
        return base.index(after: i)
    }
}

public extension Collection {

    /// Returns a collection of pairs (x, isLast), where x represents an element of the
    /// collection and the isLast flag is true if an element is the last in the collection.
    func eachWithIsLast() -> EachWithIsLastCollection<Self> {
        return EachWithIsLastCollection(self)
    }
}
