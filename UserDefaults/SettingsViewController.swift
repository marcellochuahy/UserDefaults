//
//  SettingsViewController.swift
//  UserDefaults
//
//  Created by Marcello Chuahy on 01/09/20.
//  Copyright © 2020 Applause Codes. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

	@IBOutlet weak var someStringTextField: UITextField!
	@IBOutlet weak var someIntSegmentedControl: UISegmentedControl!
	@IBOutlet weak var someDoubleSlider: UISlider!
	@IBOutlet weak var someBoolSwitch: UISwitch!
	@IBOutlet weak var someDateDatePicker: UIDatePicker!
	
	let settings = Settings.shared
	
	override func viewDidLoad() {
        super.viewDidLoad()
		someStringTextField.delegate = self
		configureViewWithSavedValues()
    }

	func configureViewWithSavedValues() {
		someStringTextField.text = settings.someString
		someIntSegmentedControl.selectedSegmentIndex = settings.someInt
		someDoubleSlider.setValue(Float(settings.someDouble), animated: false)
		someBoolSwitch.setOn(settings.someBool, animated: false)
		someDateDatePicker.date = settings.someDate
	}

	@IBAction func someStringTextFieldWasChanged(_ sender: UITextField) {
		if let text = sender.text {
			settings.someString = text
		}
	}

	@IBAction func someIntSegmentedControlWasChanged(_ sender: UISegmentedControl) {
		settings.someInt = sender.selectedSegmentIndex
	}
	
	@IBAction func someDoubleSliderWasChanged(_ sender: UISlider) {
		settings.someDouble = Double(sender.value)
	}
	
	@IBAction func someBoolSwitchWasChanged(_ sender: UISwitch) {
		settings.someBool = sender.isOn
	}
	
	@IBAction func someDatePickerWasChanged(_ sender: UIDatePicker) {
		settings.someDate = sender.date
	}

}

extension SettingsViewController: UITextFieldDelegate {

	override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
		view.endEditing(true)
	}

	func textFieldShouldReturn(_ textField: UITextField) -> Bool {
		textField.resignFirstResponder()
	}

}
