//
//  NextLaunchesViewController.swift
//  SpaceApp
//
//  Created by Rodrigo Borges on 04/03/22.
//

import UIKit

final class NextLaunchesViewController: UIViewController {

    private let nextLaunchesView: NextLaunchesView = {

        let nextLaunchesView = NextLaunchesView()
        return nextLaunchesView
    }()

    private let service = SpaceXService()

    override func viewDidLoad() {

        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "Space App 🚀"
    }

    override func viewDidAppear(_ animated: Bool) {

        service.fetchNextLaunches { launches in

            DispatchQueue.main.async {

                self.nextLaunchesView.updateView(with: launches)
            }
        }

    }

    override func loadView() {
        self.view = nextLaunchesView
    }
}
