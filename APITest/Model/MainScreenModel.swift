//
//  MainScreenModel.swift
//  APITest
//
//  Created by MacBook Pro on 31.10.2021.
//

import UIKit

enum MainScreenModel: Int, CaseIterable {
    case one
    case two
    case three
    case four
    case five
    case six
    case seven
    case eight
    case nine
    case ten
    case eleven
    case twelve
    case thirteen
    case fourteen
    case fiveteen
    case sixtenn
    case seventeen
    case eighteen
    case nineteen
    case twenty
    
    var title: String {
        switch self {
        case .one: return "One"
        case .two: return "Two"
        case .three: return "Three"
        case .four: return "Four"
        case .five: return "Five"
        case .six: return "Six"
        case .seven: return "Seven"
        case .eight: return "Eight"
        case .nine: return "Nine"
        case .ten: return "Ten"
        case .eleven: return "Eleven"
        case .twelve: return "Twelve"
        case .thirteen: return "Thirteen"
        case .fourteen: return "Fourteen"
        case .fiveteen: return "Fiveteen"
        case .sixtenn: return "Sixtenn"
        case .seventeen: return "Seventeen"
        case .eighteen: return "Eighteen"
        case .nineteen: return "Nineteen"
        case .twenty: return "Twenty"
        }
    }
}

