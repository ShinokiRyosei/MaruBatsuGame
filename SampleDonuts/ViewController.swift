//
//  ViewController.swift
//  SampleDonuts
//
//  Created by ShinokiRyosei on 2016/02/22.
//  Copyright © 2016年 ShinokiRyosei. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
   
    
    var board = Board()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let screenWIdth = UIScreen.mainScreen().bounds.size.width
        let screenHeight = UIScreen.mainScreen().bounds.size.height
        
        let boardSize = CGSizeMake(screenWIdth, screenHeight)
        let boardOrigin = CGPointMake(0, (screenHeight - boardSize.height)/2)
        
        let boardView = UIView()
        boardView.frame.origin = boardOrigin
        boardView.frame.size = boardSize
        boardView.backgroundColor = UIColor.greenColor()
        self.view.addSubview(boardView)
        
        let btnSize = boardSize.width/3
        
        for var y = 0; y < 3; y++ {
            for var x = 0; x < 3; x++ {
                let btn: UIButton = UIButton(frame: CGRectMake(btnSize * CGFloat(x), btnSize * CGFloat(y), btnSize,btnSize))
                btn.layer.borderWidth = 2.0
                btn.layer.borderColor = UIColor.blackColor().CGColor
                //                btn.backgroundColor = UIColor.redColor()
                btn.tag = y*3+x
                btn.addTarget(self, action: "onBtnClick:", forControlEvents: .TouchUpInside)
                boardView.addSubview(btn)
            }
        }
        
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func onBtnClick(btn: UIButton) {
        // 押されたマスに置けるかどうか
        if !board.canPut(btn.tag) {
            return
        }
        // ボタンのタイトルとしてプレイヤー番号(1または2)を設定
        btn.setTitle("\(board.currentPlayer())", forState: .Normal)
        // 置く
        board.put(btn.tag)
        // 勝利判定
        let winner = board.winner()
        if winner != .Blank {
            NSLog("\(winner)の勝利")
        }
    }
    
}

