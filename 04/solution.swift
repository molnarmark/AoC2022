import Foundation

let data = try String(contentsOfFile: "input.txt", encoding: .utf8).components(separatedBy: "\n")

func partOne() -> Int {
  var answer = 0

  for line in data {
    let section1RawValues = line.components(separatedBy: ",")[0].components(separatedBy: "-").map { Int($0)! }
    let section2RawValues = line.components(separatedBy: ",")[1].components(separatedBy: "-").map { Int($0)! }
    let section1 = Set(section1RawValues[0]...section1RawValues[1])
    let section2 = Set(section2RawValues[0]...section2RawValues[1])

    if (section1.isSubset(of: section2) || section2.isSubset(of: section1)) {
      answer += 1
    }
  }

  return answer
}

func partTwo() -> Int {
  var pairs: [(Set<Int>, Set<Int>)] = []

  for line in data {
    let section1RawValues = line.components(separatedBy: ",")[0].components(separatedBy: "-").map { Int($0)! }
    let section2RawValues = line.components(separatedBy: ",")[1].components(separatedBy: "-").map { Int($0)! }
    let section1 = Set(section1RawValues[0]...section1RawValues[1])
    let section2 = Set(section2RawValues[0]...section2RawValues[1])
    pairs.append((section1, section2))
  }

  return pairs.map{ (set1, set2) in
    !(set1.intersection(set2).isEmpty || set2.intersection(set1).isEmpty)
  }.filter{ $0 }.count
}

print(partOne())
print(partTwo())