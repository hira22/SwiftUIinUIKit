//
//  ViewController.swift
//  SwiftUIinUIKit
//
//  Created by hiraoka on 2021/03/24.
//

import UIKit
import SwiftUI
import Combine
import UILibrary
import IettyUI

class ViewController: UIViewController {

    private var subscriptions: Set<AnyCancellable> = []

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBSegueAction func showHostingView(_ coder: NSCoder) -> UIViewController? {
        return HostingViewController(coder: coder, color: .green)
    }

    @IBAction func showSwiftUIViewWithCode(_ sender: Any) {


        let interactor = WalkThroughInteractor(repository: Repository())
        let presentation = WalkThroughPresentation()
        let view = WalkThroughView()
            .environmentObject(interactor)
            .environmentObject(presentation)

        let viewController = UIHostingController(rootView: view)
        viewController.modalPresentationStyle = .fullScreen
        viewController.modalTransitionStyle = .flipHorizontal

        presentation.$isPresented
            .compactMap { $0 }
            .sink { [weak self] isPresent in
                if !isPresent {
//                    viewController.dismiss(animated: true)
                    self?.navigationController?.popViewController(animated: true)
                }
            }
            .store(in: &subscriptions)

//        present(viewController, animated: true)
        navigationController?.pushViewController(viewController, animated: true)
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
