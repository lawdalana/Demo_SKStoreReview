//
//  UserDefaults.swift
//  Demo_APNSAuthKey
//
//  Created by Suwat Saegauy on 5/28/2560 BE.
//  Copyright © 2560 Suwat Saegauy. All rights reserved.
//

import Foundation

class UserDefaults {
    
    // ------------------------------
    // MARK: -
    // MARK: Properties
    // ------------------------------
    
    enum DefaultName: String {
        
        case isReview
        case numberOfRuns
        
        var description: String {
            switch self {
            case .isReview: return "isReview"
            case .numberOfRuns: return "numberOfRuns"
            }
        }
    }
    
    static let shared = UserDefaults()
    
    // ------------------------------
    // MARK: -
    // MARK: Configuration
    // ------------------------------
    
    open func setObject(_ object: Any?, defaultName: DefaultName) -> Void {
        let defaults = Foundation.UserDefaults.standard
        
        if let object = object {
            defaults.set(object, forKey: defaultName.description)
        } else {
            defaults.removeObject(forKey: defaultName.description)
        }
        
        defaults.synchronize()
    }
    
    open func object(forKey defaultName: DefaultName) -> Any? {
        let defaults = Foundation.UserDefaults.standard
        return defaults.object(forKey: defaultName.description)
    }
}

extension UserDefaults {
    
    // ------------------------------
    // MARK: -
    // MARK: MEMEMTO: GETTER
    // ------------------------------
    
    func getIsReview() -> Bool {
        guard let isReview = object(forKey: .isReview) as? Bool else { return false }
        return isReview
    }
    
    func getNumberOfRuns() -> Int {
        guard let numberOfRuns = object(forKey: .numberOfRuns) as? Int else { return 0 }
        return numberOfRuns
    }
    
    // ------------------------------
    // MARK: -
    // MARK: MEMEMTO: SETTER
    // ------------------------------
    
    func setIsReview(_ isReview: Bool) {
        setObject(isReview, defaultName: .isReview)
    }
    
    func setNumberOfRuns(_ numberOfRuns: Int) {
        setObject(numberOfRuns, defaultName: .numberOfRuns)
    }
}
