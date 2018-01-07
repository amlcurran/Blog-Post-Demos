//
//  ImageSources.swift
//  Blog Post Demos
//
//  Created by Alex Curran on 07/01/2018.
//  Copyright © 2018 Alex Curran. All rights reserved.
//

import UIKit

protocol ImageSource {

}

struct NetworkImageSource: ImageSource {
    let url: URL
}

struct InMemoryImageSource: ImageSource {
    let uiImage: UIImage
}
