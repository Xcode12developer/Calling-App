import UIKit
import StoreKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        button.addTarget(self, action: #selector(call), for: .touchUpInside)
        view.addSubview(button)
        view.addSubview(Field)
}
    private let button: UIButton = {
        let button = UIButton()
        button.setTitle("Call", for: .normal)
        if #available(iOS 13.0, *) {
            button.backgroundColor = .link
        } else {
            button.backgroundColor = .blue
        }
        button.layer.cornerRadius = 12
        button.setTitleColor(.white, for: .normal)
        button.frame = CGRect(x: 60, y: 300, width: 300, height: 50)
        return button
    }()
    
    private let Field: UITextField = {
        let field = UITextField()
        field.frame = CGRect(x: 60, y: 200, width: 300, height: 60)
        field.autocapitalizationType = .none
        field.autocorrectionType = .no
        field.returnKeyType = .done
        field.layer.cornerRadius = 12
        field.layer.borderWidth = 1
        field.layer.borderColor = UIColor.lightGray.cgColor
        field.placeholder = "Number or Email Here"
        field.backgroundColor = .lightText
        return field
        
    }()
    
    @objc func call() {
        Field.resignFirstResponder()
        guard let url = URL(string: "facetime-audio://\(Field.text as! String)") else {
            return
        }
        
        if UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
}

