//
//  ParagraphStyle.swift
//  UIKit-Plus
//
//  Created by Mihael Isaev on 27.08.2020.
//

#if os(macOS)
import AppKit
#else
import UIKit
#endif

public class ParagraphStyle: NSMutableParagraphStyle {
    var _updateHandler = {}
    
    public func onUpdate(_ handler: @escaping () -> Void) {
        _updateHandler = handler
    }
    
    @discardableResult
    public func remove(tabStop: NSTextTab) -> Self {
        super.removeTabStop(tabStop)
        _updateHandler()
        return self
    }
    
    @discardableResult
    public func add(tabStop: NSTextTab) -> Self {
        super.addTabStop(tabStop)
        _updateHandler()
        return self
    }
    
    public override func setParagraphStyle(_ obj: NSParagraphStyle) {
        lineSpacing(obj.lineSpacing)
        paragraphSpacing(obj.paragraphSpacing)
        firstLineHeadIndent(obj.firstLineHeadIndent)
        headIndent(obj.headIndent)
        tailIndent(obj.tailIndent)
        minimumLineHeight(obj.minimumLineHeight)
        maximumLineHeight(obj.maximumLineHeight)
        lineHeightMultiple(obj.lineHeightMultiple)
        defaultTabInterval(obj.defaultTabInterval)
        paragraphSpacingBefore(obj.paragraphSpacingBefore)
        hyphenationFactor(obj.hyphenationFactor)
        #if os(macOS)
        tighteningFactorForTruncation(obj.tighteningFactorForTruncation)
        headerLevel(obj.headerLevel)
        allowsDefaultTighteningForTruncation(obj.allowsDefaultTighteningForTruncation)
        #endif
        alignment(obj.alignment)
        lineBreakMode(obj.lineBreakMode)
        baseWritingDirection(obj.baseWritingDirection)
        tabStops(obj.tabStops)
        #if os(macOS)
        textBlocks(obj.textBlocks)
        textLists(obj.textLists)
        #endif
    }
    
    func mergeWithParagraphStyle(_ v: ParagraphStyle) {
        lineSpacingState.merge(with: v.lineSpacingState)
        minimumLineHeightState.merge(with: v.minimumLineHeightState)
        maximumLineHeightState.merge(with: v.maximumLineHeightState)
        lineHeightMultipleState.merge(with: v.lineHeightMultipleState)
        defaultTabIntervalState.merge(with: v.defaultTabIntervalState)
        paragraphSpacingBeforeState.merge(with: v.paragraphSpacingBeforeState)
        hyphenationFactorState.merge(with: v.hyphenationFactorState)
        #if os(macOS)
        tighteningFactorForTruncationState.merge(with: v.tighteningFactorForTruncationState)
        headerLevelState.merge(with: v.headerLevelState)
        allowsDefaultTighteningForTruncationState.merge(with: v.allowsDefaultTighteningForTruncationState)
        #endif
        alignmentState.merge(with: v.alignmentState)
        lineBreakModeState.merge(with: v.lineBreakModeState)
        baseWritingDirectionState.merge(with: v.baseWritingDirectionState)
        tabStopsState.merge(with: v.tabStopsState)
        #if os(macOS)
        textBlocksState.merge(with: v.textBlocksState)
        textListsState.merge(with: v.textListsState)
        #endif
    }
    
    // MARK: Line Spacing
    
    public override var lineSpacing: CGFloat {
         get { super.lineSpacing }
         set {
             super.lineSpacing = newValue
             _updateHandler()
         }
     }
    
    lazy var lineSpacingState: State<CGFloat> = .init(wrappedValue: lineSpacing)
    private var isListeningLineSpace = false
    
    @discardableResult
    public func lineSpacing(_ v: CGFloat) -> Self {
        lineSpacing = v
        if !isListeningLineSpace {
            isListeningLineSpace = true
            lineSpacingState.listen {
                self.lineSpacing($0)
            }
        }
        return self
    }
    
    @discardableResult
    public func lineSpacing(_ state: State<CGFloat>) -> Self {
        lineSpacingState.merge(with: state)
        return lineSpacing(state.wrappedValue)
    }
    
    @discardableResult
    public func lineSpacing<V>(_ expressable: ExpressableState<V, CGFloat>) -> Self {
        lineSpacing(expressable.unwrap())
    }
    
    // MARK: Paragraph Spacing
    
    public override var paragraphSpacing: CGFloat {
        get { super.paragraphSpacing }
        set {
            super.paragraphSpacing = newValue
            _updateHandler()
        }
    }
    
    lazy var paragraphSpacingState: State<CGFloat> = .init(wrappedValue: paragraphSpacing)
    private var isListeningParagraphSpacing = false
    
    @discardableResult
    public func paragraphSpacing(_ v: CGFloat) -> Self {
        paragraphSpacing = v
        if !isListeningParagraphSpacing {
            isListeningParagraphSpacing = true
            paragraphSpacingState.listen {
                self.paragraphSpacing($0)
            }
        }
        return self
    }
    
    @discardableResult
    public func paragraphSpacing(_ state: State<CGFloat>) -> Self {
        paragraphSpacingState.merge(with: state)
        return paragraphSpacing(state.wrappedValue)
    }
    
    @discardableResult
    public func paragraphSpacing<V>(_ expressable: ExpressableState<V, CGFloat>) -> Self {
        paragraphSpacing(expressable.unwrap())
    }
    
    // MARK: First Line Head Indent
    
    public override var firstLineHeadIndent: CGFloat {
        get { super.firstLineHeadIndent }
        set {
            super.firstLineHeadIndent = newValue
            _updateHandler()
        }
    }
    
    lazy var firstLineHeadIndentState: State<CGFloat> = .init(wrappedValue: firstLineHeadIndent)
    private var isListeningFirstLineHeadIndent = false
    
    @discardableResult
    public func firstLineHeadIndent(_ v: CGFloat) -> Self {
        firstLineHeadIndent = v
        if !isListeningFirstLineHeadIndent {
            isListeningFirstLineHeadIndent = true
            firstLineHeadIndentState.listen {
                self.firstLineHeadIndent($0)
            }
        }
        return self
    }
    
    @discardableResult
    public func firstLineHeadIndent(_ state: State<CGFloat>) -> Self {
        firstLineHeadIndentState.merge(with: state)
        return firstLineHeadIndent(state.wrappedValue)
    }
    
    @discardableResult
    public func firstLineHeadIndent<V>(_ expressable: ExpressableState<V, CGFloat>) -> Self {
        firstLineHeadIndent(expressable.unwrap())
    }
    
    // MARK: Head Indent
    
    public override var headIndent: CGFloat {
        get { super.headIndent }
        set {
            super.headIndent = newValue
            _updateHandler()
        }
    }
    
    lazy var headIndentState: State<CGFloat> = .init(wrappedValue: headIndent)
    private var isListeningHeadIndent = false
    
    @discardableResult
    public func headIndent(_ v: CGFloat) -> Self {
        headIndent = v
        if !isListeningHeadIndent {
            isListeningHeadIndent = true
            headIndentState.listen {
                self.headIndent($0)
            }
        }
        return self
    }
    
    @discardableResult
    public func headIndent(_ state: State<CGFloat>) -> Self {
        headIndentState.merge(with: state)
        return headIndent(state.wrappedValue)
    }
    
    @discardableResult
    public func headIndent<V>(_ expressable: ExpressableState<V, CGFloat>) -> Self {
        headIndent(expressable.unwrap())
    }
    
    // MARK: Tail Indent
    
    public override var tailIndent: CGFloat {
        get { super.tailIndent }
        set {
            super.tailIndent = newValue
            _updateHandler()
        }
    }
    
    lazy var tailIndentState: State<CGFloat> = .init(wrappedValue: tailIndent)
    private var isListeningTailIndent = false
    
    @discardableResult
    public func tailIndent(_ v: CGFloat) -> Self {
        tailIndent = v
        if !isListeningTailIndent {
            isListeningTailIndent = true
            tailIndentState.listen {
                self.tailIndent($0)
            }
        }
        return self
    }
    
    @discardableResult
    public func tailIndent(_ state: State<CGFloat>) -> Self {
        tailIndentState.merge(with: state)
        return tailIndent(state.wrappedValue)
    }
    
    @discardableResult
    public func tailIndent<V>(_ expressable: ExpressableState<V, CGFloat>) -> Self {
        tailIndent(expressable.unwrap())
    }
    
    // MARK: Minimum Line Height
    
    public override var minimumLineHeight: CGFloat {
        get { super.minimumLineHeight }
        set {
            super.minimumLineHeight = newValue
            _updateHandler()
        }
    }
    
    lazy var minimumLineHeightState: State<CGFloat> = .init(wrappedValue: minimumLineHeight)
    private var isListeningMinimumLineHeight = false
    
    @discardableResult
    public func minimumLineHeight(_ v: CGFloat) -> Self {
        minimumLineHeight = v
        if !isListeningMinimumLineHeight {
            isListeningMinimumLineHeight = true
            minimumLineHeightState.listen {
                self.minimumLineHeight($0)
            }
        }
        return self
    }
    
    @discardableResult
    public func minimumLineHeight(_ state: State<CGFloat>) -> Self {
        minimumLineHeightState.merge(with: state)
        return minimumLineHeight(state.wrappedValue)
    }
    
    @discardableResult
    public func minimumLineHeight<V>(_ expressable: ExpressableState<V, CGFloat>) -> Self {
        minimumLineHeight(expressable.unwrap())
    }
    
    // MARK: Maximum Line Height
    
    public override var maximumLineHeight: CGFloat {
        get { super.maximumLineHeight }
        set {
            super.maximumLineHeight = newValue
            _updateHandler()
        }
    }
    
    lazy var maximumLineHeightState: State<CGFloat> = .init(wrappedValue: maximumLineHeight)
    private var isListeningMaximumLineHeight = false
    
    @discardableResult
    public func maximumLineHeight(_ v: CGFloat) -> Self {
        maximumLineHeight = v
        if !isListeningMaximumLineHeight {
            isListeningMaximumLineHeight = true
            maximumLineHeightState.listen {
                self.maximumLineHeight($0)
            }
        }
        return self
    }
    
    @discardableResult
    public func maximumLineHeight(_ state: State<CGFloat>) -> Self {
        maximumLineHeightState.merge(with: state)
        return maximumLineHeight(state.wrappedValue)
    }
    
    @discardableResult
    public func maximumLineHeight<V>(_ expressable: ExpressableState<V, CGFloat>) -> Self {
        maximumLineHeight(expressable.unwrap())
    }
    
    // MARK: Line Height Multiple
    
    public override var lineHeightMultiple: CGFloat {
        get { super.lineHeightMultiple }
        set {
            super.lineHeightMultiple = newValue
            _updateHandler()
        }
    }
    
    lazy var lineHeightMultipleState: State<CGFloat> = .init(wrappedValue: lineHeightMultiple)
    private var isListeningLineHeightMultiple = false
    
    @discardableResult
    public func lineHeightMultiple(_ v: CGFloat) -> Self {
        lineHeightMultiple = v
        if !isListeningLineHeightMultiple {
            isListeningLineHeightMultiple = true
            lineHeightMultipleState.listen {
                self.lineHeightMultiple($0)
            }
        }
        return self
    }
    
    @discardableResult
    public func lineHeightMultiple(_ state: State<CGFloat>) -> Self {
        lineHeightMultipleState.merge(with: state)
        return lineHeightMultiple(state.wrappedValue)
    }
    
    @discardableResult
    public func lineHeightMultiple<V>(_ expressable: ExpressableState<V, CGFloat>) -> Self {
        lineHeightMultiple(expressable.unwrap())
    }
    
    // MARK: Default Tab Interval
    
    public override var defaultTabInterval: CGFloat {
        get { super.defaultTabInterval }
        set {
            super.defaultTabInterval = newValue
            _updateHandler()
        }
    }
    
    lazy var defaultTabIntervalState: State<CGFloat> = .init(wrappedValue: defaultTabInterval)
    private var isListeningDefaultTabInterval = false
    
    @discardableResult
    public func defaultTabInterval(_ v: CGFloat) -> Self {
        defaultTabInterval = v
        if !isListeningDefaultTabInterval {
            isListeningDefaultTabInterval = true
            defaultTabIntervalState.listen {
                self.defaultTabInterval($0)
            }
        }
        return self
    }
    
    @discardableResult
    public func defaultTabInterval(_ state: State<CGFloat>) -> Self {
        defaultTabIntervalState.merge(with: state)
        return defaultTabInterval(state.wrappedValue)
    }
    
    @discardableResult
    public func defaultTabInterval<V>(_ expressable: ExpressableState<V, CGFloat>) -> Self {
        defaultTabInterval(expressable.unwrap())
    }
    
    // MARK: Paragraph Spacing Before
    
    public override var paragraphSpacingBefore: CGFloat {
        get { super.paragraphSpacingBefore }
        set {
            super.paragraphSpacingBefore = newValue
            _updateHandler()
        }
    }
    
    lazy var paragraphSpacingBeforeState: State<CGFloat> = .init(wrappedValue: paragraphSpacingBefore)
    private var isListeningParagraphSpacingBefore = false
    
    @discardableResult
    public func paragraphSpacingBefore(_ v: CGFloat) -> Self {
        paragraphSpacingBefore = v
        if !isListeningParagraphSpacingBefore {
            isListeningParagraphSpacingBefore = true
            paragraphSpacingBeforeState.listen {
                self.paragraphSpacingBefore($0)
            }
        }
        return self
    }
    
    @discardableResult
    public func paragraphSpacingBefore(_ state: State<CGFloat>) -> Self {
        paragraphSpacingBeforeState.merge(with: state)
        return paragraphSpacingBefore(state.wrappedValue)
    }
    
    @discardableResult
    public func paragraphSpacingBefore<V>(_ expressable: ExpressableState<V, CGFloat>) -> Self {
        paragraphSpacingBefore(expressable.unwrap())
    }
    
    // MARK: Hyphenation Factor
    
    public override var hyphenationFactor: Float {
        get { super.hyphenationFactor }
        set {
            super.hyphenationFactor = newValue
            _updateHandler()
        }
    }
    
    lazy var hyphenationFactorState: State<Float> = .init(wrappedValue: hyphenationFactor)
    private var isListeningHyphenationFactor = false
    
    @discardableResult
    public func hyphenationFactor(_ v: Float) -> Self {
        hyphenationFactor = v
        if !isListeningHyphenationFactor {
            isListeningHyphenationFactor = true
            hyphenationFactorState.listen {
                self.hyphenationFactor($0)
            }
        }
        return self
    }
    
    @discardableResult
    public func hyphenationFactor(_ state: State<Float>) -> Self {
        hyphenationFactorState.merge(with: state)
        return hyphenationFactor(state.wrappedValue)
    }
    
    @discardableResult
    public func hyphenationFactor<V>(_ expressable: ExpressableState<V, Float>) -> Self {
        hyphenationFactor(expressable.unwrap())
    }
    
    #if os(macOS)
    // MARK: Tightening Factor For Truncation
    
    public override var tighteningFactorForTruncation: Float {
        get { super.tighteningFactorForTruncation }
        set {
            super.tighteningFactorForTruncation = newValue
            _updateHandler()
        }
    }
    
    lazy var tighteningFactorForTruncationState: State<Float> = .init(wrappedValue: tighteningFactorForTruncation)
    private var isListeningTighteningFactorForTruncation = false
    
    @discardableResult
    public func tighteningFactorForTruncation(_ v: Float) -> Self {
        tighteningFactorForTruncation = v
        if !isListeningTighteningFactorForTruncation {
            isListeningTighteningFactorForTruncation = true
            tighteningFactorForTruncationState.listen {
                self.tighteningFactorForTruncation($0)
            }
        }
        return self
    }
    
    @discardableResult
    public func tighteningFactorForTruncation(_ state: State<Float>) -> Self {
        tighteningFactorForTruncationState.merge(with: state)
        return tighteningFactorForTruncation(state.wrappedValue)
    }
    
    @discardableResult
    public func tighteningFactorForTruncation<V>(_ expressable: ExpressableState<V, Float>) -> Self {
        tighteningFactorForTruncation(expressable.unwrap())
    }
    
    // MARK: Header Level
    
    public override var headerLevel: Int {
        get { super.headerLevel }
        set {
            super.headerLevel = newValue
            _updateHandler()
        }
    }
    
    lazy var headerLevelState: State<Int> = .init(wrappedValue: headerLevel)
    private var isListeningHeaderLevel = false
    
    @discardableResult
    public func headerLevel(_ v: Int) -> Self {
        headerLevel = v
        if !isListeningHeaderLevel {
            isListeningHeaderLevel = true
            headerLevelState.listen {
                self.headerLevel($0)
            }
        }
        return self
    }
    
    @discardableResult
    public func headerLevel(_ state: State<Int>) -> Self {
        headerLevelState.merge(with: state)
        return headerLevel(state.wrappedValue)
    }
    
    @discardableResult
    public func headerLevel<V>(_ expressable: ExpressableState<V, Int>) -> Self {
        headerLevel(expressable.unwrap())
    }
    
    // MARK: Allows Default Tightening For Truncation
    
    public override var allowsDefaultTighteningForTruncation: Bool {
        get { super.allowsDefaultTighteningForTruncation }
        set {
            super.allowsDefaultTighteningForTruncation = newValue
            _updateHandler()
        }
    }
    
    lazy var allowsDefaultTighteningForTruncationState: State<Bool> = .init(wrappedValue: allowsDefaultTighteningForTruncation)
    private var isListeningAllowsDefaultTighteningForTruncation = false
    
    @discardableResult
    public func allowsDefaultTighteningForTruncation(_ v: Bool = true) -> Self {
        allowsDefaultTighteningForTruncation = v
        if !isListeningAllowsDefaultTighteningForTruncation {
            isListeningAllowsDefaultTighteningForTruncation = true
            allowsDefaultTighteningForTruncationState.listen {
                self.allowsDefaultTighteningForTruncation($0)
            }
        }
        return self
    }
    
    @discardableResult
    public func allowsDefaultTighteningForTruncation(_ state: State<Bool>) -> Self {
        allowsDefaultTighteningForTruncationState.merge(with: state)
        return allowsDefaultTighteningForTruncation(state.wrappedValue)
    }
    
    @discardableResult
    public func allowsDefaultTighteningForTruncation<V>(_ expressable: ExpressableState<V, Bool>) -> Self {
        allowsDefaultTighteningForTruncation(expressable.unwrap())
    }
    #endif
    
    // MARK: Alignment
    
    public override var alignment: NSTextAlignment {
        get { super.alignment }
        set {
            super.alignment = newValue
            _updateHandler()
        }
    }
    
    lazy var alignmentState: State<NSTextAlignment> = .init(wrappedValue: alignment)
    private var isListeningAlignment = false
    
    @discardableResult
    public func alignment(_ v: NSTextAlignment) -> Self {
        alignment = v
        if !isListeningAlignment {
            isListeningAlignment = true
            alignmentState.listen {
                self.alignment($0)
            }
        }
        return self
    }
    
    @discardableResult
    public func alignment(_ state: State<NSTextAlignment>) -> Self {
        alignmentState.merge(with: state)
        return alignment(state.wrappedValue)
    }
    
    @discardableResult
    public func alignment<V>(_ expressable: ExpressableState<V, NSTextAlignment>) -> Self {
        alignment(expressable.unwrap())
    }
    
    // MARK: Line Break Mode
    
    public override var lineBreakMode: NSLineBreakMode {
        get { super.lineBreakMode }
        set {
            super.lineBreakMode = newValue
            _updateHandler()
        }
    }
    
    lazy var lineBreakModeState: State<NSLineBreakMode> = .init(wrappedValue: lineBreakMode)
    private var isListeningLineBreakMode = false
    
    @discardableResult
    public func lineBreakMode(_ v: NSLineBreakMode) -> Self {
        lineBreakMode = v
        if !isListeningLineBreakMode {
            isListeningLineBreakMode = true
            lineBreakModeState.listen {
                self.lineBreakMode($0)
            }
        }
        return self
    }
    
    @discardableResult
    public func lineBreakMode(_ state: State<NSLineBreakMode>) -> Self {
        lineBreakModeState.merge(with: state)
        return lineBreakMode(state.wrappedValue)
    }
    
    @discardableResult
    public func lineBreakMode<V>(_ expressable: ExpressableState<V, NSLineBreakMode>) -> Self {
        lineBreakMode(expressable.unwrap())
    }
    
    // MARK: Base Writing Direction
    
    public override var baseWritingDirection: NSWritingDirection {
        get { super.baseWritingDirection }
        set {
            super.baseWritingDirection = newValue
            _updateHandler()
        }
    }
    
    lazy var baseWritingDirectionState: State<NSWritingDirection> = .init(wrappedValue: baseWritingDirection)
    private var isListeningBaseWritingDirection = false
    
    @discardableResult
    public func baseWritingDirection(_ v: NSWritingDirection) -> Self {
        baseWritingDirection = v
        if !isListeningBaseWritingDirection {
            isListeningBaseWritingDirection = true
            baseWritingDirectionState.listen {
                self.baseWritingDirection($0)
            }
        }
        return self
    }
    
    @discardableResult
    public func baseWritingDirection(_ state: State<NSWritingDirection>) -> Self {
        baseWritingDirectionState.merge(with: state)
        return baseWritingDirection(state.wrappedValue)
    }
    
    @discardableResult
    public func baseWritingDirection<V>(_ expressable: ExpressableState<V, NSWritingDirection>) -> Self {
        baseWritingDirection(expressable.unwrap())
    }
    
    // MARK: Tab Stops
    
    public override var tabStops: [NSTextTab]! {
        get { super.tabStops }
        set {
            super.tabStops = newValue
            _updateHandler()
        }
    }
    
    lazy var tabStopsState: State<[NSTextTab]> = .init(wrappedValue: tabStops)
    private var isListeningTabStops = false
    
    @discardableResult
    public func tabStops(_ v: [NSTextTab]) -> Self {
        tabStops = v
        if !isListeningTabStops {
            isListeningTabStops = true
            tabStopsState.listen {
                self.tabStops($0)
            }
        }
        return self
    }
    
    @discardableResult
    public func tabStops(_ state: State<[NSTextTab]>) -> Self {
        tabStopsState.merge(with: state)
        return tabStops(state.wrappedValue)
    }
    
    @discardableResult
    public func tabStops<V>(_ expressable: ExpressableState<V, [NSTextTab]>) -> Self {
        tabStops(expressable.unwrap())
    }
    
    #if os(macOS)
    // MARK: Text Blocks
    
    public override var textBlocks: [NSTextBlock] {
        get { super.textBlocks }
        set {
            super.textBlocks = newValue
            _updateHandler()
        }
    }
    
    lazy var textBlocksState: State<[NSTextBlock]> = .init(wrappedValue: textBlocks)
    private var isListeningTextBlocks = false
    
    @discardableResult
    public func textBlocks(_ v: [NSTextBlock]) -> Self {
        textBlocks = v
        if !isListeningTextBlocks {
            isListeningTextBlocks = true
            textBlocksState.listen {
                self.textBlocks($0)
            }
        }
        return self
    }
    
    @discardableResult
    public func textBlocks(_ state: State<[NSTextBlock]>) -> Self {
        textBlocksState.merge(with: state)
        return textBlocks(state.wrappedValue)
    }
    
    @discardableResult
    public func textBlocks<V>(_ expressable: ExpressableState<V, [NSTextBlock]>) -> Self {
        textBlocks(expressable.unwrap())
    }
    
    // MARK: Text Lists
    
    public override var textLists: [NSTextList] {
        get { super.textLists }
        set {
            super.textLists = newValue
            _updateHandler()
        }
    }
    
    lazy var textListsState: State<[NSTextList]> = .init(wrappedValue: textLists)
    private var isListeningTextLists = false
    
    @discardableResult
    public func textLists(_ v: [NSTextList]) -> Self {
        textLists = v
        if !isListeningTextLists {
            isListeningTextLists = true
            textListsState.listen {
                self.textLists($0)
            }
        }
        return self
    }
    
    @discardableResult
    public func textLists(_ state: State<[NSTextList]>) -> Self {
        textListsState.merge(with: state)
        return textLists(state.wrappedValue)
    }
    
    @discardableResult
    public func textLists<V>(_ expressable: ExpressableState<V, [NSTextList]>) -> Self {
        textLists(expressable.unwrap())
    }
    #endif
}
