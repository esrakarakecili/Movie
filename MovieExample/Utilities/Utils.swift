//
//  Utils.swift
//  MovieExample
//
//  Created by Esra Karakecili on 24.03.2019.
//  Copyright © 2019 Esra Karakecili. All rights reserved.
//

import UIKit
import SystemConfiguration

func unwrap(str: String?) -> String {
    if let myStr = str {
        return myStr
    }
    return ""
}

func isReachable() -> Bool {
    var zeroAddress = sockaddr_in()
    zeroAddress.sin_len = UInt8(MemoryLayout<sockaddr_in>.size)
    zeroAddress.sin_family = sa_family_t(AF_INET)
    guard let defaultRouteReachability = withUnsafePointer(to: &zeroAddress, {
        $0.withMemoryRebound(to: sockaddr.self, capacity: 1) {
            SCNetworkReachabilityCreateWithAddress(nil, $0)
        }
    }) else {
        return false
    }
    var flags: SCNetworkReachabilityFlags = []
    if !SCNetworkReachabilityGetFlags(defaultRouteReachability, &flags) {
        return false
    }
    let isReachable = flags.contains(.reachable)
    let needsConnection = flags.contains(.connectionRequired)
    return (isReachable && !needsConnection)
}

func delay(seconds: Double, completion: @escaping (() -> Void)) {
    DispatchQueue.main.asyncAfter(deadline: .now() + seconds) {
        completion()
    }
}

func loading(show: Bool) {
    if !show {
        let indicator = UIApplication.topViewController()?.view.viewWithTag(1001)
        indicator?.removeFromSuperview()
        return
    }
    let myActivityIndicator = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.gray)
    myActivityIndicator.tag = 1001
    myActivityIndicator.center = UIApplication.topViewController()!.view.center
    myActivityIndicator.startAnimating()
    UIApplication.topViewController()?.view.addSubview(myActivityIndicator)
    myActivityIndicator.bringSubviewToFront(UIApplication.topViewController()!.view)
}

func showAlert(title: String, message: String) {
    let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
    alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
    UIApplication.topViewController()?.present(alert, animated: true)
}

extension UIApplication {
    class func topViewController(controller: UIViewController? = UIApplication.shared.keyWindow?.rootViewController) -> UIViewController? {
        if let navigationController = controller as? UINavigationController {
            return topViewController(controller: navigationController.visibleViewController)
        }
        if let tabController = controller as? UITabBarController {
            if let selected = tabController.selectedViewController {
                return topViewController(controller: selected)
            }
        }
        if let presented = controller?.presentedViewController {
            return topViewController(controller: presented)
        }
        return controller
    }
}
