//
//  AlphaHeaderView.swift
//  Navigation
//
//  Created by Sergey RZHEVSKIY on 12.09.2022.
//

import Foundation
import UIKit

class AlphaHeaderView: UIView {

    override init(frame: CGRect) {
        super.init(frame: .zero)

    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }


    let avatarImageView: UIImageView = {
       let avatarImageView = UIImageView()
       avatarImageView.translatesAutoresizingMaskIntoConstraints = false
       avatarImageView.image = UIImage(named: "IMG_5935.jpeg")
   //    avatarImageView.layer.cornerRadius = 75
    //   avatarImageView.layer.borderWidth = 3
    //   avatarImageView.clipsToBounds = true
    //   avatarImageView.layer.borderColor = UIColor.white.cgColor
       return avatarImageView
   }()

    var alphaView: UIView = {
   let view = UIView()
       view.translatesAutoresizingMaskIntoConstraints = false
       //view.backgroundColor = .systemGray
       view.backgroundColor = .systemGreen
       view.alpha = 0
       return view
   }()

    var closeButton: UIButton = {
       let button = UIButton()
       button.layer.cornerRadius = 20
       button.clipsToBounds = true
       button.setBackgroundImage(UIImage(systemName: "xmark"), for: .normal)
       button.translatesAutoresizingMaskIntoConstraints = false
       button.alpha = 0
       return button
   }()
    

    }


