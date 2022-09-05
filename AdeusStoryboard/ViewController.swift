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
        
        // MARK: - Inicializar as views
        let backgroundView = UIImageView()
        let logoView = UIImageView()
        let dicesView = UIImageView()
        let playButton = UIButton(configuration: .filled())
        
        let logoContainer = UIView()
        let dicesContainer = UIView()
        let playButtonContainer = UIView()
        
//        let stackView = UIStackView(arrangedSubviews: [logoContainer, dicesContainer, playButtonContainer])
        let stackView = UIStackView()
        
        // MARK: - Setup na hierarquia das views
        view.addSubview(backgroundView)
        view.addSubview(stackView)
        
        logoContainer.addSubview(logoView)
        dicesContainer.addSubview(dicesView)
        playButtonContainer.addSubview(playButton)
        
        stackView.addArrangedSubview(logoContainer)
        stackView.addArrangedSubview(dicesContainer)
        stackView.addArrangedSubview(playButtonContainer)
        
        // MARK: - Configuração dos atributos dessas views
        backgroundView.image = UIImage(named: "background")
        backgroundView.contentMode = .scaleAspectFill
        
        logoView.image = UIImage(named: "logo-jogada")
        logoView.contentMode = .scaleAspectFit
        
        dicesView.image = UIImage(named: "dice-1")
        dicesView.contentMode = .scaleAspectFit
        
        playButton.setTitle("Jogar!", for: .normal)
        playButton.setTitleColor(.label, for: .normal)
        playButton.tintColor = .systemOrange
        
        
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.spacing = 32
        
        // MARK: - Configuração das constraints de auto layout
        backgroundView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            backgroundView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.topAnchor),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            stackView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        logoView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            logoView.topAnchor.constraint(equalTo: logoContainer.topAnchor, constant: 16),
            logoView.trailingAnchor.constraint(equalTo: logoContainer.trailingAnchor),
            logoView.leadingAnchor.constraint(equalTo: logoContainer.leadingAnchor),
            logoView.bottomAnchor.constraint(equalTo: logoContainer.bottomAnchor)
        ])
        
        
        
        dicesView.translatesAutoresizingMaskIntoConstraints = false
        // MARK: - Outras configurações
        
        
        // Atribuição da view inicializada no começo da função.
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

