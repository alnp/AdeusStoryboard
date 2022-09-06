//
//  DicesView.swift
//  AdeusStoryboard
//
//  Created by Alessandra Pereira on 06/09/22.
//

import UIKit

class DicesView: UIView {

    // MARK: - Inicializar as views
    let backgroundView = UIImageView()
    let logoView = UIImageView()
    let dicesView = UIImageView()
    let playButton = UIButton(configuration: .filled())
    
    let logoContainer = UIView()
    let dicesContainer = UIView()
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
    
    private func setupViewsHierarchy() {
        // MARK: - Setup na hierarquia das views
        addSubview(backgroundView)
        addSubview(stackView)
        
        logoContainer.addSubview(logoView)
        dicesContainer.addSubview(dicesView)
        playButtonContainer.addSubview(playButton)
        
        stackView.addArrangedSubview(logoContainer)
        stackView.addArrangedSubview(dicesContainer)
        stackView.addArrangedSubview(playButtonContainer)
    }
    
    private func setupViewsAttributes() {
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
    }
    
    func setupConstraints() {
        // MARK: - Configuração das constraints de auto layout
        backgroundView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            backgroundView.topAnchor.constraint(equalTo: topAnchor),
            backgroundView.trailingAnchor.constraint(equalTo: trailingAnchor),
            backgroundView.leadingAnchor.constraint(equalTo: leadingAnchor),
            backgroundView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
        
        logoView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            logoView.topAnchor.constraint(equalTo: logoContainer.topAnchor, constant: 16),
            logoView.trailingAnchor.constraint(equalTo: logoContainer.trailingAnchor),
            logoView.leadingAnchor.constraint(equalTo: logoContainer.leadingAnchor),
            logoView.bottomAnchor.constraint(equalTo: logoContainer.bottomAnchor)
        ])
        
        dicesView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            dicesView.centerXAnchor.constraint(equalTo: dicesContainer.centerXAnchor),
            dicesView.centerYAnchor.constraint(equalTo: dicesContainer.centerYAnchor),
            dicesView.topAnchor.constraint(equalTo: dicesContainer.topAnchor),
            dicesView.bottomAnchor.constraint(equalTo: dicesContainer.bottomAnchor)
        ])
        
        playButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            playButton.centerXAnchor.constraint(equalTo: playButtonContainer.centerXAnchor),
            playButton.centerYAnchor.constraint(equalTo: playButtonContainer.centerYAnchor),
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
        print("tocou botão")
        delegate?.rollDices()
    }
    
    func configure(diceImage: UIImage) {
        dicesView.image = diceImage
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
