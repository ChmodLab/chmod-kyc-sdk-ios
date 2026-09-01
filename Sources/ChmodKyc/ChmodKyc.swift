import UIKit
import ChmodKycKit

/// Entry point for presenting the chmod KYC verification flow from UIKit.
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
/// `present(from:request:animated:onResult:)` is the same flow with a completion closure.
///
/// SwiftUI apps should use `View.chmodKycVerification(isPresented:request:onResult:)` instead.
public enum ChmodKyc {

    /// Presents the verification flow modally and dismisses it when it finishes.
    ///
    /// - Parameters:
    ///   - presenter: view controller the flow is presented from.
    ///   - request: token, endpoint and configuration for this run.
    ///   - animated: whether presentation and dismissal are animated.
    ///   - onResult: called on the main actor once the flow ends and the dismissal completes.
    @MainActor
    public static func present(
        from presenter: UIViewController,
        request: ChmodKycRequest,
        animated: Bool = true,
        onResult: @escaping @MainActor (ChmodKycResult) -> Void
    ) {
        var controller: UIViewController?
        controller = makeViewController(request: request) { result in
            guard let presenting = controller?.presentingViewController else {
                onResult(result)
                return
            }
            presenting.dismiss(animated: animated) { onResult(result) }
        }
        guard let controller else { return }
        presenter.present(controller, animated: animated)
    }

    @MainActor
    static func makeViewController(
        request: ChmodKycRequest,
        onResult: @escaping @MainActor (ChmodKycResult) -> Void
    ) -> UIViewController {
        let flow = ChmodKycKit.ChmodKyc.shared.createVerificationViewController(
            baseUrl: request.baseURL.absoluteString,
            sdkToken: request.sdkToken,
            sdkConfig: request.configuration.kotlinValue,
            onResult: { kotlinResult in
                let result = ChmodKycResult(kotlinResult)
                Task { @MainActor in onResult(result) }
            }
        )
        return PortraitHostController(content: flow)
    }
}
