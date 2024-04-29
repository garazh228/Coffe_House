//
//  SecondUserAuthViewController.swift
//  Coffe_House
//
//  Created by adyl CEO on 02/04/2024.
//

import UIKit
import SnapKit

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
        
        mainTitle.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(80)
            make.centerX.equalToSuperview()
        }
        
        mainTitle2.snp.makeConstraints { make in
            make.top.equalTo(mainTitle.snp.bottom)
            make.centerX.equalToSuperview()
        }
        
        view.addSubview(entranceTitle)
        entranceTitle.snp.makeConstraints { make in
            make.top.equalTo(mainTitle2.snp.bottom).offset(60)
            make.leading.equalToSuperview().offset(16)
        }
        
        view.addSubview(numberTextField)
        numberTextField.snp.makeConstraints { make in
            make.top.equalTo(entranceTitle.snp.bottom).offset(32)
            make.centerX.equalToSuperview()
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
            make.height.equalTo(56)
        }
        
        view.addSubview(signInButton)
        signInButton.snp.makeConstraints { make in
            make.top.equalTo(numberTextField.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
            make.height.equalTo(56)
        }
    }
    
    deinit {
        print("second view deleted")
    }
    
    @objc private func signInButtonTapped2() {
        let vc = CustonTapBarController()
        navigationController?.pushViewController(vc, animated: true)
    }
}
