//
//  ViewController.swift
//  AdeusStoryboard
//
//  Created by Alessandra Pereira on 04/08/22.
//

import UIKit

class DiceViewController: UIViewController {
    
    let diceView = DiceView()
    var viewModel: DiceViewModel
    
    // Inicialização do array de imagens para o dado
    let diceImages = [UIImage(named: "dice-1"),
                      UIImage(named: "dice-2"),
                      UIImage(named: "dice-3"),
                      UIImage(named: "dice-4"),
                      UIImage(named: "dice-5"),
                      UIImage(named: "dice-6")]
    
    init(viewModel: DiceViewModel = DiceViewModel()) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view = diceView
        diceView.delegate = self
        viewModel.delegate = self
    }
    
}

extension DiceViewController: DiceViewDelegate {
    func rollDices() {
        viewModel.updateDiceValue()
    }
}

extension DiceViewController: DiceViewModelDelegate {
    func updateDiceView(to value: Int) {
        self.diceView.configure(diceImage: self.diceImages[value-1] ?? UIImage())
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
            DiceViewController().showPreview().previewDevice("iPhone 13")
            DiceViewController().showPreview().previewDevice("iPhone 13").previewInterfaceOrientation(.landscapeLeft)
        }
    }
}
#endif

