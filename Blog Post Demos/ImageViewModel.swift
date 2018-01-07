//
//  ImageViewModel.swift
//  Blog Post Demos
//
//  Created by Alex Curran on 07/01/2018.
//  Copyright © 2018 Alex Curran. All rights reserved.
//

import Foundation

class ImageViewModelFactory {

    func viewModel(from images: [Image]) -> ImageViewModel {
        let sources = images.flatMap { image -> ImageSource? in
            if let uiImage = image.image {
                return InMemoryImageSource(uiImage: uiImage)
            }
            return nil
        }
        return ImageViewModel(imageSources: sources)
    }

}

struct ImageViewModel {
    let imageSources: [ImageSource]
}
