//
//  main.swift
//  HW_QA_PDF_Generator_CL_30_11_22
//
//  Created by Aleksandr on 30.11.2022.
//


import Foundation

//import CoreGraphics
//import PDFKit
//import SwiftUI
//import AppKit

import Cocoa // imported in another module

var title = "title"
var strint = "this text is published"
var htmlt = "<font face=\'Futura\' color=\"SlateGray\"><h2>\(title)</h2></font><font face=\"Avenir\" color=\"SlateGray\"><h4>\(strint)</h4></font>"

let testsArr =
[
    "Igor",
    "Igor",
    "Igor",
    "Igor",
    "Igor",
]
let tests = "Igor"


print("Work!")
let par = "PDF - text"
print(par)
print(NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.allDomainsMask, true).first)
// let pdfContainer = init?(_ Provider: CGDataProvider)
//var pdfContainer =

/*
func printPdf () {
    do {
       // define bounds of PDF as the note text view
       //REPLACE
        let rect: NSRect = self.noteTextView.bounds
        //let rect = par
        
       // create the file path for the PDF
       if let dir = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.allDomainsMask, true).first {
            // add the note title to path
            let path = NSURL(fileURLWithPath: dir).appendingPathComponent("ExportedNote.pdf")
            // Create a PDF of the noteTextView and write it to the created filepath
            try self.noteTextView.dataWithPDF(inside: rect).write(to: path!)
       } else {
            print("Path format incorrect.") // never happens to me
       }

    } catch _ {
        print("something went wrong.") // never happens to me
    }
}
*/




func makePDF(markup: String) {
    let directoryURL = NSFileManager.defaultManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask)[0]
    let printOpts: [NSPrintInfo.AttributeKey: Any] = [NSPrintInfo.AttributeKey.jobDisposition: NSPrintInfo.JobDisposition.save, NSPrintInfo.AttributeKey.jobSavingURL: directoryURL]
    let printInfo = NSPrintInfo(dictionary: printOpts)
    printInfo.horizontalPagination = NSPrintingPaginationMode.AutoPagination
    printInfo.verticalPagination = NSPrintingPaginationMode.AutoPagination
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
 makePDF(markup: htmlt)

