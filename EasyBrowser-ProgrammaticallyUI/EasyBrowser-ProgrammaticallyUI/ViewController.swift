//
//  ViewController.swift
//  EasyBrowser-ProgrammaticallyUI
//
//  Created by Heang Ly on 8/10/21.
//

import UIKit
import WebKit

class ViewController: UIViewController, WKNavigationDelegate{
    var webView: WKWebView!

    override func loadView() {
        webView = WKWebView()
        webView.navigationDelegate = self
        view = webView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }

    func configureUI() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Open", style: .plain, target: self, action: #selector(openTapped))
        let url = URL(string: "https://www.hackingwithswift.com")!
        webView.load(URLRequest(url: url))
        webView.allowsBackForwardNavigationGestures = true
      
    }
    
    
    @objc func openTapped(){
        let ac = UIAlertController(title: "Open page..", message: nil, preferredStyle: .actionSheet)
        ac.addAction(UIAlertAction(title: "apple.com", style: .default, handler: openPage))
        ac.addAction(UIAlertAction(title: "hackingwithswift.com", style: .default, handler: openPage))
        ac.addAction(UIAlertAction(title: "cancel", style: .cancel, handler: nil))
        present(ac, animated: true, completion: nil)
    }
    
    func openPage(action: UIAlertAction){
        let url = URL(string: "https://www.\(action.title!)")!
        webView.load(URLRequest(url: url))
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        title = webView.title
    }

}

