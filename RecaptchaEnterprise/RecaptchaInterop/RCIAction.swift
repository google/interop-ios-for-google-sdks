// Copyright 2024 Google LLC
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     https://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

import Foundation

/// Action intended to be protected by reCAPTCHA. This object should be passed when retrieving a token.
public struct RCIAction {
    
    /// A String representing the action.
    public let action: String
    
    /// Indicates that the protected action is a Login workflow.
    public static let login = RCIAction(action: "login")
    
    /// Indicates that the protected action is a Signup workflow.
    public static let signup = RCIAction(action: "signup")
    
    /// Creates a custom action from a String.
    public static func custom(withAction action: String) -> RCIAction {
        return RCIAction(action: action)
    }
}
