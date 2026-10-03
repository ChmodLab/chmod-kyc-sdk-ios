import UIKit

public extension ChmodKyc {

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
