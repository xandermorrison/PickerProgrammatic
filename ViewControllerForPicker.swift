import UIKit

class MainScreen: UIViewController {
    
    var number = 0 {
        didSet {
            // Check if picker is updating variable
            print(number)
        }
    }
    let nums: [Int] = Array(1..<1001)

    override func viewDidLoad() {
        super.viewDidLoad()
        let picker = setUpPicker()
        view.addSubview(picker)

        // Do any additional setup after loading the view.
    }
    
    func setUpPicker() -> UIPickerView {
        let p = UIPickerView()
        p.delegate = self
        
        return p
    }
}


extension MainScreen: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent: Int) -> Int {
        return nums.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return String(nums[row])
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        number = nums[row]
    }
}
