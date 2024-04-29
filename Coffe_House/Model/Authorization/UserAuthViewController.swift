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
        
        mainTitle.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(160)
            make.centerX.equalToSuperview()
        }
        
        mainTitle2.snp.makeConstraints { make in
            make.top.equalTo(mainTitle.snp.bottom)
            make.centerX.equalToSuperview()
        }
        
        view.addSubview(signInButton)
        signInButton.snp.makeConstraints { make in
            make.top.equalTo(mainTitle2.snp.bottom).offset(98)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
            make.height.equalTo(56)
        }
        
        view.addSubview(regButton)
        regButton.snp.makeConstraints { make in
            make.top.equalTo(signInButton.snp.bottom).offset(16)
            make.centerX.equalToSuperview()
            make.height.equalTo(56)
        }
    }
    
    deinit {
        print("user auth deleted")
    }
    
    @objc private func signInButtonTapped(_ sender: UIButton) {
        let vc = SecondUserAuthViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
}
