//
//  ViewController.swift
//  SwiftUIinUIKit
//
//  Created by hiraoka on 2021/03/24.
//

import UIKit
import SwiftUI
import UILibrary

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

}


class HostingViewController: UIHostingController<SwiftUIView>{
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder, rootView: SwiftUIView())

    }
}

//struct Preview: PreviewProvider {
//    static var previews: some View {
//        Container().edgesIgnoringSafeArea(.all)
//    }
//
//    struct Container: UIViewControllerRepresentable {
//        func makeUIViewController(context: Context) -> some UIViewController {
//            UINavigationController(rootViewController: ViewController())
//        }
//
//        func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {}
//    }
//
//}
