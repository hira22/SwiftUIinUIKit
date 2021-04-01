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

    @IBSegueAction func showHostingView(_ coder: NSCoder) -> UIViewController? {
        return HostingViewController(coder: coder, color: .green)
    }

    @IBAction func showSwiftUIViewWithCode(_ sender: Any) {
//        present(UIHostingController(rootView: SwiftUIView(color: .yellow)), animated: true)
        navigationController?.pushViewController(UIHostingController(rootView: SwiftUIView(color: .red)), animated: true)
    }

}


class HostingViewController: UIHostingController<SwiftUIView>{
    required init?(coder aDecoder: NSCoder) {
        // fatalError("init(coder:) has not been implemented")
        super.init(coder: aDecoder, rootView: SwiftUIView(color: .blue))

    }

    init?(coder: NSCoder, color: Color) {
        super.init(coder: coder, rootView: SwiftUIView(color: color))
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
