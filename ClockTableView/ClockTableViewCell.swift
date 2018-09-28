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
            return toggleSwitch.isOn ? .white : UIColor(white: 0.5, alpha: 1)
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        backgroundColor = UIColor(white: 0.09, alpha: 1)
        
        // Set up our labels
        textLabel?.font = .systemFont(ofSize: 64, weight: .thin)
        textLabel?.textColor = labelTextColor
        
        detailTextLabel?.font = .systemFont(ofSize: 18)
        detailTextLabel?.textColor = labelTextColor
        
        // Add the switch
        toggleSwitch.tintColor = UIColor(white: 0.2, alpha: 1)
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
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        // Lazyily decrease space between detail and text labels
        detailTextLabel?.frame.origin.y -= 10
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
}
