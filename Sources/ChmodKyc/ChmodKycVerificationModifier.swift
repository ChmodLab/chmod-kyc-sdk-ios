import SwiftUI

public extension View {

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
