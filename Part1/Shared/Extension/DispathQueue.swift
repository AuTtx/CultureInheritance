
import Foundation

extension DispatchQueue {
    static func asyncAfterOnMain(delay: Double = 0.3, execute: @escaping () -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + delay , execute: execute)
    }
}
