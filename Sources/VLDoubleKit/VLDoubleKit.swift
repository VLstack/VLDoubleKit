import Foundation

public extension Double
{
 func formatted(decimals: Int = 2,
                allowInteger: Bool = false,
                suffix: String? = nil,
                separator: String? = nil,
                suffixPrefix: String = " ",
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

  if let suffix { return "\(value)\(suffixPrefix)\(suffix)" }

  return value
 }
}
