//
//  MenuViewController.swift
//  Coffe_House
//
//  Created by adyl CEO on 02/04/2024.
//

import UIKit

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

    private let items: [MenuItem] = [
        MenuItem(title: "Капучино", description: "Кофейный напиток", price: "140c", image: UIImage(named: "1"), counter: 0),
        MenuItem(title: "Латте", description: "Кофейный напиток", price: "140c", image: UIImage(named: "2"), counter: 0),
        MenuItem(title: "Американо", description: "Кофейный напиток", price: "100c", image: UIImage(named: "3"), counter: 0),
        MenuItem(title: "Раф", description: "Кофейный напиток", price: "170c", image: UIImage(named: "4"), counter: 0),
        MenuItem(title: "Эспрессо", description: "Кофейный напиток", price: "100c", image: UIImage(named: "5"), counter: 0),
        MenuItem(title: "Мокко", description: "Кофейный напиток", price: "150c", image: UIImage(named: "6"), counter: 0)
    ]


    // MARK: - Initialization

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        navigationItem.title = "Меню"
        
        navigationItem.hidesBackButton = true

        setupConst()
    }

    private func setupConst() {
        view.addSubview(tabBarStackView)

        NSLayoutConstraint.activate([
            tabBarStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tabBarStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tabBarStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tabBarStackView.heightAnchor.constraint(equalToConstant: 32)
        ])

        view.addSubview(coffeeTitle)
        NSLayoutConstraint.activate([
            coffeeTitle.topAnchor.constraint(equalTo: tabBarStackView.bottomAnchor, constant: 20),
            coffeeTitle.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16)
        ])

        tabBarStackView.addArrangedSubview(coffeeButton)
        tabBarStackView.addArrangedSubview(dessertsButton)
        tabBarStackView.addArrangedSubview(bakeryButton)
        tabBarStackView.addArrangedSubview(cocktailsButton)

        view.addSubview(menuTableView)
        NSLayoutConstraint.activate([
            menuTableView.topAnchor.constraint(equalTo: coffeeTitle.bottomAnchor, constant: 10),
            menuTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            menuTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            menuTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])

        menuTableView.register(MenuTableViewCell.self, forCellReuseIdentifier: "MenuCell")
    }

    @objc private func tapButtonTapped(_ sender: UIButton) {

        UIView.animate(withDuration: 0.3) {
            self.coffeeButton.backgroundColor = nil
            self.coffeeButton.tintColor = .black

            self.dessertsButton.backgroundColor = nil
            self.dessertsButton.tintColor = .black

            self.bakeryButton.backgroundColor = nil
            self.bakeryButton.tintColor = .black

            self.cocktailsButton.backgroundColor = nil
            self.cocktailsButton.tintColor = .black
        }

        switch sender {

        case coffeeButton:
            coffeeButton.backgroundColor = UIColor.black
            coffeeButton.layer.cornerRadius = 16
            coffeeButton.tintColor = .white
        case dessertsButton:
            dessertsButton.backgroundColor = UIColor.black
            dessertsButton.layer.cornerRadius = 16
            dessertsButton.tintColor = .white
        case bakeryButton:
            bakeryButton.backgroundColor = UIColor.black
            bakeryButton.layer.cornerRadius = 16
            bakeryButton.tintColor = .white
        case cocktailsButton:
            cocktailsButton.backgroundColor = UIColor.black
            cocktailsButton.layer.cornerRadius = 16
            cocktailsButton.tintColor = .white
        default:
            break
        }
    }
    
    deinit {
        print("menuView deleted")
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
}


