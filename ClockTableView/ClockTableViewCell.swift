//
//  ClockTableViewCell.swift
//  ClockTableView
//
//  Created by Tim Davies on 28/09/2018.
//  Copyright © 2018 Tim Davies. All rights reserved.
//

import UIKit

class ClockTableViewCell: UITableViewCell {
    
    @objc let toggleSwitch: UISwitch = UISwitch(frame: .zero)
    
    var labelTextColor : UIColor {
        get {
            return toggleSwitch.isOn ? .white : .darkGray
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        backgroundColor = .black
        
        textLabel?.font = .systemFont(ofSize: 48, weight: .light)
        textLabel?.textColor = labelTextColor
        
        detailTextLabel?.font = .systemFont(ofSize: 16)
        detailTextLabel?.textColor = labelTextColor
        
        toggleSwitch.addTarget(self, action: #selector(enableAlarm), for: .valueChanged)
        accessoryView = toggleSwitch
        
        selectionStyle = .none
    }

    // Observe the toggle switch
    @objc func enableAlarm() {
        
        // Lets "animate" the label colour
        UIView.transition(with: self, duration: 0.2, options: .transitionCrossDissolve, animations: { [unowned self] in
            self.textLabel?.textColor = self.labelTextColor
            self.detailTextLabel?.textColor = self.labelTextColor
        })
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
}
