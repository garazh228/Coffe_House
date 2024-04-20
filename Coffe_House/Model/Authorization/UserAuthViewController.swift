//
//  UserAuthViewController.swift
//  Coffe_House
//
//  Created by adyl CEO on 02/04/2024.
//

import UIKit

class UserAuthViewController: UIViewController {
    
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
    
    private lazy var signInButton: UIButton = {
        let view = UIButton(type: .system)
        view.setTitle("Войти", for: .normal)
        view.tintColor = .white
        view.backgroundColor = UIColor(red: 255/255, green: 139/255, blue: 91/255, alpha: 1.0)
        view.layer.cornerRadius = 30
        view.addTarget(self, action: #selector(signInButtonTapped), for: .touchUpInside)
        view.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private lazy var regButton: UIButton = {
        let view = UIButton(type: .system)
        view.setTitle("Регистрация", for: .normal)
        view.tintColor = UIColor(red: 237/255, green: 237/255, blue: 237/255, alpha: 1.0)
        view.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        setupConst()
    }
    
    private func setupConst() {
        
        view.addSubview(mainTitle)
        view.addSubview(mainTitle2)
        
        NSLayoutConstraint.activate([
            mainTitle.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 160),
            mainTitle.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            mainTitle2.topAnchor.constraint(equalTo: mainTitle.bottomAnchor),
            mainTitle2.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        view.addSubview(signInButton)
        NSLayoutConstraint.activate([
            signInButton.topAnchor.constraint(equalTo: mainTitle2.bottomAnchor, constant: 98),
            signInButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            signInButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            signInButton.heightAnchor.constraint(equalToConstant: 56)
        ])
        
        view.addSubview(regButton)
        NSLayoutConstraint.activate([
            regButton.topAnchor.constraint(equalTo: signInButton.bottomAnchor, constant: 16),
            regButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            regButton.heightAnchor.constraint(equalToConstant: 56)
        ])
    }
    
    deinit {
        print("user auth deleted")
    }
    
    @objc private func signInButtonTapped(_ sender: UIButton) {
        let vc = SecondUserAuthViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
}
