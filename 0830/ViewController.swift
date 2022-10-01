//
//  ViewController.swift
//  0830
//
//  Created by Xie on 2022/8/30.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var imageViewRabbit: UIImageView!
    
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    @IBOutlet weak var alphaSlider: UISlider!
    
    @IBOutlet weak var redLable: UILabel!
    @IBOutlet weak var greenLable: UILabel!
    @IBOutlet weak var blueLable: UILabel!
    @IBOutlet weak var alphaLable: UILabel!
    
    @IBOutlet weak var redSwich: UISwitch!
    @IBOutlet weak var greenSwich: UISwitch!
    @IBOutlet weak var blueSwich: UISwitch!
    @IBOutlet weak var alphaSwich: UISwitch!
    
    @IBOutlet weak var randomButton: UIButton!
    @IBOutlet weak var resetButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
//米飛圖片加上圓角及邊匡
        imageViewRabbit.layer.cornerRadius = 50
        imageViewRabbit.layer.borderWidth = 3
        imageViewRabbit.layer.borderColor = UIColor.brown.cgColor
//背景圖片加上圓角
        backgroundImage.layer.cornerRadius = 50
    }
//設定顏色數值
    @IBAction func changeColor(_ sender: UISlider) {
        changeColor()
        
        redLable.text = String(format: "%.2f", redSlider.value)
        greenLable.text = String(format: "%.2f", greenSlider.value)
        blueLable.text = String(format: "%.2f", blueSlider.value)
        alphaLable.text = String(format: "%.2f", alphaSlider.value)
    }
//設定按鈕打開時，點選隨機，亂數出現顏色並顯示數值；當某個按鈕關閉時，只可調整其他打開按鈕的顏色條
    @IBAction func randomColor(_ sender: Any) {
        if redSwich.isOn == false{
            redSlider.value = 0
            redLable.text = "0.00"
        } else {
            redSlider.setValue(.random(in: 0...1), animated: true)
            redLable.text = String(format: "%.2f", redSlider.value)
        }
        if greenSwich.isOn == false{
            greenSlider.value = 0
            greenLable.text = "0.00"
        } else{
            greenSlider.setValue(.random(in: 0...1), animated: true)
            greenLable.text = String(format: "%.2f", greenSlider.value)
        }
        if blueSwich.isOn == false{
            blueSlider.value = 0
            blueLable.text = "0.00"
        } else{
            blueSlider.setValue(.random(in: 0...1), animated: true)
            blueLable.text = String(format: "%.2f", blueSlider.value)
        }
        if alphaSwich.isOn == false{
            alphaSlider.value = 0
            alphaLable.text = "0.00"
        } else{
            alphaSlider.setValue(.random(in: 0...1), animated: true)
            alphaLable.text = String(format: "%.2f", alphaSlider.value)
        }
        changeColor()
    }
//顏色條及數值歸零
    @IBAction func resetButton(_ sender: UIButton) {
        changeColor()
        
        redSlider.value = 0
        greenSlider.value = 0
        blueSlider.value = 0
        alphaSlider.value = 0
        redLable.text = "0.00"
        greenLable.text = "0.00"
        blueLable.text = "0.00"
        alphaLable.text = "0.00"
    }
//當關掉按鈕時，顏色條及數值全部歸零
    @IBAction func swichPress(_ sender: UISwitch) {
        if sender == redSwich{
            redSlider.isEnabled = sender.isOn
            changeColor()
            redSlider.value = 0
            redLable.text = "0.00"
        }else if sender == greenSwich{
            greenSlider.isEnabled = sender.isOn
            changeColor()
            greenSlider.value = 0
            greenLable.text = "0.00"
        }else if sender == blueSwich{
            blueSlider.isEnabled = sender.isOn
            changeColor()
            blueSlider.value = 0
            blueLable.text = "0.00"
        }else if sender == alphaSwich{
            changeColor()
            alphaSlider.isEnabled = sender.isOn
            alphaSlider.value = 0
            alphaLable.text = "0.00"
        }
    }
    
    //設定重複使用的顏色公式
    func changeColor(){
        imageViewRabbit.backgroundColor = UIColor(red: CGFloat(redSlider.value), green: CGFloat(greenSlider.value), blue: CGFloat(blueSlider.value), alpha: CGFloat(alphaSlider.value))
    }
}
