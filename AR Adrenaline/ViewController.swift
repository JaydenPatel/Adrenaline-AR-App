//
//  ViewController.swift
//  Adrenaline App - AR
//

import ARKit

let kStartingPosition = SCNVector3(0, -1, -0.6)
let kAnimationDurationMoving: TimeInterval = 0.2
let kMovingLengthPerLoop: CGFloat = 0.05
let kRotationRadianPerLoop: CGFloat = 0.2

class ViewController: UIViewController {
    @IBOutlet weak var sceneView: ARSCNView!

    //menu Outlets
    @IBOutlet weak var atomicRadii: UIButton!
    @IBOutlet var atomicRadiiCollection: [UIButton]!
    @IBOutlet var atomicInfo: [UITextView]!
    
    @IBOutlet weak var hydrogenInfo: UITextView!
    
    @IBOutlet weak var oxygenInfo: UITextView!
    
    @IBOutlet weak var carbonInfo: UITextView!
    
    @IBOutlet weak var nitrogenInfo: UITextView!
    

    //menu actions
    
    @IBAction func atomicRadiiAction(_ sender: UIButton) {
        atomicInfo.forEach { (textBox) in
            textBox.isHidden = true
        }
    
        bondLengthCollection.forEach { (option) in
            UIView.animate(withDuration: 0.25, animations: {
                option.isHidden = true
                self.view.layoutIfNeeded()
            })
        }
        
        bondInfo.forEach { (bondBox) in
            bondBox.isHidden = true
        }
        
        atomicRadiiCollection.forEach { (button) in
            UIView.animate(withDuration: 0.25, animations: {
                button.isHidden = !button.isHidden
                self.view.layoutIfNeeded()
            })
        }
    }
    
    @IBAction func hydrogenAction(_ sender: UIButton) {
        atomicInfo.forEach { (textBox) in
            textBox.isHidden = true
        }
        
        bondInfo.forEach { (bondBox) in
            bondBox.isHidden = true
        }
        
        UIView.animate(withDuration: 0.25, animations: {
            self.hydrogenInfo.isHidden = !self.hydrogenInfo.isHidden
            })
        }

    
    @IBAction func oxygenAction(_ sender: UIButton) {
        atomicInfo.forEach { (textBox) in
            textBox.isHidden = true
        }
        
        bondInfo.forEach { (bondBox) in
            bondBox.isHidden = true
        }
        
        UIView.animate(withDuration: 0.25, animations: {
            self.oxygenInfo.isHidden = !self.oxygenInfo.isHidden
        })
    }
    
    @IBAction func carbonAction(_ sender: UIButton) {
        atomicInfo.forEach { (textBox) in
            textBox.isHidden = true
        }
        
        bondInfo.forEach { (bondBox) in
            bondBox.isHidden = true
        }
        
        UIView.animate(withDuration: 0.25, animations: {
            self.carbonInfo.isHidden = !self.carbonInfo.isHidden
        })
    }
    
    
    @IBAction func nitrogenAction(_ sender: UIButton) {
        atomicInfo.forEach { (textBox) in
            textBox.isHidden = true
        }
        
        bondInfo.forEach { (bondBox) in
            bondBox.isHidden = true
        }
        
        UIView.animate(withDuration: 0.25, animations: {
            self.nitrogenInfo.isHidden = !self.nitrogenInfo.isHidden
        })
    }
    
    
    
    @IBOutlet weak var bondLength: UIButton!
    @IBOutlet var bondLengthCollection: [UIButton]!
    @IBOutlet var bondInfo: [UITextView]!
    
    
    @IBOutlet weak var CHText: UITextView!
    @IBOutlet weak var COText: UITextView!
    @IBOutlet weak var CNText: UITextView!
    @IBOutlet weak var CCText: UITextView!
    @IBOutlet weak var CDOUBLECText: UITextView!
    @IBOutlet weak var OHText: UITextView!
    @IBOutlet weak var NHText: UITextView!
    
    
    @IBAction func bondLengthAction(_ sender: UIButton) {
        atomicInfo.forEach { (textBox) in
            textBox.isHidden = true
        }
        
        atomicRadiiCollection.forEach { (button) in
            UIView.animate(withDuration: 0.25, animations: {
                button.isHidden = true
                self.view.layoutIfNeeded()
            })
        }
        
        bondInfo.forEach { (bondBox) in
            bondBox.isHidden = true
        }
        
        bondLengthCollection.forEach { (option) in
            UIView.animate(withDuration: 0.25, animations: {
                option.isHidden = !option.isHidden
                self.view.layoutIfNeeded()
            })
        }
    }
    
    
    @IBAction func CHAction(_ sender: UIButton) {
        bondInfo.forEach { (bondBox) in
            bondBox.isHidden = true
        }
        self.CHText.isHidden = false
        
    }
    
    
    @IBAction func COAction(_ sender: UIButton) {
        bondInfo.forEach { (bondBox) in
            bondBox.isHidden = true
        }
        
        self.COText.isHidden = false
    }
    
    @IBAction func CNAction(_ sender: UIButton) {
        bondInfo.forEach { (bondBox) in
            bondBox.isHidden = true
        }
        
        self.CNText.isHidden = false
    }
    
    @IBAction func CCAction(_ sender: UIButton) {
        bondInfo.forEach { (bondBox) in
            bondBox.isHidden = true
        }
        
        self.CCText.isHidden = false
    }
    
    @IBAction func CDoubleCAction(_ sender: UIButton) {
        bondInfo.forEach { (bondBox) in
            bondBox.isHidden = true
        }
        
        self.CDOUBLECText.isHidden = false
    }
    
    @IBAction func OHAction(_ sender: UIButton) {
        bondInfo.forEach { (bondBox) in
            bondBox.isHidden = true
        }
        
        self.OHText.isHidden = false
    }
    
    @IBAction func NHAction(_ sender: UIButton) {
        bondInfo.forEach { (bondBox) in
            bondBox.isHidden = true
        }
        
        self.NHText.isHidden = false
    }
    
    
    var molecule = Molecule()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupScene()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        setupConfiguration()
        addMolecule()
    }
    
    func addMolecule() {
        molecule.loadModel()
        molecule.position = kStartingPosition
        molecule.rotation = SCNVector4Zero
        sceneView.scene.rootNode.addChildNode(molecule)
    }
    
    // MARK: - setup
    func setupScene() {
        let scene = SCNScene()
        sceneView.scene = scene
    }
    
    func setupConfiguration() {
        let configuration = ARWorldTrackingConfiguration()
        sceneView.session.run(configuration)
    }
    
    
    @IBAction func rotateLeftLongPressed(_ sender: UILongPressGestureRecognizer) {
        let action = SCNAction.scale(by: 0.25, duration: 1)
        execute(action: action, sender: sender)
        
    }
    
    @IBAction func upLongPressed(_ sender: UILongPressGestureRecognizer) {
        let action = SCNAction.scale(by: 1.75, duration: 1)
        execute(action: action, sender: sender)
        
    }
    
    @IBAction func rotateRightLongPressed(_ sender: UILongPressGestureRecognizer) {
        let action = SCNAction.rotate(by: 6.28, around: SCNVector3(0, 0, -0.6), duration: 1)
        execute(action: action, sender: sender)    }
    

    

    private func execute(action: SCNAction, sender: UILongPressGestureRecognizer) {
        let loopAction = SCNAction.repeatForever(action)
        if sender.state == .began {
            molecule.runAction(loopAction)
        } else if sender.state == .ended {
            molecule.removeAllActions()
        }
    }
    
    private func deltas() -> (sin: CGFloat, cos: CGFloat) {
        return (sin: kMovingLengthPerLoop * CGFloat(sin(molecule.eulerAngles.y)), cos: kMovingLengthPerLoop * CGFloat(cos(molecule.eulerAngles.y)))
    }
}
