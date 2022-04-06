//
// Created by Sines on 3/25/22.
//

import Foundation
import UIKit
import CoreMotion
import AVFoundation

class ShakeViewController: BaseViewController, AVAudioPlayerDelegate {
    private let vm: ShakeVM = ShakeVM()
    private let motionManager = CMMotionManager()
    
    init(coordinator: ShakeBaseCoordinator) {
        super.init(nibName: nil, bundle: nil)
        vm.coordinator = coordinator
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = ShakeView(vm: vm)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let editBtn = UIBarButtonItem(title: "History", style: .plain, target: self, action: #selector(historyBtnClicked))
        navigationItem.rightBarButtonItem = editBtn
        navigationItem.title = "Shake"
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    // MARK: - actions
    @objc func historyBtnClicked() {
        vm.coordinator?.moveTo(flow: .shake(.history), userData: nil)
    }
}
