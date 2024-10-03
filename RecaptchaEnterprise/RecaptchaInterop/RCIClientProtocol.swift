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

/// Interface to interact with reCAPTCHA.
protocol RCIClientProtocol {
    
    /// Executes reCAPTCHA on a user action.
    ///
    /// It is suggested the usage of 10 seconds for the timeout. The minimum value
    /// is 5 seconds.
    ///
    /// - Parameters:
    ///     - action The user action to protect.
    ///     - timeout: Timeout for execute in milliseconds.
    ///     - completion: Callback function to return the execute result.
    func execute(_ action: RCIAction, withTimeout timeout: Double, completion: @escaping (String?, Error?) -> Void)
    
    /// Executes reCAPTCHA on a user action.
    ///
    /// This method will throw a timeout exception after 10 seconds.
    ///
    /// - Parameters:
    ///     - action The user action to protect.
    ///     - completion: Callback function to return the execute result.
    func execute(_ action: RCIAction, completion: @escaping (String?, Error?) -> Void)
    
    /// Executes reCAPTCHA on a user action.
    ///
    /// It is suggested the usage of 10 seconds for the timeout. The minimum value
    /// is 5 seconds.
    ///
    /// - Parameters:
    ///     - action The user action to protect.
    ///     - timeout: Timeout for execute in milliseconds.
    ///     - completion: Callback function to return the execute result.
    @available(iOS 13, *)
    func execute(_ action: RCIAction, withTimeout timeout:Double) async throws -> String
    
    /// Executes reCAPTCHA on a user action.
    ///
    /// This method will throw a timeout exception after 10 seconds.
    ///
    /// - Parameters:
    ///     - action The user action to protect.
    ///     - completion: Callback function to return the execute result.
    @available(iOS 13, *)
    func execute(_ action: RCIAction) async throws -> String
}

/// Errors throw by the Recaptcha Interop module
enum RCIError: Error {
    
    /// In case a method is called without the RecaptchaEnterprise library being imported.
    case recaptchaEnterpriseNotImported
}
