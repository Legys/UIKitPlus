#if os(macOS)
import AppKit

extension DeclarativeProtocol {
    // MARK: In Radians
    
    @discardableResult
    public func onRotationGesture(rotation: CGFloat? = nil, on state: NSGestureRecognizer.State, _ action: @escaping () -> Void) -> Self {
        onRotationGesture(rotation: rotation, on: state) { v, r in
            action()
        }
    }
    
    @discardableResult
    public func onRotationGesture(rotation: CGFloat? = nil, on state: NSGestureRecognizer.State, _ action: @escaping (Self) -> Void) -> Self {
        onRotationGesture(rotation: rotation, on: state) { v, r in
            action(self)
        }
    }
    
    @discardableResult
    public func onRotationGesture(rotation: CGFloat? = nil, on state: NSGestureRecognizer.State, _ action: @escaping (Self, RotationGestureRecognizer) -> Void) -> Self {
        onRotationGesture(rotation: rotation) { v, s, r in
            if s == state {
                action(v, r)
            }
        }
    }
    
    @discardableResult
    public func onRotationGesture(rotation: CGFloat? = nil, _ action: @escaping (Self) -> Void) -> Self {
        onRotationGesture(rotation: rotation) { v, s, r in
            action(v)
        }
    }
    
    @discardableResult
    public func onRotationGesture(rotation: CGFloat? = nil, _ action: @escaping (Self, NSGestureRecognizer.State) -> Void) -> Self {
        onRotationGesture(rotation: rotation) { v, s, r in
            action(v, s)
        }
    }
    
    @discardableResult
    public func onRotationGesture(rotation: CGFloat? = nil, _ action: @escaping (Self, NSGestureRecognizer.State, RotationGestureRecognizer) -> Void) -> Self {
        let recognizer = RotationGestureRecognizer(rotation: rotation)
        declarativeView.addGestureRecognizer(recognizer.trackState {
            action(self, $0, recognizer)
        })
        return self
    }
    
    @discardableResult
    public func onRotationGesture(rotation: CGFloat? = nil, _ state: State<NSGestureRecognizer.State>) -> Self {
        onRotationGesture(rotation: rotation) { v, s, r in
            state.wrappedValue = s
        }
    }

    @discardableResult
    public func onRotationGesture<V>(rotation: CGFloat? = nil, _ expressable: ExpressableState<V, NSGestureRecognizer.State>) -> Self {
        onRotationGesture(rotation: rotation, expressable.unwrap())
    }
    
    // MARK: In Degrees
    
    @discardableResult
    public func onRotationGesture(rotationInDegrees: CGFloat, on state: NSGestureRecognizer.State, _ action: @escaping () -> Void) -> Self {
        onRotationGesture(rotationInDegrees: rotationInDegrees, on: state) { v, r in
            action()
        }
    }
    
    @discardableResult
    public func onRotationGesture(rotationInDegrees: CGFloat, on state: NSGestureRecognizer.State, _ action: @escaping (Self) -> Void) -> Self {
        onRotationGesture(rotationInDegrees: rotationInDegrees, on: state) { v, r in
            action(self)
        }
    }
    
    @discardableResult
    public func onRotationGesture(rotationInDegrees: CGFloat, on state: NSGestureRecognizer.State, _ action: @escaping (Self, RotationGestureRecognizer) -> Void) -> Self {
        onRotationGesture(rotationInDegrees: rotationInDegrees) { v, s, r in
            if s == state {
                action(v, r)
            }
        }
    }
    
    @discardableResult
    public func onRotationGesture(rotationInDegrees: CGFloat, _ action: @escaping (Self) -> Void) -> Self {
        onRotationGesture(rotationInDegrees: rotationInDegrees) { v, s, r in
            action(v)
        }
    }
    
    @discardableResult
    public func onRotationGesture(rotationInDegrees: CGFloat, _ action: @escaping (Self, NSGestureRecognizer.State) -> Void) -> Self {
        onRotationGesture(rotationInDegrees: rotationInDegrees) { v, s, r in
            action(v, s)
        }
    }
    
    @discardableResult
    public func onRotationGesture(rotationInDegrees: CGFloat, _ action: @escaping (Self, NSGestureRecognizer.State, RotationGestureRecognizer) -> Void) -> Self {
        let recognizer = RotationGestureRecognizer(rotationInDegrees: rotationInDegrees)
        declarativeView.addGestureRecognizer(recognizer.trackState {
            action(self, $0, recognizer)
        })
        return self
    }
    
    @discardableResult
    public func onRotationGesture(rotationInDegrees: CGFloat, _ state: State<NSGestureRecognizer.State>) -> Self {
        onRotationGesture(rotationInDegrees: rotationInDegrees) { v, s, r in
            state.wrappedValue = s
        }
    }

    @discardableResult
    public func onRotationGesture<V>(rotationInDegrees: CGFloat, _ expressable: ExpressableState<V, NSGestureRecognizer.State>) -> Self {
        onRotationGesture(rotationInDegrees: rotationInDegrees, expressable.unwrap())
    }
}
#else
import UIKit

#if !os(tvOS)
extension DeclarativeProtocol {
    @discardableResult
    public func onRotationGesture(rotation: CGFloat? = nil, on state: UIGestureRecognizer.State, _ action: @escaping () -> Void) -> Self {
        onRotationGesture(rotation: rotation, on: state) { v, r in
            action()
        }
    }
    
    @discardableResult
    public func onRotationGesture(rotation: CGFloat? = nil, on state: UIGestureRecognizer.State, _ action: @escaping (Self) -> Void) -> Self {
        onRotationGesture(rotation: rotation, on: state) { v, r in
            action(self)
        }
    }
    
    @discardableResult
    public func onRotationGesture(rotation: CGFloat? = nil, on state: UIGestureRecognizer.State, _ action: @escaping (Self, RotationGestureRecognizer) -> Void) -> Self {
        onRotationGesture(rotation: rotation) { v, s, r in
            if s == state {
                action(v, r)
            }
        }
    }
    
    @discardableResult
    public func onRotationGesture(rotation: CGFloat? = nil, _ action: @escaping (Self) -> Void) -> Self {
        onRotationGesture(rotation: rotation) { v, s, r in
            action(v)
        }
    }
    
    @discardableResult
    public func onRotationGesture(rotation: CGFloat? = nil, _ action: @escaping (Self, UIGestureRecognizer.State) -> Void) -> Self {
        onRotationGesture(rotation: rotation) { v, s, r in
            action(v, s)
        }
    }
    
    @discardableResult
    public func onRotationGesture(rotation: CGFloat? = nil, _ action: @escaping (Self, UIGestureRecognizer.State, RotationGestureRecognizer) -> Void) -> Self {
        let recognizer = RotationGestureRecognizer(rotation: rotation)
        declarativeView.addGestureRecognizer(recognizer.trackState {
            action(self, $0, recognizer)
        })
        return self
    }
    
    @discardableResult
    public func onRotationGesture(rotation: CGFloat? = nil, _ state: State<UIGestureRecognizer.State>) -> Self {
        onRotationGesture(rotation: rotation) { v, s, r in
            state.wrappedValue = s
        }
    }

    @discardableResult
    public func onRotationGesture<V>(rotation: CGFloat? = nil, _ expressable: ExpressableState<V, UIGestureRecognizer.State>) -> Self {
        onRotationGesture(rotation: rotation, expressable.unwrap())
    }
}
#endif
#endif
