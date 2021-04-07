//
//  ViewController.swift
//  SwiftUIinUIKit
//
//  Created by hiraoka on 2021/03/24.
//

import UIKit
import SwiftUI
import UILibrary
import IettyUI

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBSegueAction func showHostingView(_ coder: NSCoder) -> UIViewController? {
        return HostingViewController(coder: coder, color: .green)
    }

    @IBAction func showSwiftUIViewWithCode(_ sender: Any) {
        Rooter(self).showWalkThroughView()
//        let view = WalkThroughView(rooter: Rooter(self))
//            .environmentObject(WalkThroughInteractor(repository: Repository()))
//        present(UIHostingController(rootView: view), animated: true)
//        navigationController?.pushViewController(UIHostingController(rootView: view), animated: true)
    }


    class Rooter: WalkThroughRooterProtocol {
        unowned let viewController: UIViewController

        init(_ viewController: UIViewController) {
            self.viewController = viewController
        }

        func showWalkThroughView() {
            let view = WalkThroughView(rooter: self)
                .environmentObject(WalkThroughInteractor(repository: Repository()))

            viewController.present(UIHostingController(rootView: view), animated: true)
        }

        func showAuthenticationView() {
            viewController.dismiss(animated: true)

        }
    }
}

class Repository: WalkThroughRepositoryProtocol {
    var contents: [WalkThrough.Content] = [
        .init(title: "タイトル1", imageName: "", body: "なんとかかんとか説明が入る1"),
        .init(title: "タイトル2", imageName: "", body: "なんとかかんとか説明が入る2"),
        .init(title: "タイトル3", imageName: "", body: "なんとかかんとか説明が入る3"),
        .init(title: "タイトル4", imageName: "", body: "なんとかかんとか説明が入る4"),
        .init(title: "タイトル5", imageName: "", body: "なんとかかんとか説明が入る5"),
    ]
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
