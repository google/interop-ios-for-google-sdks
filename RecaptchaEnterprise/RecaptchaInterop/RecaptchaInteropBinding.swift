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

#if canImport(RecaptchaEnterprise)

  import RecaptchaEnterprise

  extension RCIAction {

    /// Creates a RecaptchaAction from the RCIAction instance.
    public func toRecaptchaAction() -> RecaptchaAction {
      return RecaptchaAction.custom(self.action)
    }
  }

  extension RecaptchaClient: RCIClientProtocol {

    @available(iOS 13, *)
    public func execute(_ action: RCIAction, withTimeout timeout: Double) async throws -> String {
      return try await self.execute(withAction: action.toRecaptchaAction(), withTimeout: timeout)
    }

    @available(iOS 13, *)
    public func execute(_ action: RCIAction) async throws -> String {
      return try await self.execute(withAction: action.toRecaptchaAction())
    }

    public func execute(
      _ action: RCIAction, withTimeout timeout: Double,
      completion: @escaping (String?, (any Error)?) -> Void
    ) {
      self.execute(
        withAction: action.toRecaptchaAction(), withTimeout: timeout, completion: completion)
    }

    public func execute(_ action: RCIAction, completion: @escaping (String?, (any Error)?) -> Void)
    {
      self.execute(withAction: action.toRecaptchaAction(), completion: completion)
    }
  }

#endif
