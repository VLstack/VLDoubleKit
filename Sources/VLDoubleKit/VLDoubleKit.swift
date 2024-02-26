import Foundation

public
extension Double
{
 func formatted(decimals: Int = 2,
                handleInteger: Bool = true,
                suffix: String? = nil) -> String
 {
  var nb: Int = decimals
  
  if handleInteger && self.truncatingRemainder(dividingBy: 1) == 0
  {
   nb = 0
  }
  
  if let suffix
  {
   return String(format: "%.\(nb)f \(suffix)", self)
  }
  
  return String(format: "%.\(nb)f", self)
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
