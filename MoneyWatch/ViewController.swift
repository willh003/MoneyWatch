//
//  ViewController.swift
//  MoneyWatch
//
//  Created by Will H on 10/5/21.
//


import UIKit

protocol UpdateColorDelegate: class {
    func updateColor(newColor: UIColor)
    
}

protocol UpdateInfoDelegate: class {
    func updateInfo(newCompany: String, newTicker: String, newPrice: String, newHL: String, newDesc: String)
    
}


let salmonColor = UIColor(red: 241/256, green: 140/256, blue: 142/256, alpha: 1)
let pinkColor = UIColor(red: 241/256, green: 183/256, blue: 164/256, alpha: 1)
let yellowColor = UIColor(red: 241/256, green: 209/256, blue: 181/256, alpha: 1)
let lightBlueColor = UIColor(red: 86/256, green: 142/256, blue: 166/256, alpha: 1)
let darkBlueColor = UIColor(red: 48/256, green: 95/256, blue: 114/256, alpha: 1)
let purpleColor = UIColor(red: 172/256, green: 128/256, blue: 160/256, alpha: 1)
let textColor = UIColor(red: 55/256, green: 55/256, blue: 55/256, alpha: 1)

class ViewController: UIViewController, UpdateInfoDelegate, UpdateColorDelegate {
    
    var backgroundColor: UIColor = salmonColor

    private var newBackgroundButton = UIButton()
    private var newTickerButton = UIButton()
    private var companyView = UITextView()
    private var tickerView = UITextView()
    private var priceView = UITextView()
    private var highLowView = UITextView()
    private var descriptionView = UITextView()
    private var linkButton = UIButton()

    private var company = "company"
    private var ticker = "TCKR"
    private var price = "30"
    private var highLow = "50/20"
    private var desc = "Description"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = backgroundColor

        title = "MoneyWatch"
        
        newBackgroundButton.translatesAutoresizingMaskIntoConstraints = false
        newBackgroundButton.setTitle("New Background", for: .normal)
        newBackgroundButton.setTitleColor(textColor, for: .normal)
        newBackgroundButton.backgroundColor = .white
        newBackgroundButton.titleLabel?.font = .systemFont(ofSize: 24)
        newBackgroundButton.layer.cornerRadius = 4
        newBackgroundButton.addTarget(self, action: #selector(presentViewControllerButtonPressed), for: .touchUpInside)
        view.addSubview(newBackgroundButton)
        
        
        newTickerButton.translatesAutoresizingMaskIntoConstraints = false
        newTickerButton.setTitle("New Ticker", for: .normal)
        newTickerButton.titleLabel?.font = .systemFont(ofSize: 24)
        newTickerButton.setTitleColor(textColor, for: .normal)
        newTickerButton.backgroundColor = .white
        newTickerButton.layer.cornerRadius = 4
        newTickerButton.addTarget(self, action: #selector(pushViewControllerButtonPressed), for: .touchUpInside)
        view.addSubview(newTickerButton)
        
        companyView = setUpLayout(inputTextView: companyView, label: company)
        tickerView = setUpLayout(inputTextView: tickerView, label: ticker)
        priceView = setUpLayout(inputTextView: priceView, label: price)
        highLowView = setUpLayout(inputTextView: highLowView, label: highLow)
        descriptionView = setUpLayout(inputTextView: descriptionView, label: desc)
        view.addSubview(companyView)
        view.addSubview(tickerView)
        view.addSubview(priceView)
        view.addSubview(highLowView)
        view.addSubview(descriptionView)
        
        linkButton.translatesAutoresizingMaskIntoConstraints = false
        linkButton.setTitle("Check Yahoo Finance", for: .normal)
        linkButton.titleLabel?.font = .systemFont(ofSize: 20)
        linkButton.setTitleColor(textColor, for: .normal)
        linkButton.backgroundColor = .white
        linkButton.layer.cornerRadius = 4
        linkButton.addTarget(self, action: #selector(linkButtonPressed), for: .touchUpInside)
        view.addSubview(linkButton)
        
        
        setUpMainConstraints()
    }
    
    func setUpMainConstraints() {
        NSLayoutConstraint.activate([
            newBackgroundButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            newBackgroundButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            newBackgroundButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -180),
            newBackgroundButton.heightAnchor.constraint(equalToConstant: 28)
        ])
        
        NSLayoutConstraint.activate([
            newTickerButton.topAnchor.constraint(equalTo: newBackgroundButton.topAnchor, constant: 0),
            newTickerButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            newTickerButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 249),
            newTickerButton.heightAnchor.constraint(equalToConstant: 28)
        ])

        NSLayoutConstraint.activate([
            companyView.topAnchor.constraint(equalTo: newTickerButton.bottomAnchor, constant: 20),
            companyView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            companyView.widthAnchor.constraint(equalToConstant: 341),
            companyView.bottomAnchor.constraint(equalTo: newTickerButton.bottomAnchor, constant: 80)
        ])
        
        NSLayoutConstraint.activate([
            tickerView.topAnchor.constraint(equalTo: companyView.bottomAnchor, constant: 20),
            tickerView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            tickerView.widthAnchor.constraint(equalToConstant: 341),
            tickerView.bottomAnchor.constraint(equalTo: companyView.bottomAnchor, constant: 80)
        ])
        
        NSLayoutConstraint.activate([
            priceView.topAnchor.constraint(equalTo: tickerView.bottomAnchor, constant: 20),
            priceView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            priceView.widthAnchor.constraint(equalToConstant: 341),
            priceView.bottomAnchor.constraint(equalTo: tickerView.bottomAnchor, constant: 80)
        ])
        
        NSLayoutConstraint.activate([
            highLowView.topAnchor.constraint(equalTo: priceView.bottomAnchor, constant: 20),
            highLowView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            highLowView.widthAnchor.constraint(equalToConstant: 341),
            highLowView.bottomAnchor.constraint(equalTo: priceView.bottomAnchor, constant: 80)
        ])
        NSLayoutConstraint.activate([
            descriptionView.topAnchor.constraint(equalTo: highLowView.bottomAnchor, constant: 20),
            descriptionView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            descriptionView.widthAnchor.constraint(equalToConstant: 341),
            descriptionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            descriptionView.topAnchor.constraint(equalTo: highLowView.bottomAnchor, constant: 20),
            descriptionView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            descriptionView.widthAnchor.constraint(equalToConstant: 341),
            descriptionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -60)
        ])
        
        NSLayoutConstraint.activate([
            linkButton.topAnchor.constraint(equalTo: descriptionView.bottomAnchor, constant: 20),
            linkButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            linkButton.widthAnchor.constraint(equalToConstant: 300),
            linkButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    func setUpLayout(inputTextView: UITextView, label: String) -> UITextView {
        inputTextView.translatesAutoresizingMaskIntoConstraints = false
        inputTextView.text = label
        inputTextView.isEditable = false
        inputTextView.font = .systemFont(ofSize: 24)
        inputTextView.textAlignment = .center
        inputTextView.textColor = textColor
        inputTextView.backgroundColor = .white
        inputTextView.translatesAutoresizingMaskIntoConstraints = false
        inputTextView.clipsToBounds = true
        inputTextView.layer.cornerRadius = 20
        return inputTextView
    }

    @objc func pushViewControllerButtonPressed() {
        let vc = PushViewController(delegate: self, placeHolderCompany: self.companyView.text, placeHolderTicker: self.tickerView.text,
                                    placeHolderPrice: self.priceView.text, placeHolderHL: self.highLowView.text, placeHolderDesc: self.descriptionView.text, bgColor: self.backgroundColor)
       
        navigationController?.pushViewController(vc, animated: true)
    }

    @objc func presentViewControllerButtonPressed() {
        let vc = PresentViewController(delegate: self, placeHolderColor: view.backgroundColor ?? salmonColor)
        present(vc, animated: true, completion: nil)

    }
    
    // Method from Apple Developer Forums - https://developer.apple.com/forums/thread/668019
    @objc func linkButtonPressed(_ sender: UIButton) {
        if let url = URL(string: "https://finance.yahoo.com") {
          UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
    
}


extension ViewController {
    func updateColor(newColor: UIColor) {
        backgroundColor = newColor
        view.backgroundColor = backgroundColor
    }
    
    func updateInfo(newCompany: String, newTicker: String, newPrice: String, newHL: String, newDesc: String) {
        companyView.text = newCompany
        tickerView.text = newTicker
        priceView.text = newPrice
        highLowView.text = newHL
        descriptionView.text = newDesc
        
    }
    
}

