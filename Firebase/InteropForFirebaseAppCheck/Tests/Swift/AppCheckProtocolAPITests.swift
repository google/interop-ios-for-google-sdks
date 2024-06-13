// Copyright 2024 Google LLC
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//      http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

// MARK: This file is used to evaluate the AppCheckProtocol API in Swift.

import Foundation

// MARK: Do not import `FirebaseAppCheck`, this file is for `FirebaseAppCheckInterop` only.

import FirebaseAppCheckInterop

final class AppCheckProtocolAPITests {
  let appCheck: AppCheckProtocol! = nil

  func usage() {
    let _: Void = appCheck.token(forcingRefresh: false, completion: { token, error in
      if let token: AppCheckTokenProtocol {
        let _: String = token.token
        let _: Date = token.expirationDate
      }
      if let error: Error {
        let _: String = error.localizedDescription
      }
    })

    let _: Void = appCheck.limitedUseToken { token, error in
      if let token: AppCheckTokenProtocol {
        let _: String = token.token
        let _: Date = token.expirationDate
      }
      if let error: Error {
        let _: String = error.localizedDescription
      }
    }
  }

  @available(iOS 13, macOS 10.15, macCatalyst 13, tvOS 13, *)
  func usage_async() async {
    do {
      let token: AppCheckTokenProtocol = try await appCheck.token(forcingRefresh: false)
      let _: String = token.token
      let _: Date = token.expirationDate
    } catch {
      let _: String = error.localizedDescription
    }
  }
}
