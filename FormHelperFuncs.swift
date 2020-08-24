import UIKit

extension UIView {
    
    func autolayout(t: NSLayoutYAxisAnchor? = nil, l: NSLayoutXAxisAnchor? = nil, b: NSLayoutYAxisAnchor? = nil, r: NSLayoutXAxisAnchor? = nil,
                    c: UIEdgeInsets = .zero, cy: NSLayoutYAxisAnchor? = nil, cx: NSLayoutXAxisAnchor? = nil,
                    size: (NSLayoutDimension?, NSLayoutDimension?) = (nil, nil)) {
        
        translatesAutoresizingMaskIntoConstraints = false
        
        if let top = t {
            topAnchor.constraint(equalTo: top, constant: c.top).isActive = true
        }
        
        if let left = l {
            leadingAnchor.constraint(equalTo: left, constant: c.left).isActive = true
        }
        
        if let bottom = b {
            bottomAnchor.constraint(equalTo: bottom, constant: c.bottom).isActive = true
        }
        
        if let right = r {
            trailingAnchor.constraint(equalTo: right, constant: c.right).isActive = true
        }
        
        if let centerY = cy {
            centerYAnchor.constraint(equalTo: centerY).isActive = true
        }
        
        if let centerX = cx {
            centerXAnchor.constraint(equalTo: centerX).isActive = true
        }
        
        if let width = size.0 {
            widthAnchor.constraint(equalTo: width).isActive = true
        }
        
        if let height = size.1 {
            heightAnchor.constraint(equalTo: height).isActive = true
        }
    }
    
    func halfWidth(parent view: UIView) {
        widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5).isActive = true

    }
}

func createFormContainer<T: UIView>(title: UITextView, formElement: T) -> UIView {
    
    let view = UIView()
    
    let leftView = UIView()
    let rightView = UIView()
    
    // Add subviews to container view
    
    view.addSubview(leftView)
    view.addSubview(rightView)
    
    // Add argument components to subviews
    
    leftView.addSubview(title)
    rightView.addSubview(formElement)
    
    // Constrain subviews
    
    leftView.halfWidth(parent: view)
    rightView.halfWidth(parent: view)
    leftView.autolayout(t: view.topAnchor, l: view.leadingAnchor, b: view.bottomAnchor)
    rightView.autolayout(t: leftView.topAnchor, b: leftView.bottomAnchor, r: view.trailingAnchor)
    
    // Constrain arguments
    
    title.textAlignment = .center
    title.autolayout(l: leftView.leadingAnchor, r: leftView.trailingAnchor, cy: leftView.centerYAnchor)
    
    formElement.autolayout(cy: rightView.centerYAnchor, cx: rightView.centerXAnchor, size: (rightView.widthAnchor, rightView.heightAnchor))

    return view
}
