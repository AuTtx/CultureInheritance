

import Foundation

public struct Completion: Decodable {
    /// The unique identifier for the completion.
    public let id: String
    
    public let choices: [Choice]
}

public struct Choice: Decodable {
    /// The text of the completion choice.
    public let text: String
}
