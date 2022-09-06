//
//  DicesView.swift
//  AdeusStoryboard
//
//  Created by Alessandra Pereira on 06/09/22.
//

import UIKit

class DicesView: UIView {
    // MARK: - Inicialização dos componentes
    let backgroundView = UIImageView(image: UIImage(named: "background"))
    let logoView = UIImageView()
    let diceView = UIImageView()
    let playButton = UIButton(configuration: .filled())
    
    let logoContainer = UIView()
    let diceContainer = UIView()
    let playButtonContainer = UIView()
    
    let stackView = UIStackView()
    
    weak var delegate: DicesViewDelegate?
    
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
    
    func setupViewsHierarchy() {
        // MARK: - Setup na hierarquia das views
        addSubview(backgroundView)
        addSubview(stackView)
        
        stackView.addArrangedSubview(logoContainer)
        stackView.addArrangedSubview(diceContainer)
        stackView.addArrangedSubview(playButtonContainer)
        
        logoContainer.addSubview(logoView)
        diceContainer.addSubview(diceView)
        playButtonContainer.addSubview(playButton)
    }
    
    func setupViewsAttributes() {
        // MARK: - Configuração dos atributos dos componentes
        backgroundView.contentMode = .scaleAspectFill
        
        logoView.image = UIImage(named: "logo-jogada")
        logoView.contentMode = .scaleAspectFit
        
        diceView.image = UIImage(named: "dice-1")
        diceView.contentMode = .scaleAspectFit
        
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.spacing = 32
        
        playButton.setTitle("Jogar!", for: .normal)
        playButton.setTitleColor(.label, for: .normal)
        playButton.tintColor = .systemOrange
    }
    
    fileprivate func setupConstraints() {
        // MARK: - Configuração das constraints de auto layout
        backgroundView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            backgroundView.topAnchor.constraint(equalTo: topAnchor),
            backgroundView.leadingAnchor.constraint(equalTo: leadingAnchor),
            backgroundView.trailingAnchor.constraint(equalTo: trailingAnchor),
            backgroundView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
        
        logoView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            logoView.centerYAnchor.constraint(equalTo: logoContainer.centerYAnchor),
            logoView.centerXAnchor.constraint(equalTo: logoContainer.centerXAnchor),
            logoView.trailingAnchor.constraint(equalTo: logoContainer.trailingAnchor),
            logoView.bottomAnchor.constraint(equalTo: logoContainer.bottomAnchor)
        ])
        
        diceView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            diceView.centerXAnchor.constraint(equalTo: diceContainer.centerXAnchor),
            diceView.centerYAnchor.constraint(equalTo: diceContainer.centerYAnchor),
            diceView.topAnchor.constraint(equalTo: diceContainer.topAnchor),
            diceView.bottomAnchor.constraint(equalTo: diceContainer.bottomAnchor)
        ])
        
        playButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            playButton.centerYAnchor.constraint(equalTo: playButtonContainer.centerYAnchor),
            playButton.centerXAnchor.constraint(equalTo: playButtonContainer.centerXAnchor),
            playButton.trailingAnchor.constraint(equalTo: playButtonContainer.trailingAnchor, constant: -16),
            playButton.leadingAnchor.constraint(equalTo: playButtonContainer.leadingAnchor, constant: 16),
            playButton.heightAnchor.constraint(equalToConstant: 60)
        ])
    }
    
    func setupAdditionalConfiguration() {
        // MARK: - Outras configurações
        playButton.addTarget(self, action: #selector(tappedButton), for: .touchUpInside)
    }
    
    @objc func tappedButton(sender: UIButton) {
        print("apertou o botão")
        delegate?.rollDices()
    }
    
    func configure(image: UIImage?){
        diceView.image = image
    }
}

// MARK: - Preview
#if DEBUG
import SwiftUI

@available(iOS 13, *)
struct View_Preview: PreviewProvider {
    static var previews: some View {
        Group {
            DicesView().showPreview().previewDevice("iPhone 13")
            DicesView().showPreview().previewDevice("iPhone 13").previewInterfaceOrientation(.landscapeLeft)
        }
    }
}
#endif
