//
//  TimerViewController.swift
//  WorkoutTimer
//
//  Created by Yuki Shinohara on 2020/09/28.
//

import UIKit

final class TimerViewController: UIViewController {
    
    var countNum = 10
    
    private let timerTitle: UILabel = {
        let label = UILabel()
        label.text = "ここにタイトル"
        label.textAlignment = .center
        label.textColor = .systemRed
        return label
    }()
    
    private var countLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 88, weight: .bold)
        return label
    }()
    
    private let stackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.alignment = .fill
        stack.distribution = .fillEqually
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private let setView: UIView = {
        let uiView = UIView()
        uiView.backgroundColor = .black
        uiView.translatesAutoresizingMaskIntoConstraints = false
        return uiView
    }()
    
    private let setTitle: UILabel = {
        let label = UILabel()
        label.backgroundColor = .white
        label.textColor = .black
        label.text = "セット"
        label.textAlignment = .center
        return label
    }()
    
    private let setValue: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.text = "10"
        label.font = .systemFont(ofSize: 40, weight: .semibold)
        label.textAlignment = .center
        return label
    }()
    
    private let amountView: UIView = {
        let uiView = UIView()
        uiView.backgroundColor = .white
        uiView.translatesAutoresizingMaskIntoConstraints = false
        return uiView
    }()
    
    private let amountTitle: UILabel = {
        let label = UILabel()
        label.backgroundColor = .black
        label.textColor = .white
        label.text = "回数"
        label.textAlignment = .center
        return label
    }()
    
    private let amountValue: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.text = "8"
        label.font = .systemFont(ofSize: 40, weight: .semibold)
        label.textAlignment = .center
        return label
    }()
    
    private let startButton: UIButton = {
        let button = UIButton()
        button.setTitle("Start", for: .normal)
        button.backgroundColor = .black
        button.setTitleColor(.white, for: .normal)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .secondarySystemBackground
        title = "Timer"
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add,
                                                            target: self,
                                                            action: #selector(didTapAdd))
        
        let views = [timerTitle, countLabel, stackView,startButton]
        for x in views {
            view.addSubview(x)
        }
        stackView.addArrangedSubview(setView)
        stackView.addArrangedSubview(amountView)
        
        setView.addSubview(setTitle)
        setView.addSubview(setValue)
        amountView.addSubview(amountTitle)
        amountView.addSubview(amountValue)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        countLabel.text = String(countNum)
    }
    
    @objc private func didTapAdd(){
        let vc = AddNewTimerViewController()
        let navVC = UINavigationController(rootViewController: vc)
        navVC.modalPresentationStyle = .fullScreen
        present(navVC, animated: true, completion: nil)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        guard let navHeight = navigationController?.navigationBar.height else {return}
        timerTitle.frame = CGRect(x: 30,
                                  y: navHeight + 40,
                                  width: view.width - 60,
                                  height: 52)
        
        countLabel.frame = CGRect(x: 30, y: timerTitle.bottom + 20, width: timerTitle.width, height: 200)
        
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            stackView.topAnchor.constraint(equalTo: countLabel.bottomAnchor, constant: 20),
            stackView.bottomAnchor.constraint(equalTo: startButton.topAnchor, constant: -20)
        ])
        
        setTitle.frame = CGRect(x: 10,
                                y: 10,
                                width: setView.width - 20,
                                height: (setView.height - 20)/5)
        
        setValue.frame = CGRect(x: 10,
                                y: setTitle.bottom,
                                width: setTitle.width,
                                height: (setView.height - 20) * 4/5)
        
        amountTitle.frame = CGRect(x: 10,
                                   y: 10,
                                   width: amountView.width - 20,
                                   height: (amountView.height - 20)/5)
        
        amountValue.frame = CGRect(x: 10,
                                   y: amountTitle.bottom,
                                   width: amountTitle.width,
                                   height: (amountView.height - 20) * 4/5)
        
        guard let tabHeight = tabBarController?.tabBar.height else {return}
        startButton.frame = CGRect(x: 30,
                                   y: view.height - tabHeight - 72,
                                   width: view.width - 60,
                                   height: 52)
    }
}
