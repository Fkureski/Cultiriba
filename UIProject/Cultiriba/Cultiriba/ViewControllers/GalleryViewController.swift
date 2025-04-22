class GalleryViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    private var obras:[ObraDeArte] = []
    private var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Artistas Curitibanos"
        view.backgroundColor = .whitesetupCollectionView()
        carregarObras()
    }
    
    private func setipCollectionView(){
        let layout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = 10
        layout.minimumLineSpacing = 10
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: layout)
        collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        collectionView.backgroundColor = .whitecollectionView.dataSource
        collectionView.dataSource = self
        CollectionView.delegate = selfcollectionView.register(ObraCell.self, forCellWithReuseIdentifier: "ObraCell")
        view.addSubview(collectionView)
    }
    
    private func carregarObras(){
        obras = [
            ObraDeArte(titulo: "Titulo 1", artista: "Artista A", ano: 1990, estilo: "Estilo barroco", imagemNome: "Obra1", descricao: "Descricao"),
            ObraDeArte(titulo: "Titulo 2", artista: "Artista ", ano: 2000, estilo: "Estilo moderno", imagemNome: "Obra2", descricao: "Descricao"),        ]
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int){
        return obras.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICOllectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ObraCell", for: indexPath) as? ObraCell else {
            return UICollectionViewCell()
        }
        let obra = obras[indexPath.item]
        cell.configure(with: obra)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let detalheVC = DetalheObraViewController(obra: obras[indexPath.item])
        navigationController?.pushViewController(detalheVC, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, lauout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (collectionView.frame.width - 30) / 2
        return CGSize(width: width, height: width + 60)
    }
}
