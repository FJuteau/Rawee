//
//  ReaderViewController.swift
//  TabBarCoordinator
//
//  Created by François Juteau on 07/06/2018.
//  Copyright © 2018 vente-privee. All rights reserved.
//

import UIKit
import PDFKit

class ReaderViewController: UIViewController {

    static var instance: ReaderViewController {
        return ReaderViewController(nibName: "ReaderViewController", bundle: nil)
    }

    var pdfView: PDFView?

    override func viewDidLoad() {
        super.viewDidLoad()

        self.pdfView = PDFView(frame: view.frame)
        DispatchQueue.global(qos: .background).async {
            let pdfDocument: PDFDocument = PDFDocument(url: URL(string: "http://carlosicaza.com/swiftbooks/SwiftLanguage.pdf")!)!
            DispatchQueue.main.async {
                self.pdfView?.document = pdfDocument
            }
        }



        view.addSubview(pdfView!)
    }

}
