# UserDefaults
Simple App to demonstrate how to save and retrieve data using User Defaults.

![Captura de Tela 2020-09-02 às 11 29 19](https://user-images.githubusercontent.com/17011151/91996714-b24e7500-ed0f-11ea-8f67-20ca3ea1d21d.png)  

### Settings.swift
```
import Foundation

class Settings {
	
	let defaults = UserDefaults.standard
	static var shared: Settings = Settings()

	// MARK: - Initializer
	private init() {

		// By default:
		// String = ""
		// Int    = 0
    // Bool   = false

		// Example for setting an initial value other than 0:
		// if defaults.double(forKey: UserDefaultsKeys.someDouble.rawValue) == 0.0 {
		//  	defaults.set(5.0, forKey: UserDefaultsKeys.someDouble.rawValue)
		// }
		
	}
	
	// MARK: - Methods
	func removeAllKeys() {
		if let appDomain = Bundle.main.bundleIdentifier {
			UserDefaults.standard.removePersistentDomain(forName: appDomain)
		}
	}

}
```

### extension Settings
```

enum UserDefaultsKeys: String {
	case someInt        = "someInt"
	case someDouble     = "someDouble"
	case someBool       = "someBool"
	case someString     = "someString"
	case someDate       = "someDate"
	case someArray      = "someArray"
	case someDictionary = "someDictionary"
}

extension Settings {
	
	// MARK: - Computed Properties:
	
	var someInt: Int {
		get { return defaults.integer(forKey: UserDefaultsKeys.someInt.rawValue) }
		set { defaults.set(newValue, forKey: UserDefaultsKeys.someInt.rawValue) }
	}
	
	var someDouble: Double {
		get { return defaults.double(forKey: UserDefaultsKeys.someDouble.rawValue) }
		set { defaults.set(newValue, forKey: UserDefaultsKeys.someDouble.rawValue) }
	}
	
	var someBool: Bool {
		get { return defaults.bool(forKey: UserDefaultsKeys.someBool.rawValue) }
		set { defaults.set(newValue, forKey: UserDefaultsKeys.someBool.rawValue) }
	}
	
	var someString: String {
		get { return defaults.string(forKey: UserDefaultsKeys.someString.rawValue) ?? ""}
		set { defaults.set(newValue, forKey: UserDefaultsKeys.someString.rawValue) }
	}
	
	var someDate: Date {
		get { return defaults.object(forKey: UserDefaultsKeys.someDate.rawValue) as? Date ?? Date() }
		set { defaults.set(newValue, forKey: UserDefaultsKeys.someDate.rawValue) }
	}
	
	var someArray: [String] {
		get { return defaults.object(forKey: UserDefaultsKeys.someArray.rawValue) as? [String] ?? [String]() }
		set { defaults.set(newValue, forKey: UserDefaultsKeys.someArray.rawValue) }
	}
	
	var someDictionary: [String: String] {
		get { return defaults.object(forKey: UserDefaultsKeys.someDictionary.rawValue) as? [String: String] ?? [String: String]() }
		set { defaults.set(newValue, forKey: UserDefaultsKeys.someDictionary.rawValue) }
	}
	
}
```

### SettingsViewController.swift
```

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
```





