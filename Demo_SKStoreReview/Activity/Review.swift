//
//  Review.swift
//  Demo_SKStoreReview
//
//  Created by Suwat Saegauy on 6/3/2560 BE.
//  Copyright © 2560 Suwat Saegauy. All rights reserved.
//

import Foundation
import StoreKit

class Review {
    
    // ------------------------------
    // MARK: -
    // MARK: Properties
    // ------------------------------
    
    static let shared = Review()
    
    // Minimum number of runs that should have until ask for review
    fileprivate let minimumRunCount = 10
    
    public var numberOfRuns: Int {
        return getNumberOfRuns()
    }
    
    // ------------------------------
    // MARK: -
    // MARK: Configuration
    // ------------------------------
    
    /// Run counter
    public func incrementAppRuns() -> Void {
        UserDefaults.shared.setNumberOfRuns(self.numberOfRuns + 1)
    }
    
    public func show() {
        print("[Log] Show Review")
        
        if calculateFromModular() {
            if #available(iOS 10.3, *) {
                print("[Log] Review Requested")
                SKStoreReviewController.requestReview()
            } else {
                // Fallback on earlier versions
                print("Fallback on earlier versions")
            }
        } else {
            print("[Log] Runs are not enough to request review!")
        }
    }
    
    fileprivate func getNumberOfRuns() -> Int {
        return UserDefaults.shared.getNumberOfRuns()
    }
    
    fileprivate func calculateFromModular() -> Bool {
        return (self.numberOfRuns % minimumRunCount) == 0
    }
}
