//
//  ViewController.swift
//  Demo_SKStoreReview
//
//  Created by Suwat Saegauy on 6/3/2560 BE.
//  Copyright © 2560 Suwat Saegauy. All rights reserved.
//

/*
 
 Description:
 
 How to ask users to review your app using SKStoreReviewController
 Available from iOS 10.3
 
 Many apps ask users to review their apps, 
 but it’s increasingly common to see dark patterns such as apps pre-screening users 
 so they get sent to the App Store only if they said they like the app.
 
 To avoid this problem in the future, 
 and also to provide a standardized interface that users can trust, 
 iOS 10.3 brought a built-in way to ask users to review the app, 
 and it couldn’t be much easier to use.
 
 But first, some important information:
 
 You request that the system show a review dialog, 
 which means the request might be ignored based on internal logic known only to Apple.
 Because the request might be ignored, you should not trigger the request from a user-facing button saying something like 
 “Leave a review” – it might appear to do nothing at all.
 When you are in development, requesting a review will always show the review user interface, but you can’t submit an actual review.
 When you are using TestFlight to test your app, requesting a review will do nothing at all.
 
 
 That’s it!
 
 Again, you should not call that in response to user input, 
 although if you have any sense you won’t just put it inside viewDidAppear() in your app.
 
 Instead, consider storing a simple run count for your app using UserDefaults, 
 then calling the method after your app has been run 10 times. 
 By that point it’s pretty clear the user keeps coming back to your app,
 so hopefully you have more chance of getting a positive review!
 
 Reference source: 
 https://developer.apple.com/app-store/ratings-and-reviews
 https://www.behradbagheri.com/boringb-tutorials/2017/4/a-proper-way-to-request-review-using-skstorereviewcontroller-in-ios-103-and-higher
 
 */

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var labelOutlet: UILabel!
    @IBOutlet weak var buttonLabelOutlet: UIButton!
    
    let review = Review()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let ps = "\n\n if numberOfRuns mod == 0 that show dialog prompt!!"
        self.labelOutlet.text = "\(self.review.numberOfRuns) mode 10 = \(modResult())" + ps
    }
    
    @IBAction func buttonAction(_ sender: UIButton) {
        self.review.show()
    }
    
    fileprivate func modResult() -> Int {
        return (self.review.numberOfRuns % 10)
    }
}
