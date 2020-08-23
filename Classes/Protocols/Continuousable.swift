#if os(macOS)
import AppKit
#else
import UIKit
#endif

public protocol Continuousable {
    @discardableResult
    func continuous() -> Self
    
    @discardableResult
    func continuous(_ value: Bool) -> Self
    
    @discardableResult
    func continuous(_ binding: UIKitPlus.State<Bool>) -> Self
    
    @discardableResult
    func continuous<V>(_ expressable: ExpressableState<V, Bool>) -> Self
}

protocol _Continuousable: Continuousable {
    var _continuousState: State<Bool> { get }
    
    func _setContinuous(_ v: Bool)
}

extension Continuousable {
    @discardableResult
    public func continuous() -> Self {
        continuous(true)
    }
    
    @discardableResult
    public func continuous(_ binding: UIKitPlus.State<Bool>) -> Self {
        binding.listen { self.continuous($0) }
        return continuous(binding.wrappedValue)
    }
    
    @discardableResult
    public func continuous<V>(_ expressable: ExpressableState<V, Bool>) -> Self {
        continuous(expressable.unwrap())
    }
}

@available(iOS 13.0, macOS 10.15, *)
extension Continuousable {
    @discardableResult
    public func continuous(_ value: Bool) -> Self {
        guard let s = self as? _Continuousable else { return self }
        s._setContinuous(value)
        return self
    }
}

// for iOS lower than 13
extension _Continuousable {
    @discardableResult
    public func continuous(_ value: Bool) -> Self {
        _setContinuous(value)
        return self
    }
}