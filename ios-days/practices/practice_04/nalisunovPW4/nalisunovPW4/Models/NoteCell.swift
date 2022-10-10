//
//  NoteCell.swift
//  nalisunovPW4
//
//  Created by Никита Лисунов on 07.10.2022.
//

import UIKit

final class NoteCell: UITableViewCell {
    static let reuseIdentifier = "NoteCell"
    private var noteText: UITextView = {
        let lbl = UITextView()
        lbl.font = .systemFont(ofSize: 18, weight: .regular)
        lbl.textColor = .black
        lbl.backgroundColor = .systemGray5
        return lbl
    }()
    
    override init(
        style: UITableViewCell.CellStyle,
        reuseIdentifier: String?
    ) {
        super.init(
            style: style,
            reuseIdentifier: reuseIdentifier
        )
        self.selectionStyle = .none
        self.backgroundColor = .systemGray5
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureUI() {
        noteText.isScrollEnabled = false
        self.addSubview(self.noteText)
        noteText.pin(
            to: self,
            [.left: 10, .right: 10, .bottom: 20, .top: 20]
        )
    }
    
    public func configure(note: ShortNote) {
        self.noteText.text = note.text
    }
}
