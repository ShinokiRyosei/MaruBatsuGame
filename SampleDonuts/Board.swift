//
//  Board.swift
//  SampleDonuts
//
//  Created by ShinokiRyosei on 2016/02/22.
//  Copyright © 2016年 ShinokiRyosei. All rights reserved.
//

import UIKit

class Board {
    enum Status {
        case Blank
        case First
        case Second
    }
    
    let lines = [
        [0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6],
        [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]
    ]
    
    var statuses = Array(count: 9, repeatedValue: Status.Blank)
    var turn = 0
    
    func currentPlayer() -> Status {
        if turn % 2 == 0 {
        return Status.First
    }else {
        return Status.Second
        }
    }
    
    func canPut(i: Int) -> Bool {
        if winner() != .Blank {
        return false
        }
        
        return (statuses[i] == .Blank)
    }
    
    func put(i: Int) {
        statuses[i] = currentPlayer()
        turn++
    }
    
    func winner() -> Status {
        for line in lines {
        let l0 = line[0], l1 = line[1], l2 = line[2]
        if statuses[l0] != .Blank && statuses[l0] == statuses[l1] && statuses[l1] == statuses[l2] {
            return statuses[l0]
        }
        }
        return .Blank
    }
}
