//
//  main.swift
//  swiftgl2
//
//  Created by Manuel Fernández Baños on 28/5/19.
//  Copyright © 2019 Manuel Fernández Baños. All rights reserved.
//

import AppKit
import Cocoa
import OpenGL

func computeScreenCenteredPosition(_ windowWidth : CGFloat, _ windowHeight : CGFloat) -> NSRect {
    
    let screen : NSScreen = NSScreen.main!
    
    let screenFrame : NSRect = screen.frame;
    
    let windowWidth : CGFloat = 200.0
    let windowHeight : CGFloat = 200.0
    let windowX = screenFrame.origin.x + 0.5 * screenFrame.width - 0.5 * windowWidth;
    let windowY = screenFrame.origin.y + 0.5 * screenFrame.height - 0.5 * windowHeight;
    
    return NSRect(x: windowX, y: windowY, width: windowWidth, height: windowHeight)
}

func makeMainWindow() -> NSWindow {
    
    var window: NSWindow
    let windowWidth : CGFloat = 200.0
    let windowHeight : CGFloat = 200.0
    let windowRect : NSRect = computeScreenCenteredPosition(windowWidth, windowHeight)
    
    let windowStyleMask = NSWindow.StyleMask(rawValue: NSWindow.StyleMask.titled.rawValue
            | NSWindow.StyleMask.closable.rawValue
            | NSWindow.StyleMask.resizable.rawValue)
    
    window =  NSWindow.init(contentRect: windowRect, styleMask: windowStyleMask, backing: NSWindow.BackingStoreType.buffered, defer: true)
    
    let openglview = OpenGLView(frame: windowRect)
    (window.contentView!).addSubview(openglview!)
    
    return window;
}

let app : NSApplication = NSApplication.shared

let mainWindow = makeMainWindow()
mainWindow.makeKeyAndOrderFront(app)

app.run()



