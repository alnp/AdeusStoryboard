//
//  DiceViewModel.swift
//  AdeusStoryboard
//
//  Created by Alessandra Pereira on 29/08/22.
//

import Foundation

final class DiceViewModel {
    
    weak var delegate: DiceViewModelDelegate?
    var model: Dice {
        didSet {
            delegate?.updateDiceView(to: model.value)
        }
    }
    
    init(model: Dice = Dice(value: Int.random(in: 1...6))) {
        self.model = model
    }
    
    func updateDiceValue() {
        let randomValue = Int.random(in: 1...6)
        model.value = randomValue
    }
}
