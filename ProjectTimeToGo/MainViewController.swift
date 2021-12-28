//
//  MainViewController.swift
//  ProjectTimeToGo
//
//  Created by limyunhwi on 2021/12/21.
//

import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet weak var btnStart: UIButton!
    @IBOutlet weak var viewTop: UIImageView!
    
    var goal: Goal?
    let shap = CAShapeLayer()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        self.btnStart.layer.cornerRadius = 10
        self.btnStart.layer.shadowOffset = CGSize(width: 0, height: 4)
        self.btnStart.layer.shadowOpacity = 0.2
        
        addLayerCircleTimer()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    func addLayerCircleTimer() {
        let circlePath = UIBezierPath(arcCenter: view.center,
                                      radius: view.frame.height/7,
                                      startAngle: -(.pi/2),
                                      endAngle: .pi * 2,
                                      clockwise: true)
        
        let trackCircle = CAShapeLayer()
        trackCircle.fillColor = UIColor.clear.cgColor
        trackCircle.path = circlePath.cgPath
        trackCircle.lineWidth = 40
        trackCircle.strokeColor = UIColor(displayP3Red: 252/255, green: 251/255, blue: 238/255, alpha: 1).cgColor
        
        shap.path = circlePath.cgPath
        shap.lineWidth = 20
        shap.strokeColor = UIColor(displayP3Red: 243/255, green: 220/255, blue: 152/255, alpha: 1).cgColor
        shap.fillColor = UIColor.clear.cgColor
        
        view.layer.addSublayer(trackCircle)
        view.layer.addSublayer(shap)
    }
    
    @IBAction func tapBtnLeave(_ sender: UIButton) {
        let message = """
            나가면 지금까지 기록한 시간이 초기화됩니다.
            정말 나가시겠습니까?
            """
        let alert = UIAlertController(title: "나가기", message: message, preferredStyle: UIAlertController.Style.alert)
        let actionLeave = UIAlertAction(title: "네", style: UIAlertAction.Style.default) {
            _ in
            self.navigationController?.popToRootViewController(animated: true)
        }
        let actionStay = UIAlertAction(title: "계속하기", style: UIAlertAction.Style.default, handler: nil)
        
        alert.addAction(actionLeave)
        alert.addAction(actionStay)
        
        present(alert, animated: true, completion: nil)
    }
}
