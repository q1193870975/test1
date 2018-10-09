//
//  ViewController.swift
//  AstroLayout
//
//  Created by 广州飞进信息科技有限公司 on 2018/10/8.
//  Copyright © 2018 广州飞进信息科技有限公司. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var mercury = UIImageView()
    var venus = UIImageView()
    var earth = UIImageView()
    var mars = UIImageView()
    var jupiter = UIImageView()
    var saturn = UIImageView()
    var uranus = UIImageView()
    var neptune = UIImageView()
    
    var compactConstraints = NSArray()
    var regularConstraints = NSArray()
    var sharedConstraints = NSArray()
    
    var mercuryLeadingToTrailing = NSLayoutConstraint()
    var venusLeadingToTrailing = NSLayoutConstraint()
    var earthLeadingToTrailing = NSLayoutConstraint()
    var marsLeadingToTrailing = NSLayoutConstraint()
    var jupiterLeadingToTrailing = NSLayoutConstraint()
    var saturnLeadingToTrailing = NSLayoutConstraint()
    var uranusLeadingToTrailing = NSLayoutConstraint()
    var neptuneLeadingToTrailing = NSLayoutConstraint()
    
    var mercuryCenter = NSLayoutConstraint()
    var venusCenter = NSLayoutConstraint()
    var earthCenter = NSLayoutConstraint()
    var marsCenter = NSLayoutConstraint()
    var jupiterCenter = NSLayoutConstraint()
    var saturnCenter = NSLayoutConstraint()
    var uranusCenter = NSLayoutConstraint()
    var neptuneCenter = NSLayoutConstraint()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.black
        self.createPlanetViews()
        self.createConstraints()
        self.setUpGestures()
    }
    
    func createConstraints() {
        self.planetSizes()
        self.createCompactConstraints()
        self.createRegularConstraints()
        NSLayoutConstraint.activate(regularConstraints as! [NSLayoutConstraint])
        NSLayoutConstraint.activate(sharedConstraints as! [NSLayoutConstraint])
    }
    
    func setLayoutIdentifier(identifier:String,constraintsArray:[NSLayoutConstraint]) {
        for constraint:NSLayoutConstraint in constraintsArray {
            constraint.identifier = identifier
        }
    }
    
    func createPlanetViews() {
        let planetCreate: (String) -> UIImageView = {
            (planetName:String) -> UIImageView in
            let planet = UIImageView(image: UIImage(named: planetName))
            planet.translatesAutoresizingMaskIntoConstraints = false
            planet.contentMode = UIView.ContentMode.scaleAspectFit
            planet.accessibilityIdentifier = planetName
            self.view.addSubview(planet)
            return planet
        }
        mercury = planetCreate("Mercury")
        venus = planetCreate("Venus")
        earth = planetCreate("Earth")
        mars = planetCreate("Mars")
        jupiter = planetCreate("Jupiter")
        saturn = planetCreate("Saturn")
        uranus = planetCreate("Uranus")
        neptune = planetCreate("Neptune")
    }
    func planetSizes() {
        let mercuryHeight = mercury.heightAnchor.constraint(equalTo: earth.heightAnchor, multiplier: 38)
        let mercuryWidth = mercury.widthAnchor.constraint(equalTo: mercury.heightAnchor, multiplier: 1)
        let venusHeight = venus.heightAnchor.constraint(equalTo: earth.heightAnchor, multiplier: 95)
        let venusWidth = venus.widthAnchor.constraint(equalTo: venus.heightAnchor, multiplier: 1)
        let marsHeight = mars.heightAnchor.constraint(equalTo: earth.heightAnchor, multiplier: 53)
        let marsWidth = mars.widthAnchor.constraint(equalTo: mars.heightAnchor, multiplier: 1)
        let jupiterHeight = jupiter.heightAnchor.constraint(equalTo: earth.heightAnchor, multiplier: 11.2)
        let jupiterWidth = jupiter.widthAnchor.constraint(equalTo: jupiter.heightAnchor, multiplier: 1)
        let saturnHeight = saturn.heightAnchor.constraint(equalTo: earth.heightAnchor, multiplier: 9.45)
        let saturnWidth = saturn.widthAnchor.constraint(equalTo: saturn.heightAnchor, multiplier: 1.5)
        let uranusHeight = uranus.heightAnchor.constraint(equalTo: earth.heightAnchor, multiplier: 4)
        let uranusWidth = uranus.widthAnchor.constraint(equalTo: uranus.widthAnchor, multiplier: 1)
        let neptuneHeight = neptune.heightAnchor.constraint(equalTo: earth.heightAnchor, multiplier: 3.88)
        let neptuneWidth = neptune.widthAnchor.constraint(equalTo: neptune.heightAnchor, multiplier: 1)
        let earthWidth = earth.widthAnchor.constraint(equalTo: earth.heightAnchor)
        
        mercuryHeight.identifier = "mercuryHeight"
        mercuryWidth.identifier = "mercuryWidth"
        venusHeight.identifier = "venusHeight"
        venusWidth.identifier = "venusWidth"
        marsHeight.identifier = "marsHeight"
        marsWidth.identifier = "marsWidth"
        jupiterHeight.identifier = "jupiterHeight"
        jupiterWidth.identifier = "jupiterWidth"
        saturnHeight.identifier = "saturnHeight"
        saturnWidth.identifier = "saturnWidth "
        uranusHeight.identifier = "uranusHeight"
        uranusWidth.identifier = "uranusWidth "
        neptuneHeight.identifier = "neptuneHeight"
        neptuneWidth.identifier = "neptuneWidth"
        earthWidth.identifier = "earthWidth"
        NSLayoutConstraint.activate([mercuryHeight, venusHeight, marsHeight, jupiterHeight, saturnHeight, uranusHeight, neptuneHeight, mercuryWidth, venusWidth, earthWidth, marsWidth, jupiterWidth, saturnWidth, uranusWidth, neptuneWidth])
    }
    func createCompactConstraints() {
        if compactConstraints.count > 0 {
            return
        }
        let createCenterXConstraint:(UIImageView,String) -> NSLayoutConstraint = {
            (planetToCenter: UIImageView,identifierName: String) in
            let newConstraint = planetToCenter.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
            newConstraint.identifier = identifierName
            return newConstraint
        }
        mercuryCenter = createCenterXConstraint(mercury, "mercuryCenterX")
        venusCenter   = createCenterXConstraint(venus, "venusCenterX")
        earthCenter   = createCenterXConstraint(earth, "earthCenterX")
        marsCenter    = createCenterXConstraint(mars, "marsCenterX")
        jupiterCenter = createCenterXConstraint(jupiter, "jupiterCenterX")
        saturnCenter  = createCenterXConstraint(saturn, "saturnCenterX")
        uranusCenter  = createCenterXConstraint(uranus, "uranusCenterX")
        neptuneCenter = createCenterXConstraint(neptune, "neptuneCenterX")
        compactConstraints = [mercuryCenter, venusCenter, earthCenter, marsCenter, jupiterCenter, saturnCenter, uranusCenter, neptuneCenter]
    }
    func createRegularConstraints() {
        if (regularConstraints.count > 0) && (sharedConstraints.count > 0){
            return
        }
        let newLayoutGuide:(String) -> UILayoutGuide = {
            (identifierName:String) in
            let newGuide = UILayoutGuide()
            self.view.addLayoutGuide(newGuide)
            return newGuide
        }
        let leadingMercuryGuide = newLayoutGuide("leadingMercuryGuide")
        let leadingVenusGuide = newLayoutGuide("leadingVenusGuide")
        let leadingEarthGuide = newLayoutGuide("leadingEarthGuide")
        let leadingMarsGuide = newLayoutGuide("leadingMarsGuide")
        let leadingJupiterGuide = newLayoutGuide("leadingJupiterGuide")
        let leadingSaturnGuide = newLayoutGuide("leadingSaturnGuide")
        let leadingUranusGuide = newLayoutGuide("leadingUranusGuide")
        let leadingNeptuneGuide = newLayoutGuide("leadingNeptuneGuide")
        
        let trailingMercuryGuide = newLayoutGuide("trailingMercuryGuide")
        let trailingVenusGuide = newLayoutGuide("trailingVenusGuide")
        let trailingEarthGuide = newLayoutGuide("trailingEarthGuide")
        let trailingMarsGuide = newLayoutGuide("trailingMarsGuide")
        let trailingJupiterGuide = newLayoutGuide("trailingJupiterGuide")
        let trailingSaturnGuide = newLayoutGuide("trailingSaturnGuide")
        let trailingUranusGuide = newLayoutGuide("trailingUranusGuide")
        let trailingNeptuneGuide = newLayoutGuide("trailingNeptuneGuide")
        let toopLayoutGuide = self.topLayoutGuide
        
        var planetsAndGuides: [String:Any] = ["mercury":mercury,"venus":venus,"earth":earth,"mars":mars,"jupiter":jupiter,"saturn":saturn,"uranus":uranus,"neptune":neptune,"leadingMercuryGuide":leadingMercuryGuide,"leadingVenusGuide":leadingVenusGuide,"leadingEarthGuide":leadingEarthGuide,"leadingSaturnGuide":leadingSaturnGuide,"leadingUranusGuide":leadingUranusGuide,"leadingNeptuneGuide":leadingNeptuneGuide,"trailingMercuryGuide":trailingMercuryGuide,"trailingVenusGuide":trailingVenusGuide,"trailingEarthGuide":trailingEarthGuide,"trailingMarsGuide":trailingMarsGuide,"trailingJupiterGuide":trailingJupiterGuide,"trailingSaturnGuide":trailingSaturnGuide,"trailingUranusGuide":trailingUranusGuide,"trailingNeptuneGuide":trailingNeptuneGuide,"topLayoutGuide":topLayoutGuide]
        //使用布局指南创建垂直间距。这也可以通过行星视图本身来完成
        let topToBottom = NSLayoutConstraint.constraints(withVisualFormat: "V:|[topLayoutGuide]-[leadingMercuryGuide]-[leadingVenusGuide]-[leadingEarthGuide]-[leadingMarsGuide]-[leadingJupiterGuide][leadingSaturnGuide][leadingUranusGuide]-[leadingNeptuneGuide]-20-|", options: NSLayoutConstraint.FormatOptions.init(rawValue: 0), metrics: nil, views: planetsAndGuides)
        sharedConstraints = topToBottom as NSArray
        self.setLayoutIdentifier(identifier: "topToBottom", constraintsArray: topToBottom)
        
        let newHorizontalArray: (String,String) -> Void = {
            (layoutString: String,arrayID: String) in
            let horizontalConstraintsArray = NSLayoutConstraint.constraints(withVisualFormat: layoutString, options: NSLayoutConstraint.FormatOptions.alignAllCenterY, metrics: nil, views: planetsAndGuides)
            self.sharedConstraints = self.sharedConstraints.addingObjects(from: horizontalConstraintsArray) as NSArray
            self.setLayoutIdentifier(identifier: arrayID, constraintsArray: horizontalConstraintsArray)
        }
        
        newHorizontalArray("|[leadingMercuryGuide][mercury][trailingMercuryGuide]|", "hMercury")
        newHorizontalArray("|[leadingVenusGuide][venus][trailingVenusGuide]|", "hVenus")
        newHorizontalArray("|[leadingEarthGuide][earth][trailingEarthGuide]|", "hEarth")
        newHorizontalArray("|[leadingMarsGuide][mars][trailingMarsGuide]|", "hMars")
        newHorizontalArray("|[leadingJupiterGuide][jupiter][trailingJupiterGuide]|", "hJupiter")
        newHorizontalArray("|[leadingSaturnGuide][saturn][trailingSaturnGuide]|", "hSaturn")
        newHorizontalArray("|[leadingUranusGuide][uranus][trailingUranusGuide]|", "hUranus")
        newHorizontalArray("|[leadingNeptuneGuide][neptune][trailingNeptuneGuide]|", "hNeptune")
        
        /*使引导导板与其各自的行星具有相同的高度，以确保垂直间距看起来正确。
         如果需要使间距不均匀或在行星未垂直对齐或需要不同布局时重叠一点，则可以进行调整。*/
        let guideHeightToPlanetHeight: (UILayoutGuide,UIImageView,String) ->NSLayoutConstraint = {
            (layoutGuide: UILayoutGuide,planet: UIImageView,identifier:String) in
            let guideHeightToPlanet = layoutGuide.heightAnchor.constraint(equalTo: planet.heightAnchor)
            guideHeightToPlanet.identifier = identifier
            return guideHeightToPlanet
        }
        
        let guideHeightToMercury = guideHeightToPlanetHeight(leadingMercuryGuide, mercury, "guideHeightToMercury")
        let guideHeightToVenus   = guideHeightToPlanetHeight(leadingVenusGuide, venus, "guideHeightToVenus")
        let guideHeightToEarth   = guideHeightToPlanetHeight(leadingEarthGuide, earth, "guideHeightToEarth")
        let guideHeightToMars    = guideHeightToPlanetHeight(leadingMarsGuide, mars, "guideHeightToMars")
        let guideHeightToJupiter = guideHeightToPlanetHeight(leadingJupiterGuide, jupiter, "guideHeightToJupiter")
        let guideHeightToSaturn  = guideHeightToPlanetHeight(leadingSaturnGuide, saturn, "guideHeightToSaturn")
        let guideHeightToUranus  = guideHeightToPlanetHeight(leadingUranusGuide, uranus, "guideHeightToUranus")
        let guideHeightToNeptune = guideHeightToPlanetHeight(leadingNeptuneGuide, neptune, "guideHeightToNeptune")
        
        sharedConstraints = sharedConstraints.addingObjects(from: [guideHeightToMercury,guideHeightToVenus, guideHeightToEarth, guideHeightToMars, guideHeightToJupiter, guideHeightToSaturn, guideHeightToUranus, guideHeightToNeptune]) as NSArray
        mercuryLeadingToTrailing = leadingMercuryGuide.widthAnchor.constraint(equalTo: trailingMercuryGuide.widthAnchor, multiplier: 02)
        venusLeadingToTrailing = leadingVenusGuide.widthAnchor.constraint(equalTo: trailingVenusGuide.widthAnchor, multiplier: 03)
        earthLeadingToTrailing = leadingEarthGuide.widthAnchor.constraint(equalTo: trailingEarthGuide.widthAnchor, multiplier: 06)
        marsLeadingToTrailing = leadingMarsGuide.widthAnchor.constraint(equalTo: trailingMarsGuide.widthAnchor, multiplier: 1)
        jupiterLeadingToTrailing = leadingJupiterGuide.widthAnchor.constraint(equalTo: trailingJupiterGuide.widthAnchor, multiplier: 2)
        uranusLeadingToTrailing = leadingUranusGuide.widthAnchor.constraint(equalTo: trailingUranusGuide.widthAnchor, multiplier: 2.7)
        neptuneLeadingToTrailing = leadingNeptuneGuide.widthAnchor.constraint(equalTo: trailingNeptuneGuide.widthAnchor, multiplier: 10)
        
        mercuryLeadingToTrailing.identifier = "leadingTrailingAnchorMercury"
        venusLeadingToTrailing.identifier = "leadingTrailingAnchorVenus"
        earthLeadingToTrailing.identifier = "leadingTrailingAnchorEarth"
        marsLeadingToTrailing.identifier = "leadingTrailingAnchorMars"
        jupiterLeadingToTrailing.identifier = "leadingTrailingAnchorJupiter"
        saturnLeadingToTrailing.identifier = "leadingTrailingAnchorSaturn"
        uranusLeadingToTrailing.identifier = "leadingTrailingAnchorUranus"
        neptuneLeadingToTrailing.identifier = "leadingTrailingAnchorNeptune"
        regularConstraints = [mercuryLeadingToTrailing,venusLeadingToTrailing, earthLeadingToTrailing, marsLeadingToTrailing, saturnLeadingToTrailing, jupiterLeadingToTrailing,  uranusLeadingToTrailing, neptuneLeadingToTrailing]
    }
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        if self.traitCollection.containsTraits(in: UITraitCollection(horizontalSizeClass: UIUserInterfaceSizeClass.compact)) {
            if (regularConstraints.object(at: 0) as AnyObject).isActive{
                NSLayoutConstraint.deactivate(regularConstraints as! [NSLayoutConstraint])
                NSLayoutConstraint.activate(compactConstraints as! [NSLayoutConstraint])
                }
            }
            else{
                if (compactConstraints.object(at: 0) as AnyObject).isActive{
                    NSLayoutConstraint.deactivate(compactConstraints as! [NSLayoutConstraint])
                    NSLayoutConstraint.activate(regularConstraints as! [NSLayoutConstraint])
                }
            }
    }
    @objc func changeLayout(tapGesture: UITapGestureRecognizer) {
        if tapGesture.state == UIGestureRecognizer.State.ended {
            let regularConstraint: NSLayoutConstraint = regularConstraints.firstObject as! NSLayoutConstraint
            let compactConstraint: NSLayoutConstraint = compactConstraints.firstObject as! NSLayoutConstraint
            if (regularConstraint.isActive) {
                UIView.animate(withDuration: 1.0) {
                    NSLayoutConstraint.deactivate(self.regularConstraints as! [NSLayoutConstraint])
                    NSLayoutConstraint.activate(self.compactConstraints as! [NSLayoutConstraint])
                    self.view.layoutIfNeeded()
                }
            }
            else if (compactConstraint.isActive){
                UIView.animate(withDuration: 1.0) {
                    NSLayoutConstraint.deactivate(self.compactConstraints as! [NSLayoutConstraint])
                    NSLayoutConstraint.deactivate(self.regularConstraints as! [NSLayoutConstraint])
                    self.view.layoutIfNeeded()
                }
            }
        }
    }
    
    @objc func keyframeBasedLayoutChange(twoFingerDoubleTap:UITapGestureRecognizer) {
        if twoFingerDoubleTap.state == UIGestureRecognizer.State.ended {
            let regularConstraint: NSLayoutConstraint = regularConstraints.firstObject as! NSLayoutConstraint
            let compactConstraint: NSLayoutConstraint = compactConstraints.firstObject as! NSLayoutConstraint
            if regularConstraint.isActive {
                UIView.animateKeyframes(withDuration: 1.5, delay: 0, options: UIView.KeyframeAnimationOptions.calculationModeLinear, animations: {
                    self.animateToCompact()
                }) { (finished:Bool) in
                    print("回调")
                }
            }
            else if compactConstraint.isActive {
                UIView.animateKeyframes(withDuration: 1.5, delay: 0, options: UIView.KeyframeAnimationOptions.calculationModeLinear, animations: {
                    self.animateToRegular()
                }) { (finished:Bool) in
                    print("回调")
                }
            }
        }
    }
    
    func animateToRegular() {
        UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 1.0) {
            NSLayoutConstraint.deactivate([self.mercuryCenter])
            NSLayoutConstraint.activate([self.mercuryLeadingToTrailing])
            self.view.layoutIfNeeded()
        }
        
        UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 0.9) {
            NSLayoutConstraint.deactivate([self.venusCenter,self.neptuneCenter])
            NSLayoutConstraint.activate([self.venusLeadingToTrailing,self.neptuneLeadingToTrailing])
            self.view.layoutIfNeeded()
        }
        
        UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 0.7) {
            NSLayoutConstraint.deactivate([self.earthCenter, self.uranusCenter])
            NSLayoutConstraint.activate([self.earthLeadingToTrailing, self.uranusLeadingToTrailing])
            self.view.layoutIfNeeded()
        }
        
        UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 0.5) {
            NSLayoutConstraint.deactivate([self.marsCenter, self.jupiterCenter, self.saturnCenter])
            NSLayoutConstraint.activate([self.marsLeadingToTrailing, self.jupiterLeadingToTrailing, self.saturnLeadingToTrailing])
            self.view.layoutIfNeeded()
        }
    }
    
    func animateToCompact() {
        UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 1.0) {
            NSLayoutConstraint.deactivate([self.marsLeadingToTrailing, self.jupiterLeadingToTrailing, self.saturnLeadingToTrailing])
            NSLayoutConstraint.activate([self.marsCenter, self.jupiterCenter, self.saturnCenter])
            self.view.layoutIfNeeded()
        }
        
        UIView.addKeyframe(withRelativeStartTime: 0.1, relativeDuration: 0.9) {
            NSLayoutConstraint.deactivate([self.earthLeadingToTrailing,self.uranusLeadingToTrailing])
            NSLayoutConstraint.activate([self.earthCenter,self.uranusCenter])
            self.view.layoutIfNeeded()
        }
        
        UIView.addKeyframe(withRelativeStartTime: 0.3, relativeDuration: 0.7) {
            NSLayoutConstraint.deactivate([self.venusLeadingToTrailing,self.neptuneLeadingToTrailing])
            NSLayoutConstraint.activate([self.venusCenter,self.neptuneCenter])
            self.view.layoutIfNeeded()
        }
        
        UIView.addKeyframe(withRelativeStartTime: 0.5, relativeDuration: 0.5) {
            NSLayoutConstraint.deactivate([self.mercuryLeadingToTrailing])
            NSLayoutConstraint.activate([self.mercuryCenter])
            self.view.layoutIfNeeded()
        }
    }
    
    func setUpGestures() {
        let doubleTap = UITapGestureRecognizer(target: self, action: #selector(changeLayout(tapGesture:)))
        doubleTap.numberOfTapsRequired = 2
        doubleTap.numberOfTouchesRequired = 1
        self.view.addGestureRecognizer(doubleTap)
        
        let twoFingerDoubleTap = UITapGestureRecognizer(target: self, action: #selector(keyframeBasedLayoutChange(twoFingerDoubleTap:)))
        twoFingerDoubleTap.numberOfTapsRequired = 2
        twoFingerDoubleTap.numberOfTouchesRequired = 2
        self.view.addGestureRecognizer(twoFingerDoubleTap)
    }
}

