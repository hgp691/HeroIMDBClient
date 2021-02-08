//
//  CollectionEmptyView.swift
//  HeroIMDBClient
//
//  Created by Horacio Guzman on 6/02/21.
//

import UIKit

class CollectionEmptyView: UIView {
    
    public var nibName: String = "CollectionEmptyView"
    public var bundle: Bundle = Bundle(for: CollectionEmptyView.self)

    @IBOutlet var view: UIView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var button: UIButton!
    
    var buttonDidPressed: (() -> Void)?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        UINib(nibName: nibName, bundle: bundle).instantiate(withOwner: self, options: nil)
        addSubview(view)
        view.frame = self.bounds
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        UINib(nibName: nibName, bundle: bundle).instantiate(withOwner: self, options: nil)
        addSubview(view)
        view.frame = self.bounds
        setupUI()
    }
    
    private func setupUI() {
        button.setTitle("moviesGallery.emptyView.buttonTitle".heroLocalizedString(),
                        for: .normal)
    }
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        buttonDidPressed?()
    }
    
}
