//
//  OnboardViewController.swift
//  Taskcy
//
//  Created by 김시연 on 2023/09/06.
//

import UIKit

class OnboardViewController: UIViewController {

    @IBOutlet weak var onboardPageControl: UIPageControl!
    @IBOutlet weak var nextPageButton: UIButton!
    @IBOutlet weak var skipButton: UIButton!
    
    var onboardPageViewController: OnboardPageViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        onboardPageControl.preferredIndicatorImage = UIImage(named: "otherPageIndicator")
        onboardPageControl.setIndicatorImage(UIImage(named: "currentPageIndicator"), forPage: 0)
        //onboardPageControl.pageIndicatorTintColor = UIColor(named: "808080")
        //onboardPageControl.currentPageIndicatorTintColor = UIColor(named: "756EF3")
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let desinationViewController = segue.destination as? OnboardPageViewController {
            onboardPageViewController = desinationViewController
            onboardPageViewController.onboardDelegate = self
        }
    }
    
    @IBAction func nextPageButtonTapped(_ sender: Any) {
        let nextPageIndex = onboardPageControl.currentPage + 1
        onboardPageViewController.goToPage(index: nextPageIndex)
        onboardPageControl.currentPage = nextPageIndex
        updatePageControlUI(currentPageIndex: nextPageIndex)
    }
    @IBAction func onboardPageControlValueChanged(_ sender: Any) {
        let currentPageIndex = onboardPageControl.currentPage
        onboardPageViewController.goToPage(index: currentPageIndex)
        updatePageControlUI(currentPageIndex: currentPageIndex)
    }
    
    func updatePageControlUI(currentPageIndex: Int) {
        (0..<onboardPageControl.numberOfPages).forEach { (index) in
            let currentPageIconImage = UIImage(named: "currentPageIndicator")
            let otherPageIconImage = UIImage(named: "otherPageIndicator")
            let pageIcon = index == currentPageIndex ? currentPageIconImage : otherPageIconImage
            onboardPageControl.setIndicatorImage(pageIcon, forPage: index)
        }
    }
}

extension OnboardViewController: OnboardPageControlDelegate {
    func numberOfPage(numberOfPage: Int) {
        onboardPageControl.numberOfPages = numberOfPage
    }
    
    func pageChangedTo(index: Int) {
        updatePageControlUI(currentPageIndex: index)
        onboardPageControl.currentPage = index
    }
}

protocol OnboardPageControlDelegate: AnyObject {
    func numberOfPage(numberOfPage: Int)
    func pageChangedTo(index: Int)
}
