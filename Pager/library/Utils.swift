import UIKit

extension Array {
    func find(_ includedElement: (Element) -> Bool) -> Int? {
        for (idx, element) in self.enumerated() {
            if includedElement(element) {
                return idx
            }
        }
        return 0
    }
}

extension UIDevice {
    
    static var isIphoneX: Bool {
        return keyWindow?.hasNotch ?? false
    }
    
    static var keyWindow: UIWindow? {
        // iOS 13+ multi-scene support
        if #available(iOS 13.0, *) {
            return UIApplication.shared
                .connectedScenes                       // all scenes (UIWindowScene, etc.)
                .compactMap { $0 as? UIWindowScene }  // only window scenes
                .flatMap { $0.windows }               // all windows in each scene
                .first { $0.isKeyWindow }             // pick the one that’s key
        } else {
            // Fallback on earlier versions
            return UIApplication.shared.keyWindow
        }
    }

}

extension UIWindow {
  var hasNotch: Bool {
    safeAreaInsets.top > 20
  }
    
}
