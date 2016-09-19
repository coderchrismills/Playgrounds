import Foundation
import AppKit

public enum TestResult {
    case Pass
    case Fail
    
    public var color: NSColor {
        switch self {
        case .Pass:
            return NSColor.green
        case .Fail:
            return NSColor.red
        }
    }
}

public func test(condition: Bool) -> NSColor {
    if(condition) {
        return TestResult.Pass.color
    }
    return TestResult.Fail.color
}
