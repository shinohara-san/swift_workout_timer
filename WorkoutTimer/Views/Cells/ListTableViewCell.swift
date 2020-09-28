//
//  ListTableViewCell.swift
//  WorkoutTimer
//
//  Created by Yuki Shinohara on 2020/09/28.
//

import UIKit

protocol ListTableViewCellDelegate {
    func moveToEdit()
}

class ListTableViewCell: UITableViewCell {
    static let identifier = "ListTableViewCell"
}
