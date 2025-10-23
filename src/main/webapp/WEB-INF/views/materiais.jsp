<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="icon" href="${pageContext.request.contextPath}/assets/images/favicon.ico" type="image/ico"/>

    <title>Paraíso Gráfica Rápida - Materiais</title>

    <!-- Bootstrap -->
    <link href="${pageContext.request.contextPath}/assets/vendors/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="${pageContext.request.contextPath}/assets/vendors/font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <!-- NProgress -->
    <link href="${pageContext.request.contextPath}/assets/vendors/nprogress/nprogress.css" rel="stylesheet">
    <!-- iCheck -->
    <link href="${pageContext.request.contextPath}/assets/vendors/iCheck/skins/flat/green.css" rel="stylesheet">
    <!-- Datatables -->
    <link href="${pageContext.request.contextPath}/assets/vendors/datatables.net-bs/css/dataTables.bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/assets/vendors/datatables.net-buttons-bs/css/buttons.bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/assets/vendors/datatables.net-fixedheader-bs/css/fixedHeader.bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/assets/vendors/datatables.net-responsive-bs/css/responsive.bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/assets/vendors/datatables.net-scroller-bs/css/scroller.bootstrap.min.css" rel="stylesheet">

    <!-- Custom Theme Style -->
    <link href="${pageContext.request.contextPath}/assets/css/custom.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/assets/css/style-extra-bs4.css" rel="stylesheet">
</head>

<body class="nav-md">
<div class="body">
    <div class="main_container container-fluid">
        <div class="row">
            <div class="col-lg-2 col-md-2 left_col">
                <div class="left_col">
                    <div class="navbar nav_title" style="border: 0;">
                        <a href="dashboard" class="site_title"><i class="fa fa-print"></i> <span>Paraíso Gráfica</span></a>
                    </div>
                    <div class="clearfix"></div>

                    <!-- menu profile quick info -->
                    <div class="profile clearfix">
                        <div class="profile_pic">
                            <img src="${pageContext.request.contextPath}/assets/images/user.png" alt="..." class="img-circle profile_img">
                        </div>
                        <div class="profile_info">
                            <span>Bem-vindo,</span>
                            <h2>${sessionScope.nome}</h2>
                        </div>
                    </div>
                    <!-- /menu profile quick info -->

                    <br/>

                    <!-- sidebar menu -->
                    <div id="sidebar-menu" class="main_menu_side hidden-print main_menu">
                        <div class="menu_section">
                            <h3>Geral</h3>
                            <ul class="nav side-menu">
                                <li><a><i class="fa fa-home"></i> Início <span class="fa fa-chevron-down"></span></a>
                                    <ul class="nav child_menu">
                                        <li><a href="dashboard">Dashboard</a></li>
                                    </ul>
                                </li>
                                <li><a><i class="fa fa-cubes"></i> Materiais <span class="fa fa-chevron-down"></span></a>
                                    <ul class="nav child_menu">
                                        <li><a href="materiais">Listar Materiais</a></li>
                                        <li><a href="materiais?action=form">Novo Material</a></li>
                                    </ul>
                                </li>
                            </ul>
                        </div>
                    </div>
                    <!-- /sidebar menu -->

                    <!-- /menu footer buttons -->
                    <div class="col-lg-2 sidebar-footer hidden-small">
                        <a data-toggle="tooltip" data-placement="top" title="Configurações">
                            <span class="fa fa-cog" aria-hidden="true"></span>
                        </a>
                        <a data-toggle="tooltip" data-placement="top" title="Tela Cheia">
                            <span class="fa fa-arrows-alt" aria-hidden="true"></span>
                        </a>
                        <a data-toggle="tooltip" data-placement="top" title="Bloquear">
                            <span class="fa fa-eye-slash" aria-hidden="true"></span>
                        </a>
                        <a data-toggle="tooltip" data-placement="top" title="Sair" href="logout">
                            <span class="fa fa-power-off" aria-hidden="true"></span>
                        </a>
                    </div>
                    <!-- /menu footer buttons -->
                </div>
            </div>
            <div class="col-lg-10 col-md-12 right_col_wrapper">
                <div class="row">
                    <!-- top navigation -->
                    <div class="top_nav col-md-12">
                        <div class="nav_menu">
                            <nav>
                                <div class="nav toggle">
                                    <a id="menu_toggle"><i class="fa fa-bars"></i></a>
                                </div>

                                <ul class="nav navbar-nav navbar-right">
                                    <li class="">
                                        <a href="javascript:;" class="user-profile dropdown-toggle"
                                           data-toggle="dropdown" aria-expanded="false">
                                            <img src="${pageContext.request.contextPath}/assets/images/user.png" alt="">${sessionScope.nome}
                                            <span class=" fa fa-angle-down"></span>
                                        </a>
                                        <ul class="dropdown-menu dropdown-usermenu pull-right">
                                            <li><a href="javascript:;"> Perfil</a></li>
                                            <li><a href="javascript:;"> Configurações</a></li>
                                            <li><a href="logout"><i class="fa fa-sign-out pull-right"></i> Sair</a></li>
                                        </ul>
                                    </li>
                                </ul>
                            </nav>
                        </div>
                    </div>
                    <!-- /top navigation -->
                    <!-- page content -->
                    <div class="right_col col-md-12" role="main">
                        <div class="">
                            <div class="page-title">
                                <div class="title_left">
                                    <h3>Gerenciamento de Materiais</h3>
                                </div>
                                <div class="title_right">
                                    <div class="col-md-5 col-sm-5 col-12 form-group pull-right top_search">
                                        <div class="input-group">
                                            <input type="text" class="form-control" placeholder="Buscar material...">
                                            <span class="input-group-btn">
                                                <button class="btn btn-default" type="button">Go!</button>
                                            </span>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="clearfix"></div>

                            <div class="row">
                                <div class="col-md-12 col-sm-12 col-12">
                                    <div class="x_panel">
                                        <div class="x_title">
                                            <h2>Lista de Materiais</h2>
                                            <ul class="nav navbar-right panel_toolbox">
                                                <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a></li>
                                                <li><a class="close-link"><i class="fa fa-close"></i></a></li>
                                            </ul>
                                            <div class="clearfix"></div>
                                        </div>
                                        <div class="x_content">
                                            <div class="row">
                                                <div class="col-sm-12">
                                                    <div class="card-box table-responsive">
                                                        <p class="text-muted font-13 m-b-30">
                                                            <a href="materiais?action=form" class="btn btn-primary">
                                                                <i class="fa fa-plus"></i> Novo Material
                                                            </a>
                                                        </p>
                                                        <table id="datatable" class="table table-striped table-bordered" style="width:100%">
                                                            <thead>
                                                                <tr>
                                                                    <th>ID</th>
                                                                    <th>Nome</th>
                                                                    <th>Descrição</th>
                                                                    <th>Categoria</th>
                                                                    <th>Quantidade</th>
                                                                    <th>Preço Unit.</th>
                                                                    <th>Fornecedor</th>
                                                                    <th>Valor Total</th>
                                                                    <th>Ações</th>
                                                                </tr>
                                                            </thead>
                                                            <tbody>
                                                                <c:forEach var="material" items="${materiais}">
                                                                    <tr>
                                                                        <td>${material.id}</td>
                                                                        <td>${material.nome}</td>
                                                                        <td>${material.descricao}</td>
                                                                        <td>${material.categoria}</td>
                                                                        <td>
                                                                            <c:choose>
                                                                                <c:when test="${material.quantidade < 10}">
                                                                                    <span class="badge badge-warning">${material.quantidade}</span>
                                                                                </c:when>
                                                                                <c:otherwise>
                                                                                    <span class="badge badge-success">${material.quantidade}</span>
                                                                                </c:otherwise>
                                                                            </c:choose>
                                                                        </td>
                                                                        <td><fmt:formatNumber value="${material.precoUnitario}" type="currency" currencySymbol="R$ "/></td>
                                                                        <td>${material.fornecedor}</td>
                                                                        <td><fmt:formatNumber value="${material.valorTotal}" type="currency" currencySymbol="R$ "/></td>
                                                                        <td>
                                                                            <a href="materiais?action=edit&id=${material.id}" class="btn btn-info btn-xs">
                                                                                <i class="fa fa-pencil"></i> Editar
                                                                            </a>
                                                                            <a href="materiais?action=delete&id=${material.id}" 
                                                                               class="btn btn-danger btn-xs"
                                                                               onclick="return confirm('Tem certeza que deseja excluir este material?')">
                                                                                <i class="fa fa-trash-o"></i> Excluir
                                                                            </a>
                                                                        </td>
                                                                    </tr>
                                                                </c:forEach>
                                                            </tbody>
                                                        </table>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- /page content -->
                    <!-- footer content -->
                    <footer class="col-md-12">
                        <div class="pull-right">
                            Paraíso Gráfica Rápida - Sistema de Gestão de Materiais
                        </div>
                        <div class="clearfix"></div>
                    </footer>
                </div>
            </div>
            <!-- /footer content -->
        </div>
    </div>
</div>

<!-- jQuery -->
<script src="${pageContext.request.contextPath}/assets/vendors/jquery/dist/jquery.min.js"></script>
<!-- Bootstrap -->
<script src="${pageContext.request.contextPath}/assets/vendors/bootstrap/dist/js/bootstrap.min.js"></script>
<!-- FastClick -->
<script src="${pageContext.request.contextPath}/assets/vendors/fastclick/lib/fastclick.js"></script>
<!-- NProgress -->
<script src="${pageContext.request.contextPath}/assets/vendors/nprogress/nprogress.js"></script>
<!-- Datatables -->
<script src="${pageContext.request.contextPath}/assets/vendors/datatables.net/js/jquery.dataTables.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendors/datatables.net-bs/js/dataTables.bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendors/datatables.net-buttons/js/dataTables.buttons.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendors/datatables.net-buttons-bs/js/buttons.bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendors/datatables.net-buttons/js/buttons.flash.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendors/datatables.net-buttons/js/buttons.html5.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendors/datatables.net-buttons/js/buttons.print.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendors/datatables.net-fixedheader/js/dataTables.fixedHeader.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendors/datatables.net-keytable/js/dataTables.keyTable.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendors/datatables.net-responsive/js/dataTables.responsive.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendors/datatables.net-responsive-bs/js/responsive.bootstrap.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendors/datatables.net-scroller/js/dataTables.scroller.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendors/jszip/dist/jszip.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendors/pdfmake/build/pdfmake.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendors/pdfmake/build/vfs_fonts.js"></script>

<!-- Custom Theme Scripts -->
<script src="${pageContext.request.contextPath}/assets/js/custom.min.js"></script>

<!-- Datatables -->
<script>
    $(document).ready(function() {
        $('#datatable').DataTable({
            "language": {
                "url": "//cdn.datatables.net/plug-ins/1.10.24/i18n/Portuguese-Brasil.json"
            },
            "responsive": true,
            "order": [[ 0, "desc" ]]
        });
    });
</script>

</body>
</html>
