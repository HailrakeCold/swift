//
//  ViewControllerLifeCycle
//
//

import UIKit

class MainViewController: UIViewController {
  
    
    deinit{
        print("main vc did deinit")
    }
    //loadview is called to create or load the view. Do not use this with storyboards
//    override func loadView() {
        
 //   }
    
// this is called only once bounds are not yet finalized
    // perfect tp do setup work like init the UI and performing network calls
    override func viewDidLoad() {
        super.viewDidLoad()
        print("View did load called")
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
    
    @IBAction func goToNextViewController(_ sender: Any) {
        performSegue(withIdentifier: "NextSegue", sender: nil)
    }
    


}

