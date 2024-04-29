//
//  MenuViewController.swift
//  Coffe_House
//
//  Created by adyl CEO on 02/04/2024.
//

import UIKit
import SnapKit

enum MenuType {
    case coffee
    case dessert
}

class MenuViewController: UIViewController {
    
    private lazy var tabBarStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.alignment = .center
        stackView.spacing = 8
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var coffeeButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Кофе", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        button.tintColor = .black
        button.addTarget(self, action: #selector(tapButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var dessertsButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Десерты", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        button.tintColor = .black
        button.addTarget(self, action: #selector(tapButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var bakeryButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Выпечка", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        button.tintColor = .black
        button.addTarget(self, action: #selector(tapButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var cocktailsButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Коктейли", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        button.tintColor = .black
        button.addTarget(self, action: #selector(tapButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var coffeeTitle: UILabel = {
        let title = UILabel()
        title.text = "Кофе"
        title.font = UIFont.systemFont(ofSize: 35)
        title.tintColor = .black
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()
    
    private lazy var menuTableView: UITableView = {
        let view = UITableView()
        view.delegate = self
        view.dataSource = self
        view.separatorStyle = .none
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private var currentMenu: MenuType = .coffee
    
    private var items: [MenuItem] = []
    
    // MARK: - Initialization
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        navigationItem.title = "Меню"
        
        navigationItem.hidesBackButton = true
        
        setupConst()
        
        if let products = JSONParser.parseProducts(from: "products") {
            items = products
            menuTableView.reloadData()
        }
    }
    
    private func setupConst() {
        view.addSubview(tabBarStackView)
        tabBarStackView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.height.equalTo(32)
        }
        
        view.addSubview(coffeeTitle)
        coffeeTitle.snp.makeConstraints { make in
            make.top.equalTo(tabBarStackView.snp.bottom).offset(20)
            make.left.equalToSuperview().offset(16)
        }
        
        tabBarStackView.addArrangedSubview(coffeeButton)
        tabBarStackView.addArrangedSubview(dessertsButton)
        tabBarStackView.addArrangedSubview(bakeryButton)
        tabBarStackView.addArrangedSubview(cocktailsButton)
        
        view.addSubview(menuTableView)
        menuTableView.snp.makeConstraints { make in
            make.top.equalTo(coffeeTitle.snp.bottom).offset(10)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
        }
        
        menuTableView.register(MenuTableViewCell.self, forCellReuseIdentifier: "MenuCell")
        
        displayMenu(for: currentMenu)
    }
    
    private func displayMenu(for menu: MenuType) {
        switch menu {
        case .coffee:
            coffeeTitle.text = "Кофе"
            items = [
                ProductItem(title: "Капучино", description: "Кофейный напиток", price: "140c", image: "1", counter: 0),
                ProductItem(title: "Латте", description: "Кофейный напиток", price: "140c", image: "2", counter: 0),
                ProductItem(title: "Американо", description: "Кофейный напиток", price: "100c", image: "3", counter: 0),
                ProductItem(title: "Раф", description: "Кофейный напиток", price: "170c", image: "4", counter: 0),
                ProductItem(title: "Эспрессо", description: "Кофейный напиток", price: "100c", image: "5", counter: 0),
                ProductItem(title: "Мокко", description: "Кофейный напиток", price: "150c", image: "6", counter: 0)
            ].map { productItem -> MenuItem in
                return MenuItem(title: productItem.title, description: productItem.description, price: productItem.price, image: UIImage(named: productItem.image)!, counter: productItem.counter)
            }
        case .dessert:
            coffeeTitle.text = "Десерты"
            items = [
                ProductItem(title: "Чизкейк", description: "Сладкое блюдо", price: "200c", image: "cheesecake", counter: 0),
                ProductItem(title: "Тирамису", description: "Сладкое блюдо", price: "150c", image: "tiramisu", counter: 0),
                ProductItem(title: "Эклер", description: "Сладкое блюдо", price: "100c", image: "ekler", counter: 0),
                ProductItem(title: "Панна-Котта", description: "Сладкое блюдо", price: "250c", image: "pannacotta", counter: 0),
            ].map { productItem -> MenuItem in
                return MenuItem(title: productItem.title, description: productItem.description, price: productItem.price, image: UIImage(named: productItem.image)!, counter: productItem.counter)
            }
        }
        menuTableView.reloadData()
    }
    
    @objc private func tapButtonTapped(_ sender: UIButton) {
        
        UIView.animate(withDuration: 0.3) {
            self.resetButtonStyles()
            
            sender.backgroundColor = UIColor.black
            sender.layer.cornerRadius = 16
            sender.tintColor = .white
        }
        
        switch sender {
        case coffeeButton:
            currentMenu = .coffee
        case dessertsButton:
            currentMenu = .dessert
        default:
            break
        }
        
        displayMenu(for: currentMenu)
    }
    
    deinit {
        print("menuView deleted")
    }
    
    private func resetButtonStyles() {
        coffeeButton.backgroundColor = nil
        coffeeButton.tintColor = .black
        
        dessertsButton.backgroundColor = nil
        dessertsButton.tintColor = .black
    }
}

extension MenuViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MenuCell", for: indexPath) as! MenuTableViewCell
        let item = items[indexPath.row]
        cell.configure(with: item)
        cell.counter = item.counter
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
}

extension MenuViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 110
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedItem = items[indexPath.row]
        let itemInfoVC = ItemInfoViewController()
        itemInfoVC.item = selectedItem
        navigationController?.pushViewController(itemInfoVC, animated: true)
    }
}
