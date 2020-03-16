//
//  ViewController.swift
//  Carousel
//
//  Created by mhlee on 2020/03/16.
//  Copyright © 2020 mhlee. All rights reserved.
//

import UIKit
import SnapKit

class ViewController: UIViewController {

  lazy var carouselView: iCarousel = {
    let v = iCarousel()
    v.type = iCarouselType.rotary
    return v
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    
    view.backgroundColor = .white
    
    view.addSubview(carouselView)
    
    carouselView.snp.makeConstraints { make in
      make.center.width.equalToSuperview()
      make.height.equalToSuperview().dividedBy(2)
    }
  
    carouselView.dataSource = self
    carouselView.delegate = self
  }


}

extension ViewController: iCarouselDataSource {
  func numberOfItems(in carousel: iCarousel) -> Int {
    return 10
  }
  
  func carousel(_ carousel: iCarousel, viewForItemAt index: Int, reusing view: UIView?) -> UIView {
    var itemView: UIView! = nil
    var label: UILabel! = nil
    
    if view == nil {
      let v = UIView(frame: CGRect(x: 0, y: 0, width: 90, height: 90))
      v.layer.borderColor = UIColor.red.cgColor
      v.layer.borderWidth = 2
      v.backgroundColor = .gray
      
      let l = UILabel()
      l.backgroundColor = .white
      l.textColor = .black
      l.textAlignment = .center
      l.tag = 1;
      v.addSubview(l)
      
      l.snp.makeConstraints { make in
        make.center.equalToSuperview()
      }
      
      itemView = v
      label = l
      
    } else {
      itemView = view
      label = itemView.viewWithTag(1) as? UILabel
    }
    
    label.text = "\(index)"
    
    return itemView
  }
}

extension ViewController: iCarouselDelegate {
  
}
