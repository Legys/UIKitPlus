#if os(macOS)
import AppKit

public protocol FocusRingTypeable {
    @discardableResult
    func focusRingType(_ value: NSFocusRingType) -> Self
    
    @discardableResult
    func focusRingType(_ binding: UIKitPlus.State<NSFocusRingType>) -> Self
    
    @discardableResult
    func focusRingType<V>(_ expressable: ExpressableState<V, NSFocusRingType>) -> Self
}

protocol _FocusRingTypeable: FocusRingTypeable {
    func _setFocusRingType(_ v: NSFocusRingType)
}

extension FocusRingTypeable {
    @discardableResult
    public func focusRingType(_ binding: UIKitPlus.State<NSFocusRingType>) -> Self {
        binding.listen { self.focusRingType($0) }
        return focusRingType(binding.wrappedValue)
    }
    
    @discardableResult
    public func focusRingType<V>(_ expressable: ExpressableState<V, NSFocusRingType>) -> Self {
        focusRingType(expressable.unwrap())
    }
}

@available(iOS 13.0, macOS 10.15, *)
extension FocusRingTypeable {
    @discardableResult
    public func focusRingType(_ value: NSFocusRingType) -> Self {
        guard let s = self as? _FocusRingTypeable else { return self }
        s._setFocusRingType(value)
        return self
    }
}

// for iOS lower than 13
extension _FocusRingTypeable {
    @discardableResult
    public func focusRingType(_ value: NSFocusRingType) -> Self {
        _setFocusRingType(value)
        return self
    }
}
#endif
