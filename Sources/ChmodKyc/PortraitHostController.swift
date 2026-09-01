import UIKit

final class PortraitHostController: UIViewController {

    private let content: UIViewController

    init(content: UIViewController) {
        self.content = content
        super.init(nibName: nil, bundle: nil)
        modalPresentationStyle = .fullScreen
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) is not supported")
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask { .portrait }

    override var shouldAutorotate: Bool { false }

    override var preferredInterfaceOrientationForPresentation: UIInterfaceOrientation { .portrait }

    override var childForStatusBarStyle: UIViewController? { content }

    override var childForHomeIndicatorAutoHidden: UIViewController? { content }

    override func viewDidLoad() {
        super.viewDidLoad()

        addChild(content)
        content.view.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(content.view)

        NSLayoutConstraint.activate([
            content.view.topAnchor.constraint(equalTo: view.topAnchor),
            content.view.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            content.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            content.view.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])

        content.didMove(toParent: self)
    }
}
