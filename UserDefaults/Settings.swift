//
//  Settings.swift
//  UserDefaults
//
//  Created by Marcello Chuahy on 01/09/20.
//  Copyright © 2020 Applause Codes. All rights reserved.
//

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

		// Exemplo para configurar um valor inicial diferente de 0:
		if defaults.double(forKey: UserDefaultsKeys.someDouble.rawValue) == 0.0 {
			defaults.set(50.0, forKey: UserDefaultsKeys.someDouble.rawValue)
		}
		
	}
	
	// MARK: - Methods
	func removeAllKeys() {
		if let appDomain = Bundle.main.bundleIdentifier {
			UserDefaults.standard.removePersistentDomain(forName: appDomain)
		}
	}

}

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
