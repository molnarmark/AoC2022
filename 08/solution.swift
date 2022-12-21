import Foundation

let data = try String(contentsOfFile: "input.txt", encoding: .utf8).split(separator: "\n")
let grid = data.map { Array($0) }
let outerVisible = grid[0].count * 2 + grid.count * 2 - 4

func calculateToEdgeLeft(row: Int, column: Int) -> [Int] {
  return Array(stride(from: column - 1, through: 0, by: -1)).map { Int(String(grid[row][$0]))! }
}

func calculateToEdgeRight(row: Int, column: Int) -> [Int] {
  return Array(stride(from: column + 1, through: grid.count - 1, by: 1)).map { Int(String(grid[row][$0]))! }
}

func calculateToEdgeTop(row: Int, column: Int) -> [Int] {
  return Array(stride(from: row - 1, through: 0, by: -1)).map { Int(String(grid[$0][column]))! }
}

func calculateToEdgeBottom(row: Int, column: Int) -> [Int] {
  return Array(stride(from: row + 1, through: grid.count - 1, by: 1)).map { Int(String(grid[$0][column]))! }
}


func partOne() -> Int {
  var answer = outerVisible

  for i in 1...grid.count - 2 {
    for j in 1...grid.count - 2 {
      let condition: (Int) -> Bool = { return $0 < Int(String(grid[i][j]))! }
      answer += [
        calculateToEdgeLeft(row: i, column: j).allSatisfy(condition),
        calculateToEdgeRight(row: i, column: j).allSatisfy(condition),
        calculateToEdgeTop(row: i, column: j).allSatisfy(condition),
        calculateToEdgeBottom(row: i, column: j).allSatisfy(condition)
      ].contains(true) ? 1 : 0
    }
  }

  return answer
}

print(partOne())