//
//  WorldTimeTableViewCell.swift
//  worldCloc
//
//  Created by Дмитрий Яновский on 18.02.24.
//

import UIKit

class WorldTimeTableViewCell: UITableViewCell {
        
        lazy var nameCityLabel: UILabel = {
            let nameCityLabel = UILabel()
            nameCityLabel.translatesAutoresizingMaskIntoConstraints = false
            return nameCityLabel
        }()
        
        lazy var utcLabel: UILabel = {
            let utcLabel = UILabel()
            utcLabel.translatesAutoresizingMaskIntoConstraints = false
            return utcLabel
        }()
        
        lazy var timeCityLabel: UILabel = {
            let timeCityLabel = UILabel()
            timeCityLabel.translatesAutoresizingMaskIntoConstraints = false
            return timeCityLabel
        }()
        
        override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
            super.init(style: style, reuseIdentifier: reuseIdentifier)
            setupLabel()
           
        }
        
        required init?(coder: NSCoder) {
            super.init(coder: coder)
        }
      
        func setupLabel(){
            addSubview(nameCityLabel)
            addSubview(utcLabel)
            addSubview(timeCityLabel)
            
            NSLayoutConstraint.activate([
                nameCityLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
                timeCityLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
                timeCityLabel.topAnchor.constraint(equalTo: topAnchor, constant: 50),
                utcLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
                utcLabel.bottomAnchor.constraint(equalTo: nameCityLabel.topAnchor, constant: -20),
                utcLabel.topAnchor.constraint(equalTo: topAnchor,constant: 20)])
        }
        
        func configure(timezone: WorldTime) {
            nameCityLabel.text = timezone.name
            timeCityLabel.text = timezone.time
            utcLabel.text = timezone.UTC
        }

    }
