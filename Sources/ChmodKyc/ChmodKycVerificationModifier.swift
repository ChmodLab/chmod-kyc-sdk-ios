import SwiftUI

public extension View {

    /// Presents the chmod KYC verification flow full screen while `isPresented` is `true`.
    ///
    /// ```swift
    /// .chmodKycVerification(isPresented: $isVerifying, request: request) { result in
    ///     switch result {
    ///     case .completed(let id): break
    ///     case .cancelled: break
    ///     case .failed(_, let code, let message): break
    ///     }
    /// }
    /// ```
    ///
    /// `isPresented` is set back to `false` before `onResult` runs, so the flow is
    /// already dismissing by the time you handle the outcome.
    func chmodKycVerification(
        isPresented: Binding<Bool>,
        request: ChmodKycRequest,
        onResult: @escaping @MainActor (ChmodKycResult) -> Void
    ) -> some View {
        let pending = Binding<ChmodKycRequest?>(
            get: { isPresented.wrappedValue ? request : nil },
            set: { value in if value == nil { isPresented.wrappedValue = false } }
        )
        return chmodKycVerification(request: pending, onResult: onResult)
    }

    /// Presents the chmod KYC verification flow full screen while `request` is non-`nil`.
    ///
    /// Mirrors `sheet(item:content:)`: set `request` to start the flow, and it is
    /// cleared for you when the flow ends.
    ///
    /// ```swift
    /// .chmodKycVerification(request: $pendingRequest) { result in
    ///     lastResult = result
    /// }
    /// ```
    func chmodKycVerification(
        request: Binding<ChmodKycRequest?>,
        onResult: @escaping @MainActor (ChmodKycResult) -> Void
    ) -> some View {
        background(
            ChmodKycPresenter(request: request, onResult: onResult)
                .frame(width: 0, height: 0)
                .accessibilityHidden(true)
        )
    }
}

private struct ChmodKycPresenter: UIViewControllerRepresentable {

    @Binding var request: ChmodKycRequest?
    let onResult: @MainActor (ChmodKycResult) -> Void

    func makeCoordinator() -> Coordinator { Coordinator() }

    func makeUIViewController(context: Context) -> UIViewController {
        UIViewController()
    }

    func updateUIViewController(_ anchor: UIViewController, context: Context) {
        let coordinator = context.coordinator
        coordinator.onResult = onResult

        guard let request, !coordinator.isPresenting else { return }
        coordinator.isPresenting = true

        DispatchQueue.main.async {
            ChmodKyc.present(from: anchor, request: request) { result in
                coordinator.isPresenting = false
                self.request = nil
                coordinator.onResult(result)
            }
        }
    }

    @MainActor
    final class Coordinator {
        var isPresenting = false
        var onResult: @MainActor (ChmodKycResult) -> Void = { _ in }
    }
}
