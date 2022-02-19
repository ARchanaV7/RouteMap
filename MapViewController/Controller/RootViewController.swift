//
//  RootViewController.swift
//  Rently Application (iOS)
//
//  Created by Archana Venugopal on 19/02/22.
//

import Foundation
import UIKit

class RootViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let storyBoard = UIStoryboard(name: "Stroyboard", bundle: nil)
        let mainViewController = storyBoard.instantiateViewController(withIdentifier: "mapViewController")
        self.navigationController?.pushViewController(mainViewController, animated: true)
    }
    
}
