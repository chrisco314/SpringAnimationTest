//
//  Geometry.swift
//  IQDashboard
//


import CoreGraphics
import UIKit

func + (left: CGPoint, right: CGPoint) -> CGPoint {
    return CGPoint(x: left.x + right.x, y: left.y + right.y)
}

func += (left: inout CGPoint, right: CGPoint) {
    left = left + right
}

func - (left: CGPoint, right: CGPoint) -> CGPoint {
    return CGPoint(x: left.x - right.x, y: left.y - right.y)
}

func -= (left: inout CGPoint, right: CGPoint) {
    left = left - right
}


func * (left: CGPoint, right: CGPoint) -> CGPoint {
    return CGPoint(x: left.x * right.x, y: left.y * right.y)
}

func *= (left: inout CGPoint, right: CGPoint) {
    left = left * right
}

func / (left: CGPoint, right: CGPoint) -> CGPoint {
    return CGPoint(x: left.x / right.x, y: left.y / right.y)
}

func /= (left: inout CGPoint, right: CGPoint) {
    left = left / right
}


func * (left: CGPoint, right: CGFloat) -> CGPoint {
    return CGPoint(x: left.x * right, y: left.y * right)
}

func *= (left: inout CGPoint, right: CGFloat) {
    left = left * right
}

func / (left: CGPoint, right: CGFloat) -> CGPoint {
    return CGPoint(x: left.x / right, y: left.y / right)
}

func /= (left: inout CGPoint, right: CGFloat) {
    left = left / right
}


func + (left: CGPoint, right: CGSize) -> CGPoint {
    return CGPoint(x: left.x + right.width, y: left.y + right.height)
}

func += (left: inout CGPoint, right: CGSize) {
    left = left + right
}

func - (left: CGPoint, right: CGSize) -> CGPoint {
    return CGPoint(x: left.x - right.width, y: left.y - right.height)
}

func -= (left: inout CGPoint, right: CGSize) {
    left = left - right
}


func * (left: CGPoint, right: CGSize) -> CGPoint {
    return CGPoint(x: left.x * right.width, y: left.y * right.height)
}

func *= (left: inout CGPoint, right: CGSize) {
    left = left * right
}

func / (left: CGPoint, right: CGSize) -> CGPoint {
    return CGPoint(x: left.x / right.width, y: left.y / right.height)
}

func /= (left: inout CGPoint, right: CGSize) {
    left = left / right
}


prefix func - (left: CGPoint) -> CGPoint {
    return CGPoint(x: -left.x, y: -left.y)
}

extension CGPoint {
    func integerPoint() -> CGPoint {
        return CGPoint(
            x: CGFloat(Int(self.x >= 0.0 ? self.x + 0.5 : self.x - 0.5)),
            y: CGFloat(Int(self.y >= 0.0 ? self.y + 0.5 : self.y - 0.5))
        )
    }
}

func min(_ left: CGPoint, _ right: CGPoint) -> CGPoint {
    return CGPoint(x: min(left.x, right.x), y: min(left.y, right.y))
}

func max(_ left: CGPoint, _ right: CGPoint) -> CGPoint {
    return CGPoint(x: max(left.x, right.x), y: max(left.y, right.y))
}


func + (left: CGSize, right: CGSize) -> CGSize {
    return CGSize(width: left.width + right.width, height: left.height + right.height)
}


func += (left: inout CGSize, right: CGSize) {
    left = left + right
}


func - (left: CGSize, right: CGSize) -> CGSize {
    return CGSize(width: left.width - right.width, height: left.height - right.height)
}


func -= (left: inout CGSize, right: CGSize) {
    left = left - right
}


func * (left: CGSize, right: CGSize) -> CGSize {
    return CGSize(width: left.width * right.width, height: left.height * right.height)
}


func *= (left: inout CGSize, right: CGSize) {
    left = left * right
}


func / (left: CGSize, right: CGSize) -> CGSize {
    return CGSize(width: left.width / right.width, height: left.height / right.height)
}


func /= (left: inout CGSize, right: CGSize) {
    left = left / right
}


func + (left: CGSize, right: CGPoint) -> CGSize {
    return CGSize(width: left.width + right.x, height: left.height + right.y)
}


func += (left: inout CGSize, right: CGPoint) {
    left = left + right
}


func - (left: CGSize, right: CGPoint) -> CGSize {
    return CGSize(width: left.width - right.x, height: left.height - right.y)
}


func -= (left: inout CGSize, right: CGPoint) {
    left = left - right
}


func * (left: CGSize, right: CGPoint) -> CGSize {
    return CGSize(width: left.width * right.x, height: left.height * right.y)
}


func *= (left: inout CGSize, right: CGPoint) {
    left = left * right
}


func / (left: CGSize, right: CGPoint) -> CGSize {
    return CGSize(width: left.width / right.x, height: left.height / right.y)
}


func /= (left: inout CGSize, right: CGPoint) {
    left = left / right
}


func * (left: CGSize, right: CGFloat) -> CGSize {
    return CGSize(width: left.width * right, height: left.height * right)
}


func *= (left: inout CGSize, right: CGFloat) {
    left = left * right
}


func min(_ left: CGSize, _ right: CGSize) -> CGSize {
    return CGSize(width: min(left.width, right.width), height: min(left.height, right.height))
}

func max(_ left: CGSize, _ right: CGSize) -> CGSize {
    return CGSize(width: max(left.width, right.width), height: max(left.height, right.height))
}



func + (left: CGRect, right: CGPoint) -> CGRect {
    return CGRect(x: left.origin.x + right.x, y: left.origin.y + right.y, width: left.size.width, height: left.size.height)
}


func += (left: inout CGRect, right: CGPoint) {
    left = left + right
}


func - (left: CGRect, right: CGPoint) -> CGRect {
    return CGRect(x: left.origin.x - right.x, y: left.origin.y - right.y, width: left.size.width, height: left.size.height)
}


func -= (left: inout CGRect, right: CGPoint) {
    left = left - right
}


func * (left: CGRect, right: CGFloat) -> CGRect {
    return CGRect(x: left.origin.x * right, y: left.origin.y * right, width: left.size.width * right, height: left.size.height * right)
}


func *= (left: inout CGRect, right: CGFloat) {
    left = left * right
}


func / (left: CGRect, right: CGFloat) -> CGRect {
    return CGRect(x: left.origin.x / right, y: left.origin.y / right, width: left.size.width / right, height: left.size.height / right)
}


func /= (left: inout CGRect, right: CGFloat) {
    left = left / right
}


extension CGRect {

    func inset(_ insets: UIEdgeInsets) -> CGRect {
        return UIEdgeInsetsInsetRect(self, insets)
    }

    var center: CGPoint {
        get { return CGPoint(x: midX, y: midY) }
        set {
            origin.x = newValue.x - size.width / 2
            origin.y = newValue.y - size.height / 2
        }
    }

    func withCenter(_ center: CGPoint) -> CGRect {
        var result = self
        result.center = center
        return result
    }
}


extension CGSize {

    func insetBy(dx: CGFloat, dy: CGFloat) -> CGSize {
        return CGSize(width: max(width - dx, 0), height: max(height - dy, 0))
    }

    func inset(_ insets: UIEdgeInsets) -> CGSize {
        return UIEdgeInsetsInsetRect(
            CGRect(x: 0, y: 0, width: width, height: height),
            insets).size
    }

    var isZero: Bool { return width == 0 || height == 0 }
}

extension CGPoint {
    func dot(_ other: CGPoint) -> CGFloat { return x * other.x + y * other.y }
    var length: CGFloat { return hypot(x, y) }

    var normalized: CGPoint {
        let length = self.length
        guard length != 0 else { return .zero }
        return self / length
    }

    func scalarProjection(_ other: CGPoint) -> CGFloat {
        return dot(other.normalized)
    }
}
