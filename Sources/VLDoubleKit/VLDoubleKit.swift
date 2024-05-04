import Foundation

public extension Double
{
 func formatted(decimals: Int = 2,
                suffix: String? = nil,
                separator: String? = nil) -> String
 {
  let decimalSeparator: String = separator ?? Locale.current.decimalSeparator ?? "."
  let nbDecimals: Int = max(0, decimals)
  let value: String = String(format: "%.\(nbDecimals)f", self).replacingOccurrences(of: ".", with: decimalSeparator)

  if let suffix { return "\(value) \(suffix)" }

  return value
 }

 @available(*, deprecated, message: "forceInteger parameter must be replaced by decimals: 0")
 func formatted(decimals: Int = 2,
                forceInteger: Bool,
                suffix: String? = nil,
                separator: String? = nil) -> String
 {
  if forceInteger
  {
   return self.formatted(decimals: 0, suffix: suffix, separator: separator)
  }

  return self.formatted(decimals: decimals, suffix: suffix, separator: separator)
 }
}
