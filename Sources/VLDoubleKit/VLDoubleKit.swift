import Foundation

public
extension Double
{
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
