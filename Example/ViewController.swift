//
//  ViewController.swift
//  SCAlphaWebView
//
//  Created by scorpiolin on 2018/3/11.
//  Copyright © 2018 sc. All rights reserved.
//

import UIKit
import SCAlphaWebView

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, SCAlphaWebViewDelegate {
    var alphaWebView: SCAlphaWebView?
    var tableview: UITableView?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.blue
        // add tableview
        self.tableview = UITableView(frame: self.view.bounds)
        self.tableview?.delegate = self
        self.tableview?.dataSource = self
        self.view.addSubview(self.tableview!)
        // add webview
        self.alphaWebView = SCAlphaWebView(frame: self.view.bounds)
        self.alphaWebView?.alphaThreshold = 0.6
        self.alphaWebView?.loadUrl(customUrl: "/Users/scorpiolin/project/SCAlphaWebView/SCAlphaWebView/Resources/demo.html")
        self.alphaWebView?.alphaDelegate = self
        self.view.addSubview(self.alphaWebView!)
    }

    func alphaWebViewDidRemove(_ webView: SCAlphaWebView) {
        webView.removeFromSuperview()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let label = UILabel()
        label.textColor = UIColor.black
        label.frame = CGRect(x: 20, y: 20, width: 150, height: 50)
        label.text = "cell at index: \(indexPath.row)"
        cell.backgroundColor = UIColor.lightGray
        cell.addSubview(label)
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90;
    }


}
