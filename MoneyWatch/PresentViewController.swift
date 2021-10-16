//
//  PresentViewController.swift
//  MoneyWatch
//
//  Created by Will H on 10/5/21.
//

import UIKit

class PresentViewController: UIViewController {

    weak var delegate: UpdateColorDelegate?
    
    private var saveButton = UIButton()
    private var salmonButton = UIButton(type: .custom)
    private var pinkButton = UIButton(type: .custom)
    private var yellowButton = UIButton(type: .custom)
    private var lightBlueButton = UIButton(type: .custom)
    private var darkBlueButton = UIButton(type: .custom)
    private var randomButton = UIButton(type: .custom)
    private var label = UILabel()
    private var textView = UITextView()
    private var newBackground: UIColor?
    private var placeHolderColor: UIColor
    
    let colors = [salmonColor, pinkColor, yellowColor, lightBlueColor, darkBlueColor]
    
    init(delegate: UpdateColorDelegate?, placeHolderColor: UIColor)
    {
        self.delegate = delegate
        self.placeHolderColor = placeHolderColor
        super.init(nibName: nil, bundle: nil)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white

        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Change Theme"
        label.font = UIFont.systemFont(ofSize: 24)
        label.textColor = textColor
        label.textAlignment = .center
        view.addSubview(label)

        saveButton.translatesAutoresizingMaskIntoConstraints = false
        saveButton.setTitle("Exit", for: .normal)
        saveButton.setTitleColor(.black, for: .normal)
        saveButton.backgroundColor = UIColor(red: 240/255, green: 240/255, blue: 240/255, alpha: 1)
        saveButton.layer.cornerRadius = 4
        saveButton.addTarget(self, action: #selector(dismissViewController), for: .touchUpInside)
        view.addSubview(saveButton)

        salmonButton = setUpLayout(inputButton: salmonButton, color: salmonColor)
        salmonButton.addTarget(self, action: #selector(salmonButtonPressed), for: .touchUpInside)
        view.addSubview(salmonButton)
        
        pinkButton = setUpLayout(inputButton: pinkButton, color: pinkColor)
        pinkButton.addTarget(self, action: #selector(pinkButtonPressed), for: .touchUpInside)
        view.addSubview(pinkButton)
        
        yellowButton = setUpLayout(inputButton: yellowButton, color: yellowColor)
        yellowButton.addTarget(self, action: #selector(yellowButtonPressed), for: .touchUpInside)
        view.addSubview(yellowButton)
        
        lightBlueButton = setUpLayout(inputButton: lightBlueButton, color: lightBlueColor)
        lightBlueButton.addTarget(self, action: #selector(lightBlueButtonPressed), for: .touchUpInside)
        view.addSubview(lightBlueButton)
        
        darkBlueButton = setUpLayout(inputButton: darkBlueButton, color: darkBlueColor)
        darkBlueButton.addTarget(self, action: #selector(darkBlueButtonPressed), for: .touchUpInside)
        view.addSubview(darkBlueButton)
        
        randomButton = setUpLayout(inputButton: randomButton, color: UIColor(white: 0.66, alpha: 1.0))
        randomButton.setTitle("?", for: .normal)
        randomButton.titleLabel?.font = UIFont(name: "arial", size:24)
        randomButton.addTarget(self, action: #selector(randomButtonPressed), for: .touchUpInside)
        view.addSubview(randomButton)
        
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.backgroundColor = .white
        textView.textColor = textColor
        textView.font = UIFont.systemFont(ofSize: 18)
        textView.text = "Tip: Use colors to label different types of assets!"
        textView.textAlignment = .center
        textView.isEditable = false
        view.addSubview(textView)

        setUpConstraints()
    }
    
    @objc func salmonButtonPressed() {
        delegate?.updateColor(newColor: salmonColor)
        dismiss(animated: true, completion: nil)
    }
    @objc func pinkButtonPressed() {
        delegate?.updateColor(newColor: pinkColor)
        dismiss(animated: true, completion: nil)
    }
    @objc func yellowButtonPressed() {
        delegate?.updateColor(newColor: yellowColor)
        dismiss(animated: true, completion: nil)
    }
    @objc func lightBlueButtonPressed() {
        delegate?.updateColor(newColor: lightBlueColor)
        dismiss(animated: true, completion: nil)
    }
    @objc func darkBlueButtonPressed() {
        delegate?.updateColor(newColor: darkBlueColor)
        dismiss(animated: true, completion: nil)
    }

    @objc func randomButtonPressed() {
        
        delegate?.updateColor(newColor: colors.randomElement() ?? placeHolderColor)
        dismiss(animated: true, completion: nil)
    }
    

    func setUpConstraints() {
        NSLayoutConstraint.activate([
            saveButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            saveButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            saveButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 249),
            saveButton.heightAnchor.constraint(equalToConstant: 28)
        ])
        
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: saveButton.bottomAnchor, constant: 10),
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.widthAnchor.constraint(equalToConstant: 400),
            label.bottomAnchor.constraint(equalTo: saveButton.bottomAnchor, constant: 70)
        ])
        
        NSLayoutConstraint.activate([
            salmonButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 25),
            salmonButton.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 12),
            salmonButton.heightAnchor.constraint(equalToConstant: 146),
            salmonButton.widthAnchor.constraint(equalToConstant: 146)
        ])
        
        NSLayoutConstraint.activate([
            pinkButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -25),
            pinkButton.topAnchor.constraint(equalTo: salmonButton.topAnchor),
            pinkButton.heightAnchor.constraint(equalToConstant: 146),
            pinkButton.widthAnchor.constraint(equalToConstant: 146)
        ])
        
        NSLayoutConstraint.activate([
            yellowButton.leadingAnchor.constraint(equalTo: salmonButton.leadingAnchor),
            yellowButton.topAnchor.constraint(equalTo: salmonButton.bottomAnchor, constant: 44),
            yellowButton.heightAnchor.constraint(equalToConstant: 146),
            yellowButton.widthAnchor.constraint(equalToConstant: 146)
        ])
        
        NSLayoutConstraint.activate([
            lightBlueButton.trailingAnchor.constraint(equalTo: pinkButton.trailingAnchor),
            lightBlueButton.topAnchor.constraint(equalTo: yellowButton.topAnchor),
            lightBlueButton.heightAnchor.constraint(equalToConstant: 146),
            lightBlueButton.widthAnchor.constraint(equalToConstant: 146)
        ])
            
        NSLayoutConstraint.activate([
            darkBlueButton.leadingAnchor.constraint(equalTo: yellowButton.leadingAnchor),
            darkBlueButton.topAnchor.constraint(equalTo: yellowButton.bottomAnchor, constant: 44),
            darkBlueButton.heightAnchor.constraint(equalToConstant: 146),
            darkBlueButton.widthAnchor.constraint(equalToConstant: 146)
        ])
        
        NSLayoutConstraint.activate([
            randomButton.trailingAnchor.constraint(equalTo: pinkButton.trailingAnchor),
            randomButton.topAnchor.constraint(equalTo: darkBlueButton.topAnchor),
            randomButton.heightAnchor.constraint(equalToConstant: 146),
            randomButton.widthAnchor.constraint(equalToConstant: 146)
        ])
        
        NSLayoutConstraint.activate([
            textView.topAnchor.constraint(equalTo: darkBlueButton.bottomAnchor, constant: 26),
            textView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            textView.widthAnchor.constraint(equalToConstant: 346),
            textView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 40)
        ])
    }

    func setUpLayout(inputButton: UIButton, color: UIColor) -> UIButton {
        inputButton.translatesAutoresizingMaskIntoConstraints = false
        inputButton.clipsToBounds = true
        inputButton.backgroundColor = color
        inputButton.layer.cornerRadius = 0.5 * inputButton.bounds.size.width
        return inputButton
    }
    
    @objc func dismissViewController() {
        dismiss(animated: true, completion: nil)
    }

}
