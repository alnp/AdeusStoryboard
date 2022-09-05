//
//  ViewController.swift
//  AdeusStoryboard
//
//  Created by Alessandra Pereira on 04/08/22.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        view.backgroundColor = .blue
    }
    
    override func loadView() {
        // Inicialização da view que irá ser atribuída como view raiz do view controller
        let view = UIView()
        
        // MARK: - Inicialização dos componentes
        let backgroundView = UIImageView(image: UIImage(named: "background"))
        let logoView = UIImageView()
        let diceView = UIImageView()
        let playButton = UIButton(configuration: .filled())
        
        let logoContainer = UIView()
        let diceContainer = UIView()
        let playButtonContainer = UIView()
        
        //        let stackView = UIStackView(arrangedSubviews: [logoContainer, diceContainer, playButtonContainer])
        let stackView = UIStackView()
        
        // MARK: - Setup na hierarquia das views
        view.addSubview(backgroundView)
        view.addSubview(stackView)
        
        stackView.addArrangedSubview(logoContainer)
        stackView.addArrangedSubview(diceContainer)
        stackView.addArrangedSubview(playButtonContainer)
        
        logoContainer.addSubview(logoView)
        diceContainer.addSubview(diceView)
        playButtonContainer.addSubview(playButton)
        
        
        // MARK: - Configuração dos atributos dos componentes
        backgroundView.contentMode = .scaleAspectFill
        
        logoView.image = UIImage(named: "logo-jogada")
        diceView.image = UIImage(named: "dice-1")
        
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.spacing = 32
        
        
        // MARK: - Configuração das constraints de auto layout
        backgroundView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            backgroundView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 16),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        logoView.translatesAutoresizingMaskIntoConstraints = false
        
        diceView.translatesAutoresizingMaskIntoConstraints = false
        
        playButton.translatesAutoresizingMaskIntoConstraints = false
        
        
        
        // Atribuição da view inicializada no começo da função
        self.view = view
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

