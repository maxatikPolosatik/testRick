import UIKit

final class CharacterStatusView: UIView {
    
    private var container: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 14
        return view
    }()
    
    private var statusLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14)
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
        container.addSubview(statusLabel)
    }
    
    private func setupConstraints() {
        container.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        statusLabel.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.horizontalEdges.equalToSuperview().inset(8)
        }
    }
    
    func configure(status: String) {
        statusLabel.text = status.uppercased()
        switch status {
        case "Alive":
            statusLabel.textColor = .green
            container.backgroundColor = .green.withAlphaComponent(0.1)
        case "Dead":
            statusLabel.textColor = .red
            container.backgroundColor = .red.withAlphaComponent(0.1)
        case "unknown":
            statusLabel.textColor = .gray
            container.backgroundColor = .gray.withAlphaComponent(0.1)
        default:
            statusLabel.textColor = .none
            container.backgroundColor = .none
            print("not found")
        }
    }
}
