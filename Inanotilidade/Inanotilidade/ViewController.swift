//
//  ViewController.swift
//  Inanotilidade
//
//  Created by Juliana Vigato Pavan on 15/04/20.
//  Copyright © 2020 Juliana Vigato Pavan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var imgBiscoito: UIImageView!
    
    var biscoitoImages: [UIImage] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        biscoitoImages = fillArray(total: 21, prefixo: "biscoito")
    }
    
    func fillArray(total:Int, prefixo: String) -> [UIImage] {
        var imageArray: [UIImage] = []
        
        for i in 1..<total {
            let nomeImg = "\(prefixo)\(i).pdf"
            guard let imagem = UIImage(named: nomeImg) else { return biscoitoImages }
            
            imageArray.append(imagem)
        }
        return imageArray
    }
    
    func createAnimation(imageView: UIImageView, images: [UIImage]) {
        imageView.animationImages = images
        imageView.animationDuration = 2.0
        imageView.animationRepeatCount = 1
        imageView.startAnimating()
    }
    
    @IBAction func tapButton(_ sender: Any) {
        createAnimation(imageView: imgBiscoito, images: biscoitoImages)
        imgBiscoito.image = UIImage(named: "biscoito21")
    }
    

}

