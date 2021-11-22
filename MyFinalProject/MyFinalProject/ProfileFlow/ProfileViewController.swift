//
//  ProfileViewController.swift
//  MyFinalProject
//
//  Created by Максим on 22.11.2021.
//

import UIKit

class ProfileViewController:UIViewController{
    
    var user = User()
    
    enum ViewMode{
        case edit
        case view
    }
    var mode = ViewMode.edit
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var surnameTextField: UITextField!
    @IBOutlet weak var bioTextView: UITextView!
    @IBOutlet weak var agreeWithTermsAndCondLabel: UILabel!
    @IBOutlet weak var agreeSwitch: UISwitch!
    @IBOutlet weak var modeButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    @IBAction func switchModeButton(_ sender: Any) {
        if mode == .view{
           setupUIForViewMode()
            
        }else{
           setupUIForEditMode()
       }
    }
    
    @IBAction func agreeSwitch(_ sender: UISwitch) {
        if !sender.isOn{
        modeButton.isEnabled = false
    }else {
        modeButton.isEnabled = true
    }
    }
    
    private func setup(){
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(hideKeyboard)))
        modeButton.setTitle("Edit", for: .normal)
        modeButton.isEnabled = true
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(notification: )), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    private func setupUIForEditMode(){
        modeButton.setTitle("Save", for: .normal)
        modeButton.isEnabled = false
        emailTextField.isEnabled = true
        nameTextField.isEnabled = true
        surnameTextField.isEnabled = true
        bioTextView.isUserInteractionEnabled = true
        agreeWithTermsAndCondLabel.isHidden = false
        agreeSwitch.isHidden = false
        agreeSwitch.isOn = false
        mode = .view

    }
    
    private func setupUIForViewMode(){
        modeButton.setTitle("Edit", for: .normal)
        emailTextField.isEnabled = false
        nameTextField.isEnabled = false
        surnameTextField.isEnabled = false
        bioTextView.isUserInteractionEnabled = false
        agreeWithTermsAndCondLabel.isHidden = true
        agreeSwitch.isHidden = true
        agreeSwitch.isOn = false
        mode = .edit
        user.email = emailTextField.text!
        user.name = nameTextField.text!
        user.surname = surnameTextField.text!
        user.bio = bioTextView.text!
    }
    
    @objc private func hideKeyboard(){
        self.view.endEditing(true)
    }

    @objc private func keyboardWillShow(notification:NSNotification){
        if let keyboardFrame:NSValue = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue{
            let keyboardHeight = keyboardFrame.cgRectValue.height
            scrollView.contentOffset = CGPoint(x: 0, y: keyboardHeight)
        }
        
        
    }
    
    @objc private func keyboardWillHide(){
        self.view.frame.origin.y = 0
        scrollView.contentOffset = CGPoint.zero
    }
    
}
