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
    var arrayInt = [Int]()
    
    // MARK: - Subviews
    var outputLabel = UILabel()
    var applyButton = UIButton()
    var removeButton = UIButton()
    var oneTextField = UITextField()
    var twoTextField = UITextField()
    var threeTextField = UITextField()
    var fourTextField = UITextField()
    var stackView = UIStackView()
    
    lazy var safeArea = view.safeAreaLayoutGuide
    
    
    // MARK: - Initializers
    
    deinit {
        print("Deinit")
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
    
    
    func configureStackView() {
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 6
        
    }
    
    func setStackViewConstraints() {
        configureStackView()
        
        stackView.backgroundColor = #colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 20).isActive = true
        stackView.leadingAnchor.constraint(equalTo: outputLabel.leadingAnchor).isActive = true
        stackView.trailingAnchor.constraint(equalTo: outputLabel.trailingAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalTo: applyButton.topAnchor, constant: -10).isActive = true
        
    }
    
    private func setup() {
        buildHierarchy()
        setStackViewConstraints()
        configureSubviews()
        layoutSubviews()
    }
    
    private func buildHierarchy() {
        view.addSubview(stackView)
        
        stackView.addArrangedSubview(oneTextField)
        stackView.addArrangedSubview(twoTextField)
        stackView.addArrangedSubview(threeTextField)
        stackView.addArrangedSubview(fourTextField)
        
        view.addSubview(outputLabel)
        view.addSubview(applyButton)
        view.addSubview(removeButton)
    }
    
    func setupTextField(textField: UITextField, color: UIColor) {
        
        textField.delegate = self
        textField.borderStyle = .roundedRect
        textField.keyboardType = .numberPad
        textField.backgroundColor = color
        
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.widthAnchor.constraint(equalTo: stackView.widthAnchor).isActive = true
        
        oneTextField.addTarget(self, action: #selector(textChanged(_:)), for: .editingChanged)
        twoTextField.addTarget(self, action: #selector(textChanged(_:)), for: .editingChanged)
        threeTextField.addTarget(self, action: #selector(textChanged(_:)), for: .editingChanged)
        fourTextField.addTarget(self, action: #selector(textChanged(_:)), for: .editingChanged)
        
    }
    
    
    private func configureSubviews() {
        applyButton.layer.cornerRadius = 10
        applyButton.backgroundColor = UIColor(hexString: "#5ac18e")
        applyButton.setTitle("Apply".uppercased(), for: .normal)
        applyButton.addTarget(self, action: #selector(applyButtonTapped), for: .touchUpInside)
        applyButton.isHidden = true
        
        setupTextField(textField: oneTextField, color: UIColor(hexString: "#faebd7"))
        setupTextField(textField: twoTextField, color: UIColor(hexString: "#faebd7"))
        setupTextField(textField: threeTextField, color: UIColor(hexString: "#faebd7"))
        setupTextField(textField: fourTextField, color: UIColor(hexString: "#faebd7"))
        
        removeButton.layer.cornerRadius = 10
        removeButton.backgroundColor = UIColor(hexString: "#7fffd4")
        removeButton.setTitleColor(.black, for: .normal)
        removeButton.setTitle("Multiple".uppercased(), for: .normal)
        removeButton.addTarget(self, action: #selector(removeButtonTapped), for: .touchUpInside)
        
        outputLabel.backgroundColor = UIColor(hexString: "#ffff66")
        outputLabel.textColor = .black
        outputLabel.font = .systemFont(ofSize: 15)
        outputLabel.numberOfLines = 4
        outputLabel.layer.cornerRadius = 10
        outputLabel.clipsToBounds = true
        
    }
    
    private func layoutSubviews() {
        
        applyButton.translatesAutoresizingMaskIntoConstraints = false
        applyButton.widthAnchor.constraint(equalTo: outputLabel.widthAnchor).isActive = true
        applyButton.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor).isActive = true
        applyButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
        applyButton.bottomAnchor.constraint(equalTo: removeButton.topAnchor, constant: -10).isActive = true
        
        removeButton.translatesAutoresizingMaskIntoConstraints = false
        removeButton.widthAnchor.constraint(equalTo: outputLabel.widthAnchor).isActive = true
        removeButton.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor).isActive = true
        removeButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
        removeButton.bottomAnchor.constraint(equalTo: outputLabel.topAnchor, constant: -10).isActive = true
        
        outputLabel.translatesAutoresizingMaskIntoConstraints = false
        outputLabel.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 20).isActive = true
        outputLabel.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -20).isActive = true
        outputLabel.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor, constant: -10).isActive = true
        outputLabel.topAnchor.constraint(equalTo: safeArea.centerYAnchor, constant: 100).isActive = true
        
    }
    
    
    // MARK: - Handlers
    func appendInt(textField: UITextField) {
        if let text = textField.text {
            if let int = Int(text) {
                arrayInt.append(int) }
        }
        
        
    }
    
    func clearFields() {
        oneTextField.text = ""
        twoTextField.text = ""
        threeTextField.text = ""
        fourTextField.text = ""
    }
    
    @objc private func applyButtonTapped() {
        
        appendInt(textField: oneTextField)
        appendInt(textField: twoTextField)
        appendInt(textField: threeTextField)
        appendInt(textField: fourTextField)
        
        view?.endEditing(true)
        
        //        arrayInt = [Int(oneTextField.text ?? "0") ?? 0, Int(twoTextField.text ?? "0") ?? 0, Int(threeTextField.text ?? "0") ?? 0, Int(fourTextField.text ?? "0") ?? 0]
        //
        
        outputLabel.text = arrayInt.description
        
    }
    
    @objc private func removeButtonTapped() {
        
        arrayInt = arrayInt.map { num in
            num * 7
        }
       
        outputLabel.text = arrayInt.description
        clearFields()
        //print(arrayInt)
        
        //        let multiArray =
        
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



/* Задача 5
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
 
 
 outputLabel.text = "\(arrayInt)"*/


// MARK: -- SomeProtocol

extension ViewController: UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        let allowedCharacters = CharacterSet.decimalDigits
        let characterSet = CharacterSet(charactersIn: string)
        return allowedCharacters.isSuperset(of: characterSet)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.endEditing(true)
    }
    
    @objc func textChanged(_ textField: UITextField) {
        applyButton.isHidden = [oneTextField, twoTextField, threeTextField, fourTextField].contains { $0.text!.isEmpty }
    }
    
    
}
        


