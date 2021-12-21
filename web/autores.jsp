<%-- 
    Document   : autores
    Created on : 4/11/2021, 08:15:04 AM
    Author     : fido
--%>

<%@page import="logica.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF" crossorigin="anonymous"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.9/angular.min.js"></script>
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
        <style>
            /*div{ border: dotted;}*/
        </style>
        <title>Autores</title>
    </head>
    <body>
        <%
            Usuario u = (Usuario) session.getAttribute("usuario");
            if (u != null) {
        %>
        <jsp:include page="menu.jsp"/>
        <div class="container-fluid" ng-app="autores" ng-controller="autorController as ac">
            <div class="row mt-2" >
                <div class="col-10"><h2>Bienvenido/a: <%=u.getNombreDeUsuario()%></h2></div>
                <div class="col-2"><button type="button" class="btn btn-outline-danger btn-block" ng-click="ac.cerrarSesion()">Cerrar sesion</button></div>
            </div>
            <div class="row">
                <div class="col-6">
                    <div class="row">
                        <div class="col-6"> 
                            <label>Codigo</label>
                            <input type="text" class="form-control" placeholder="Codigo" ng-model="ac.codigo">
                        </div>
                        <div class="col-6"> 
                            <label>Nombre</label>
                            <input type="text" class="form-control" placeholder="Nombre" ng-model="ac.nombre">
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-6"> 
                            <label >Nacionalidad</label>
                            <select class="form-control" ng-model="ac.nacionalidad">
                                <option>Colombiano</option>
                                <option>Mexicano</option>
                                <option>Peruano</option>
                            </select>
                        </div>
                        <div class="col-6"></div>
                    </div>
                    <br>
                    <div class="row">
                        <div class="col-2"> 
                            <button type="button" class="btn btn-success" ng-click="ac.guardar()">Guardar</button>
                        </div>
                        <div class="col-2"> 
                            <button type="button" class="btn btn-primary" ng-click="ac.listar()">Listar</button> 
                        </div>
                        <div class="col-3"> 
                            <button type="button" class="btn btn-warning" ng-click="ac.actualizar()">Actualizar</button>
                        </div>
                        <div class="col-2"> 
                            <button type="button" class="btn btn-danger" data-toggle="modal" data-target="#eliminarModal">Eliminar</button>
                        </div>
                        <div class="col-3"> 
                            <button type="button" class="btn btn-secondary" ng-click="ac.limpiar()">Limpiar campos</button>
                        </div>

                    </div>
                </div>
                <div class="col-6">
                    <div class="row">
                        <div class="col-6"> 
                            <label>Codigo</label>
                            <input type="text" class="form-control" placeholder="Codigo" disabled="" value="{{ac.codigo}}">
                        </div>
                        <div class="col-6"> 
                            <label>Nombre</label>
                            <input type="text" class="form-control" placeholder="Nombre" disabled="" value="{{ac.nombre}}">
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-6"> 
                            <label >Nacionalidad</label>
                            <input type="text" class="form-control" placeholder="Nacionalidad" disabled="" value="{{ac.nacionalidad}}">
                        </div>
                        <div class="col-6"></div>
                    </div>

                </div>
            </div>
            <div class="row mt-2">
                <div class="col-12">
                    Seccion 3
                    <table class="table">
                        <thead class="thead-dark">
                            <tr>
                                <th scope="col">Código</th>
                                <th scope="col">Nombre</th>
                                <th scope="col">Nacionalidad</th>
                                <th scope="col">Acciones</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr ng-repeat="a in ac.Autores">
                                <td>{{a.codigo}}</td>
                                <td>{{a.nombre}}</td>
                                <td>{{a.nacionalidad}}</td>
                                <td>
                                    <div class="row">
                                        <div class="col6 mr-3">
                                            <button type="button" class="btn btn-info" ng-click="ac.editar(a.codigo)">Editar</button>
                                        </div>
                                        <div class="col6">
                                            <button type="button" class="btn btn-info" data-toggle="modal" data-target="#verMasModal" ng-click="ac.verMas(a.codigo)">Ver mas</button>
                                        </div>
                                    </div>
                                </td>
                            </tr>

                        </tbody>
                    </table>
                </div>
            </div>
            <!-- Modal eliminar-->
            <div class="modal fade" id="eliminarModal" tabindex="-1" aria-labelledby="eliminarModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="eliminarModalLabel">¿Está seguro de eliminar ese registro?</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            El registro será eliminado completamente de la base de datos
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">No</button>
                            <button type="button" class="btn btn-primary" data-dismiss="modal" ng-click="ac.eliminar()">SI</button>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Modal ver mas-->
            <div class="modal fade" id="verMasModal" tabindex="-1" aria-labelledby="verMasModalLabel" aria-hidden="true">
                <div class="modal-dialog modal-xl">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="verMasModalLabel">Datos del autor</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            {{ac.Autor}}
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script>
            var app = angular.module('autores', []);
            app.controller('autorController', ['$http', controladorAutor]);
            function controladorAutor($http) {
                var ac = this;
                validar = function (tipoDeValidacion) {
                    var codigo = ac.codigo ? true : false;
                    var nombre = ac.nombre ? true : false;
                    var nacionalidad = ac.nacionalidad ? true : false;
                    if (tipoDeValidacion === 'todosLosCampos') {
                        if (codigo && nombre && nacionalidad) {
                            return true;
                        } else {
                            return false;
                        }
                    } else if (tipoDeValidacion === 'soloCodigo') {
                        if (codigo) {
                            return true;
                        } else {
                            return false;
                        }
                    } else {
                        return false;
                    }
                };
                ac.listar = function () {
                    var parametros = {
                        proceso: 'listar'
                    };
                    $http({
                        method: 'POST',
                        url: 'peticionesAutor.jsp',
                        params: parametros
                    }).then(function (res) {
                        ac.Autores = res.data.Autores;
                    });
                };
                ac.guardar = function () {
                    if (validar('todosLosCampos')) {
                        var parametros = {
                            proceso: 'guardar',
                            codigo: ac.codigo,
                            nombre: ac.nombre,
                            nacionalidad: ac.nacionalidad
                        };
                        $http({
                            method: 'POST',
                            url: 'peticionesAutor.jsp',
                            params: parametros
                        }).then(function (res) {
                            if (res.data.ok === true) {//verificar si el proceso existe
                                if (res.data.guardar === true) {//verifica el resultado de la transaccion
                                    swal({
                                        title: "Guardó",
                                        text: "El registro fue guardado exitosamente",
                                        icon: "success",
                                        button: "cerrar"
                                    });
                                } else {
                                    swal({
                                        title: "No guardó",
                                        text: "El registro no fue guardado exitosamente",
                                        icon: "error",
                                        button: "cerrar"
                                    });
                                }
                            } else {
                                swal({
                                    title: "Falló",
                                    text: res.data.errorMsg,
                                    icon: "error",
                                    button: "cerrar"
                                });
                            }
                        });
                    } else {
                        swal({
                            title: "Verificar Campos",
                            text: "Todos los campos son obligatorios",
                            icon: "warning",
                            button: "cerrar"
                        });
                    }
                };
                ac.actualizar = function () {
                    if (validar('todosLosCampos')) {
                        var parametros = {
                            proceso: 'actualizar',
                            codigo: ac.codigo,
                            nombre: ac.nombre,
                            nacionalidad: ac.nacionalidad
                        };
                        $http({
                            method: 'POST',
                            url: 'peticionesAutor.jsp',
                            params: parametros
                        }).then(function (res) {
                            if (res.data.ok === true) {
                                if (res.data.actualizar === true) {
                                    swal({
                                        title: "Ejecutado",
                                        text: "El registro fue actualizado exitosamente",
                                        icon: "success",
                                        button: "cerrar"
                                    });
                                } else {
                                    swal({
                                        title: "No ejecutado",
                                        text: "El registro no fue actualizado exitosamente",
                                        icon: "error",
                                        button: "cerrar"
                                    });
                                }
                            } else {
                                swal({
                                    title: "Falló",
                                    text: res.data.errorMsg,
                                    icon: "error",
                                    button: "cerrar"
                                });
                            }
                        });
                    } else {
                        swal({
                            title: "Verificar Campos",
                            text: "Todos los campos son obligatorios",
                            icon: "warning",
                            button: "cerrar"
                        });
                    }
                };
                ac.eliminar = function () {
                    if (validar('soloCodigo')) {
                        var parametros = {
                            proceso: 'eliminar',
                            codigo: ac.codigo
                        };
                        $http({
                            method: 'POST',
                            url: 'peticionesAutor.jsp',
                            params: parametros
                        }).then(function (res) {
                            if (res.data.ok === true) {
                                if (res.data.eliminar === true) {
                                    swal({
                                        title: "Ejecutado",
                                        text: "El registro fue eliminado exitosamente",
                                        icon: "success",
                                        button: "cerrar"
                                    });
                                } else {
                                    swal({
                                        title: "No ejecutado",
                                        text: "El registro fue eliminado exitosamente",
                                        icon: "success",
                                        button: "cerrar"
                                    });
                                }
                            } else {
                                swal({
                                    title: "Falló",
                                    text: res.data.errorMsg,
                                    icon: "error",
                                    button: "cerrar"
                                });
                            }
                        });
                    } else {
                        swal({
                            title: "Verificar Campos",
                            text: "El campo código es obligatorio",
                            icon: "warning",
                            button: "cerrar"
                        });
                    }
                };
                ac.editar = function (cod) {
                    var parametros = {
                        proceso: 'consultarIndividual',
                        codigo: cod
                    };
                    $http({
                        method: 'POST',
                        url: 'peticionesAutor.jsp',
                        params: parametros
                    }).then(function (res) {
                        ac.codigo = res.data.Autor.codigo;
                        ac.nombre = res.data.Autor.nombre;
                        ac.nacionalidad = res.data.Autor.nacionalidad;
                    });
                };
                ac.verMas = function (cod) {
                    var parametros = {
                        proceso: 'consultarIndividual',
                        codigo: cod
                    };
                    $http({
                        method: 'POST',
                        url: 'peticionesAutor.jsp',
                        params: parametros
                    }).then(function (res) {
                        ac.Autor = res.data.Autor;
                    });
                };
                ac.limpiar = function () {
                    ac.codigo = undefined;
                    ac.nombre = undefined;
                    ac.nacionalidad = undefined;
                };
                ac.cerrarSesion = function () {
                    var parametros = {
                        proceso: 'cerrarSesion'
                    };
                    $http({
                        method: 'POST',
                        url: 'peticionesLogin.jsp',
                        params: parametros
                    }).then(function (res) {
                        if (res.data.ok === true) {
                            window.location.href="autores.jsp";
                        } else {
                            alert(res.data.errorMsg);
                        }
                    });
                };
            }
        </script>
        <%} else {%>
    <center><a href="index.jsp">La sesion caducó o no se ha iniciado sesion click acá para ingresar</a></center>
        <%}%>

</body>
<jsp:include page="footer.jsp"/>
</html>
