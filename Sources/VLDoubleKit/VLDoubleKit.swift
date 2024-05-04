import Foundation

public extension Double
{
 func formatted(decimals: Int = 2,
                allowInteger: Bool = false,
                suffix: String? = nil,
                separator: String? = nil) -> String
 {
  let decimalSeparator: String = separator ?? Locale.current.decimalSeparator ?? "."
  let nbDecimals: Int
  if allowInteger && self.truncatingRemainder(dividingBy: 1) == 0
  {
   nbDecimals = 0
  }
  else
  {
   nbDecimals = max(0, decimals)
  }
  let value: String = String(format: "%.\(nbDecimals)f", self).replacingOccurrences(of: ".", with: decimalSeparator)

  if let suffix { return "\(value) \(suffix)" }

  return value
 }
}
