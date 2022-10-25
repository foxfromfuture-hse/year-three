//
//  NewsListViewController.swift
//  nalisunovPW5
//
//  Created by Никита Лисунов on 24.10.2022.
//

import UIKit

extension URLSession {
    func getTopStories(completion: @escaping ((Model.News) -> ())) {
        guard let url = URL(
            string: "https://newsapi.org/v2/top-headlines?country=us&apiKey=e361c607451d421e8cb54ffaa4493ced"
        ) else {
            return
        }
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if
                let data = data,
                let news = try? JSONDecoder().decode(Model.News.self, from: data)
            {
                completion(news)
            } else {
                print("Could not get any content")
            }
        }
        task.resume()
    }
}

extension NewsListViewController: UITableViewDataSource {
    func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int
    ) -> Int {
        if isLoading {
            return 1
        } else {
            return newsViewModels.count
        }
    }
    
    func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        if isLoading {
            let newsCell = NewsCell()
            newsCell.loadConfigure()
            return(newsCell)
        } else {
            let viewModel = newsViewModels[indexPath.row]
            if let newsCell = tableView.dequeueReusableCell(
                withIdentifier: NewsCell.reuseIdentifier,
                for: indexPath
            ) as? NewsCell {
                newsCell.configure(with: viewModel)
                return newsCell
            }
        }
        return UITableViewCell()
    }
}

extension NewsListViewController: UITableViewDelegate {
    func tableView(
        _ tableView: UITableView,
        didSelectRowAt indexPath: IndexPath
    ) {
        if !isLoading {
            let newsVC = NewsViewController()
            newsVC.configure(with: newsViewModels[indexPath.row])
            navigationController?.pushViewController(newsVC, animated: true)
        }
    }
}

final class NewsListViewController: UIViewController {
    private var tableView = UITableView(frame: .zero, style: .plain)
    private var isLoading = false
    private var newsViewModels = [NewsViewModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.isLoading = true
        loadNews()
        configureUI()
    }
    
    private func configureUI() {
        view.backgroundColor = .systemBackground
        configureTableView()
    }
    
    private func configureTableView() {
        setupNavBar()
        setTableViewUI()
        setTableViewDelegate()
        setTableViewCell()
    }
    
    private func setupNavBar() {
        navigationItem.title = "Articles"
        navigationItem.leftBarButtonItem = UIBarButtonItem(
            image: UIImage(systemName: "chevron.left"),
            style: .plain,
            target: self,
            action: #selector(goBack)
        )
        navigationItem.leftBarButtonItem?.tintColor = .label
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            image: UIImage(systemName: "arrow.counterclockwise"),
            style: .plain,
            target: self,
            action: #selector(loadNews)
        )
        navigationItem.rightBarButtonItem?.tintColor = .label
    }
    
    private func setTableViewDelegate() {
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    private func setTableViewUI() {
        view.addSubview(tableView)
        tableView.backgroundColor = .clear
        tableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        tableView.rowHeight = 120
        tableView.pinLeft(to: view)
        tableView.pinTop(to: view.safeAreaLayoutGuide.topAnchor)
        tableView.pinRight(to: view)
        tableView.pinBottom(to: view)
    }
    
    private func setTableViewCell() {
        tableView.register(
            NewsCell.self,
            forCellReuseIdentifier: NewsCell.reuseIdentifier
        )
    }
    
    private func fetchNews() {
        URLSession.shared.getTopStories { [weak self] result in
            self?.newsViewModels = result.articles.compactMap {
                NewsViewModel(
                    title: $0.title,
                    description: $0.description ?? "No description",
                    imageURL: URL(string: $0.urlToImage ?? "")
                )
            }
            DispatchQueue.main.async {
                self?.isLoading = false
                self?.tableView.reloadData()
            }
        }
    }
    
    @objc
    private func loadNews() {
        self.isLoading = true
        self.tableView.reloadData()
        self.fetchNews()
    }
    
    @objc
    private func goBack() {
        self.navigationController?.popViewController(animated: true)
    }
}
