

import Combine

class ArManager{
    static let shared = ArManager()
    private init() { }
    
    var actionStream = PassthroughSubject<ArAction,Never>()
}
