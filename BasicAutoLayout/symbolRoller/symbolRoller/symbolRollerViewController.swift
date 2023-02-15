//
//  symbolRollerViewController.swift
//  symbolRoller

import UIKit

class symbolRollerViewController: UIViewController {
    
    let symbols: [String] = ["sun.min", "moon", "cloud", "wind", "snowflake"]


    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var button: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        button.tintColor = UIColor.systemPink
        reload()

        // Do any additional setup after loading the view.
    }
    
    func reload(){   // 버튼눌렀을때의 작동 함수
        // symbol에서 하나를 임의로 추출해서, 이미지와 텍스트를 설정한다
        let symbol = symbols.randomElement()!
        imageView.image = UIImage(systemName:symbol)
        label.text = symbol
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    // 버튼의 액션 추가
    @IBAction func buttonTapped(_ sender: Any) {
        reload()
    }
    
    
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
