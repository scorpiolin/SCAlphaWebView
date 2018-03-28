//
// Created by scorpiolin on 2018/3/11.
// Copyright (c) 2018 sc. All rights reserved.
//

import Foundation
import UIKit
import CoreGraphics

enum SCAlphaWebViewAction: String {
    case appear = "appear"
    case close = "close"
}

public protocol SCAlphaWebViewDelegate: NSObjectProtocol {
    func alphaWebViewDidRemove(_ webView: SCAlphaWebView)
}

open class SCAlphaWebView: UIWebView, UIWebViewDelegate {

    public weak var alphaDelegate: SCAlphaWebViewDelegate?

    private static let defaultAlphaThreshold: CGFloat = 0.6
    private var _alphaThreshold: CGFloat?
    public var alphaThreshold: CGFloat? {
        get {
            return _alphaThreshold
        }
        set {
            _alphaThreshold = newValue
        }
    }

    public override init(frame: CGRect) {
        super.init(frame: frame)
        self.alphaThreshold = SCAlphaWebView.defaultAlphaThreshold
        self.delegate = self
        self.clearBackgroundColor()
    }

    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    public func loadUrl(customUrl: String) {
        self.loadRequest(URLRequest(url: Foundation.URL(string: customUrl)!))
    }

    private func clearBackgroundColor() {
        self.backgroundColor = UIColor.clear
        self.isOpaque = false
        self.clearsContextBeforeDrawing = false
        self.backgroundColor = UIColor.clear
    }

    open override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        if (self.alphaOfPoint(point: point) < self.alphaThreshold!) {
            return nil
        }
        return super.hitTest(point, with: event)
    }


    func alphaOfPoint(point: CGPoint) -> CGFloat {
        var pixel: [CUnsignedChar] = [0, 0, 0, 0]

        let colorSpace = CGColorSpaceCreateDeviceRGB()
        let bitmapInfo = CGBitmapInfo(rawValue: CGImageAlphaInfo.premultipliedLast.rawValue)

        let context = CGContext(data: &pixel, width: 1, height: 1, bitsPerComponent: 8, bytesPerRow: 4, space: colorSpace, bitmapInfo: bitmapInfo.rawValue)

        context!.translateBy(x: -point.x, y: -point.y)

        self.layer.render(in: context!)

        let alpha: CGFloat = CGFloat(pixel[3]) / 255.0

        return alpha
    }

    public func webView(_ webView: UIWebView, shouldStartLoadWith request: URLRequest, navigationType: UIWebViewNavigationType) -> Bool {
        if let host = request.url?.host {
            if let action = SCAlphaWebViewAction(rawValue: host) {
                switch action {
                case .close:
                    self.alphaDelegate?.alphaWebViewDidRemove(self)
                default:
                    break
                }
            }
        }
        return true
    }

}
