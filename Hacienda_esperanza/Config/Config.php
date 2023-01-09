<?php 
	const BASE_URL = "http://localhost:8080/hacienda_esperanza";

	//Zona horaria
	date_default_timezone_set('America/Guayaquil');

	//Datos de conexión a Base de Datos
	const DB_HOST = "localhost";
	const DB_NAME = "hacienda_esperanza";
	const DB_USER = "root";
	const DB_PASSWORD = "";
	const DB_CHARSET = "utf8";

	//Para envío de correo
	const ENVIRONMENT = 1; // Local: 0, Produccón: 1;

	//Deliminadores decimal y millar Ej. 24,1989.00
	const SPD = ".";
	const SPM = ",";

	//Simbolo de moneda
	const SMONEY = "$";
	const CURRENCY = "USD";

	//Api PayPal
	//SANDBOX PAYPAL
	const URLPAYPAL = "https://api-m.sandbox.paypal.com";
	const IDCLIENTE = "";
	const SECRET = "";
	//LIVE PAYPAL
	//const URLPAYPAL = "https://api-m.paypal.com";
	//const IDCLIENTE = "";
	//const SECRET = "";

	//Datos envio de correo
	const NOMBRE_REMITENTE = 'Hacienda "La esperanza"';
	const EMAIL_REMITENTE = "haciendalaesperanza@gmail.com";
	const NOMBRE_EMPESA = 'Hacienda "La esperanza"';
	const WEB_EMPRESA = 'Hacienda "La esperanza"';

	const DESCRIPCION = "Control y ventas del arroz";
	const SHAREDHASH = 'Hacienda "La esperanza"';

	//Datos Empresa
	const DIRECCION = "Guayaquil 090104";
	const TELEMPRESA = "+(593)192928822";
	const WHATSAPP = "+929388282";
	const EMAIL_EMPRESA = "haciendalaesperanza@gmail.com";
	const EMAIL_PEDIDOS = "haciendalaesperanza@gmail.com";
	const EMAIL_SUSCRIPCION = "haciendalaesperanza@gmail.com";
	const EMAIL_CONTACTO = "haciendalaesperanza@gmail.com";

	const CAT_SLIDER = "1,2,3";
	const CAT_BANNER = "4,5,6";
	const CAT_FOOTER = "1,2,3,4,5";

	//Datos para Encriptar / Desencriptar
	const KEY = 'abelosh';
	const METHODENCRIPT = "AES-128-ECB";

	//Envío
	const COSTOENVIO = 5;

	//Módulos
	const MDASHBOARD = 1;
	const MUSUARIOS = 2;
	const MCLIENTES = 3;
	const MPRODUCTOS = 4;
	const MPEDIDOS = 5;
	const MCATEGORIAS = 6;
	const MSUSCRIPTORES = 7;
	const MDCONTACTOS = 8;
	const MDPAGINAS = 9;

	//Páginas
	const PINICIO = 1;
	const PTIENDA = 2;
	const PCARRITO = 3;
	const PNOSOTROS = 4;
	const PCONTACTO = 5;
	const PPREGUNTAS = 6;
	const PTERMINOS = 7;
	const PSUCURSALES = 8;
	const PERROR = 9;

	//Roles
	const RADMINISTRADOR = 1;
	const RSUPERVISOR = 2;
	const RCLIENTES = 3;
	const RVENDEDOR = 4;
	const RREPARTIDOR = 5;
	

	const STATUS = array('Completo','Aprobado','Cancelado','Reembolsado','Pendiente','Entregado');

	//Productos por página
	const CANTPORDHOME = 8;
	const PROPORPAGINA = 4;
	const PROCATEGORIA = 4;
	const PROBUSCAR = 4;

	//REDES SOCIALES
	const FACEBOOK = "";
	const INSTAGRAM = "";
	

 ?>