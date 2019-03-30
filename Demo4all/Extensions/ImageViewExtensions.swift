import UIKit
import Kingfisher

extension UIImageView {
    
    func from(url: String) {
        self.kf.setImage(with: URL(string: url))
    }
    
    func downloadCustom(url: String) {
        let url = URL(string: url)
        let processor = DownsamplingImageProcessor(size: self.bounds.size)
            >> RoundCornerImageProcessor(cornerRadius: 20)
        self.kf.setImage(
            with: url,
            placeholder: UIImage(named: "noPartnerIco"),
            options: [
                .processor(processor)
            ])
        {
            result in
            switch result {
            case .success(let value):
                print("IMAGE STATUS: \(value.source.url?.absoluteString ?? "")")
            case .failure(let error):
                print("IMAGE STATUS: \(error.localizedDescription)")
            }
        }
    }
    
    func rounded() {
        layer.borderWidth = 1
        layer.masksToBounds = false
        layer.borderColor = UIColor.clear.cgColor
        layer.cornerRadius = frame.height/2
        clipsToBounds = true
    }
}

extension UIImage {
    func resize(toTargetSize targetSize: CGSize) -> UIImage {
        // inspired by Hamptin Catlin
        // https://gist.github.com/licvido/55d12a8eb76a8103c753
        
        let newScale = self.scale // change this if you want the output image to have a different scale
        let originalSize = self.size
        
        let widthRatio = targetSize.width / originalSize.width
        let heightRatio = targetSize.height / originalSize.height
        
        // Figure out what our orientation is, and use that to form the rectangle
        let newSize: CGSize
        if widthRatio > heightRatio {
            newSize = CGSize(width: floor(originalSize.width * heightRatio), height: floor(originalSize.height * heightRatio))
        } else {
            newSize = CGSize(width: floor(originalSize.width * widthRatio), height: floor(originalSize.height * widthRatio))
        }
        
        // This is the rect that we've calculated out and this is what is actually used below
        let rect = CGRect(origin: .zero, size: newSize)
        
        // Actually do the resizing to the rect using the ImageContext stuff
        let format = UIGraphicsImageRendererFormat()
        format.scale = newScale
        format.opaque = true
        let newImage = UIGraphicsImageRenderer(bounds: rect, format: format).image() { _ in
            self.draw(in: rect)
        }
        
        return newImage
    }
    
    func scaleImageToSize(size: CGSize) -> UIImage? {
        UIGraphicsBeginImageContextWithOptions(size, false, 0.0)
        self.draw(in: CGRect(x: 0.0, y: 00, width: size.width, height: size.height))
        let imageR = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return imageR;
    }
}
