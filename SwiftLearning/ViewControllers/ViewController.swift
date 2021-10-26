//
//  FirstViewController.swift
//  SwiftLearning
//
//  Created by Григорий Зауличный on 15.07.21.
//

import UIKit

class ViewController: UIViewController {
    
    
    // MARK: - Properties
    
    
    // MARK: - Subviews
    var outputLabel = UILabel()
    var applyButton = UIButton()
    var appSwitch = UISwitch()
    
    
    lazy var safeArea = view.safeAreaLayoutGuide
    
    
    // MARK: - Initializers
    
    deinit {
        print("Deinit ViewController")
    }
    
    // MARK: - Lifecycle
    
    public override func viewDidLoad() {
        
        super.viewDidLoad()
        setup()
        self.view.backgroundColor = #colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1)
    }
    
    
    public override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    // MARK: -  Methods
    
    private func setup() {
        buildHierarchy()
        configureSubviews()
        layoutSubviews()
    }
    
    func openSecondVC() {
        
        let secondVC = SecondViewController(colorIN: .systemPink, barTitle: "Back") { [weak self] text in
            guard let self = self else { return }
            
            self.outputLabel.text = text
            
            if text.count > 5 {
                self.appSwitch.setOn(true, animated: true)
            } else {
                self.appSwitch.setOn(false, animated: true)
            }
            
        }
        
        
        self.navigationController?.pushViewController(secondVC, animated: true)
        
    }
    
    private func buildHierarchy() {
        view.addSubview(outputLabel)
        view.addSubview(applyButton)
        view.addSubview(appSwitch)
    }
    
    
    private func configureSubviews() {
        applyButton.layer.cornerRadius = 10
        applyButton.backgroundColor = UIColor(hexString: "#5ac18e")
        applyButton.setTitle("Apply".uppercased(), for: .normal)
        applyButton.addTarget(self, action: #selector(applyButtonTapped), for: .touchUpInside)
        
        outputLabel.backgroundColor = UIColor(hexString: "#ffff66")
        outputLabel.textColor = .black
        outputLabel.font = .systemFont(ofSize: 15)
        outputLabel.numberOfLines = 4
        outputLabel.layer.cornerRadius = 10
        outputLabel.clipsToBounds = true
        
        appSwitch.frame = CGRect(x: 150, y: 150, width: 0, height: 0)
        
        
    }
    
    private func layoutSubviews() {
        
        applyButton.translatesAutoresizingMaskIntoConstraints = false
        applyButton.widthAnchor.constraint(equalTo: outputLabel.widthAnchor).isActive = true
        applyButton.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor).isActive = true
        applyButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
        applyButton.bottomAnchor.constraint(equalTo: outputLabel.topAnchor).isActive = true
        applyButton.bottomAnchor.constraint(equalTo: outputLabel.topAnchor, constant: -10).isActive = true
        
        outputLabel.translatesAutoresizingMaskIntoConstraints = false
        outputLabel.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 20).isActive = true
        outputLabel.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -20).isActive = true
        outputLabel.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor, constant: -10).isActive = true
        outputLabel.topAnchor.constraint(equalTo: safeArea.centerYAnchor, constant: 100).isActive = true
        
        appSwitch.translatesAutoresizingMaskIntoConstraints = false
        appSwitch.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor).isActive = true
        appSwitch.centerYAnchor.constraint(equalTo: safeArea.centerYAnchor, constant: -100).isActive = true
        
    }
    
    // MARK: - Handlers
    
    @objc private func applyButtonTapped() {
        
        openSecondVC()
        
    }
    

}

// MARK: -- SomeProtocol

extension ViewController: UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        let allowedCharacters = CharacterSet.decimalDigits
        let characterSet = CharacterSet(charactersIn: string)
        return allowedCharacters.isSuperset(of: characterSet)
    }
    
    
    
}



