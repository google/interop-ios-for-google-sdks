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

/// Interface to interact with reCAPTCHA and retrieve a reCAPTCHA Client.
public enum RCIClientFactory {
    
    /// Builds a new reCAPTCHA Client for the given Site Key and timeout.
    ///
    /// The SDK currently supports one Site Key. Passing a different Site Key will
    /// throw an exception.
    ///
    /// At least a 10000 millisecond timeout is suggested to allow for slow
    /// networking, though in some cases longer timeouts may be necessary. The
    /// minimum allowable value is 5000 milliseconds.
    ///
    /// - Parameters:
    ///     - siteKey: reCAPTCHA Site Key for the app.
    ///     - timeout: Timeout for getClient in milliseconds.
    ///     - completion: Callback function to return the RecaptchaClient or an error.
    @available(*, deprecated, message: "Use fetchClient api instead")
    public static func getClient(withSiteKey siteKey: String, withTimeout timeout: Double, completion: @escaping (RCIClientProtocol?, Error?) -> Void){
        #if canImport(RecaptchaEnterprise)
            Recaptcha.getClient(withSiteKey: siteKey, withTimeout: timeout, completion: completion)
        #else
            completion(nil, RCIError.recaptchaEnterpriseNotImported)
        #endif
    }
    
    /// Builds a new reCAPTCHA Client for the given Site Key and timeout.
    ///
    /// The SDK currently supports one Site Key. Passing a different Site Key will
    /// throw an exception.
    ///
    /// This method will throw a timeout exception after 10 seconds.
    ///
    /// - Parameters:
    ///     - siteKey: reCAPTCHA Site Key for the app.
    ///     - completion: Callback function to return the RCIClientProtocol or an error.
    @available(*, deprecated, message: "Use fetchClient api instead")
    public static func getClient(withSiteKey siteKey: String, completion: @escaping (RCIClientProtocol?, Error?) -> Void){
        #if canImport(RecaptchaEnterprise)
            Recaptcha.getClient(withSiteKey: siteKey, completion: completion)
        #else
            completion(nil, RCIError.recaptchaEnterpriseNotImported)
        #endif
    }
    
    /// Builds a new reCAPTCHA Client for the given Site Key.
    ///
    /// The SDK accepts one Site Key. Passing a different Site Key will throw an exception.
    ///
    /// - Parameters:
    ///   - siteKey: reCAPTCHA Site Key for the app.
    ///   - completion: Callback function to return the RCIClientProtocol or an error.
    public static func fetchClient(withSiteKey siteKey: String, completion: @escaping (RCIClientProtocol?, Error?) -> Void){
        #if canImport(RecaptchaEnterprise)
            Recaptcha.fetchClient(withSiteKey: siteKey, completion: completion)
        #else
            completion(nil, RCIError.recaptchaEnterpriseNotImported)
        #endif
    }
    
    /// Builds a new reCAPTCHA Client for the given Site Key.
    ///
    /// The SDK accepts one Site Key. Passing a different Site Key will throw an exception.
    ///
    /// - Parameters:
    ///   - siteKey: reCAPTCHA Site Key for the app.
    /// - Returns: A RCIClientProtocol used to retrieve reCAPTCHA tokens.
    @available(iOS 13, *)
    public static func fetchClient(withSiteKey siteKey: String) async throws -> RCIClientProtocol {
        #if canImport(RecaptchaEnterprise)
            return try await Recaptcha.fetchClient(withSiteKey: siteKey)
        #else
            throw RCIError.recaptchaEnterpriseNotImported
        #endif
    }
}
