//
//  LeftToRightSegue.swift
//  Drip-V1
//
//  Created by William Pintas on 11/9/18.
//  Copyright © 2018 William Pintas. All rights reserved.
//

import UIKit

class LeftToRightSegue: UIStoryboardSegue {
    override func perform() {
        self.source.navigationController?.pushViewController(self.destination, animated: true)
    }
}
