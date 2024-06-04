// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
public enum L10n {

  public enum Walkthrough {
    /// Hayalindeki forma bir an once kavusabilirsin
    public static let analiz = L10n.tr("Localizable", "Walkthrough.analiz")
    /// Analiz
    public static let analizTitle = L10n.tr("Localizable", "Walkthrough.analizTitle")
    /// Basla
    public static let baslaButton = L10n.tr("Localizable", "Walkthrough.baslaButton")
    /// Diyet arkadaslarin ile motivasyonunu yuksek tutabilirsin.
    public static let diyet = L10n.tr("Localizable", "Walkthrough.diyet")
    /// Diyet
    public static let diyetTitle = L10n.tr("Localizable", "Walkthrough.diyetTitle")
    /// Hello
    public static let hello = L10n.tr("Localizable", "Walkthrough.hello")
    /// Ilerle
    public static let ilerleButton = L10n.tr("Localizable", "Walkthrough.ilerleButton")
    /// Saglikli ve hizli bir sekilde kilo verebilirsin
    public static let saglikli = L10n.tr("Localizable", "Walkthrough.saglikli")
    /// Saglikli Yasam
    public static let saglikTitle = L10n.tr("Localizable", "Walkthrough.saglikTitle")
  }
}
// swiftlint:enable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:enable nesting type_body_length type_name vertical_whitespace_opening_braces

// MARK: - Implementation Details

extension L10n {
  private static func tr(_ table: String, _ key: String, _ args: CVarArg...) -> String {
    var format = BundleToken.bundle.localizedString(forKey: key, value: nil, table: table)
    if let value = Localize.shared.strings[key] {
        format = value
    }
    return String(format: format, locale: Locale.current, arguments: args)
  }
}

// swiftlint:disable convenience_type
private final class BundleToken {
  static let bundle: Bundle = {
    #if SWIFT_PACKAGE
    return Bundle.module
    #else
    return Bundle(for: BundleToken.self)
    #endif
  }()
}
// swiftlint:enable convenience_type
