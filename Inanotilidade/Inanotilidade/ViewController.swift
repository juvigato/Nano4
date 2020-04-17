//
//  ViewController.swift
//  Inanotilidade
//
//  Created by Juliana Vigato Pavan on 15/04/20.
//  Copyright © 2020 Juliana Vigato Pavan. All rights reserved.
//

import UIKit
import Foundation

class ViewController: UIViewController {
    
    @IBOutlet weak var imgBiscoito: UIImageView!
    @IBOutlet weak var btnPote: UIButton!
    @IBOutlet weak var lblFrase: UILabel!
    
    var biscoitoImages: [UIImage] = []
    
    let frasesDesmotivacionais: [String] = [
        "O segredo do fracasso é começar",
        "A luta é grande mas a derrota é certa",
        "A maior derrota é acreditar que é capaz",
        "Foco, força, fracasso",
        "Não se preocupe. Nada vai dar certo",
        "Tudo dando errado conforme esperado",
        "Não foi fácil, mas fracassei novamente!",
        "Pare de tentar e comece a desistir",
        "Nenhum obstáculo é grande para quem desiste",
        "Nada é tão nosso quanto nossos fracassos",
        "Só vai dar errado se você tentar",
        "Nunca se esqueça que você é limitado",
        "Não tenha medo do fracasso, tenha certeza"
    ]

    var timerFrase = Timer()
    var timerBiscoito = Timer()
     
    override func viewDidLoad() {
        super.viewDidLoad()
        imgBiscoito.isHidden = true
        lblFrase.isHidden = true
        btnPote.adjustsImageWhenHighlighted = false
        biscoitoImages = fillArray(total: 26, prefixo: "biscoito")
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
    
    func createAnimation(imageView: UIImageView, images: [UIImage], duration: Double) {
        timerFrase = Timer.scheduledTimer(timeInterval: duration, target: self, selector: #selector(timerAction), userInfo: nil, repeats: false)
        UIView.animate(withDuration: duration, delay: 0.0, animations: {
            self.imgBiscoito.isHidden = false
            imageView.animationImages = images
            imageView.animationRepeatCount = 1
            imageView.startAnimating()
        })
    }
    
    @objc func timerAction() {
        let randomName = frasesDesmotivacionais.randomElement()
        self.lblFrase.isHidden = false
        self.lblFrase.text = randomName
//        self.lblFrase.text = frasesDesmotivacionais[8]
    }
    
    @objc func timerActionBiscoito() {
        self.lblFrase.isHidden = true
        self.imgBiscoito.isHidden = true
    }
    
    @IBAction func tapButton(_ sender: Any) {
        self.lblFrase.isHidden = true
        self.imgBiscoito.isHidden = true
        createAnimation(imageView: imgBiscoito, images: biscoitoImages, duration: 1.0)
        imgBiscoito.image = UIImage(named: "biscoito26")
//        if imgBiscoito.isHidden == false && lblFrase.isHidden == false {
//            timerBiscoito = Timer.scheduledTimer(timeInterval: 3.0, target: self, selector: #selector(timerActionBiscoito), userInfo: nil, repeats: false)
//        }
    }
}

