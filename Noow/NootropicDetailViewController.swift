//
//  NootropicDetailViewController.swift
//  Noow
//
//  Created by Wim Van Renterghem on 14/03/2017.
//  Copyright © 2017 vrwim. All rights reserved.
//

import UIKit

class NootropicDetailViewController: UIViewController {
	
	var nootropic: Nootropic!

    override func viewDidLoad() {
        super.viewDidLoad()

		let improveButton = UIBarButtonItem(title: "Improve", style: .plain, target: self, action: #selector(improveTapped))
		navigationItem.rightBarButtonItem = improveButton
    }
	
	func improveTapped() {
		print("improve this nootropic")
	}

}
