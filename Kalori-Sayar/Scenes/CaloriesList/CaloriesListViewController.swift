//
//  CaloriesListViewController.swift
//  Kalori-Sayar
//
//  Created by Baki Dikbıyık on 5.06.2024.
//

import MobilliumBuilders
import UIKit
import TinyConstraints
import UIComponents

final class CaloriesListViewController: BaseViewController<CaloriesListViewModel> {
    
    private let topCaloriesTitleLabel = UILabelBuilder()
        .textColor(.black)
        .font(.font(.nunitoBold, size: .xxLarge))
        .build()
    
    private let totalCaloriesLabel = UILabelBuilder()
        .textColor(.black)
        .font(.font(.nunitoBold, size: .xxLarge))
        .build()
    
    private let dailyCaloriesStackView = UIStackViewBuilder()
        .axis(.horizontal)
        .build()
    
    private let dailyCaloriesLabel = UILabelBuilder()
        .textColor(.black)
        .font(.font(.nunitoBold, size: .xxLarge))
        .build()
    
    private let addButton = UIButtonBuilder()
        .tintColor(.gray)
        .build()
    
    private let tableView = UITableViewBuilder()
        .build()
    
    var totalCalories: Int = 0
    var foodItems: [(name: String, calories: Int, time: Date)] = []
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviews()
        configureContents()
        setLocalize()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        checkForNewDay()
        localSavedData()
        totalCaloriesLabel.text = String(totalCalories)
    }
}

// MARK: - UILayout
extension CaloriesListViewController {
    
    private func addSubviews() {
        
        view.addSubview(topCaloriesTitleLabel)
        topCaloriesTitleLabel.edgesToSuperview(excluding: [.trailing, .bottom], insets: .init(top: 50, left: 20, bottom: 0, right: 0), usingSafeArea: true)
        
        view.addSubview(totalCaloriesLabel)
        totalCaloriesLabel.edgesToSuperview(excluding: [.leading, .bottom], insets: .init(top: 50, left: 0, bottom: 0, right: 20), usingSafeArea: true)
        
        view.addSubview(dailyCaloriesStackView)
        dailyCaloriesStackView.topToBottom(of: topCaloriesTitleLabel).constant = 100
        dailyCaloriesStackView.leadingToSuperview().constant = 20
        dailyCaloriesStackView.trailingToSuperview().constant = -20
        
        dailyCaloriesStackView.addArrangedSubview(dailyCaloriesLabel)
        dailyCaloriesStackView.addArrangedSubview(addButton)
        
        view.addSubview(tableView)
        tableView.edgesToSuperview(excluding: .top, insets: .init(top: 0, left: 0, bottom: 0, right: 0))
        tableView.topToBottom(of: dailyCaloriesStackView)
    }
}

// MARK: - Configure Contents And Localize
extension CaloriesListViewController {
    
    private func configureContents() {
        view.backgroundColor = .white
        addButton.setTitle(L10n.Calories.kaloriEkleButton, for: .normal)
        addButton.addTarget(self, action: #selector(addButtonTapped), for: .touchUpInside)
        
        tableView.register(CaloriesCell.self)
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    private func setLocalize() {
        topCaloriesTitleLabel.text = L10n.Calories.toplamKalMik
        totalCaloriesLabel.text = String(totalCalories)
        dailyCaloriesLabel.text = L10n.Calories.kaloriTitle
        addButton.setTitle(L10n.Calories.kaloriEkleButton, for: .normal)
    }
}

// MARK: - Actions
extension CaloriesListViewController {
    
    @objc
    func addButtonTapped() {
        let alert = UIAlertController(title: "Yemek Ekle", message: "Yemek ismi ve Kalorisini gir", preferredStyle: .alert)
        
        alert.addTextField { textField in
            textField.placeholder = "Yemek ismi"
        }
        
        alert.addTextField { textField in
            textField.placeholder = "Kalorisi"
            textField.keyboardType = .numberPad
        }
        
        let addAction = UIAlertAction(title: "Ekle", style: .default) { [weak self] _ in
            guard let self = self,
                  let foodName = alert.textFields?[0].text, !foodName.isEmpty,
                  let calorieText = alert.textFields?[1].text, !calorieText.isEmpty, let calories = Int(calorieText) else {
                self?.showValidationAlert()
                return
            }
            
            let currentTime = Date()
            self.foodItems.append((name: foodName, calories: calories, time: currentTime))
            self.totalCalories += calories
            
            self.totalCaloriesLabel.text = String(self.totalCalories)
            self.tableView.reloadData()
            self.savedData()
        }
        
        let cancelAction = UIAlertAction(title: "Iptal Et", style: .cancel, handler: nil)
        
        alert.addAction(addAction)
        alert.addAction(cancelAction)
        
        present(alert, animated: true, completion: nil)
    }
    
    func showValidationAlert() {
        let validationAlert = UIAlertController(title: "Hata", message: "Lutfen Yemek ismi ve Kalorisini giriniz.", preferredStyle: .alert)
        validationAlert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(validationAlert, animated: true, completion: nil)
    }
}

// MARK: - UserDefaults
extension CaloriesListViewController {
    
    func savedData() {
        let defaults = UserDefaults.standard
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        
        let itemsToSave = foodItems.map {
            [
                "name": $0.name,
                "calories": $0.calories,
                "time": dateFormatter.string(from: $0.time)
            ]
        }
        defaults.set(itemsToSave, forKey: "foodItems")
        defaults.set(totalCalories, forKey: "totalCalories")
        defaults.set(Date(), forKey: "lastSavedDate")
    }
    
    func localSavedData() {
         let defaults = UserDefaults.standard
         let dateFormatter = DateFormatter()
         dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
         
         if let lastSavedDate = defaults.object(forKey: "lastSavedDate") as? Date {
             if !Calendar.current.isDateInToday(lastSavedDate) {
                 defaults.removeObject(forKey: "foodItems")
                 defaults.removeObject(forKey: "totalCalories")
                 totalCalories = 0
                 totalCaloriesLabel.text = "0"
                 tableView.reloadData()
                 return
             }
         }
         
         if let savedItems = defaults.array(forKey: "foodItems") as? [[String: Any]] {
             foodItems = savedItems.compactMap {
                 guard let name = $0["name"] as? String,
                       let calories = $0["calories"] as? Int,
                       let timeString = $0["time"] as? String,
                       let time = dateFormatter.date(from: timeString) else { return nil }
                 return (name: name, calories: calories, time: time)
             }
         }
         
         totalCalories = defaults.integer(forKey: "totalCalories")
         totalCaloriesLabel.text = String(totalCalories)
     }
     
     func checkForNewDay() {
         let defaults = UserDefaults.standard
         let currentDate = Date()
         
         if let lastSavedDate = defaults.object(forKey: "lastSavedDate") as? Date {
             if !Calendar.current.isDateInToday(lastSavedDate) {
                 defaults.removeObject(forKey: "foodItems")
                 defaults.removeObject(forKey: "totalCalories")
                 totalCalories = 0
                 totalCaloriesLabel.text = "0"
                 foodItems.removeAll()
                 tableView.reloadData()
             }
         }
         
         defaults.set(currentDate, forKey: "lastSavedDate")
     }
}

// MARK: - UITableViewDelegate
extension CaloriesListViewController: UITableViewDelegate {
    
}

// MARK: - UITableViewDataSource
extension CaloriesListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return foodItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: CaloriesCell = tableView.dequeueReusableCell(for: indexPath)
        let cellItem = foodItems[indexPath.row]
        cell.set(viewModel: CaloriesCellModel(foodItem: cellItem))
        return cell
    }
}
