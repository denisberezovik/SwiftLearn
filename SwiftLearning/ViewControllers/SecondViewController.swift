//
//  SecondViewController.swift
//  SwiftLearning
//
//  Created by REEMOTTO on 21.10.21.
//

import UIKit

class SecondViewController: UIViewController {
    
    // MARK: - Properties
    
    var textChanged: ((String) -> Void)?
    var barTitle = ""
    var color: UIColor
    
    // MARK: - Subviews
    
    var inputTextField = UITextField ()
    var backButton = UIButton ()
    
    
    lazy var safeArea = view.safeAreaLayoutGuide
    
    // MARK: - Initializers
    
    init(colorIN: UIColor, barTitle: String, textChanged: ((String) -> Void)?) {
        self.textChanged = textChanged
        self.barTitle = barTitle
        self.color = colorIN

        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    deinit {
        print("Deinit")
    }
    
    // MARK: - Lifecycle
    
    public override func viewDidLoad() {
        
        super.viewDidLoad()
        setup()
        self.view.backgroundColor = color
        inputTextField.delegate = self
    }
    
    
    public override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    // MARK: -  Methods
    
    private func setup() {
        buildHierarchy()
        configureSubviews()
        layoutSubviews()
        setupBackButton()
    }
    
    private func buildHierarchy() {
        view.addSubview(inputTextField)
    }
    
    private func configureSubviews() {
        inputTextField.textColor = .white
        inputTextField.backgroundColor = .systemGray2
        
        
        
    }
    
    private func layoutSubviews() {
        
        inputTextField.translatesAutoresizingMaskIntoConstraints = false
        inputTextField.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 20).isActive = true
        inputTextField.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -20).isActive = true
        inputTextField.topAnchor.constraint(equalTo: safeArea.centerYAnchor, constant: -100).isActive = true
        inputTextField.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>,
                               with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func setupBackButton() {
        self.navigationItem.hidesBackButton = true
        let newBackButton = UIBarButtonItem(title: barTitle, style: .plain, target: self, action: #selector(back(sender:)))
        self.navigationItem.leftBarButtonItem = newBackButton
    }
    
    @objc func back(sender: UIBarButtonItem) {
        
        if let text = inputTextField.text {
            
            textChanged?(text)
            
        }
       
            _ = navigationController?.popViewController(animated: true)
        }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}

// MARK: - Protocol

extension SecondViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()
        return true
    }
}
