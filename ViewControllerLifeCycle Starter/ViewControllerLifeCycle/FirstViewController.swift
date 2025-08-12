//
//  FirstViewController.swift
//  ViewControllerLifeCycle
//
//

import UIKit

class FirstViewController: UIViewController {
    
    lazy var nextButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(goToNextViewController), for: .touchUpInside)
        button.setTitle("Next View Controller", for: .normal)
        button.setTitleColor(UIColor.black, for: .normal)
        return button
    }()
    
    //we use the load view if we setuo our views and constraints programatically
    //do not call super implementation and you must to create the root view
    override func loadView() {
        print("The load view has been called")
        let rootView = UIView()
        rootView.backgroundColor = UIColor.white
        rootView.addSubview(nextButton)
        nextButton.centerXAnchor.constraint(equalTo: rootView.centerXAnchor).isActive = true
        nextButton.centerYAnchor.constraint(equalTo: rootView.centerYAnchor).isActive = true
        view = rootView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
print("The view did laod called")
        // Do any additional setup after loading the view.
    }
    
    // view is about to appear bounds are not defined but not final
    // resume observors or any kind of running tasks
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("View will appear called")
   }
    
    //this is called when the subviews are about to laid
    // perfect place to change layer properties like the corner of radius
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        print("View will layout subviews called")
    }
    //this is when its visible to the user
    // perfect for starting an animation
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("View did appear called, Visible to user")
    }
    
    // this is called when the subviews have been laid
    //perfect place to change  layer properties like the cprner radius
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        print("View did layout subviews called")
    }

    
    //when view is about to disappear
    //stops timers or observors
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("View is about to disappear")
    }
    
    // The view is no longer visible, its disappeared
    //stop timers or observors
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("View did disappear called")
    }
    
    @objc func goToNextViewController() {
        let secondViewController = SecondViewController()
        secondViewController.modalPresentationStyle = .fullScreen
        present(secondViewController, animated: true)
    }

}
