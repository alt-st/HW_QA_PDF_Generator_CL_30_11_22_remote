//
//  container_for_convert_to_new_version_swift.swift
//  HW_QA_PDF_Generator_CL_30_11_22
//
//  Created by Aleksandr on 02.12.2022.
//

import Foundation

//import CoreGraphics
//import PDFKit
//import SwiftUI
//import AppKit

import Cocoa // imported in another module


func makePDF() {
    init(murkup: String) {
    markup: ""
        
    }
  //let directoryURL = NSFileManager.defaultManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask)[0]
    let directoryURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
    let printOpts: [NSPrintInfo.AttributeKey: Any] = [NSPrintInfo.AttributeKey.jobDisposition: NSPrintInfo.JobDisposition.save, NSPrintInfo.AttributeKey.jobSavingURL: directoryURL]
    let printInfo = NSPrintInfo(dictionary: printOpts)
    printInfo.horizontalPagination = NSPrintInfo.PaginationMode.automatic
    printInfo.verticalPagination = NSPrintInfo.PaginationMode.automatic
    printInfo.topMargin = 20.0
    printInfo.leftMargin = 20.0
    printInfo.rightMargin = 20.0
    printInfo.bottomMargin = 20.0

    let view = NSView(frame: NSRect(x: 0, y: 0, width: 570, height: 740))

    if let htmlData = markup.dataUsingEncoding(NSUTF8StringEncoding) {
        if let attrStr = NSAttributedString(HTML: htmlData, options: [NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType], documentAttributes: nil) {
            let frameRect = NSRect(x: 0, y: 0, width: 570, height: 740)
            let textField = NSTextField(frame: frameRect)
            textField.attributedStringValue = attrStr
            view.addSubview(textField)

            let printOperation = NSPrintOperation(view: view, printInfo: printInfo)
            printOperation.showsPrintPanel = false
            printOperation.showsProgressPanel = false
            printOperation.run()
        }
    }
}
