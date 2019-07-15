//
//  OpenGLView.swift
//  swiftgl2
//
//  Created by Manuel Fernández Baños on 3/6/19.
//  Copyright © 2019 Manuel Fernández Baños. All rights reserved.
//

import Foundation
import Cocoa
import OpenGL

class OpenGLView: NSOpenGLView {
    
    required init?(coder decoder: NSCoder) {
        
        super.init(coder: decoder)
        
    }
    
    override init?(frame frameRect: NSRect) {
        
        let openGLPixelFormatAttributes : [NSOpenGLPixelFormatAttribute] = [
            UInt32(NSOpenGLPFAAccelerated),
            UInt32(NSOpenGLPFAColorSize), UInt32(32),
            UInt32(NSOpenGLPFADoubleBuffer),
            UInt32(NSOpenGLPFAOpenGLProfile),
            UInt32(NSOpenGLProfileVersion3_2Core),
            UInt32(0)
        ]
        
        self.pixelFormat = NSOpenGLPixelFormat(attributes: openGLPixelFormatAttributes)
        
        super.init(frame: frameRect, pixelFormat: pixelFormat)
    }
}
