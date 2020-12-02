#if os(macOS)
import AppKit

extension DeclarativeProtocol {
    @discardableResult
    public func onPanGesture(touches: Int? = nil, on state: NSGestureRecognizer.State, _ action: @escaping () -> Void) -> Self {
        onPanGesture(touches: touches, on: state) { v, r in
            action()
        }
    }
    
    @discardableResult
    public func onPanGesture(touches: Int? = nil, on states: [NSGestureRecognizer.State], _ action: @escaping () -> Void) -> Self {
        onPanGesture(touches: touches, on: states) { v, r in
            action()
        }
    }
    
    @discardableResult
    public func onPanGesture(touches: Int? = nil, on state: NSGestureRecognizer.State, _ action: @escaping (Self) -> Void) -> Self {
        onPanGesture(touches: touches, on: state) { v, r in
            action(self)
        }
    }
    
    @discardableResult
    public func onPanGesture(touches: Int? = nil, on states: [NSGestureRecognizer.State], _ action: @escaping (Self) -> Void) -> Self {
        onPanGesture(touches: touches, on: states) { v, r in
            action(self)
        }
    }
    
    @discardableResult
    public func onPanGesture(touches: Int? = nil, on state: NSGestureRecognizer.State, _ action: @escaping (Self, PanGestureRecognizer) -> Void) -> Self {
        onPanGesture(touches: touches, on: [state], action)
    }
    
    @discardableResult
    public func onPanGesture(touches: Int? = nil, on states: [NSGestureRecognizer.State], _ action: @escaping (Self, PanGestureRecognizer) -> Void) -> Self {
        onPanGesture(touches: touches) { v, s, r in
            if states.contains(s) {
                action(v, r)
            }
        }
    }
    
    @discardableResult
    public func onPanGesture(touches: Int? = nil, _ action: @escaping (Self) -> Void) -> Self {
        onPanGesture(touches: touches) { v, s, r in
            action(v)
        }
    }
    
    @discardableResult
    public func onPanGesture(touches: Int? = nil, _ action: @escaping (Self, NSGestureRecognizer.State) -> Void) -> Self {
        onPanGesture(touches: touches) { v, s, r in
            action(v, s)
        }
    }
    
    @discardableResult
    public func onPanGesture(touches: Int? = nil, _ action: @escaping (Self, NSGestureRecognizer.State, PanGestureRecognizer) -> Void) -> Self {
        let recognizer = PanGestureRecognizer(touches: touches)
        declarativeView.addGestureRecognizer(recognizer.trackState {
            action(self, $0, recognizer)
        })
        return self
    }
    
    @discardableResult
    public func onPanGesture(touches: Int? = nil, _ state: State<NSGestureRecognizer.State>) -> Self {
        onPanGesture(touches: touches) { v, s, r in
            state.wrappedValue = s
        }
    }

    @discardableResult
    public func onPanGesture<V>(touches: Int? = nil, _ expressable: ExpressableState<V, NSGestureRecognizer.State>) -> Self {
        onPanGesture(touches: touches, expressable.unwrap())
    }
}
#else
import UIKit
// TODO: implement multiple state methods
extension DeclarativeProtocol {
    @discardableResult
    public func onPanGesture(minTouches: Int? = nil, maxTouches: Int? = nil, on state: UIGestureRecognizer.State, _ action: @escaping () -> Void) -> Self {
        onPanGesture(minTouches: minTouches, maxTouches: maxTouches, on: state) { v, r in
            action()
        }
    }
    
    @discardableResult
    public func onPanGesture(minTouches: Int? = nil, maxTouches: Int? = nil, on state: UIGestureRecognizer.State, _ action: @escaping (Self) -> Void) -> Self {
        onPanGesture(minTouches: minTouches, maxTouches: maxTouches, on: state) { v, r in
            action(self)
        }
    }
    
    @discardableResult
    public func onPanGesture(minTouches: Int? = nil, maxTouches: Int? = nil, on state: UIGestureRecognizer.State, _ action: @escaping (Self, PanGestureRecognizer) -> Void) -> Self {
        onPanGesture(minTouches: minTouches, maxTouches: maxTouches) { v, s, r in
            if s == state {
                action(v, r)
            }
        }
    }
    
    @discardableResult
    public func onPanGesture(minTouches: Int? = nil, maxTouches: Int? = nil, _ action: @escaping (Self) -> Void) -> Self {
        onPanGesture(minTouches: minTouches, maxTouches: maxTouches) { v, s, r in
            action(v)
        }
    }
    
    @discardableResult
    public func onPanGesture(minTouches: Int? = nil, maxTouches: Int? = nil, _ action: @escaping (Self, UIGestureRecognizer.State) -> Void) -> Self {
        onPanGesture(minTouches: minTouches, maxTouches: maxTouches) { v, s, r in
            action(v, s)
        }
    }
    
    @discardableResult
    public func onPanGesture(minTouches: Int? = nil, maxTouches: Int? = nil, _ action: @escaping (Self, UIGestureRecognizer.State, PanGestureRecognizer) -> Void) -> Self {
        let recognizer = PanGestureRecognizer(minTouches: minTouches, maxTouches: maxTouches)
        declarativeView.addGestureRecognizer(recognizer.trackState {
            action(self, $0, recognizer)
        })
        return self
    }
    
    @discardableResult
    public func onPanGesture(minTouches: Int? = nil, maxTouches: Int? = nil, _ state: State<UIGestureRecognizer.State>) -> Self {
        onPanGesture(minTouches: minTouches, maxTouches: maxTouches) { v, s, r in
            state.wrappedValue = s
        }
    }

    @discardableResult
    public func onPanGesture<V>(minTouches: Int? = nil, maxTouches: Int? = nil, _ expressable: ExpressableState<V, UIGestureRecognizer.State>) -> Self {
        onPanGesture(minTouches: minTouches, maxTouches: maxTouches, expressable.unwrap())
    }
}
#endif
