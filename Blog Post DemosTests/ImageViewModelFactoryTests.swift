//
//  ImageViewModelFactoryTests.swift
//  Blog Post DemosTests
//
//  Created by Alex Curran on 07/01/2018.
//  Copyright © 2018 Alex Curran. All rights reserved.
//

import XCTest
@testable import Blog_Post_Demos

/**
 This pair of test and assertion are demoed in "Custom assertions in Swift",
 which can be found [here](https://medium.com/@amlcurran/custom-assertions-in-swift-3b91b413665e).

 Don't worry, the test should fail!

 Try changing the default value of the line parameter in assertFirstSource(...) to a number, and
 see how it changes where the assertion failure is reported.
 */
class ImageViewModelFactoryTests: XCTestCase {
    
    func testViewModelWhenAnImageHasUrlAndNoImageItReturnsANetworkImageSourceWithTheSameUrl() {
        let factory = ImageViewModelFactory()
        let expectedURL = URL(string: "https://www.google.com/image.png")!
        let image = Image(url: expectedURL, image: nil)

        let viewModel = factory.viewModel(from: [image])

        assertFirstSource(of: viewModel.imageSources, isNetworkWithURL: expectedURL)
    }

    func assertFirstSource(of imageSources: [ImageSource], isNetworkWithURL expectedURL: URL, file: StaticString = #file, line: UInt = 22) {
        if let imageSource = imageSources.first {
            if let networkImageSource = imageSource as? NetworkImageSource {
                XCTAssertEqual(networkImageSource.url, expectedURL, file: file, line: line)
            } else {
                XCTFail("ImageSource \(imageSource) isn’t expected type, NetworkImageSource", file: file, line: line)
            }
        } else {
            XCTFail("First image source was nil", file: file, line: line)
        }
    }
    
}
