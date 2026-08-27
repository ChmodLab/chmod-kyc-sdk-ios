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
        fullScreenCover(isPresented: isPresented) {
            ChmodKycFlowView(request: request) { result in
                isPresented.wrappedValue = false
                onResult(result)
            }
            .ignoresSafeArea()
        }
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
        let isPresented = Binding(
            get: { request.wrappedValue != nil },
            set: { presented in if !presented { request.wrappedValue = nil } }
        )
        return fullScreenCover(isPresented: isPresented) {
            if let value = request.wrappedValue {
                ChmodKycFlowView(request: value) { result in
                    request.wrappedValue = nil
                    onResult(result)
                }
                .ignoresSafeArea()
            }
        }
    }
}

struct ChmodKycFlowView: UIViewControllerRepresentable {

    let request: ChmodKycRequest
    let onResult: @MainActor (ChmodKycResult) -> Void

    func makeCoordinator() -> Coordinator {
        Coordinator(onResult: onResult)
    }

    func makeUIViewController(context: Context) -> UIViewController {
        let coordinator = context.coordinator
        return ChmodKyc.makeViewController(request: request) { result in
            coordinator.onResult(result)
        }
    }

    func updateUIViewController(_ controller: UIViewController, context: Context) {
        context.coordinator.onResult = onResult
    }

    final class Coordinator {
        var onResult: @MainActor (ChmodKycResult) -> Void

        init(onResult: @escaping @MainActor (ChmodKycResult) -> Void) {
            self.onResult = onResult
        }
    }
}
