//
//  DiceView.swift
//  AdeusStoryboard
//
//  Created by Alessandra Pereira on 15/08/22.
//

import UIKit

class DiceView: UIView {
    
    // MARK: - Inicialização das subviews (componentes)
    // Inicialização dos componentes
    private let backgroundView = UIImageView()
    private let logoView = UIImageView()
    private let diceView = UIImageView()
    private let playButton = UIButton()
    
    // Inicialização das views containers para uso na stack view
    private let logoContainer = UIView()
    private let diceContainer = UIView()
    private let playButtonContainer = UIView()
    
    // Inicialização da stack view
    private let stackView = UIStackView()
    
    // Propriedade de delegate dessa tela
    weak var delegate: DiceViewDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViewsHierarchy()
        setupViewsAttributes()
        setupConstraints()
        setupAdditionalConfiguration()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViewsHierarchy() {
        // MARK: - Setup na hierarquia das subviews
        // Adiciona a view do background e da stack view como subviews da view raiz
        addSubview(backgroundView)
        addSubview(stackView)
        
        // Adiciona as views a stack view
        stackView.addArrangedSubview(logoContainer)
        stackView.addArrangedSubview(diceContainer)
        stackView.addArrangedSubview(playButtonContainer)
        
        // Adiciona os componentes aos seus respectivos containers (views)
        logoContainer.addSubview(logoView)
        diceContainer.addSubview(diceView)
        playButtonContainer.addSubview(playButton)
    }
    
    private func setupViewsAttributes() {
        // MARK: - Configuração dos atributos dos componentes
        // Configura a stack view conforme o figma ou necessário
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.spacing = 32
        
        // Configura o botão
        playButton.configuration = .filled()
        playButton.setTitle("Jogar!", for: .normal)
        playButton.setTitleColor(.systemBackground, for: .normal)
        playButton.tintColor = .systemOrange
        
        // Configura a imagem e a forma de exibição das imagens:
        // Background
        backgroundView.image = UIImage(named: "background")
        backgroundView.contentMode = .scaleAspectFill
        // Logo
        logoView.image = UIImage(named: "logo-jogada")
        logoView.contentMode = .scaleAspectFit
        // Dado
        diceView.image = UIImage(named: "dice-1")
        diceView.contentMode = .scaleAspectFit
    }
    
    private func setupConstraints() {
        // MARK: - Configuração das constraints de auto layout
        // Background
        backgroundView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            backgroundView.topAnchor.constraint(equalTo: topAnchor),
            backgroundView.trailingAnchor.constraint(equalTo: trailingAnchor),
            backgroundView.leadingAnchor.constraint(equalTo: leadingAnchor),
            backgroundView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
        
        // Stack view
        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
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
    }
    
    private func setupAdditionalConfiguration() {
        // MARK: - Outras configurações
        // Adiciona target para ação de toque no botão
        playButton.addTarget(self, action: #selector(tappedButton), for: .touchUpInside)
    }
    
    // MARK: - Função que é chamada quando o botão é tocado
    @objc private func tappedButton(sender: UIButton) {
        delegate?.rollDices()
    }
    
    func configure(diceImage: UIImage) {
        diceView.image = diceImage
    }
}

// MARK: - Preview
#if DEBUG
import SwiftUI

@available(iOS 13, *)
struct View_Preview: PreviewProvider {
    static var previews: some View {
        Group {
            DiceView().showPreview().previewDevice("iPhone 13")
            DiceView().showPreview().previewDevice("iPhone 13").previewInterfaceOrientation(.landscapeLeft)
        }
    }
}
#endif

