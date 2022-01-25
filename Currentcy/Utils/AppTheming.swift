//
//  AppTheming.swift
//  Currentcy
//
//  Created by Matías  Gil Echavarría on 25/01/22.
//

import UIKit

struct AppTheming {
    /// General app colors
    let general = GeneralColors()
    
    struct GeneralColors {
        var main: UIColor { return #colorLiteral(red: 0.9176470588, green: 0.9215686275, blue: 0.9294117647, alpha: 1) }
        var main2: UIColor { return #colorLiteral(red: 0, green: 0.4117647059, blue: 0.537254902, alpha: 1) }
        var main3: UIColor { return #colorLiteral(red: 0.6392156863, green: 0.7294117647, blue: 0.7647058824, alpha: 1) }
        var main4: UIColor { return #colorLiteral(red: 0, green: 0.4392156863, blue: 0.5647058824, alpha: 1) }
        var main5: UIColor { return #colorLiteral(red: 0.003921568627, green: 0.6549019608, blue: 0.7607843137, alpha: 1) }
        
        var secondary: UIColor { return #colorLiteral(red: 0.1333333333, green: 0.1333333333, blue: 0.1333333333, alpha: 1) }
        var secondary2: UIColor { return #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1) }
        var secondary3: UIColor { return #colorLiteral(red: 0.1098039216, green: 0.3647058824, blue: 0.6, alpha: 1) }
        var secondary4: UIColor { return #colorLiteral(red: 0, green: 0.4392156863, blue: 0.5647058824, alpha: 1) }
        var secondary5: UIColor { return #colorLiteral(red: 0.003921568627, green: 0.6549019608, blue: 0.7607843137, alpha: 1) }
    }
    
}
