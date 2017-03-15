//
//  ViewController.swift
//  EzChess
//
//  Created by techmaster on 3/15/17.
//  Copyright © 2017 techmaster. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITextFieldDelegate {
    var gameManager: GameManager! = nil
    
    @IBOutlet weak var txt_NumCell: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // init Controller gameManager
        gameManager = GameManager(self.view)
        
        txt_NumCell.delegate = self
        txt_NumCell.keyboardType = .numberPad
    }
    
    @IBAction func drawAction(_ sender: UIButton) {
        let numOfCell = Int(txt_NumCell.text!)!
        
        //Call Controller gameManager
        gameManager.draw(numOfCell)
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let invalidCharacters = CharacterSet(charactersIn: "0123456789").inverted
        return string.rangeOfCharacter(from: invalidCharacters, options: [], range: string.startIndex ..< string.endIndex) == nil
    }
}

