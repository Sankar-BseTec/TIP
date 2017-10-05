//
//  AppDelegate.swift
//  TechNavioInsightsPlatform
//
//  Created by Sankar on 24/08/17.
//  Copyright © 2017 TechNavio. All rights reserved.
//

import UIKit
import CoreData

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var tabBarController: UITabBarController?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        UIApplication.shared.statusBarStyle = .lightContent
        /*self.window = UIWindow(frame:UIScreen.main.bounds)
        let homeVC = HomeViewController(nibName:"HomeViewController", bundle:nil)
        let navi    = UINavigationController()
        navi.isNavigationBarHidden = true
        navi.viewControllers = [homeVC]
        self.window!.rootViewController = navi
        self.window?.makeKeyAndVisible()
*/
        self.callStartPage()
        return true
    }

    func callStartPage() {
        
        self.window = UIWindow(frame:UIScreen.main.bounds)
        
        let hVC = HomeViewController(nibName: "HomeViewController", bundle: nil)
        hVC.tabBarItem.image = UIImage(named: "Home")
        
        let nVC = NewsViewController(nibName: "NewsViewController", bundle: nil)
        nVC.tabBarItem.image = UIImage(named: "News")
        
        let qVC = QuestionViewController(nibName: "QuestionViewController", bundle: nil)
        qVC.tabBarItem.image = UIImage(named: "Question")
        
        let aVC = AccountViewController(nibName: "AccountViewController", bundle: nil)
        aVC.tabBarItem.title = "Account Info"
        aVC.tabBarItem.image = UIImage(named: "Account")
        
        let homeTabBarItem:UITabBarItem = UITabBarItem(title: "Home", image: UIImage(named: "InHome")?.withRenderingMode(UIImageRenderingMode.alwaysOriginal), selectedImage: UIImage(named: "Home"))
        hVC.tabBarItem = homeTabBarItem

        let newsTabBarItem:UITabBarItem = UITabBarItem(title: "News", image: UIImage(named: "InNews")?.withRenderingMode(UIImageRenderingMode.alwaysOriginal), selectedImage: UIImage(named: "News"))
        nVC.tabBarItem = newsTabBarItem

        let quesTabBarItem:UITabBarItem = UITabBarItem(title: "As a Question", image: UIImage(named: "InQuestion")?.withRenderingMode(UIImageRenderingMode.alwaysOriginal), selectedImage: UIImage(named: "Question"))
        qVC.tabBarItem = quesTabBarItem

        let accTabBarItem:UITabBarItem = UITabBarItem(title: "Account Info", image: UIImage(named: "InAccount")?.withRenderingMode(UIImageRenderingMode.alwaysOriginal), selectedImage: UIImage(named: "Account"))
        aVC.tabBarItem = accTabBarItem

        self.tabBarController = UITabBarController()
        self.tabBarController!.setViewControllers([hVC,nVC,qVC,aVC], animated: false);
        
        
        // Set color of background tabBar
        UITabBar.appearance().backgroundColor = UIColor(hex : "03a7d5")//UIColor(hex: "6EA943")
        UITabBar.appearance().backgroundImage = UIImage()
        UITabBar.appearance().shadowImage = UIImage()
        
        // to avoid blue color selection on image
        self.tabBarController?.tabBar.tintColor = UIColor.white
        //self.tabBarController?.tabBar.barTintColor = UIColor(hex: "6EA943")
        
        UITabBarItem.appearance().setTitleTextAttributes([NSForegroundColorAttributeName : UIColor(hex: "b7d5a2")], for: .normal)
         UITabBarItem.appearance().setTitleTextAttributes([NSForegroundColorAttributeName : UIColor.white], for: .selected)
        
        let navigationController = UINavigationController(rootViewController: self.tabBarController!)
        navigationController.isNavigationBarHidden = true
        self.window!.rootViewController = navigationController
        self.window!.makeKeyAndVisible()

        
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
        let container = NSPersistentContainer(name: "TechNavioInsightsPlatform")
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

