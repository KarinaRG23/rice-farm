import React from "react";
import ReactDOM from "react-dom/client";
import "bootstrap/dist/css/bootstrap.min.css";
import "bootstrap/dist/js/bootstrap.min.js";
import "./css/main_login.css";
import rice from "./img/rice.png";
import account from "./img/account.png";
import password from "./img/password.png";
//import {Formulario} from "../src/components/body/login"

const root = ReactDOM.createRoot(document.getElementById('root'));

function Formulario() {
    return <div>
        <div className="container">
            <div className="container-elements">
                <div className="container-image">
                    <img src={rice} alt="Logo del registro de lotes de cultivo" id="logo_page"/>
                    <h5>Hacienda "La Esperanza"</h5>
                    <h5>Inicio de sesion</h5>
                </div>
                <div className="container-form">
                    <form>
                        <div className="input-group mb-3">
                            <div className="input-group-prepend">
                                <span className="input-group-text" id="account basic-addon1">
                                    <img src={account} id="icon_account" alt="Icon Account"/>
                                </span>
                            </div>
                            <input type="text" className="form-control" id="input_usuario" placeholder="Usuario"/>
                        </div>
                        <div className="input-group mb-3">
                            <div className="input-group-prepend">
                                <span className="input-group-text" id="password basic-addon1">
                                    <img src={password} id="icon_password" alt="Icon password"/>
                                </span>
                            </div>
                            <input type="password" id="input_password" className="form-control" placeholder="Contrasenia"/>
                        </div>
                        <br></br>
                        <div className="container-button">
                            <button type="submit" className="btn btn-primary" id="submit">Ingresar</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
}

root.render(<div>
    <Formulario />
</div>)