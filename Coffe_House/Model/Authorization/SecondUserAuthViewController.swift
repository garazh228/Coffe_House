//
//  SecondUserAuthViewController.swift
//  Coffe_House
//
//  Created by adyl CEO on 02/04/2024.
//

import UIKit

class SecondUserAuthViewController: UIViewController {
    
    private lazy var mainTitle: UILabel = {
       let view = UILabel()
        view.text = "кофейня"
        view.textColor = .black
        view.font = UIFont.italicSystemFont(ofSize: 40)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var mainTitle2: UILabel = {
        let view = UILabel()
        view.text = "Geeks"
        view.textColor = .systemYellow
        view.font = UIFont.italicSystemFont(ofSize: 40)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var entranceTitle: UILabel = {
        let view = UILabel()
        view.text = "Вход"
        view.textColor = .black
        view.font = UIFont.systemFont(ofSize: 34)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var numberTextField: UITextField = {
        let view = UITextField()
        view.placeholder = "555 555 555"
        
        if let phoneImage = UIImage(systemName: "phone") {

            let tintedPhoneImage = phoneImage.withTintColor(.gray, renderingMode: .alwaysOriginal)
            
            let leftPaddingView = UIView(frame: CGRect(x: 0, y: 0, width: 45, height: 30))
            let imageView = UIImageView(image: tintedPhoneImage)
            imageView.frame = CGRect(x: 10, y: 0, width: 30, height: 30)
            leftPaddingView.addSubview(imageView)
            
            view.leftView = leftPaddingView
            view.leftViewMode = .always
        }
        
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(red: 237/255, green: 237/255, blue: 237/255, alpha: 1.0)
        view.layer.cornerRadius = 25
        return view
    }()
    
    private lazy var signInButton: UIButton = {
        let view = UIButton(type: .system)
        view.setTitle("Войти", for: .normal)
        view.tintColor = .white
        view.backgroundColor = UIColor(red: 255/255, green: 139/255, blue: 91/255, alpha: 1.0)
        view.layer.cornerRadius = 30
        view.addTarget(self, action: #selector(signInButtonTapped2), for: .touchUpInside)
        view.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        view.addSubview(mainTitle)
        view.addSubview(mainTitle2)
        
        NSLayoutConstraint.activate([
            mainTitle.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 80),
            mainTitle.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            mainTitle2.topAnchor.constraint(equalTo: mainTitle.bottomAnchor),
            mainTitle2.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        view.addSubview(entranceTitle)
        NSLayoutConstraint.activate([
            entranceTitle.topAnchor.constraint(equalTo: mainTitle2.bottomAnchor, constant: 60),
            entranceTitle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16)
        ])
        
        view.addSubview(numberTextField)
        NSLayoutConstraint.activate([
            numberTextField.topAnchor.constraint(equalTo: entranceTitle.bottomAnchor, constant: 32),
            numberTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            numberTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            numberTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            numberTextField.heightAnchor.constraint(equalToConstant: 56)
        ])
        
        view.addSubview(signInButton)
        NSLayoutConstraint.activate([
            signInButton.topAnchor.constraint(equalTo: numberTextField.bottomAnchor, constant: 20),
            signInButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            signInButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            signInButton.heightAnchor.constraint(equalToConstant: 56)
        ])
    }
    
    deinit {
        print("second view deleted")
    }
    
    @objc private func signInButtonTapped2() {
        let vc = CustonTapBarController()
        navigationController?.pushViewController(vc, animated: true)
    }
}
