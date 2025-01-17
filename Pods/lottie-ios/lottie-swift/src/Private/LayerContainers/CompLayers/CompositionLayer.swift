//
//  LayerContainer.swift
//  lottie-swift
//
//  Created by Brandon Withrow on 1/22/19.
//

import Foundation
import QuartzCore

/**
 The base class for a child layer of CompositionContainer
 */
class CompositionLayer: CALayer, KeypathSearchable {
    weak var layerDelegate: CompositionLayerDelegate?

    let transformNode: LayerTransformNode

    let contentsLayer: CALayer = CALayer()

    let maskLayer: MaskContainerLayer?

    let matteType: MatteType?

    var renderScale: CGFloat = 1 {
        didSet {
            updateRenderScale()
        }
    }

    var matteLayer: CompositionLayer? {
        didSet {
            if let matte = matteLayer {
                if let type = matteType, type == .invert {
                    mask = InvertedMatteLayer(inputMatte: matte)
                } else {
                    mask = matte
                }
            } else {
                mask = nil
            }
        }
    }

    let inFrame: CGFloat
    let outFrame: CGFloat
    let startFrame: CGFloat
    let timeStretch: CGFloat

    init(layer: LayerModel, size: CGSize) {
        transformNode = LayerTransformNode(transform: layer.transform)
        if let masks = layer.masks {
            maskLayer = MaskContainerLayer(masks: masks)
        } else {
            maskLayer = nil
        }
        matteType = layer.matte
        inFrame = layer.inFrame.cgFloat
        outFrame = layer.outFrame.cgFloat
        timeStretch = layer.timeStretch.cgFloat
        startFrame = layer.startTime.cgFloat
        keypathName = layer.name
        childKeypaths = [transformNode.transformProperties]
        super.init()
        anchorPoint = .zero
        actions = [
            "opacity": NSNull(),
            "transform": NSNull(),
            "bounds": NSNull(),
            "anchorPoint": NSNull(),
            "sublayerTransform": NSNull(),
        ]

        contentsLayer.anchorPoint = .zero
        contentsLayer.bounds = CGRect(origin: .zero, size: size)
        contentsLayer.actions = [
            "opacity": NSNull(),
            "transform": NSNull(),
            "bounds": NSNull(),
            "anchorPoint": NSNull(),
            "sublayerTransform": NSNull(),
            "hidden": NSNull(),
        ]
        addSublayer(contentsLayer)

        if let maskLayer = maskLayer {
            contentsLayer.mask = maskLayer
        }
    }

    override init(layer: Any) {
        /// Used for creating shadow model layers. Read More here: https://developer.apple.com/documentation/quartzcore/calayer/1410842-init
        guard let layer = layer as? CompositionLayer else {
            fatalError("Wrong Layer Class")
        }
        transformNode = layer.transformNode
        matteType = layer.matteType
        inFrame = layer.inFrame
        outFrame = layer.outFrame
        timeStretch = layer.timeStretch
        startFrame = layer.startFrame
        keypathName = layer.keypathName
        childKeypaths = [transformNode.transformProperties]
        maskLayer = nil
        super.init(layer: layer)
    }

    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    final func displayWithFrame(frame: CGFloat, forceUpdates: Bool) {
        transformNode.updateTree(frame, forceUpdates: forceUpdates)
        let layerVisible = frame.isInRangeOrEqual(inFrame, outFrame)
        /// Only update contents if current time is within the layers time bounds.
        if layerVisible {
            displayContentsWithFrame(frame: frame, forceUpdates: forceUpdates)
            maskLayer?.updateWithFrame(frame: frame, forceUpdates: forceUpdates)
        }
        contentsLayer.transform = transformNode.globalTransform
        contentsLayer.opacity = transformNode.opacity
        contentsLayer.isHidden = !layerVisible
        layerDelegate?.frameUpdated(frame: frame)
    }

    func displayContentsWithFrame(frame _: CGFloat, forceUpdates _: Bool) {
        /// To be overridden by subclass
    }

    // MARK: Keypath Searchable

    let keypathName: String

    var keypathProperties: [String: AnyNodeProperty] {
        return [:]
    }

    final var childKeypaths: [KeypathSearchable]

    var keypathLayer: CALayer? {
        return contentsLayer
    }

    func updateRenderScale() {
        contentsScale = renderScale
    }
}

protocol CompositionLayerDelegate: class {
    func frameUpdated(frame: CGFloat)
}
