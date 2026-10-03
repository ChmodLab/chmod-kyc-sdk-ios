import UIKit
import ChmodKycKit

public enum ChmodKyc {

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
