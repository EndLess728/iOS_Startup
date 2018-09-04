//
//  ViewController.swift
//  Image Picker
//
//  Created by MacMini on 9/4/18.
//  Copyright © 2018 Mantucom.noobpicker. All rights reserved.
//

import UIKit

class ViewController: UIViewController ,UIImagePickerControllerDelegate ,UINavigationControllerDelegate {

    @IBOutlet weak var imageViewPicker: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


        
    @IBAction func chooseImage(sender: AnyObject) {
        
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        
        let actionSheet = UIAlertController(title: "Photo Source", message: "Choose a Source", preferredStyle: .ActionSheet )
        
        actionSheet.addAction(UIAlertAction(title: "Camera", style: .Default, handler: { (actioin:UIAlertAction) in
            imagePickerController.sourceType = .Camera
            self.presentViewController(imagePickerController, animated: true, completion: nil)
        }))
        
        actionSheet.addAction(UIAlertAction(title: "Photo Library", style: .Default, handler: { (actioin:UIAlertAction) in
            imagePickerController.sourceType = .PhotoLibrary
            self.presentViewController(imagePickerController, animated: true, completion: nil)
        }))
        
        actionSheet.addAction(UIAlertAction(title: "Cancel", style: .Cancel, handler: nil))
        
        self.presentViewController(actionSheet, animated: true, completion: nil)
        
    }
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        let image = info[UIImagePickerControllerOriginalImage] as! UIImage
        
        imageViewPicker.image = image
        
        picker.dismissViewControllerAnimated(true, completion: nil)
        
    }
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        picker.dismissViewControllerAnimated(true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

