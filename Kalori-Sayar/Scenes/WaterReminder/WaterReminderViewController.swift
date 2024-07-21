
//
//  WaterReminderViewController.swift
//  Kalori-Sayar
//
//  Created by Baki Dikbıyık on 20.06.2024.
//

import UIKit
import MobilliumBuilders
import UIComponents

final class WaterReminderViewController: BaseViewController<WaterReminderViewModel> {

    private let dateStackView = UIStackViewBuilder()
        .axis(.vertical)
        .spacing(10)
        .build()

    private let datePicker: UIDatePicker = {
        let picker = UIDatePicker()
        picker.datePickerMode = .date
        picker.translatesAutoresizingMaskIntoConstraints = false
        return picker
    }()

    private let dayLabel = UILabelBuilder()
        .font(.font(.nunitoExtraBold, size: .xxLarge))
        .textColor(.gray)
        .textAlignment(.center)
        .build()
    
    private let waterIntakeLabel = UILabelBuilder()
        .textColor(.primaryWater)
        .font(.font(.nunitoBold, size: .xxxLarge))
        .textAlignment(.center)
        .build()

    private let addButton = UIButtonBuilder()
        .backgroundImage(.icPlus)
        .build()

    private let addWaterLabel = UILabelBuilder()
        .textColor(.primaryWater)
        .font(.font(.nunitoBold, size: .xxxLarge))
        .build()
    
    private var totalWaterIntake: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviews()
        configureContents()
        updateDateLabel(date: datePicker.date)
        setLocalize()
        checkForNewDay()
        loadWaterIntake()
    }
}

// MARK: - UILayout
extension WaterReminderViewController {

    private func addSubviews() {

        view.addSubview(dateStackView)
        dateStackView.topToSuperview(usingSafeArea: true)
        dateStackView.centerXToSuperview()

        dateStackView.addArrangedSubview(datePicker)
        dateStackView.addArrangedSubview(dayLabel)
        
        view.addSubview(waterIntakeLabel)
        waterIntakeLabel.topToBottom(of: dateStackView).constant = 30
        waterIntakeLabel.centerXToSuperview()

        view.addSubview(addButton)
        addButton.bottomToSuperview(usingSafeArea: true).constant = -100
        addButton.centerXToSuperview()

        view.addSubview(addWaterLabel)
        addWaterLabel.topToBottom(of: addButton)
        addWaterLabel.centerXToSuperview()
        
    }
}

// MARK: - Configure Contents And Localize
extension WaterReminderViewController {

    private func configureContents() {
        view.backgroundColor = .white

        datePicker.addTarget(self, action: #selector(dateChanged), for: .valueChanged)
        addButton.addTarget(self, action: #selector(addButtonSelected), for: .touchUpInside)
    }

    private func setLocalize() {
        addWaterLabel.text = L10n.WaterReminder.addWater
        waterIntakeLabel.text = "Bugun icilen miktar 0 ml"
    }
}

// MARK: - Actions
extension WaterReminderViewController {

    @objc
    func showDatePicker() {
        datePicker.isHidden = false
    }

    @objc
    func dateChanged(picker: UIDatePicker) {
        updateDateLabel(date: picker.date)
    }

    func updateDateLabel(date: Date) {
        let formatter = DateFormatter()
        formatter.dateFormat = "EEEE"
        let dayName = formatter.string(from: date)
        dayLabel.text = dayName
    }

    @objc
    func addButtonSelected() {
        let alert = UIAlertController(title: "Select Drink Amount", message: nil, preferredStyle: .actionSheet)
        
        let amounts = [100, 200, 500, 1000]
        
        for amount in amounts {
            alert.addAction(UIAlertAction(title: "\(amount) ml", style: .default, handler: { _ in
                self.waterIntakeLabel.text = "Bugun icilen miktar \(amount) ml"
                self.addWater(amount: amount)
            }))
        }
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        present(alert, animated: true, completion: nil)
    }
    
    func addWater(amount: Int) {
        totalWaterIntake += amount
        waterIntakeLabel.text = "Bugun icilen miktar \(totalWaterIntake) ml"
        saveWaterIntake(totalWaterIntake)
    }
    
    func saveWaterIntake(_ amount: Int) {
         UserDefaults.standard.set(amount, forKey: "waterIntake")
     }
    
    func loadWaterIntake() {
        if let savedAmount = UserDefaults.standard.value(forKey: "waterIntake") as? Int {
            totalWaterIntake = savedAmount
            waterIntakeLabel.text = "Bugun icilen miktar \(totalWaterIntake) ml"
        }
    }
    
    func checkForNewDay() {
        let currentDate = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        
        let currentDateString = formatter.string(from: currentDate)
        let lastDateString = UserDefaults.standard.string(forKey: "lastDate") ?? ""
        
        if currentDateString != lastDateString {
            UserDefaults.standard.removeObject(forKey: "waterIntake")
            UserDefaults.standard.set(currentDateString, forKey: "lastDate")
            totalWaterIntake = 0
            waterIntakeLabel.text = "0 ml"
        } else {
            loadWaterIntake()
        }
    }
}

