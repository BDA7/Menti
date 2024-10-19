//
//  ViewController.swift
//  TestingApp
//
//  Created by Данила Бондаренко on 12.10.2024.
//

import UIKit
import SnapKit


class ViewController: UIViewController {
    let imageView = UIImageView()
    let labelCouner = UILabel()
    let minusButton = UIButton()
    let containerView = UIView()
    let plusButton = UIButton()
    let secondContainer = UIView()
    let multButton = UIButton()
    let divButton = UIButton()
    let zeroValueButton = UIButton()
    var switcher = UISegmentedControl()
    var counter: Int = 0

    let photos: [String] = ["michaelImage", "longMichael"]
    

    override func viewDidLoad() {
        super.viewDidLoad()
        makeImageView()
        makeLabelCounter()
        makeContainer()
        makeMinusButton()
        makePlusButton()
        makeSecondContainer()
        makeMultButton()
        makeDivButton()
        makeZeroValueButton()
        makeSwither()
    }
    
    func makeImageView() {
        imageView.image = UIImage(named: "michaelImage")
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = 30
        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor = .black
        view.addSubview(imageView)
        imageView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(64)
            make.centerX.equalToSuperview()
            make.width.equalTo(100)
            make.height.equalTo(120)
            
        }
    }
    
    func makeLabelCounter() {
        labelCouner.text = "Каунтер: 0"
        labelCouner.textColor = .black
        view.addSubview(labelCouner)
        labelCouner.snp.makeConstraints { make in
            make.top.equalTo(imageView.snp.bottom).offset(16)
            make.centerX.equalToSuperview()
            
        }
    }
    
    func makeContainer() {
        view.addSubview(containerView)
        containerView.snp.makeConstraints { make in
            make.top.equalTo(labelCouner.snp.bottom).offset(16)
            make.centerX.equalToSuperview()
            
        }
    }

    func makeMinusButton() {
        minusButton.setTitle("-", for: .normal)
        minusButton.setTitleColor( .white, for: .normal)
        minusButton.layer.masksToBounds = true
        minusButton.layer.cornerRadius = 20
        minusButton.backgroundColor = .blue
        minusButton.addTarget(self, action: #selector (MinusButtonTapped), for: .touchUpInside)
        containerView.addSubview(minusButton)
        minusButton.snp.makeConstraints { make in
            make.top.leading.bottom.equalToSuperview()
            make.width.height.equalTo(40)
        }
    }

    func makePlusButton() {
        plusButton.setTitle("+", for: .normal)
        plusButton.setTitleColor( .black, for: .normal)
        plusButton.layer.masksToBounds = true
        plusButton.layer.cornerRadius = 20
        plusButton.backgroundColor = .green
        plusButton.addTarget(self, action: #selector (plusButtonTapped), for: .touchUpInside)
        containerView.addSubview(plusButton)
        plusButton.snp.makeConstraints { make in
            make.top.trailing.bottom.equalToSuperview()
            make.width.height.equalTo(40)
            make.leading.equalTo(minusButton.snp.trailing).offset(8)
        }
    }
    
    func makeSecondContainer() {
        view.addSubview(secondContainer)
        secondContainer.snp.makeConstraints { make in
            make.top.equalTo(containerView.snp.bottom).offset(16)
            make.centerX.equalToSuperview()
            
        }
    }
    
    func makeMultButton() {
        multButton.setTitle("*", for: .normal)
        multButton.setTitleColor( .white, for: .normal)
        multButton.layer.masksToBounds = true
        multButton.layer.cornerRadius = 20
        multButton.backgroundColor = .black
        multButton.addTarget(self, action: #selector (multButtonTapped), for: .touchUpInside)
        secondContainer.addSubview(multButton)
        multButton.snp.makeConstraints { make in
            make.top.trailing.bottom.equalToSuperview()
            make.width.height.equalTo(40)
        }
    }
    
    func makeDivButton() {
        divButton.setTitle("/", for: .normal)
        divButton.setTitleColor( .white, for: .normal)
        divButton.layer.masksToBounds = true
        divButton.layer.cornerRadius = 20
        divButton.backgroundColor = .black
        divButton.addTarget(self, action: #selector (divButtonTapped), for: .touchUpInside)
        secondContainer.addSubview(divButton)
        divButton.snp.makeConstraints { make in
            make.top.leading.bottom.equalToSuperview()
            make.width.height.equalTo(40)
            make.trailing.equalTo(multButton.snp.leading).offset(-8)
        }
    }
    
    func makeZeroValueButton() {
        zeroValueButton.setTitle("0", for: .normal)
        zeroValueButton.setTitleColor( .white, for: .normal)
        zeroValueButton.layer.masksToBounds = true
        zeroValueButton.layer.cornerRadius = 12
        zeroValueButton.backgroundColor = .black
        zeroValueButton.addTarget(self, action: #selector (zeroValueButtonTapped), for: .touchUpInside)
        view.addSubview(zeroValueButton)
        zeroValueButton.snp.makeConstraints { make in
            make.top.equalTo(secondContainer.snp.bottom).offset(16)
            make.width.equalTo(secondContainer.snp.width)
            make.centerX.equalToSuperview()
        }
    }
    
    func makeSwither() {
        switcher = UISegmentedControl(items: photos)
        switcher.addTarget(self, action: #selector(segmentAction), for: .valueChanged)
        switcher.selectedSegmentIndex = 0
        view.addSubview(switcher)

        switcher.snp.makeConstraints {
            $0.top.equalTo(zeroValueButton.snp.bottom).offset(16)
            $0.centerX.equalToSuperview()
        }
    }
    
    @objc
    func MinusButtonTapped() {
        counter -= 1
        labelCouner.text = "Каунтер: \(counter) "
    }
    @objc
    func plusButtonTapped() {
        counter += 1
        labelCouner.text = "Каунтер: \(counter) "
    }
    @objc
    func multButtonTapped() {
        counter *= 2
        labelCouner.text = "Каунтер: \(counter) "
    }
    @objc
    func divButtonTapped() {
        counter /= 2
        labelCouner.text = "Каунтер: \(counter) "
    }
    @objc
    func zeroValueButtonTapped() {
        counter = 0
        labelCouner.text = "Каунтер: \(counter) "
    }

    @objc
    func segmentAction(sender: UISegmentedControl) {
        let index = sender.selectedSegmentIndex
        let photoName = photos[index]
        imageView.image = UIImage(named: photoName)
    }

}
#Preview {
    ViewController()
}
