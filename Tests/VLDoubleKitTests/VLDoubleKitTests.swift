import XCTest
@testable import VLDoubleKit

final class VLDoubleKitTests: XCTestCase 
{
 func testFormatted_parameters_default() throws
 {
  let separator: String = Locale.current.decimalSeparator ?? "."
  
  var value: Double = 25
  var expected: String = "25\(separator)00"
  var result: String = value.formatted()
  XCTAssert(result == expected, "\(result) is not equal to expected \(expected)")

  value = 25
  expected = "25\(separator)00"
  result = value.formatted()
  XCTAssert(result == expected, "\(result) is not equal to expected \(expected)")

  value = 25.501234
  expected = "25\(separator)50"
  result = value.formatted()
  XCTAssert(result == expected, "\(result) is not equal to expected \(expected)")

  value = 25.5
  expected = "25\(separator)50"
  result = value.formatted()
  XCTAssert(result == expected, "\(result) is not equal to expected \(expected)")
 }

 func testFormatted_parameter_decimals() throws
 {
  let separator: String = Locale.current.decimalSeparator ?? "."

  var value: Double = 25.501234
  var expected: String = "25\(separator)5"
  var result: String = value.formatted(decimals: 1)
  XCTAssert(result == expected, "\(result) is not equal to expected \(expected)")

  value = 25
  expected = "25"
  result = value.formatted(decimals: 0)
  XCTAssert(result == expected, "\(result) is not equal to expected \(expected)")

  value = 25.501234
  expected = "25\(separator)5012"
  result = value.formatted(decimals: 4)
  XCTAssert(result == expected, "\(result) is not equal to expected \(expected)")
 }
 
 func testFormatted_parameter_allowInteger() throws
 {
  let separator: String = Locale.current.decimalSeparator ?? "."

  var value: Double = 25
  var expected: String = "25"
  var result: String = value.formatted(allowInteger: true)
  XCTAssert(result == expected, "\(result) is not equal to expected \(expected)")

  value = 25.000
  expected = "25"
  result = value.formatted(allowInteger: true)
  XCTAssert(result == expected, "\(result) is not equal to expected \(expected)")

  value = 25.5
  expected = "25\(separator)50"
  result = value.formatted(allowInteger: true)
  XCTAssert(result == expected, "\(result) is not equal to expected \(expected)")
 }
 
 func testFormatted_parameter_suffix() throws
 {
  let separator: String = Locale.current.decimalSeparator ?? "."

  let value: Double = 25
  let expected: String = "25\(separator)00 €"
  let result: String = value.formatted(suffix: "€")
  XCTAssert(result == expected, "\(result) is not equal to expected \(expected)")
 }

 func testFormatted_parameter_separator() throws
 {
  let value: Double = 25
  let expected: String = "25--00"
  let result: String = value.formatted(separator: "--")
  XCTAssert(result == expected, "\(result) is not equal to expected \(expected)")
 }
}
