//
//  NationalizeView.swift
//  NationalizeApp
//
//  Created by Daniel Washington Ignacio on 19/04/24.
//

import UIKit

protocol NationalizeViewDelegate: AnyObject {
    func clickButtonToCallApi()
}

class NationalizeView: UIView {
    weak var delegate: NationalizeViewDelegate?
    
    var labelTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Predict the Nationality of a Name"
        label.font = UIFont(name: "Arial Rounded MT Bold", size: 36)
        label.textColor = UIColor(red: 0.27, green: 0.27, blue: 0.27, alpha: 1.00)
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    var textFieldName: UITextField = {
        let text = UITextField()
        text.translatesAutoresizingMaskIntoConstraints = false
        text.placeholder = "Last or full name"
        text.textAlignment = .center
        text.backgroundColor = .white
        text.layer.cornerRadius = 10
        return text
    }()
    
    var buttonCallApi: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = UIColor(red: 0.36, green: 0.74, blue: 0.45, alpha: 1.00)
        button.layer.cornerRadius = 15
        button.setImage(UIImage(systemName: "magnifyingglass"), for: .normal)
        button.tintColor = .white
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        return button
    }()
    
    var labelAnswer: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.font = UIFont(name: "Grantha Sangam MN Bold", size: 20)
        label.textAlignment = .center
        return label
    }()

    
    @objc func buttonAction(sender: UIButton!) {
        delegate?.clickButtonToCallApi()
    }
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupSubviews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupSubviews() {
        self.addSubview(labelTitle)
        self.addSubview(textFieldName)
        self.addSubview(buttonCallApi)
        self.addSubview(labelAnswer)
    }
    
    private func setupConstraints(){
        
        NSLayoutConstraint.activate([
            labelTitle.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            labelTitle.topAnchor.constraint(equalTo: self.topAnchor, constant: 120),
            labelTitle.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            labelTitle.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20)
        ])
        
        NSLayoutConstraint.activate([
            textFieldName.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: -30),
            textFieldName.topAnchor.constraint(equalTo: labelTitle.bottomAnchor, constant: 40),
            textFieldName.heightAnchor.constraint(equalToConstant: 40),
            textFieldName.widthAnchor.constraint(equalToConstant: 210)
        ])
        

        NSLayoutConstraint.activate([
            buttonCallApi.widthAnchor.constraint(equalToConstant: 40),
            buttonCallApi.heightAnchor.constraint(equalToConstant: 40),
            buttonCallApi.leadingAnchor.constraint(equalTo: textFieldName.trailingAnchor, constant: 10),
            buttonCallApi.topAnchor.constraint(equalTo: labelTitle.bottomAnchor, constant: 40)
        ])
        
        NSLayoutConstraint.activate([
            labelAnswer.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            labelAnswer.topAnchor.constraint(equalTo: buttonCallApi.bottomAnchor, constant: 40),
            labelAnswer.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            labelAnswer.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20)
        ])
    }
}
