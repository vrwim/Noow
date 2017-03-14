//
//  AppDelegate.swift
//  Noow
//
//  Created by Wim Van Renterghem on 14/03/2017.
//  Copyright © 2017 vrwim. All rights reserved.
//

import UIKit
import CoreData

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

	var window: UIWindow?

	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
		// Override point for customization after application launch.
		
		if !UserDefaults.standard.bool(forKey: "launched") {
			UserDefaults.standard.set(true, forKey: "launched")
			
			let context = persistentContainer.viewContext
			
			// Load a basic set of nootropics and vendors here.
			// TODO: eventually load this from server
			let adrafinil = Nootropic(context: context)
			adrafinil.name = "Adrafinil"
			adrafinil.image = "https://www.ceretropic.com/161-large_default/adrafinil-powder.jpg"
			adrafinil.effects = "promotes vigilance (alertness), attention, wakefulness, mood, and other parameters, particularly in the elderly."
			adrafinil.history = "Adrafinil was discovered in 1974 by two chemists working for the French pharmaceutical company Laboratoires Lafon who were screening compounds in search of analgesics.[14] Pharmacological studies of adrafinil instead revealed psychostimulant-like effects such as hyperactivity and wakefulness in animals.[14] The substance was first tested in humans, specifically for the treatment of narcolepsy, in 1977–1978.[14] Introduced by Lafon (now Cephalon), it reached the market in France in 1984,[4] and for the treatment of narcolepsy in 1985.[14][15]\n\nIn 1976, two years after the discovery of adrafinil, modafinil, its active metabolite, was discovered.[14] Modafinil appeared to be more potent than adrafinil in animal studies, and was selected for further clinical development, with both adrafinil and modafinil eventually reaching the market.[14] Modafinil was first approved in France in 1994, and then in the United States in 1998.[15] Lafon was acquired by Cephalon in 2001.[16] As of September 2011, Cephalon has discontinued Olmifon, its adrafinil product, while modafinil continues to be marketed.[4]"
			adrafinil.recommendedDosage = "250-400 mg"
			
			let tianeptine = Nootropic(context: context)
			tianeptine.name = "Tianeptine"
			tianeptine.image = "https://www.ceretropic.com/162-home_default/tianeptine-solution.jpg"
			tianeptine.effects = "treatment of major depressive disorder, although it may also be used to treat asthma or irritable bowel syndrome."
			tianeptine.history = "Under the code names JNJ-39823277 and TPI-1062, tianeptine was previously under development for the treatment of major depressive disorder in the U.S. and Belgium.[45] Phase I clinical trials were completed in Belgium and the U.S. in May and June 2009, respectively.[45] For reasons that are unclear, development of tianeptine was discontinued in both countries in January 2012.[45]"
			tianeptine.recommendedDosage = "12.5 mg"
			
			let memantine = Nootropic(context: context)
			memantine.name = "Memantine"
			memantine.image = "https://www.ceretropic.com/163-home_default/memantine-solution.jpg"
			memantine.effects = "Alzheimer's disease medication acting on the glutamatergic system by blocking NMDA receptors."
			memantine.history = "Memantine was first synthesized and patented by Eli Lilly and Company in 1968 as an anti-diabetic agent, but it was ineffective at lowering blood sugar. Later it was discovered to have CNS activity, and was developed by Merz for dementia in Germany; the NMDA activity was discovered after clinical trials had already begun. Memantine was first marketed for dementia in Germany in 1989 under the name Axura.[41]\n\nIn the US, some CNS activities were discovered at Children's Hospital of Boston in 1995, and Children's licensed patents covering uses of memantine outside the field of ophthalmology to Neurobiological Technologies (NTI) in 1995.[42] In 1998 NTI amended its agreement with Children's to allow Merz to take over development.[43]\n\nIn 2000 Merz partnered with Forest to develop the drug for Alzheimers in the U.S. under the name Namenda.[41]\n\nIn 2000 Merz partnered with Suntory for the Japanese market and with Lundbeck for other markets including Europe;[44] the drug was originally marketed by Lundbeck under the name Ebixa.[41] It is generic in many countries and is marketed under many brand names worldwide.[1]\n\nSales of the drug reached $1.8 billion for 2014.[45] The cost of Namenda is $269 to $489 a month.[46]"
			memantine.recommendedDosage = "5mg"
			
			let ceretropic = Vendor(context: context)
			ceretropic.name = "Ceretropic"
			ceretropic.website = "https://www.ceretropic.com"
			ceretropic.addToNootropics(adrafinil)
			ceretropic.addToNootropics(tianeptine)
			ceretropic.addToNootropics(memantine)
			
			saveContext()
		}
		
		return true
	}

	func applicationWillResignActive(_ application: UIApplication) {
		// Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
		// Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
	}

	func applicationDidEnterBackground(_ application: UIApplication) {
		// Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
		// If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
	}

	func applicationWillEnterForeground(_ application: UIApplication) {
		// Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
	}

	func applicationDidBecomeActive(_ application: UIApplication) {
		// Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
	}

	func applicationWillTerminate(_ application: UIApplication) {
		// Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
		// Saves changes in the application's managed object context before the application terminates.
		self.saveContext()
	}

	// MARK: - Core Data stack

	lazy var persistentContainer: NSPersistentContainer = {
	    /*
	     The persistent container for the application. This implementation
	     creates and returns a container, having loaded the store for the
	     application to it. This property is optional since there are legitimate
	     error conditions that could cause the creation of the store to fail.
	    */
	    let container = NSPersistentContainer(name: "Noow")
	    container.loadPersistentStores(completionHandler: { (storeDescription, error) in
	        if let error = error as NSError? {
	            // Replace this implementation with code to handle the error appropriately.
	            // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
	             
	            /*
	             Typical reasons for an error here include:
	             * The parent directory does not exist, cannot be created, or disallows writing.
	             * The persistent store is not accessible, due to permissions or data protection when the device is locked.
	             * The device is out of space.
	             * The store could not be migrated to the current model version.
	             Check the error message to determine what the actual problem was.
	             */
	            fatalError("Unresolved error \(error), \(error.userInfo)")
	        }
	    })
	    return container
	}()

	// MARK: - Core Data Saving support

	func saveContext () {
	    let context = persistentContainer.viewContext
	    if context.hasChanges {
	        do {
	            try context.save()
	        } catch {
	            // Replace this implementation with code to handle the error appropriately.
	            // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
	            let nserror = error as NSError
	            fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
	        }
	    }
	}

}

