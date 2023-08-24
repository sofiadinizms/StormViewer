//
//  ViewController.swift
//  StormViewer
//
//  Created by sofiadinizms on 24/08/23.
//

import UIKit

class ViewController: UITableViewController {
    
    /// That pictures array will be created when the ViewController screen is created, and exist for as long as the screen exists
    var pictures = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()

        
        navigationItem.title = "Storm Viewer"
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
    
    }
    
    ///That means “send back the number of pictures in our array,” so we’re asking that there be as many table rows as there are pictures.
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pictures.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        ///To save CPU time and RAM, iOS only creates as many rows as it needs to work. When one rows moves off the top of the screen, iOS will take it away and put it into a reuse queue ready to be recycled into a new row that comes in from the bottom. This means you can scroll through hundreds of rows a second, and iOS can behave lazily and avoid creating any new table view cells – it just recycles the existing ones.
        ///That creates a new constant called cell by dequeuing a recycled cell from the table. We have to give it the identifier of the cell type we want to recycle, so we enter the same name we gave Interface Builder: “Picture”. We also pass along the index path that was requested; this gets used internally by the table view.
        let cell = tableView.dequeueReusableCell(withIdentifier: "Picture", for: indexPath)
        //it gives the text label of the cell the same text as a picture in our array.
        ///The cell has a property called textLabel, but it’s optional: there might be a text label, or there might not be – if you had designed your own, for example. Rather than write checks to see if there is a text label or not, Swift lets us use a question mark – textLabel? – to mean “do this only if there is an actual text label there, or do nothing otherwise.”
        
        ///We want to set the label text to be the name of the correct picture from our pictures array, and that’s exactly what the code does. indexPath.row will contain the row number we’re being asked to load, so we’re going to use that to read the corresponding picture from pictures, and place it into the cell’s text label.
//        var content = cell.defaultContentConfiguration()
//        content.text = pictures[indexPath.row]
//        print("POOPOPO")
//        cell.contentConfiguration = content
        cell.textLabel?.text = pictures[indexPath.row]
        
        return cell
    }


}

