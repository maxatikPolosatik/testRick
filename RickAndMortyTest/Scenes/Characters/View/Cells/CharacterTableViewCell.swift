import UIKit
import SnapKit

final class CharacterTableViewCell: UITableViewCell {
    
    private var characterImage: UIImageView = {
        let image = UIImageView()
        image.layer.cornerRadius = 40
        image.layer.masksToBounds = true
        return image
    }()
    
    private var nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .systemFont(ofSize: 21)
        return label
    }()
    
    private var typeLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .systemFont(ofSize: 14)
        return label
    }()
    
    private var locationImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "location")
        return image
    }()
    
    private var locationLabel: UILabel = {
        let label = UILabel()
        label.textColor = .darkGray
        label.font = .systemFont(ofSize: 14)
        return label
    }()
    
    private var statusView = CharacterStatusView()
    private var episodePlay = PlayEpisodeView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        setupSubviews()
        setupConstraints()
    }
    
    private func setupSubviews() {
        [characterImage, nameLabel, typeLabel,
         locationLabel, locationImage,episodePlay,
         statusView].forEach {
            contentView.addSubview($0)
        }
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        nameLabel.text = nil
        typeLabel.text = nil
        locationLabel.text = nil
        statusView.configure(status: "none")
    }
    
    private func setupConstraints() {
        characterImage.snp.makeConstraints { make in
            make.left.equalToSuperview().inset(16)
            make.size.equalTo(120)
            make.top.bottom.equalToSuperview().inset(16)
        }
        nameLabel.snp.makeConstraints { make in
            make.left.equalTo(characterImage.snp.right).offset(8)
            make.right.lessThanOrEqualTo(statusView.snp.left).offset(4)
            make.top.equalToSuperview().inset(16)
        }
        statusView.snp.makeConstraints { make in
            make.right.equalToSuperview().inset(16)
            make.height.equalTo(28)
            make.top.equalToSuperview().inset(16)
        }
        typeLabel.snp.makeConstraints { make in
            make.top.equalTo(nameLabel.snp.bottom).offset(4)
            make.left.equalTo(characterImage.snp.right).offset(8)
        }
        episodePlay.snp.makeConstraints { make in
            make.top.equalTo(typeLabel.snp.bottom).offset(8)
            make.left.equalTo(characterImage.snp.right).offset(8)
            make.height.equalTo(34)
            make.width.equalTo(148)
        }
        locationImage.snp.makeConstraints { make in
            make.top.equalTo(episodePlay.snp.bottom).offset(8)
            make.size.equalTo(12)
            make.left.equalTo(characterImage.snp.right).offset(8)
        }
        locationLabel.snp.makeConstraints { make in
            make.centerY.equalTo(locationImage.snp.centerY)
            make.left.equalTo(locationImage.snp.right).offset(2)
        }
    }
    
    func configure(character: PersonCharacter) {
        characterImage.setImage(imageUrl: character.image)
        nameLabel.text = character.name
        typeLabel.text = "\(character.species), \(character.gender)"
        locationLabel.text = character.location.name
        statusView.configure(status: character.status)
    }
}
