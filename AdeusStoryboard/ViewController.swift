//
//  ViewController.swift
//  AdeusStoryboard
//
//  Created by Alessandra Pereira on 04/08/22.
//

import UIKit

class ViewController: UIViewController {
    
    let dicesView = DicesView()
    
    let diceImages = [UIImage(named: "dice-1"),
                      UIImage(named: "dice-2"),
                      UIImage(named: "dice-3"),
                      UIImage(named: "dice-4"),
                      UIImage(named: "dice-5"),
                      UIImage(named: "dice-6")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.view = dicesView
        dicesView.delegate = self
    }
    
}

extension ViewController: DicesViewDelegate {
    func rollDices() {
    let randomNumber = Int.random(in: 0...diceImages.count-1)
        dicesView.configure(diceImage: diceImages[randomNumber] ?? UIImage())
    }
}

// MARK: - Preview
#if DEBUG
import SwiftUI

@available(iOS 13, *)
struct ViewController_Preview: PreviewProvider {
    static var previews: some View {
        // view controller using programmatic UI
        Group {
            ViewController().showPreview().previewDevice("iPhone SE (3rd generation)")
            ViewController().showPreview().previewDevice("iPhone SE (3rd generation)").previewInterfaceOrientation(.landscapeLeft)
            
        }
    }
}
#endif

