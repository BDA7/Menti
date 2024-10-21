//
//  ViewController.swift
//  TestingApp
//
//  Created by Данила Бондаренко on 12.10.2024.
//

import UIKit
import SnapKit


class ViewController: UIViewController {
    let tablewView = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()
        makeTableView()
    }

    func makeTableView() {
        tablewView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tablewView.register(UITableViewCell.self, forCellReuseIdentifier: "cell2")
        tablewView.separatorColor = .white
        tablewView.dataSource = self
        tablewView.delegate = self
        view.addSubview(tablewView)

        tablewView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1_000_000
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row % 2 == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell2", for: indexPath)
            cell.backgroundColor = .blue

            cell.textLabel?.text = "\(indexPath.row)"

            return cell
        }
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = "\(indexPath.row)"

        return cell
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
    }
}

#Preview {
    ViewController()
}
