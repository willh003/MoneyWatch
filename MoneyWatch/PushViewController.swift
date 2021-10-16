//
//  PushViewController.swift
//  MoneyWatch
//
//  Created by Will H on 10/5/21.
//

import UIKit

class PushViewController: UIViewController {
    
    weak var delegate: UpdateInfoDelegate? // Must be optional
    var placeHolderCompany: String?
    var placeHolderTicker: String?
    var placeHolderPrice: String?
    var placeHolderHL: String?
    var placeHolderDesc: String?
    var bgColor: UIColor?
    
    private var companyView = UITextView()
    private var tickerView = UITextView()
    private var priceView = UITextView()
    private var highLowView = UITextView()
    private var descriptionView = UITextView()
    private var inputTextView = UITextView()
    private var saveButton = UIButton()
    
    init(delegate: UpdateInfoDelegate?, placeHolderCompany: String, placeHolderTicker: String,
         placeHolderPrice: String, placeHolderHL: String, placeHolderDesc: String, bgColor: UIColor)
    {
        self.delegate = delegate
        self.placeHolderCompany = placeHolderCompany
        self.placeHolderTicker = placeHolderTicker
        self.placeHolderPrice = placeHolderPrice
        self.placeHolderHL = placeHolderHL
        self.placeHolderDesc = placeHolderDesc
        self.bgColor = bgColor
        super.init(nibName: nil, bundle: nil)
        
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = bgColor ?? salmonColor
        
        saveButton.translatesAutoresizingMaskIntoConstraints = false
        saveButton.setTitle("Save", for: .normal)
        saveButton.setTitleColor(.black, for: .normal)
        saveButton.backgroundColor = UIColor(red: 240/255, green: 240/255, blue: 240/255, alpha: 1)
        saveButton.layer.cornerRadius = 4
        saveButton.addTarget(self, action: #selector(saveViewController), for: .touchUpInside)
        view.addSubview(saveButton)
        
        companyView = setUpLayout(inputTextView: companyView, label: placeHolderCompany ?? "company")
        tickerView = setUpLayout(inputTextView: tickerView, label: placeHolderTicker ?? "TCKR")
        priceView = setUpLayout(inputTextView: priceView, label: placeHolderPrice ?? "50")
        highLowView = setUpLayout(inputTextView: highLowView, label: placeHolderHL ?? "60/40")
        descriptionView = setUpLayout(inputTextView: descriptionView, label: placeHolderDesc ?? "it's cool")
        view.addSubview(companyView)
        view.addSubview(tickerView)
        view.addSubview(priceView)
        view.addSubview(highLowView)
        view.addSubview(descriptionView)
        
        setUpPushConstraints()
    }
    
    @objc func saveViewController() {
        // Validate data (check if priceView text is an int, else display an alert)
        guard let price = Int(priceView.text) else {
            let alertView = UIAlertController(title: "Check your format!", message: "Price must be a number", preferredStyle: .alert)
            alertView.addAction(UIAlertAction(title: "I'll Fix It", style: .cancel, handler: nil))
            self.present(alertView, animated: true)
            return
        }
        
        // Send data back through delegate
        delegate?.updateInfo(newCompany: companyView.text ?? "company", newTicker: tickerView.text ?? "TCKR",
                             newPrice: priceView.text ?? "40", newHL: highLowView.text ?? "50/30", newDesc: descriptionView.text ?? "it's cool")
        navigationController?.popViewController(animated: true)
        
    }
    
    func setUpPushConstraints() {
        NSLayoutConstraint.activate([
            saveButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            saveButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            saveButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 249),
            saveButton.heightAnchor.constraint(equalToConstant: 28)
        ])
        
        NSLayoutConstraint.activate([
            companyView.topAnchor.constraint(equalTo: saveButton.bottomAnchor, constant: 20),
            companyView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            companyView.widthAnchor.constraint(equalToConstant: 341),
            companyView.bottomAnchor.constraint(equalTo: saveButton.bottomAnchor, constant: 70)
        ])
        
        NSLayoutConstraint.activate([
            tickerView.topAnchor.constraint(equalTo: companyView.bottomAnchor, constant: 20),
            tickerView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            tickerView.widthAnchor.constraint(equalToConstant: 300),
            tickerView.bottomAnchor.constraint(equalTo: companyView.bottomAnchor, constant: 100)
        ])
        
        NSLayoutConstraint.activate([
            priceView.topAnchor.constraint(equalTo: tickerView.bottomAnchor, constant: 20),
            priceView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            priceView.widthAnchor.constraint(equalToConstant: 341),
            priceView.bottomAnchor.constraint(equalTo: tickerView.bottomAnchor, constant: 100)
        ])
        
        NSLayoutConstraint.activate([
            highLowView.topAnchor.constraint(equalTo: priceView.bottomAnchor, constant: 20),
            highLowView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            highLowView.widthAnchor.constraint(equalToConstant: 341),
            highLowView.bottomAnchor.constraint(equalTo: priceView.bottomAnchor, constant: 100)
        ])
        NSLayoutConstraint.activate([
            descriptionView.topAnchor.constraint(equalTo: highLowView.bottomAnchor, constant: 20),
            descriptionView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            descriptionView.widthAnchor.constraint(equalToConstant: 341),
            descriptionView.bottomAnchor.constraint(equalTo: highLowView.bottomAnchor, constant: 200)
        ])

    }

    func setUpLayout(inputTextView: UITextView, label: String) -> UITextView {
        inputTextView.translatesAutoresizingMaskIntoConstraints = false
        inputTextView.text = label
        inputTextView.isEditable = true
        inputTextView.font = .systemFont(ofSize: 24)
        inputTextView.textAlignment = .center
        inputTextView.textColor = textColor
        inputTextView.backgroundColor = .white
        inputTextView.translatesAutoresizingMaskIntoConstraints = false
        inputTextView.clipsToBounds = true
        inputTextView.layer.cornerRadius = 20
        return inputTextView
    }
}

