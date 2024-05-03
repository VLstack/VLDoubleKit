import Foundation

public extension Double
{
 func formatted(decimals: Int = 2,
                forceInteger: Bool = true,
                suffix: String? = nil,
                separator: String? = nil) -> String
 {
  var value: String
  if forceInteger && self.truncatingRemainder(dividingBy: 1) == 0
  {
   value = String(format: "%.0f", self)
  }
  else
  {
   let decimalSeparator: String = separator ?? Locale.current.decimalSeparator ?? "."
   value = String(format: "%.\(decimals)f", self).replacingOccurrences(of: ".", with: decimalSeparator)
  }

  if let suffix { return "\(value) \(suffix)" }

  return value
 }
}
