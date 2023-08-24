//
//  ViewController.swift
//  StormViewer
//
//  Created by sofiadinizms on 24/08/23.
//

import UIKit

class ViewController: UIViewController {
    
    /// That pictures array will be created when the ViewController screen is created, and exist for as long as the screen exists
    var pictures = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        /// declares a constant called fm and assigns it the value returned by FileManager.default. This is a data type that lets us work with the filesystem, and in our case we'll be using it to look for files.
        let fm = FileManager.default
        
        ///declares a constant called path that is set to the resource path of our app's bundle. Remember, a bundle is a directory containing our compiled program and all our assets. So, this line says, "tell me where I can find all those images I added to my app."
        let path = Bundle.main.resourcePath!
        
        ///declares a third constant called items that is set to the contents of the directory at a path. Which path? Well, the one that was returned by the line before. As you can see, Apple's long method names really does make their code quite self-descriptive! The items constant will be an array of strings containing filenames.
        let items = try! fm.contentsOfDirectory(atPath: path)
        
        for item in items{
            if item.hasPrefix("nssl"){
                pictures.append(item)
            }
        }
        
        print(pictures)
    }


}

