import Foundation

let data = try String(contentsOfFile: "input.txt", encoding: .utf8)

func partOne() -> Int {
  var answer = 0

  for i in 0...data.count {
    if Array(Set(data.suffix(data.count-i).prefix(4))).count == 4 {
      answer = i + 4
      break
    }
  }

  return answer
}

func partTwo() -> Int {
  var answer = 0

  for i in 0...data.count {
    if Array(Set(data.suffix(data.count-i).prefix(14))).count == 14 {
      answer = i + 14
      break
    }
  }

  return answer
}

print(partOne())
print(partTwo())