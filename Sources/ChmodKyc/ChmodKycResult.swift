import Foundation
import ChmodKycKit

/// Reason a verification could not be completed.
public enum ChmodKycFailureCode: Hashable, Sendable {
    case documentScanMaxRetries
    case livenessError
    case cameraPermissionDenied
    case locationPermissionDenied
    case unknownError
    /// A code introduced by a newer SDK than this package knows about.
    case unrecognized(String)

    init(rawName: String) {
        switch rawName {
        case "DOCUMENT_SCAN_MAX_RETRIES": self = .documentScanMaxRetries
        case "LIVENESS_ERROR": self = .livenessError
        case "CAMERA_PERMISSION_DENIED": self = .cameraPermissionDenied
        case "LOCATION_PERMISSION_DENIED": self = .locationPermissionDenied
        case "UNKNOWN_ERROR": self = .unknownError
        default: self = .unrecognized(rawName)
        }
    }
}

/// Outcome of a verification flow.
public enum ChmodKycResult: Hashable, Sendable {
    case completed(transactionID: UUID?)
    case cancelled(transactionID: UUID?)
    case failed(transactionID: UUID?, code: ChmodKycFailureCode, message: String)

    /// Identifier of the transaction the flow ran against, when one was created.
    public var transactionID: UUID? {
        switch self {
        case let .completed(id), let .cancelled(id): return id
        case let .failed(id, _, _): return id
        }
    }
}

extension ChmodKycResult {

    init(_ result: any VerificationResult) {
        let transactionID = result.transactionId.flatMap { UUID(uuidString: $0.toHexDashString()) }

        switch result {
        case is VerificationResultCompleted:
            self = .completed(transactionID: transactionID)
        case is VerificationResultCancelled:
            self = .cancelled(transactionID: transactionID)
        default:
            self = .failed(
                transactionID: transactionID,
                code: ChmodKycFailureCode(rawName: result.code.name),
                message: result.message
            )
        }
    }
}
