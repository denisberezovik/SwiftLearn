//
//  ViewController.swift
//  SwiftLearning
//
//  Created by Григорий Зауличный on 15.07.21.
//

import UIKit

class ViewController: UIViewController {
    
    
    // MARK: - Properties
    var array = [String]()
    
    // MARK: - Subviews
    var inputTextField = UITextField()
    var outputLabel = UILabel()
    var applyButton = UIButton()
    var cancelButton = UIButton()
    
    // MARK: - Initializers
    
    deinit {
        print("Deinit")
    }
    
    // MARK: - Lifecycle
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    public override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    // MARK: -  Methods
    
    private func setup() {
        configureSubviews()
        buildHierarchy()
        layoutSubviews()
    }
    
    private func buildHierarchy() {
        view.addSubview(inputTextField)
        view.addSubview(outputLabel)
        view.addSubview(applyButton)
        view.addSubview(cancelButton)
    }
    
    private func configureSubviews() {
        applyButton.layer.cornerRadius = 10
        applyButton.backgroundColor = .systemPink
        applyButton.setTitle("Apply".uppercased(), for: .normal)
        applyButton.addTarget(self, action: #selector(applyButtonTapped), for: .touchUpInside)
        
        cancelButton.layer.cornerRadius = 10
        cancelButton.backgroundColor = .red
        cancelButton.setTitle("Cancel".uppercased(), for: .normal)
        cancelButton.addTarget(self, action: #selector(cancelButtonTapped), for: .touchUpInside)
        
        inputTextField.borderStyle = .roundedRect
        
        outputLabel.backgroundColor = .gray
        outputLabel.textColor = .white
        outputLabel.font = .systemFont(ofSize: 15)
        outputLabel.numberOfLines = 4
        outputLabel.layer.cornerRadius = 10
        outputLabel.clipsToBounds = true
        
    }
    
    private func layoutSubviews() {
        let safeArea = self.view.safeAreaLayoutGuide
        
        inputTextField.translatesAutoresizingMaskIntoConstraints = false
        inputTextField.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 100).isActive = true
        inputTextField.widthAnchor.constraint(equalTo: safeArea.widthAnchor, multiplier: 0.5).isActive = true
        inputTextField.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor).isActive = true
        
        applyButton.translatesAutoresizingMaskIntoConstraints = false
        applyButton.widthAnchor.constraint(equalTo: inputTextField.widthAnchor).isActive = true
        applyButton.centerYAnchor.constraint(equalTo: safeArea.centerYAnchor).isActive = true
        applyButton.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor).isActive = true
        applyButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        cancelButton.translatesAutoresizingMaskIntoConstraints = false
        cancelButton.widthAnchor.constraint(equalTo: inputTextField.widthAnchor).isActive = true
        cancelButton.centerYAnchor.constraint(equalTo: applyButton.centerYAnchor, constant: 40).isActive = true
        cancelButton.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor).isActive = true
        cancelButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        outputLabel.translatesAutoresizingMaskIntoConstraints = false
        outputLabel.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 20).isActive = true
        outputLabel.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -20).isActive = true
        outputLabel.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor, constant: -40).isActive = true
        outputLabel.heightAnchor.constraint(greaterThanOrEqualToConstant: 100).isActive = true
        
    }
    
    
    // MARK: - Handlers
    
    @objc private func applyButtonTapped() {
        /* написать функцию, которая по нажатию на кнопку "Apply":
         - добавляет текст из поля ввода в массив
         - выводит в лейбл все элементы массива
         - очищает поле ввода
         */
        outputLabel.text = "Denis ne ssi"
    }
    
    @objc private func cancelButtonTapped() {
        /* написать функцию, которая по нажатию на кнопку "Apply":
         - добавляет текст из поля ввода в массив
         - выводит в лейбл все элементы массива
         - очищает поле ввода
         */
        outputLabel.text = ""
    }
    
}


