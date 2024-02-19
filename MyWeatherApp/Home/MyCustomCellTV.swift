//
//  MyCustomCellTV.swift
//  MyWeatherApp
//
//  Created by Владислав Наумов on 19.02.2024.
//

import UIKit

class MyCustomCellTV: UITableViewCell {
    
    var cellCustom: UITableViewCell = {
        let cell = UITableViewCell()
        cell.layer.cornerRadius = 10
        return cell
    }()
    
    public var cloudImageView = UIImageView()
    
    public var MinlabelView:UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20)
        return label
    }()
    
    public var MaxlabelView:UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20)
        return label
    }()
    
    public var cityLabelView: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20)
        return label
    }()
    
    public var cityLabelViewNamed: UILabel = {
        let label = UILabel()
        label.text = "Город:"
        label.font = UIFont.systemFont(ofSize: 20)
        label.textColor = .systemGray
        return label
    }()
    
    public var tempLabelView: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 55)
        return label
    }()
    
    func setupCellCustomView() {
        cellCustom.translatesAutoresizingMaskIntoConstraints = false
        cellCustom.layer.masksToBounds = true
        NSLayoutConstraint.activate([
            cellCustom.topAnchor.constraint(equalTo: topAnchor),
            cellCustom.leadingAnchor.constraint(equalTo: leadingAnchor),
            cellCustom.bottomAnchor.constraint(equalTo: bottomAnchor),
            cellCustom.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
    
    func setupCloudImageView() {
        
        cloudImageView.translatesAutoresizingMaskIntoConstraints = false
        cloudImageView.layer.cornerRadius = 15
        cloudImageView.layer.masksToBounds = true
        NSLayoutConstraint.activate([
            cloudImageView.topAnchor.constraint(equalTo: topAnchor),
            cloudImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            cloudImageView.bottomAnchor.constraint(equalTo: bottomAnchor),
            cloudImageView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
    
    func setupCityLabelView() {
        
        cityLabelView.translatesAutoresizingMaskIntoConstraints = false
        cityLabelView.layer.masksToBounds = true
        NSLayoutConstraint.activate([
            cityLabelView.topAnchor.constraint(equalTo: topAnchor,constant: 5),
            cityLabelView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 25),
            cityLabelView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 25),
            cityLabelView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -150)
        ])
    }
    
    func setupCityLabelViewNamed() {
        
        cityLabelViewNamed.translatesAutoresizingMaskIntoConstraints = false
        cityLabelViewNamed.layer.masksToBounds = true
        NSLayoutConstraint.activate([
            cityLabelViewNamed.topAnchor.constraint(equalTo: topAnchor,constant: 5),
            cityLabelViewNamed.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 25),
            cityLabelViewNamed.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -35),
            cityLabelViewNamed.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -150)
        ])
    }
    
    func setupTempLabelView() {
        
        tempLabelView.translatesAutoresizingMaskIntoConstraints = false
        tempLabelView.layer.masksToBounds = true
        NSLayoutConstraint.activate([
            tempLabelView.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            tempLabelView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 200),
            tempLabelView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0),
            tempLabelView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10)
        ])
    }
    
    func setupMinLabelView() {
        
        MinlabelView.translatesAutoresizingMaskIntoConstraints = false
        MinlabelView.layer.masksToBounds = true
        NSLayoutConstraint.activate([
            MinlabelView.topAnchor.constraint(equalTo: topAnchor, constant: -15),
            MinlabelView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 340),
            MinlabelView.bottomAnchor.constraint(equalTo: bottomAnchor,constant: -5),
            MinlabelView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10)
        ])
    }
    
    func setupMaxLabelView() {
        
        MaxlabelView.translatesAutoresizingMaskIntoConstraints = false
        MaxlabelView.layer.masksToBounds = true
        NSLayoutConstraint.activate([
            MaxlabelView.topAnchor.constraint(equalTo: topAnchor, constant: 35),
            MaxlabelView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 340),
            MaxlabelView.bottomAnchor.constraint(equalTo: bottomAnchor,constant: -5),
            MaxlabelView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10)
        ])
    }
    
    func addSubviews() {
        addSubview(cloudImageView)
        addSubview(cellCustom)
        addSubview(cityLabelView)
        addSubview(tempLabelView)
        addSubview(MinlabelView)
        addSubview(MaxlabelView)
        addSubview(cityLabelViewNamed)
    }
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubviews()
        setupCloudImageView()
        setupCityLabelView()
        setupTempLabelView()
        setupCellCustomView()
        setupMinLabelView()
        setupMaxLabelView()
        setupCityLabelViewNamed()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


