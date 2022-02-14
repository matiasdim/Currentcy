//
//  RatesStyle.swift
//  Currentcy
//
//  Created by Matías  Gil Echavarría on 14/02/22.
//

import UIKit

struct RatesStyle {
    
    public typealias StyleClosure<T> = (T) -> Void
    
    var navigationStyle: StyleClosure<UINavigationController> = { navController in
        let theming = AppTheming()
        navController.navigationBar.barTintColor = theming.colors.main2
    }
    
    var searchController: StyleClosure<UISearchController> = { searchController in
//        searchController.searchBar.tintColor = .white
    }
    
    var mainView: StyleClosure<UIView> = { view in
        let theming = AppTheming()
        view.backgroundColor = theming.colors.main2
    }
    
    var cellStyle: StyleClosure <UIView> = { view in
        let theming = AppTheming()
        view.layer.cornerRadius = 5
        view.backgroundColor = theming.colors.main6
        view.layer.shadowOpacity = 0.5
        view.layer.shadowRadius = 1
        view.layer.shadowOffset = CGSize(width: 0, height: 2)
        view.layer.shadowColor = theming.colors.main3.cgColor
    }
    
    var cellTitle: StyleClosure <UILabel> = { label in
        let theming = AppTheming()
        label.font = theming.fonts.title2
        label.textColor = theming.colors.main4
    }
    
    var cellSubitle: StyleClosure <UILabel> = { label in
        let theming = AppTheming()
        label.font = theming.fonts.boldTitle3
        label.textColor = theming.colors.main7
    }
    
    var favoriteButton: StyleClosure<UIButton> = { button in
        let theming = AppTheming()
        let starImage = UIImage(named: "star")?
            .withRenderingMode(.alwaysOriginal)
            .withTintColor(theming.colors.main4)
        let filledStarImage = UIImage(named: "star.filled")?
            .withRenderingMode(.alwaysOriginal)
            .withTintColor(theming.colors.main4)
        
        button.setTitle("", for: .normal)
        button.setImage(starImage, for: .normal)
        button.setImage(filledStarImage, for: .selected)
        button.imageView?.contentMode = .scaleAspectFit
        button.imageEdgeInsets = UIEdgeInsets(top: 15.0, left: 15.0, bottom: 15.0, right: 15.0)
    }
}
