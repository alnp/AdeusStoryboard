//
//  ViewController.swift
//  AdeusStoryboard
//
//  Created by Alessandra Pereira on 04/08/22.
//

import UIKit

class ViewController: UIViewController {
    
    let diceView = DiceView()
    
    // Inicialização do array de imagens para o dado
    let diceImages = [UIImage(named: "dice-1"),
                      UIImage(named: "dice-2"),
                      UIImage(named: "dice-3"),
                      UIImage(named: "dice-4"),
                      UIImage(named: "dice-5"),
                      UIImage(named: "dice-6")]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view = diceView
        diceView.delegate = self
    }
}

extension ViewController: DiceViewDelegate {
    func rollDices() {
        guard let randomImage = diceImages[Int.random(in: 0...diceImages.count-1)] else { return }
        diceView.configure(diceImage: randomImage)
        diceView.setupViewsHierarchy()
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
            ViewController().showPreview().previewDevice("iPhone 13")
            ViewController().showPreview().previewDevice("iPhone 13").previewInterfaceOrientation(.landscapeLeft)
        }
    }
}
#endif

