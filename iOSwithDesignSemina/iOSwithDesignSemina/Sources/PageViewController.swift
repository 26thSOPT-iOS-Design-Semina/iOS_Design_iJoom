//
//  PageViewController.swift
//  iOSwithDesignSemina
//
//  Created by IJ . on 2020/05/27.
//  Copyright © 2020 jun. All rights reserved.
//

import UIKit

class PageViewController: UIPageViewController, UIPageViewControllerDataSource, UIPageViewControllerDelegate {
    
    
    let pageControl = UIPageControl()
    
    lazy var VCArray:[UIViewController] = {
        return [self.VCInstance(name: "FirstVC"),
                self.VCInstance(name: "SecondVC"),
                self.VCInstance(name: "ThirdVC")]
    }()
    private func VCInstance(name: String)->UIViewController{
        return UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: name)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.dataSource = self
        self.delegate = self
        
 
      
        
        if let firstVC = VCArray.first{
            setViewControllers([firstVC], direction: .forward, animated: true, completion: nil)
        }
        configureMyPageControl()
        
    }
    
    func configureMyPageControl(){
        // PageControl 세팅
        self.pageControl.frame = CGRect()
        self.pageControl.currentPageIndicatorTintColor = UIColor.black
        self.pageControl.pageIndicatorTintColor = UIColor.lightGray
        self.pageControl.numberOfPages = self.VCArray.count
        self.pageControl.currentPage = 0
        self.view.addSubview(self.pageControl)
        
        self.pageControl.translatesAutoresizingMaskIntoConstraints = false
        self.pageControl.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -50).isActive = true
        self.pageControl.widthAnchor.constraint(equalTo: self.view.widthAnchor, constant: -20).isActive = true
        self.pageControl.heightAnchor.constraint(equalToConstant: 20).isActive = true
        self.pageControl.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        
        
        
    }
    
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = VCArray.firstIndex(of: viewController) else {
            return nil
        }
        
        let previousIndex = viewControllerIndex - 1
        
        guard previousIndex >= 0 else{
            return VCArray.last
        }
        
        guard VCArray.count > previousIndex else{
            return nil
        }
        
        return VCArray[previousIndex]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = VCArray.firstIndex(of: viewController) else {
            return nil
        }
        
        let nextIndex = viewControllerIndex + 1
        
        guard nextIndex < VCArray.count else{
            return VCArray.first
        }
        
        guard VCArray.count > nextIndex else{
            return nil
        }
        
        return VCArray[nextIndex]
    }
    
    public func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return VCArray.count
    }
    
    public func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        
        
        guard let firstViewController = viewControllers?.first, let firstViewControllerIndex = VCArray.firstIndex(of: firstViewController) else{
            return 0
        }
        return firstViewControllerIndex
    }
    
//    func pageViewController(_ pageViewController: UIPageViewController, willTransitionTo pendingViewControllers: [UIViewController]) {
//       guard let firstViewController = viewControllers?.first, let firstViewControllerIndex = VCArray.firstIndex(of: firstViewController) else{
//
//        return
//              }
//        self.pageControl.currentPage = firstViewControllerIndex
//
//
//    }
    //    override func viewDidLayoutSubviews() {
    //        super.viewDidLayoutSubviews()
    //        for view in self.view.subviews{
    //            if view is UIScrollView{
    //                view.frame = UIScreen.main.bounds
    //            }else if view is UIPageControl{
    //                view.backgroundColor = UIColor.blue
    //            }
    //        }
    //    }
    
    
    
    
    
}
