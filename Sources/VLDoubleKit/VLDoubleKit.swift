import Foundation

extension Double
{
 // MARK: - Public API
 /// Returns a formatted string representation of the double.
 ///
 /// - Parameters:
 ///   - decimals: Number of decimal places to display (default: 2).
 ///   - allowInteger: If true, suppresses decimals when the value is an integer (default: false).
 ///   - suffix: Optional string to append after the number (e.g. "kg", "%").
 ///   - separator: Decimal separator to use (default: locale's decimalSeparator or ".").
 ///   - stringBeforeSuffix: String to place between the number and suffix (default: " ").
 ///   - locale: Locale to use for the decimal separator (default: `.current`).
 /// - Returns: Formatted string representation of the double, with optional suffix.
 @inlinable
 public func formatted(decimals: Int = 2,
                       allowInteger: Bool = false,
                       suffix: String? = nil,
                       separator: String? = nil,
                       stringBeforeSuffix: String = " ",
                       locale: Locale = .current) -> String
 {
  let decimalSeparator: String = separator ?? locale.decimalSeparator ?? "."
  let isInteger: Bool = self.truncatingRemainder(dividingBy: 1) == 0
  let nbDecimals: Int = allowInteger && isInteger ? 0 : max(0, decimals)

  var value: String = String(format: "%.\(nbDecimals)f", self).replacingOccurrences(of: ".", with: decimalSeparator)
  
  if allowInteger && nbDecimals > 0
  {
   let unnecessaryZeros = "\(decimalSeparator)\(String(repeating: "0", count: nbDecimals))"
   if value.hasSuffix(unnecessaryZeros)
   {
    value = String(value.dropLast(unnecessaryZeros.count))
   }
  }

  if let suffix { return "\(value)\(stringBeforeSuffix)\(suffix)" }

  return value
 }

 // MARK: - Deprecated API
 @available(*, deprecated, renamed: "formatted(decimals:allowInteger:suffix:separator:stringBeforeSuffix:locale:)")
 public func formatted(decimals: Int,
                       allowInteger: Bool,
                       suffix: String?,
                       separator: String?,
                       suffixPrefix: String,
                       locale: Locale) -> String
 {
  self.formatted(decimals: decimals,
                 allowInteger: allowInteger,
                 suffix: suffix,
                 separator: separator,
                 stringBeforeSuffix: suffixPrefix,
                 locale: locale)
 }
}
