//
//  Article.swift
//  nalisunovPW5
//
//  Created by Никита Лисунов on 25.10.2022.
//

import UIKit

enum Model {
    // MARK: - News
    struct News: Decodable {
        let status: String
        let totalResults: Int
        let articles: [Article]
    }
    
    // MARK: - Article
    struct Article: Decodable {
        let source: Source
        let author: String?
        let title: String
        let description: String?
        let url: String
        let urlToImage: String?
        let publishedAt: String
        let content: String?
    }
    
    // MARK: - Source
    struct Source: Decodable {
        let id: String?
        let name: String
    }
}
