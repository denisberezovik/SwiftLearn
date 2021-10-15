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
    var arrayInt: [Int] = [1,2,3,4,5,6,7,8,9,10]
    
    // MARK: - Subviews
    var inputTextField = UITextField()
    var outputLabel = UILabel()
    var applyButton = UIButton()
    var removeButton = UIButton()
    
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
    
    func setupTextField(textField: UITextField) {
        textField.delegate = self
    }
    
    private func setup() {
        configureSubviews()
        buildHierarchy()
        layoutSubviews()
        setupTextField(textField: inputTextField)
    }
    
    private func buildHierarchy() {
        view.addSubview(inputTextField)
        view.addSubview(outputLabel)
        view.addSubview(applyButton)
        view.addSubview(removeButton)
    }
    
    private func configureSubviews() {
        applyButton.layer.cornerRadius = 10
        applyButton.backgroundColor = .systemPink
        applyButton.setTitle("Apply".uppercased(), for: .normal)
        applyButton.addTarget(self, action: #selector(applyButtonTapped), for: .touchUpInside)
        
        inputTextField.borderStyle = .roundedRect
        inputTextField.backgroundColor = .yellow
        inputTextField.keyboardType = .numberPad
        
        removeButton.layer.cornerRadius = 10
        removeButton.backgroundColor = .red
        removeButton.setTitleColor(.black, for: .normal)
        removeButton.setTitle("Remove".uppercased(), for: .normal)
        removeButton.addTarget(self, action: #selector(removeButtonTapped), for: .touchUpInside)
        
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
        
        removeButton.translatesAutoresizingMaskIntoConstraints = false
        removeButton.widthAnchor.constraint(equalTo: inputTextField.widthAnchor).isActive = true
        removeButton.centerYAnchor.constraint(equalTo: safeArea.centerYAnchor, constant: 50).isActive = true
        removeButton.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor).isActive = true
        removeButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        outputLabel.translatesAutoresizingMaskIntoConstraints = false
        outputLabel.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 20).isActive = true
        outputLabel.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -20).isActive = true
        outputLabel.topAnchor.constraint(equalTo: inputTextField.bottomAnchor, constant: 40).isActive = true
        outputLabel.heightAnchor.constraint(greaterThanOrEqualToConstant: 60).isActive = true
        
    }
    
    
    // MARK: - Handlers
    
    @objc private func applyButtonTapped() {
        
        arrayInt = [121,232,24231,13412,141324,1234231,13,4,6,7,8,4564,455]
        
        if arrayInt.count > 1 {
            
            removeButton.isHidden = false
            
        }
        
        /* Задача 1
        array.append(inputTextField.text ?? "empty")
        inputTextField.text = ""
        outputLabel.text = "\(array)"
        */
    
        /* Задача 2
        array.insert(inputTextField.text!, at:0)
        inputTextField.text = ""
        outputLabel.text = "\(array)"
        */
        
        /* Задача 3
        array.append(inputTextField.text ?? "empty")
        inputTextField.text = ""
        outputLabel.text = (array.randomElement()!)
         */
        
        /* Задача 4
         if let number = inputTextField.text {
            arrayInt.append(Int(number) ?? 0)
        }
        inputTextField.text = ""
        outputLabel.text = "\(arrayInt)"
         */
        
    }
    
    
    @objc private func removeButtonTapped() {
        
        let element = Int(inputTextField.text ?? "0")
        let lastElement = arrayInt.last
        
        if element ?? 0 > lastElement ?? 0 {
            arrayInt.removeLast()
        } else {
            arrayInt.removeFirst()
        }
        
        if arrayInt.count <= 1 {
            
            removeButton.isHidden = true
            
        }
        
        //button.isHidden = true
        
        
        outputLabel.text = "\(arrayInt)"
    }
    
}

extension ViewController: UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {

        let allowedCharacters = CharacterSet.decimalDigits
        let characterSet = CharacterSet(charactersIn: string)
        return allowedCharacters.isSuperset(of: characterSet)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.endEditing(true)
    }
    
}

