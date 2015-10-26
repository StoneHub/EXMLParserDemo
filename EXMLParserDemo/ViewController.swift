//
//  ViewController.swift
//  EXMLParserDemo
//
//  Created by Stone Zhang on 10/25/15.
//  Copyright © 2015 Stone. All rights reserved.
//

import UIKit
import EXMLParser

class ViewController: UIViewController, EXMLParserDelegate {
    var eparser: EXMLParser?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        eparser = EXMLParser.createWithEXMLParserDelegate(self)
        if let url = NSBundle.mainBundle().URLForResource("container", withExtension: "xml") {
            eparser!.parseXMLFileWithURL(url)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func didParseContainerXML(opfPath: String) {
        print(opfPath)
        if let url = NSBundle.mainBundle().URLForResource("Naip_9780307776587_epub_opf_r1", withExtension: "opf") {
            eparser!.parseXMLFileWithURL(url)
        }
    }
    
    func didParseOPFXML(epubContent: EpubContent) {
        let chapterId = epubContent.spine[0]
        let chapterHref = epubContent.manifest[chapterId]
        
        print(chapterHref)
    }


}

