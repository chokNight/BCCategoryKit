//
//  TestTargetA.swift
//  BCPodTest_A
//
//  Created by choknight on 2021/3/16.
//

import Foundation

@objc class TestTargetA: NSObject {

    @objc func Action_Extension_TestAViewController(_ params:NSDictionary) -> UIViewController {
        if let callback = params["callback"] as? (String) -> Void {
            callback("success")
        }

        let aViewController = TestAViewController()
        return aViewController
    }
    
    @objc func Action_Category_TestAViewController(_ params:NSDictionary) -> UIViewController {
        
        if let block = params["callback"] {
            
            typealias CallbackType = @convention(block) (NSString) -> Void
            let blockPtr = UnsafeRawPointer(Unmanaged<AnyObject>.passUnretained(block as AnyObject).toOpaque())
            let callback = unsafeBitCast(blockPtr, to: CallbackType.self)
            
            callback("success")
        }
        
        let aViewController = TestAViewController()
        return aViewController
    }
}
