import UIKit

final class PlayEpisodeView: UIView {
    
    private var container: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 17
        view.backgroundColor = .orange.withAlphaComponent(0.1)
        return view
    }()
    
    private var playImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "play.fill")?.withTintColor(.orange, renderingMode: .alwaysOriginal)
        return imageView
    }()
    
    private var playLabel: UILabel = {
        let label = UILabel()
        label.textColor = .orange
        label.font = .systemFont(ofSize: 14)
        label.text = "Watch Episodes"
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
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
        addSubview(container)
        container.addSubview(playImage)
        container.addSubview(playLabel)
    }
    
    private func setupConstraints() {
        container.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        playImage.snp.makeConstraints { make in
            make.left.equalToSuperview().inset(12)
            make.size.equalTo(12)
            make.centerY.equalToSuperview()
        }
        playLabel.snp.makeConstraints { make in
            make.left.equalTo(playImage.snp.right).offset(8)
            make.centerY.equalToSuperview()
        }
    }
}
