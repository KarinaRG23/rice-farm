<?php 
	require_once("Models/TCategoria.php");
	require_once("Models/TProducto.php");
	class Home extends Controllers{
		use TCategoria, TProducto;
		public function __construct()
		{
			parent::__construct();
			session_start();
		}

		public function home()
		{
			$pageContent = getPageRout('inicio');
			$data['page_tag'] = 'Hacienda "La esperanza"';
			$data['page_title'] = 'Hacienda "La esperanza"';
			$data['page_name'] = 'Hacienda "La esperanza"';
			$data['page'] = $pageContent;
			$data['slider'] = $this->getCategoriasT(CAT_SLIDER);
			$data['banner'] = $this->getCategoriasT(CAT_BANNER);
			$data['productos'] = $this->getProductosT();
			$this->views->getView($this,"home",$data); 
		}

	}
 ?>