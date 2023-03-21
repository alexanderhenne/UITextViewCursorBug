import UIKit

class ViewController: UIViewController {

    private var delegate: CursorBugTextViewDelegate = CursorBugTextViewDelegate()

    override func viewDidLoad() {
        super.viewDidLoad()

        let textView = UITextView(frame: CGRect(x: 25, y: 100, width: 300, height: 400))
        textView.backgroundColor = .brown
        textView.delegate = delegate
        textView.font = .systemFont(ofSize: 15.0)
        view.addSubview(textView)

        let endEditingButton = UIButton(type: .system)
        endEditingButton.frame = CGRect(x: 25, y: 25, width: 125, height: 50)
        endEditingButton.setTitle("End editing", for: .normal)
        endEditingButton.setTitleColor(.white, for: .normal)
        endEditingButton.backgroundColor = .brown
        endEditingButton.addAction(UIAction { [weak self] _ in
            self?.view.endEditing(true)
        }, for: .touchUpInside)
        view.addSubview(endEditingButton)

        let toggleColoringButton = UIButton(type: .system)
        toggleColoringButton.frame = CGRect(x: 175, y: 25, width: 150, height: 50)
        toggleColoringButton.setTitle("Toggle coloring", for: .normal)
        toggleColoringButton.setTitleColor(.white, for: .normal)
        toggleColoringButton.backgroundColor = .brown
        toggleColoringButton.addAction(UIAction { [weak self] _ in
            guard let self = self else { return }
            self.delegate.coloringEnabled = !self.delegate.coloringEnabled
        }, for: .touchUpInside)
        view.addSubview(toggleColoringButton)
    }
}

class CursorBugTextViewDelegate: NSObject, UITextViewDelegate {

    var coloringEnabled: Bool = true

    public func textViewDidBeginEditing(_ textView: UITextView) {
        if coloringEnabled {
            textView.textColor = .cyan
        }
    }
}
