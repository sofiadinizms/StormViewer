//
//  DetailViewController.swift
//  StormViewer
//
//  Created by sofiadinizms on 12/09/23.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet var imageView: UIImageView!
    ///will hold the name of the image to load. it needs to be an optional string because when the view controller is first created it won’t exist. We’ll be setting it straight away, but it still starts off life empty.
    var selectedImage: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ///The first line is what checks and unwraps the optional in selectedImage. If for some reason selectedImage is nil (which it should never be, in theory) then the imageView.image line will never be executed. If it has a value, it will be placed into imageToLoad, then passed to UIImage and loaded.
        if let imageToLoad = selectedImage {
            imageView.image  = UIImage(named: imageToLoad)
        }

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
