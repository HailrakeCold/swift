//
//  SecondViewController.swift
//  ViewControllerLifeCycle
//
//

import UIKit

class SecondViewController: UIViewController {
    
    lazy var previousButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(goToPreviousViewController), for: .touchUpInside)
        button.setTitle("Previous View Controller", for: .normal)
        button.setTitleColor(UIColor.black, for: .normal)
        return button
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor.black
        label.text = "Second View Controller"
        label.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        return label
    }()
    
    override func loadView() {
        let rootView = UIView()
        rootView.backgroundColor = UIColor.white
        rootView.addSubview(previousButton)
        rootView.addSubview(titleLabel)
        previousButton.centerXAnchor.constraint(equalTo: rootView.centerXAnchor).isActive = true
        previousButton.centerYAnchor.constraint(equalTo: rootView.centerYAnchor).isActive = true
        titleLabel.topAnchor.constraint(equalTo: rootView.safeAreaLayoutGuide.topAnchor, constant: 60).isActive = true
        titleLabel.centerXAnchor.constraint(equalTo: rootView.centerXAnchor).isActive = true
        view = rootView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        print("next view did load")
        // Do any additional setup after loading the view.
    }
    
    // view is about to appear bounds are not defined but not final
    // resume observors or any kind of running tasks
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("NExt View will appear called")
   }
    
    //this is called when the subviews are about to laid
    // perfect place to change layer properties like the corner of radius
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        print("NExt View will layout subviews called")
    }
    //this is when its visible to the user
    // perfect for starting an animation
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("NExt View did appear called, Visible to user")
    }
    
    // this is called when the subviews have been laid
    //perfect place to change  layer properties like the cprner radius
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        print("NExt View did layout subviews called")
    }

    
    //when view is about to disappear
    //stops timers or observors
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("NExt View is about to disappear")
    }
    
    // The view is no longer visible, its disappeared
    //stop timers or observors
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("NExt View did disappear called")
    }

    @objc func goToPreviousViewController() {
        dismiss(animated: true)
    }

}
