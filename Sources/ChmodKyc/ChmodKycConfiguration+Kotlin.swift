import Foundation
import ChmodKycKit

extension ChmodKycConfiguration {

    var kotlinValue: SdkConfig {
        SdkConfig(
            appearance: appearance.kotlinValue,
            locale: locale.kotlinValue,
            documentCapture: documentCapture.kotlinValue,
            showWelcomeScreen: showsWelcomeScreen,
            showResultScreen: showsResultScreen,
            showErrorDetail: showsErrorDetail,
            locationPermission: locationPermission.kotlinValue
        )
    }
}

private extension ChmodKycConfiguration.LocationPermission {
    var kotlinValue: LocationPermissionMode {
        switch self {
        case .required: return .required
        case .optional: return .optional
        case .disabled: return .disabled
        }
    }
}

private extension ChmodKycConfiguration.LocationPermission {
    init(kotlinName: String) {
        switch kotlinName {
        case "OPTIONAL": self = .optional
        case "DISABLED": self = .disabled
        default: self = .required
        }
    }
}

private extension ChmodKycConfiguration.Theme {
    var kotlinValue: ThemeMode {
        switch self {
        case .system: return .system
        case .light: return .light
        case .dark: return .dark
        }
    }
}

private extension ChmodKycConfiguration.CornerStyle {
    var kotlinValue: ShapePreset {
        switch self {
        case .none: return .none
        case .extraSmall: return .extraSmall
        case .small: return .small
        case .medium: return .medium
        case .large: return .large
        case .extraLarge: return .extraLarge
        case .full: return .full
        }
    }
}

private extension ChmodKycConfiguration.Language {
    var kotlinValue: Language {
        switch self {
        case .device: return .device
        case .en: return .en
        case .es: return .es
        case .pt: return .pt
        case .fr: return .fr
        case .it: return .it
        case .de: return .de
        case .ru: return .ru
        }
    }
}

private extension ChmodKycConfiguration.DocumentDetectionMode {
    var kotlinValue: DocumentTypeDetectionMode {
        switch self {
        case .auto: return .auto_
        case .userSelect: return .userSelect
        case .userSelectStrict: return .userSelectStrict
        case .autoAndHideDocumentOptions: return .autoAndHideDocumentOptions
        }
    }
}

private extension ChmodKycConfiguration.DocumentCaptureMode {
    var kotlinValue: DocumentPhotoCaptureMode {
        switch self {
        case .auto: return .auto_
        case .manual: return .manual
        }
    }
}

private extension ChmodKycConfiguration.ThemeColors {
    var kotlinValue: SdkConfig.ThemeColors {
        SdkConfig.ThemeColors(
            primary: primary,
            onPrimary: onPrimary,
            background: background,
            surface: surface,
            secondary: secondary,
            onSecondary: onSecondary,
            tertiary: tertiary,
            onTertiary: onTertiary,
            onBackground: onBackground,
            onSurface: onSurface,
            onSurfaceVariant: onSurfaceVariant,
            surfaceVariant: surfaceVariant,
            error: error,
            onError: onError,
            outline: outline,
            resultSuccessBackground: resultSuccessBackground,
            resultSuccessIcon: resultSuccessIcon,
            resultErrorBackground: resultErrorBackground,
            resultErrorIcon: resultErrorIcon
        )
    }
}

private extension ChmodKycConfiguration.FontFamily {
    var kotlinValue: Ui_textFontFamily {
        switch self {
        case .default: return Ui_textFontFamily.companion.Default
        case .sansSerif: return Ui_textFontFamily.companion.SansSerif
        case .serif: return Ui_textFontFamily.companion.Serif
        case .monospace: return Ui_textFontFamily.companion.Monospace
        case .cursive: return Ui_textFontFamily.companion.Cursive
        }
    }
}

private extension ChmodKycConfiguration.Typography {
    var kotlinValue: SdkConfig.Typography {
        SdkConfig.Typography(
            fontFamily: fontFamily.kotlinValue,
            bodySize: Int32(bodySize),
            titleSize: Int32(titleSize),
            labelSize: Int32(labelSize)
        )
    }
}

private extension ChmodKycConfiguration.Appearance {
    var kotlinValue: SdkConfig.Appearance {
        SdkConfig.Appearance(
            theme: theme.kotlinValue,
            light: light.kotlinValue,
            dark: dark.kotlinValue,
            typography: typography.kotlinValue,
            shapes: SdkConfig.Shapes(preset: corners.kotlinValue)
        )
    }
}

private extension ChmodKycConfiguration.Translation {
    var kotlinValue: SdkConfig.Translation {
        SdkConfig.Translation(language: language.kotlinValue, key: key, value: value)
    }
}

private extension ChmodKycConfiguration.Locale {
    var kotlinValue: SdkConfig.Locale {
        SdkConfig.Locale(
            defaultLanguage: defaultLanguage.kotlinValue,
            fallbackLanguage: fallbackLanguage.kotlinValue,
            allowLanguageSelection: allowsLanguageSelection,
            texts: translations.map(\.kotlinValue)
        )
    }
}

private extension ChmodKycConfiguration.DocumentCapture {
    var kotlinValue: SdkConfig.DocumentCapture {
        SdkConfig.DocumentCapture(
            documentTypeDetectionMode: detectionMode.kotlinValue,
            documentPhotoCaptureMode: captureMode.kotlinValue,
            showPhotoPreview: showsPhotoPreview,
            maxPhotoRetakeOnFailed: Int32(maxRetakesOnFailure)
        )
    }
}

extension ChmodKycConfiguration {

    /// Values the SDK falls back to when you don't set a field.
    ///
    /// Read from the SDK itself, so they always match the Android defaults.
    /// Useful as a starting point: `ThemeColors(primary: "#FF0000", ...)` on top of
    /// `ChmodKycConfiguration.Defaults.lightColors`.
    public enum Defaults {

        private static var kotlin: SdkConfigDefaults { SdkConfigDefaults.shared }

        public static let theme = ChmodKycConfiguration.Theme(kotlinName: kotlin.theme.name)
        public static let corners = ChmodKycConfiguration.CornerStyle(kotlinName: kotlin.shapePreset.name)

        public static let bodySize = Int(kotlin.bodySize)
        public static let titleSize = Int(kotlin.titleSize)
        public static let labelSize = Int(kotlin.labelSize)

        public static let defaultLanguage = ChmodKycConfiguration.Language(kotlinName: kotlin.defaultLanguage.name)
        public static let fallbackLanguage = ChmodKycConfiguration.Language(kotlinName: kotlin.fallbackLanguage.name)
        public static let allowsLanguageSelection = kotlin.allowLanguageSelection

        public static let detectionMode = ChmodKycConfiguration.DocumentDetectionMode(
            kotlinName: kotlin.documentTypeDetectionMode.name
        )
        public static let captureMode = ChmodKycConfiguration.DocumentCaptureMode(
            kotlinName: kotlin.documentPhotoCaptureMode.name
        )
        public static let showsPhotoPreview = kotlin.showPhotoPreview
        public static let maxRetakesOnFailure = Int(kotlin.maxPhotoRetakeOnFailed)

        public static let showsWelcomeScreen = kotlin.showWelcomeScreen
        public static let showsResultScreen = kotlin.showResultScreen
        public static let showsErrorDetail = kotlin.showErrorDetail
        public static let locationPermission = ChmodKycConfiguration.LocationPermission(
            kotlinName: kotlin.locationPermission.name
        )

        public static let lightColors = ChmodKycConfiguration.ThemeColors(kotlin.lightColors)
        public static let darkColors = ChmodKycConfiguration.ThemeColors(kotlin.darkColors)
    }
}

private extension ChmodKycConfiguration.Theme {
    init(kotlinName: String) {
        switch kotlinName {
        case "LIGHT": self = .light
        case "DARK": self = .dark
        default: self = .system
        }
    }
}

private extension ChmodKycConfiguration.CornerStyle {
    init(kotlinName: String) {
        switch kotlinName {
        case "NONE": self = .none
        case "EXTRA_SMALL": self = .extraSmall
        case "MEDIUM": self = .medium
        case "LARGE": self = .large
        case "EXTRA_LARGE": self = .extraLarge
        case "FULL": self = .full
        default: self = .small
        }
    }
}

private extension ChmodKycConfiguration.Language {
    init(kotlinName: String) {
        switch kotlinName {
        case "en": self = .en
        case "es": self = .es
        case "pt": self = .pt
        case "fr": self = .fr
        case "it": self = .it
        case "de": self = .de
        case "ru": self = .ru
        default: self = .device
        }
    }
}

private extension ChmodKycConfiguration.DocumentDetectionMode {
    init(kotlinName: String) {
        switch kotlinName {
        case "USER_SELECT": self = .userSelect
        case "USER_SELECT_STRICT": self = .userSelectStrict
        case "AUTO_AND_HIDE_DOCUMENT_OPTIONS": self = .autoAndHideDocumentOptions
        default: self = .auto
        }
    }
}

private extension ChmodKycConfiguration.DocumentCaptureMode {
    init(kotlinName: String) {
        self = kotlinName == "MANUAL" ? .manual : .auto
    }
}

private extension ChmodKycConfiguration.ThemeColors {
    init(_ kotlin: SdkConfig.ThemeColors) {
        self.init(
            primary: kotlin.primary,
            onPrimary: kotlin.onPrimary,
            secondary: kotlin.secondary,
            onSecondary: kotlin.onSecondary,
            tertiary: kotlin.tertiary,
            onTertiary: kotlin.onTertiary,
            background: kotlin.background,
            onBackground: kotlin.onBackground,
            surface: kotlin.surface,
            onSurface: kotlin.onSurface,
            surfaceVariant: kotlin.surfaceVariant,
            onSurfaceVariant: kotlin.onSurfaceVariant,
            error: kotlin.error,
            onError: kotlin.onError,
            outline: kotlin.outline,
            resultSuccessBackground: kotlin.resultSuccessBackground,
            resultSuccessIcon: kotlin.resultSuccessIcon,
            resultErrorBackground: kotlin.resultErrorBackground,
            resultErrorIcon: kotlin.resultErrorIcon
        )
    }
}
