import Foundation

/// Appearance, localisation and capture options for the verification flow.
///
/// Every field has a default, so `ChmodKycConfiguration()` is a valid starting
/// point and you only set what you want to change.
public struct ChmodKycConfiguration: Equatable, Sendable {

    public var appearance: Appearance
    public var locale: Locale
    public var documentCapture: DocumentCapture
    public var showsWelcomeScreen: Bool
    public var showsResultScreen: Bool
    public var showsErrorDetail: Bool
    public var requiresLocationPermission: Bool

    public init(
        appearance: Appearance = Appearance(),
        locale: Locale = Locale(),
        documentCapture: DocumentCapture = DocumentCapture(),
        showsWelcomeScreen: Bool = Defaults.showsWelcomeScreen,
        showsResultScreen: Bool = Defaults.showsResultScreen,
        showsErrorDetail: Bool = Defaults.showsErrorDetail,
        requiresLocationPermission: Bool = Defaults.requiresLocationPermission
    ) {
        self.appearance = appearance
        self.locale = locale
        self.documentCapture = documentCapture
        self.showsWelcomeScreen = showsWelcomeScreen
        self.showsResultScreen = showsResultScreen
        self.showsErrorDetail = showsErrorDetail
        self.requiresLocationPermission = requiresLocationPermission
    }
}

extension ChmodKycConfiguration {

    public enum Theme: Equatable, Sendable {
        case system, light, dark
    }

    public enum CornerStyle: Equatable, Sendable {
        case none, extraSmall, small, medium, large, extraLarge, full
    }

    public enum Language: Equatable, Sendable {
        case device, en, es, pt, fr, it, de, ru
    }

    public enum DocumentDetectionMode: Equatable, Sendable {
        case auto, userSelect, userSelectStrict, autoAndHideDocumentOptions
    }

    public enum DocumentCaptureMode: Equatable, Sendable {
        case auto, manual
    }

    /// Hex colours (`"#RRGGBB"`). A `nil` field keeps the SDK default.
    public struct ThemeColors: Equatable, Sendable {
        public var primary: String?
        public var onPrimary: String?
        public var secondary: String?
        public var onSecondary: String?
        public var tertiary: String?
        public var onTertiary: String?
        public var background: String?
        public var onBackground: String?
        public var surface: String?
        public var onSurface: String?
        public var surfaceVariant: String?
        public var onSurfaceVariant: String?
        public var error: String?
        public var onError: String?
        public var outline: String?
        public var resultSuccessBackground: String?
        public var resultSuccessIcon: String?
        public var resultErrorBackground: String?
        public var resultErrorIcon: String?

        public init(
            primary: String? = nil,
            onPrimary: String? = nil,
            secondary: String? = nil,
            onSecondary: String? = nil,
            tertiary: String? = nil,
            onTertiary: String? = nil,
            background: String? = nil,
            onBackground: String? = nil,
            surface: String? = nil,
            onSurface: String? = nil,
            surfaceVariant: String? = nil,
            onSurfaceVariant: String? = nil,
            error: String? = nil,
            onError: String? = nil,
            outline: String? = nil,
            resultSuccessBackground: String? = nil,
            resultSuccessIcon: String? = nil,
            resultErrorBackground: String? = nil,
            resultErrorIcon: String? = nil
        ) {
            self.primary = primary
            self.onPrimary = onPrimary
            self.secondary = secondary
            self.onSecondary = onSecondary
            self.tertiary = tertiary
            self.onTertiary = onTertiary
            self.background = background
            self.onBackground = onBackground
            self.surface = surface
            self.onSurface = onSurface
            self.surfaceVariant = surfaceVariant
            self.onSurfaceVariant = onSurfaceVariant
            self.error = error
            self.onError = onError
            self.outline = outline
            self.resultSuccessBackground = resultSuccessBackground
            self.resultSuccessIcon = resultSuccessIcon
            self.resultErrorBackground = resultErrorBackground
            self.resultErrorIcon = resultErrorIcon
        }
    }

    public enum FontFamily: Equatable, Sendable {
        case `default`, sansSerif, serif, monospace, cursive
    }

    public struct Typography: Equatable, Sendable {
        public var fontFamily: FontFamily
        public var bodySize: Int
        public var titleSize: Int
        public var labelSize: Int

        public init(
            fontFamily: FontFamily = .default,
            bodySize: Int = Defaults.bodySize,
            titleSize: Int = Defaults.titleSize,
            labelSize: Int = Defaults.labelSize
        ) {
            self.fontFamily = fontFamily
            self.bodySize = bodySize
            self.titleSize = titleSize
            self.labelSize = labelSize
        }
    }

    public struct Appearance: Equatable, Sendable {
        public var theme: Theme
        public var corners: CornerStyle
        public var light: ThemeColors
        public var dark: ThemeColors
        public var typography: Typography

        public init(
            theme: Theme = Defaults.theme,
            corners: CornerStyle = Defaults.corners,
            light: ThemeColors = Defaults.lightColors,
            dark: ThemeColors = Defaults.darkColors,
            typography: Typography = Typography()
        ) {
            self.theme = theme
            self.corners = corners
            self.light = light
            self.dark = dark
            self.typography = typography
        }
    }

    /// Overrides a single translated string for one language.
    public struct Translation: Equatable, Sendable {
        public var language: Language
        public var key: String
        public var value: String

        public init(language: Language, key: String, value: String) {
            self.language = language
            self.key = key
            self.value = value
        }
    }

    public struct Locale: Equatable, Sendable {
        public var defaultLanguage: Language
        public var fallbackLanguage: Language
        public var allowsLanguageSelection: Bool
        public var translations: [Translation]

        public init(
            defaultLanguage: Language = Defaults.defaultLanguage,
            fallbackLanguage: Language = Defaults.fallbackLanguage,
            allowsLanguageSelection: Bool = Defaults.allowsLanguageSelection,
            translations: [Translation] = []
        ) {
            self.defaultLanguage = defaultLanguage
            self.fallbackLanguage = fallbackLanguage
            self.allowsLanguageSelection = allowsLanguageSelection
            self.translations = translations
        }
    }

    public struct DocumentCapture: Equatable, Sendable {
        public var detectionMode: DocumentDetectionMode
        public var captureMode: DocumentCaptureMode
        public var showsPhotoPreview: Bool
        public var maxRetakesOnFailure: Int

        public init(
            detectionMode: DocumentDetectionMode = Defaults.detectionMode,
            captureMode: DocumentCaptureMode = Defaults.captureMode,
            showsPhotoPreview: Bool = Defaults.showsPhotoPreview,
            maxRetakesOnFailure: Int = Defaults.maxRetakesOnFailure
        ) {
            self.detectionMode = detectionMode
            self.captureMode = captureMode
            self.showsPhotoPreview = showsPhotoPreview
            self.maxRetakesOnFailure = maxRetakesOnFailure
        }
    }
}
