//
//  TimerViewController.swift
//  WorkoutTimer
//
//  Created by Yuki Shinohara on 2020/09/28.
//

import UIKit

final class TimerViewController: UIViewController {
    
    private let timerTitle: UILabel = {
        let label = UILabel()
        label.text = "ここにタイトル"
        return label
    }()
    
    private var countLabel: UILabel = {
        let label = UILabel()
        label.text = "20"
        return label
    }()
    
    private let stackView: UIStackView = {
        //横
        let stack = UIStackView()
        return stack
    }()
    
    private let setLabel: UILabel = {
        let label = UILabel()
        label.text = "20"
        return label
    }()
    
    private let amountLabel: UILabel = {
        let label = UILabel()
        label.text = "20"
        return label
    }()
    
    private let startButton: UIButton = {
        let button = UIButton()
        button.setTitle("Start", for: .normal)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .secondarySystemBackground
        title = "Timer"
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add,
                                                            target: self,
                                                            action: #selector(didTapAdd))
        
        let views = [timerTitle, countLabel, stackView, setLabel, amountLabel,startButton]
        for x in views {
            view.addSubview(x)
        }
    }
   
    @objc private func didTapAdd(){
        let vc = AddNewTimerViewController()
        let navVC = UINavigationController(rootViewController: vc)
        navVC.modalPresentationStyle = .fullScreen
        present(navVC, animated: true, completion: nil)
    }
}
