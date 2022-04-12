//
//  Extentions.swift
//  SLDI03
//
//  Created by Anna Ershova on 12.04.2022.
//

import Foundation
import UIKit

extension String {
    func convertEmojiToImage(text: String, size: CGFloat) -> UIImage {
        let resultSize = CGSize.init(width: size, height: size)
        let originSize = text.boundingRect(with: CGSize(width: 2048, height: 2048), options: .usesLineFragmentOrigin, attributes: [.font: UIFont.systemFont(ofSize: size / 2)], context: nil).size
        let fontSize = resultSize.width / max(originSize.width, originSize.height) * (resultSize.width / 2)
        let font = UIFont.systemFont(ofSize: fontSize)
        let textSize = text.boundingRect(with: CGSize(width: resultSize.width, height: resultSize.height), options: .usesLineFragmentOrigin, attributes: [.font: font], context: nil).size
        let style = NSMutableParagraphStyle()
        style.alignment = NSTextAlignment.center
        style.lineBreakMode = NSLineBreakMode.byClipping
        let str: [NSAttributedString.Key: Any] = [NSAttributedString.Key.font: font, NSAttributedString.Key.paragraphStyle: style, NSAttributedString.Key.backgroundColor: UIColor.clear]
        UIGraphicsBeginImageContextWithOptions(resultSize, false, 0)
        text.draw(in: CGRect(x: (size - textSize.width) / 2, y: (size - textSize.height) / 2, width: textSize.width, height: textSize.height), withAttributes: str)
        let image = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        return image
    }
}
