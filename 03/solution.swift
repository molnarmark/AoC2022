import Foundation

let data = try String(contentsOfFile: "input.txt", encoding: .utf8).components(separatedBy: "\n")
let alphabet = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"

extension Array {
    func chunked(into size: Int) -> [[Element]] {
        return stride(from: 0, to: count, by: size).map {
            Array(self[$0 ..< Swift.min($0 + size, count)])
        }
    }
}

func partOne() -> Int {
  var score = 0
  for line in data {
    let rucksack = line.map { String($0) }
    let compartmentSize = rucksack.count / 2
    let compartmentOne = rucksack[0...compartmentSize - 1]
    let compartmentTwo = rucksack[compartmentSize...]
    let uniqueValues = Array(Set(compartmentOne).intersection(Set(compartmentTwo)))
    score += uniqueValues.map { alphabet.firstIndex(of: Character($0))!.utf16Offset(in:alphabet) + 1 }[0]
  }

  return score
}

func partTwo() -> Int {
  var score = 0
  for lines in data.chunked(into: 3) {
    let group1 = lines[0].map { String($0) }
    let group2 = lines[1].map { String($0) }
    let group3 = lines[2].map { String($0) }

    let badge = [group1, group2, group3].reduce(Set(group1)) { (result, list)  in
        result.intersection(list)
    }
    score += badge.map { alphabet.firstIndex(of: Character($0))!.utf16Offset(in:alphabet) + 1 }[0]
  }

  return score
}

print(partOne())
print(partTwo())