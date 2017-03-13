//
//  NootropicListViewController.swift
//  Noow
//
//  Created by Wim Van Renterghem on 14/03/2017.
//  Copyright © 2017 vrwim. All rights reserved.
//

import UIKit

class NootropicListViewController: UIViewController {
	
	@IBOutlet weak var tableView: UITableView!
	
	var nootropics: [Nootropic]!

    override func viewDidLoad() {
        super.viewDidLoad()
		
		tableView.register(NootropicTableViewCell.nib, forCellReuseIdentifier: NootropicTableViewCell.key)
		
		do {
			let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
			nootropics = try context.fetch(Nootropic.fetchRequest())
		} catch {
			print("Fetching Failed")
		}
		
		let addNoot = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addTapped))
		navigationItem.rightBarButtonItem = addNoot
    }
	
	func addTapped() {
		
	}
}

extension NootropicListViewController: UITableViewDataSource, UITableViewDelegate {
	
	public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return nootropics.count
	}
	
	public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: NootropicTableViewCell.key)!
		cell.textLabel?.text = nootropics[indexPath.row].name
		return cell
	}
	
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "nootropicDetail") as! NootropicDetailViewController
		vc.nootropic = nootropics[indexPath.row]
		navigationController?.pushViewController(vc, animated: true)
		
		tableView.deselectRow(at: indexPath, animated: true)
	}
}
