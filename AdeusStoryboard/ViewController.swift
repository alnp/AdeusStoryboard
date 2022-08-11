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
        
        // MARK: - Inicialização das subviews (componentes)
        // Inicialização dos componentes
        let backgroundView = UIImageView(image: UIImage(named: "background"))
        let logoView = UIImageView(image: UIImage(named: "logo-jogada"))
        let diceView = UIImageView(image: UIImage(named: "dice-1"))
        let playButton = UIButton(configuration: .filled())
        
        // Inicialização das views containers para uso na stack view
        let logoContainer = UIView()
        let diceContainer = UIView()
        let playButtonContainer = UIView()
        
        // Inicialização da stack view já com os containers adicionados
        let stackView = UIStackView(arrangedSubviews: [logoContainer, diceContainer, playButtonContainer])
        
        // MARK: - Setup na hierarquia das subviews
        // Adiciona a view do background e da stack view como subviews da view raiz
        view.addSubview(backgroundView)
        view.addSubview(stackView)
        
        // Adiciona os componentes aos seus respectivos containers (views)
        logoContainer.addSubview(logoView)
        diceContainer.addSubview(diceView)
        playButtonContainer.addSubview(playButton)
        
        // MARK: - Configuração dos atributos dos componentes
        // Configura a stack view conforme o figma ou necessário
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.spacing = 32
        
        // Configura o botão
        playButton.setTitle("Jogar!", for: .normal)
        playButton.setTitleColor(.systemBackground, for: .normal)
        playButton.tintColor = .systemOrange
        
        // Configura a forma de exibição das imagens
        backgroundView.contentMode = .scaleAspectFill
        logoView.contentMode = .scaleAspectFit
        diceView.contentMode = .scaleAspectFit
        
        // MARK: - Configuração das constraints de auto layout
        // Background
        backgroundView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            backgroundView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        // Stack view
        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            stackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
        
        // Logo
        logoView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            logoView.topAnchor.constraint(equalTo: logoContainer.topAnchor, constant: 16),
            logoView.trailingAnchor.constraint(equalTo: logoContainer.trailingAnchor),
            logoView.leadingAnchor.constraint(equalTo: logoContainer.leadingAnchor),
            logoView.bottomAnchor.constraint(equalTo: logoContainer.bottomAnchor)
        ])
        
        // Dado
        diceView.translatesAutoresizingMaskIntoConstraints = false
        diceView.setContentHuggingPriority(.defaultLow, for: .vertical)
        NSLayoutConstraint.activate([
            diceView.centerXAnchor.constraint(equalTo: diceContainer.centerXAnchor),
            diceView.centerYAnchor.constraint(equalTo: diceContainer.centerYAnchor),
            diceView.topAnchor.constraint(equalTo: diceContainer.topAnchor),
            diceView.bottomAnchor.constraint(equalTo: diceContainer.bottomAnchor)
        ])
        
        // Botão
        playButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            playButton.centerXAnchor.constraint(equalTo: playButtonContainer.centerXAnchor),
            playButton.centerYAnchor.constraint(equalTo: playButtonContainer.centerYAnchor),
            playButton.trailingAnchor.constraint(equalTo: playButtonContainer.trailingAnchor, constant: -16),
            playButton.leadingAnchor.constraint(equalTo: playButtonContainer.leadingAnchor, constant: 16),
            playButton.heightAnchor.constraint(equalToConstant: 60)
        ])
        
        // MARK: - Outras configurações
        // Adiciona target para ação de toque no botão
        playButton.addTarget(self, action: #selector(tappedButton), for: .touchUpInside)
        
        // MARK: - Finalização
        // Atribuição da view inicializada no começo da função, a qual inserimos todos os nossos componentes, como a view raiz do view controller
        self.view = view
    }
    
    // MARK: - Função que é chamada quando o botão é tocado
    @objc func tappedButton(sender: UIButton) {
        print("Botão foi pressionado")
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

