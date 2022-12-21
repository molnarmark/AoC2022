import Foundation

let data = try String(contentsOfFile: "input.txt", encoding: .utf8).components(separatedBy: "\n\n")
var results: [Int] = []

for elf in data {
  let totalCaloriesForElf = (elf.components(separatedBy: "\n").map { Int($0)! }).reduce(0, { $0 + $1 })
  results.append(totalCaloriesForElf)
}

results = results.sorted(by: { $0 > $1 })

// Part 1
print("Part 1 answer:", results[0])

// Part 2
print("Part 2 answer:", results[0...2].reduce(0, { $0 + $1 }))