import Foundation

let data = try String(contentsOfFile: "input.txt", encoding: .utf8).components(separatedBy: "\n")

let pointSystem: [String: Int] = [
  "X": 1,
  "Y": 2,
  "Z": 3,
  "A": 1,
  "B": 2,
  "C": 3
]

enum Enemy: String {
  case rock = "A"
  case paper = "B"
  case scissors = "C"
}

enum Me: String {
  case rock = "X"
  case paper = "Y"
  case scissors = "Z"
}

func partOne() -> Int {
  var myScore = 0

  for line in data {
    let lineData = line.components(separatedBy: " ")
    let theirChoice = lineData[0]
    let myChoice = lineData[1]

    myScore += pointSystem[myChoice] ?? 0
    if ((theirChoice == "A" && myChoice == "X") || (theirChoice == "B" && myChoice == "Y") || (theirChoice == "C" && myChoice == "Z")) {
      myScore += 3
    } else if (theirChoice == Enemy.rock.rawValue && myChoice == Me.paper.rawValue) {
      myScore += 6
    } else if (theirChoice == Enemy.scissors.rawValue && myChoice == Me.rock.rawValue) {
      myScore += 6
    } else if (theirChoice == Enemy.paper.rawValue && myChoice == Me.scissors.rawValue) {
      myScore += 6
    }
  }

  return myScore
}

func partTwo() -> Int {
  var myScore = 0

  for line in data {
    let lineData = line.components(separatedBy: " ")
    let theirChoice = lineData[0]
    let myChoice = lineData[1]

    if (myChoice == "Y") {
      myScore += pointSystem[theirChoice]!
      myScore += 3
    } else if (myChoice == "X") {
      switch theirChoice {
        case Enemy.rock.rawValue:
          myScore += pointSystem[Me.scissors.rawValue]!
        case Enemy.paper.rawValue:
          myScore += pointSystem[Me.rock.rawValue]!
        case Enemy.scissors.rawValue:
          myScore += pointSystem[Me.paper.rawValue]!
        default:
          break
      }
    } else if (myChoice == "Z") {
      myScore += 6
      switch theirChoice {
        case Enemy.rock.rawValue:
          myScore += pointSystem[Me.paper.rawValue]!
        case Enemy.paper.rawValue:
          myScore += pointSystem[Me.scissors.rawValue]!
        case Enemy.scissors.rawValue:
          myScore += pointSystem[Me.rock.rawValue]!
        default:
          break
      }
    }
  }

  return myScore
}

print(partOne())
print(partTwo())