//
//  ViewCodeProtocol.swift
//  AdeusStoryboard
//
//  Created by Alessandra Pereira on 16/08/22.
//

import UIKit

protocol ViewCodeProtocol {
    func setupView()
    
    func setupViewsHierarchy()
    func setupViewsAttributes()
    func setupConstraints()
    func setupAdditionalConfiguration()
}

extension ViewCodeProtocol {
    func setupView() {
        setupViewsHierarchy()
        setupViewsAttributes()
        setupConstraints()
        setupAdditionalConfiguration()
    }
    
    func setupAditionalConfiguration() { }
}
