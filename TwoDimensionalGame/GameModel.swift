
import Foundation

enum GameDirection {
    case north, east, west, south
}

struct GameLocation {
    let x: Int
    let y: Int
    let allowedDirections: [GameDirection]
    var event: String?
}

struct GameRow {
    let locations: [GameLocation]
}

class GameModel {
    
    private var gameGrid = [GameRow]()
    
    private var currentRowIndex = 2          // start at (x: 0, y: 0)
    private var currentLocationIndex = 2
    
    private let minXYvalue = 0
    private let maxXYvalue = 4
    
    init() {
        self.gameGrid = createGameGrid()
    }
    
    func restart() {
        currentRowIndex = 2
        currentLocationIndex = 2
    }
    
    func currentLocation() -> GameLocation {
        let x = self.currentRowIndex
        let y = self.currentLocationIndex
        let directions = self.allowedDirectionsForCoordinate(x: x, y: y)
        let specialEvent = self.eventForCoordinate(x: x, y: y)
        // TODO: Implement this method to return the current location of the player
        return GameLocation(x: x, y: y, allowedDirections: directions, event: specialEvent) // this is a stub you need to replace
    }
    
    func move(direction: GameDirection) {
        // TODO: Implement this method to move the current location in a particular direction
        if direction == .east {
            if currentRowIndex < 4 {
                currentRowIndex = (currentRowIndex + 1)
            }
        }
        if direction == .west {
            if currentRowIndex > 0 {
                currentRowIndex = (currentRowIndex - 1)
            }
        }
        if direction == .north {
            if currentLocationIndex > 0 {
                currentLocationIndex = (currentLocationIndex - 1)
            }
        }
        if direction == .south {
            if currentLocationIndex < 4 {
                currentLocationIndex = (currentLocationIndex + 1)
            }
        }

    }
    
    // MARK: Helper methods for creating grid

    private func createGameGrid() -> [GameRow] {
        var gameGrid = [GameRow]()
        
        for yValue in minXYvalue...maxXYvalue {
            var locations = [GameLocation]()
            for xValue in minXYvalue...maxXYvalue {
                let directions = allowedDirectionsForCoordinate(x: xValue, y: yValue)
                let event = eventForCoordinate(x: xValue, y: yValue)
                let location = GameLocation(x: xValue, y: yValue, allowedDirections: directions, event: event)
                locations.append(location)
            }
            let gameRow = GameRow(locations: locations)
            gameGrid.append(gameRow)
        }
        
        return gameGrid
    }
    
    private func allowedDirectionsForCoordinate(x: Int, y: Int) -> [GameDirection] {
        var directions = [GameDirection]()
        
        switch y {
        case minXYvalue:    directions += [.south]
        case maxXYvalue:    directions += [.north]
        default:            directions += [.north, .south]
        }
        
        switch x {
        case minXYvalue:    directions += [.east]
        case maxXYvalue:    directions += [.west]
        default:            directions += [.east, .west]
        }
        
        return directions
    }
    
    private func eventForCoordinate(x: Int, y: Int) -> String? {
        // TODO: Implement this method with whatever special events you want to return for a given location
        if x == 1 && y == 1 {
            return "\u{2620}\u{2620}\u{2620}\u{2620} PIRATES! \u{2620}\u{2620}\u{2620}\u{2620}"
        }
        if x == 3 && y == 3 {
            return "\u{1F427}\u{1F427}\u{1F427}\u{1F427} PENGUINS! \u{1F427}\u{1F427}\u{1F427}\u{1F427}"
        }
        
        return nil
    }

    
}
