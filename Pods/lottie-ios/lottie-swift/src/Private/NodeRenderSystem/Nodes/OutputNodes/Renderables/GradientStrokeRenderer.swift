//
//  GradientStrokeRenderer.swift
//  lottie-swift
//
//  Created by Brandon Withrow on 1/30/19.
//

import Foundation
import QuartzCore

// MARK: - Renderer

final class GradientStrokeRenderer: PassThroughOutputNode, Renderable {
    override func hasOutputUpdates(_ forFrame: CGFloat) -> Bool {
        let updates = super.hasOutputUpdates(forFrame)
        return updates || strokeRender.hasUpdate || gradientRender.hasUpdate
    }

    var shouldRenderInContext: Bool = true

    func updateShapeLayer(layer _: CAShapeLayer) {
        /// Not Applicable
    }

    let strokeRender: StrokeRenderer
    let gradientRender: GradientFillRenderer

    override init(parent: NodeOutput?) {
        strokeRender = StrokeRenderer(parent: nil)
        gradientRender = GradientFillRenderer(parent: nil)
        strokeRender.color = CGColor(colorSpace: CGColorSpaceCreateDeviceRGB(), components: [1, 1, 1, 1])
        super.init(parent: parent)
    }

    func render(_ inContext: CGContext) {
        guard inContext.path != nil, inContext.path!.isEmpty == false else {
            return
        }

        strokeRender.hasUpdate = false
        hasUpdate = false
        gradientRender.hasUpdate = false

        strokeRender.setupForStroke(inContext)

        inContext.replacePathWithStrokedPath()

        /// Now draw the gradient.
        gradientRender.render(inContext)
    }

    func renderBoundsFor(_ boundingBox: CGRect) -> CGRect {
        return strokeRender.renderBoundsFor(boundingBox)
    }
}
