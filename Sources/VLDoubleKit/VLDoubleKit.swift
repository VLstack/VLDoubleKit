import Foundation

public
extension Double
{
 func formatted(decimals: Int = 2,
                handleInteger: Bool = true,
                suffix: String? = nil,
                separator: String? = nil) -> String
 {
  var value: String
  if handleInteger && self.truncatingRemainder(dividingBy: 1) == 0
  {
   value = String(format: "%.0f", self)
  }
  else
  {
   let decimalSeparator: String = separator ?? Locale.current.decimalSeparator ?? "."
   value = String(format: "%.\(decimals)f", self).replacingOccurrences(of: ".", with: decimalSeparator)
  }

  if let suffix
  {
   return "\(value) \(suffix)"
  }

  return value
 }

 @available(*, deprecated, renamed: "formatted(decimals:handleInteger:suffix:)")
 func kmFormatted(decimals: Int = 2,
                  handleInteger: Bool = true) -> String
 {
  var nb: Int = decimals
  
  if handleInteger && self.truncatingRemainder(dividingBy: 1) == 0
  {
   nb = 0
  }
  
  return String(format: "%.\(nb)f km", self)
 }
 
 @available(*, deprecated, renamed: "formatted(decimals:handleInteger:suffix:)")
 func percentFormatted(decimals: Int = 2,
                       handleInteger: Bool = true) -> String
 {
  var nb: Int = decimals
  
  if handleInteger && self.truncatingRemainder(dividingBy: 1) == 0
  {
   nb = 0
  }
  
  return String(format: "%.\(nb)f %", self)
 }
 
 @available(*, deprecated, renamed: "formatted(decimals:handleInteger:suffix:)")
 func kwFormatted(decimals: Int = 2,
                  handleInteger: Bool = true) -> String
 {
  var nb: Int = decimals
  
  if handleInteger && self.truncatingRemainder(dividingBy: 1) == 0
  {
   nb = 0
  }
    
  return String(format: "%.\(nb)f kW", self)
 }

}
