//
//  AuthService.swift
//  Elite-Training-App
//
//  Created by Elmer Astudillo on 9/27/17.
//  Copyright © 2017 Elmer Astudillo. All rights reserved.
//

import Foundation
import FirebaseAuth
import UIKit


struct AuthService {
    
    // Signs in as an authenticated user on Firebase
    static func signIn(controller : UIViewController, email: String, password: String, completion: @escaping (FIRUser?) -> Void){
        
        Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
            DispatchQueue.main.async {
//                SVProgressHUD.show(withStatus: "Logging in...")
            }
            if let error = error {
                loginErrors(error: error, controller: controller)
                DispatchQueue.main.async {
//                    SVProgressHUD.dismiss()
                }
                return completion(nil)
            }
            
            DispatchQueue.main.async {
//                SVProgressHUD.dismiss()
            }
            return completion(result?.user)
        }
    }
    
    // Allows you to reset password for an email
    static func passwordReset(email: String){
        Auth.auth().sendPasswordReset(withEmail: email) { error in
            if let error = error {
                print("email error for: \(email)")
                print("error: \(error.localizedDescription)")
                return
            }
        }
    }
    
    /*
     ================= NOTE ====================
     This allows the user to return back to the
     login screen (storyboard) when the user has
     logged out.
     ===========================================
     */
    static func authListener(viewController view : UIViewController) -> AuthStateDidChangeListenerHandle {
        let authHandle = Auth.auth().addStateDidChangeListener() { (auth, user) in
            guard user == nil else { return }
            // TODO: Implement where to go once user logs out
//            let loginViewController = UIStoryboard.initialViewController(for: .login)
//            view.view.window?.rootViewController = loginViewController
//            view.view.window?.makeKeyAndVisible()
        }
        return authHandle
    }
    
    /*
     ================= NOTE ====================
     Use this when you have confirmed the user
     has logged out. Make sure to use this with
     authListener.
     ===========================================
     */
    static func removeAuthListener(authHandle : AuthStateDidChangeListenerHandle?){
        if let authHandle = authHandle {
            Auth.auth().removeStateDidChangeListener(authHandle)
        }
    }

    
    private static func loginErrors(error : Error, controller : UIViewController){
        switch (error.localizedDescription) {
        case "The email address is badly formatted.":
            let invalidEmailAlert = UIAlertController(title: "Invalid Email", message:
                "It seems like you have put in an invalid email or password.", preferredStyle: UIAlertControllerStyle.alert)
            invalidEmailAlert.addAction(UIAlertAction(title: "Okay", style: UIAlertActionStyle.default,handler: nil))
            controller.present(invalidEmailAlert, animated: true, completion: nil)
            break;
        case "The password is invalid or the user does not have a password.":
            let wrongPasswordAlert = UIAlertController(title: "Wrong Password", message:
                "It seems like you have entered the wrong password.", preferredStyle: UIAlertControllerStyle.alert)
            wrongPasswordAlert.addAction(UIAlertAction(title: "Okay", style: UIAlertActionStyle.default,handler: nil))
            controller.present(wrongPasswordAlert, animated: true, completion: nil)
            break;
        case "There is no user record corresponding to this identifier. The user may have been deleted.":
            let wrongPasswordAlert = UIAlertController(title: "No Account Found", message:
                "We couldn't find an account that corresponds to that email.", preferredStyle: UIAlertControllerStyle.alert)
            wrongPasswordAlert.addAction(UIAlertAction(title: "Okay", style: UIAlertActionStyle.default,handler: nil))
            controller.present(wrongPasswordAlert, animated: true, completion: nil)
            break;
        default:
            let loginFailedAlert = UIAlertController(title: "Error Logging In", message:
                "There was an error logging you in. Please try again soon.", preferredStyle: UIAlertControllerStyle.alert)
            loginFailedAlert.addAction(UIAlertAction(title: "Okay", style: UIAlertActionStyle.default,handler: nil))
            controller.present(loginFailedAlert, animated: true, completion: nil)
            break;
        }
    }
    
    private static func signUpErrors(error: Error, controller: UIViewController) {
        print(error.localizedDescription)
        switch(error.localizedDescription) {
        case "The email address is badly formatted.":
            let invalidEmail = UIAlertController(title: "Email is not properly formatted.", message:
                "Please enter a valid email to sign up with..", preferredStyle: UIAlertControllerStyle.alert)
            invalidEmail.addAction(UIAlertAction(title: "Okay", style: UIAlertActionStyle.default,handler: nil))
            controller.present(invalidEmail, animated: true, completion: nil)
            break;
        case "The email address is already in use by another account.":
            let invalidEmail = UIAlertController(title: "The email address is already in use by another account.", message:
                "Please enter a valid email to sign up with.", preferredStyle: UIAlertControllerStyle.alert)
            invalidEmail.addAction(UIAlertAction(title: "Okay", style: UIAlertActionStyle.default,handler: nil))
            controller.present(invalidEmail, animated: true, completion: nil)
            break;
        default:
            let generalErrorAlert = UIAlertController(title: "We are having trouble signing you up.", message:
                "We are having trouble signing you up, please try again soon.", preferredStyle: UIAlertControllerStyle.alert)
            generalErrorAlert.addAction(UIAlertAction(title: "Okay", style: UIAlertActionStyle.default,handler: nil))
            controller.present(generalErrorAlert, animated: true, completion: nil)
            break;
        }
    }
}
