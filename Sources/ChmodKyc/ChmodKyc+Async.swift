import UIKit

public extension ChmodKyc {

    /// Presents the verification flow and returns its outcome when it finishes.
    ///
    /// ```swift
    /// let result = await ChmodKyc.verify(from: self, request: request)
    /// switch result {
    /// case .completed(let id): break
    /// case .cancelled: break
    /// case .failed(_, let code, let message): break
    /// }
    /// ```
    ///
    /// A failed verification is returned as `.failed`, not thrown: it is an outcome of the
    /// flow rather than an error, so every case stays in a single exhaustive `switch`.
    ///
    /// Cancelling the surrounding task does not dismiss the flow, and the call does not
    /// resume until the user finishes it.
    ///
    /// SwiftUI apps should use `View.chmodKycVerification(request:onResult:)` instead.
    ///
    /// - Parameters:
    ///   - presenter: view controller the flow is presented from.
    ///   - request: token, endpoint and configuration for this run.
    ///   - animated: whether presentation and dismissal are animated.
    /// - Returns: the outcome of the flow, after the dismissal completes.
    @MainActor
    static func verify(
        from presenter: UIViewController,
        request: ChmodKycRequest,
        animated: Bool = true
    ) async -> ChmodKycResult {
        await withCheckedContinuation { continuation in
            var resumed = false
            present(from: presenter, request: request, animated: animated) { result in
                guard !resumed else { return }
                resumed = true
                continuation.resume(returning: result)
            }
        }
    }
}
