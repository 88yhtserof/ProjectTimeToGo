//
//  ViewController.swift
//  ProjectTimeToGo
//
//  Created by limyunhwi on 2021/12/17.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var imgLazyOwner: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.topItem?.title = ""
        
        tapImageLazyOwner()
    }
    
    func tapImageLazyOwner() {
        let recognizer = UITapGestureRecognizer(target: self, action: #selector(actionTapImageLazyOwner))
        imgLazyOwner.isUserInteractionEnabled = true
        imgLazyOwner.addGestureRecognizer(recognizer)
    }
    
    @objc func actionTapImageLazyOwner() {
        guard let lazyOwnerDetailsViewController = self.storyboard?.instantiateViewController(identifier: "LazyOwnerDetailsViewController") as? LazyOwnerDetailsViewController else {return}
        lazyOwnerDetailsViewController.modalTransitionStyle = .flipHorizontal
        
        self.present(lazyOwnerDetailsViewController, animated: true, completion: nil)
    }

}

