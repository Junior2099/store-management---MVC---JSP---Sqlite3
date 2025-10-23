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

    <title>Paraíso Gráfica Rápida - Dashboard</title>

    <!-- Bootstrap -->
    <link href="${pageContext.request.contextPath}/assets/vendors/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="${pageContext.request.contextPath}/assets/vendors/font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <!-- NProgress -->
    <link href="${pageContext.request.contextPath}/assets/vendors/nprogress/nprogress.css" rel="stylesheet">
    <!-- iCheck -->
    <link href="${pageContext.request.contextPath}/assets/vendors/iCheck/skins/flat/green.css" rel="stylesheet">
    <!-- bootstrap-progressbar -->
    <link href="${pageContext.request.contextPath}/assets/vendors/bootstrap-progressbar/css/bootstrap-progressbar-3.3.4.min.css" rel="stylesheet">
    <!-- JQVMap -->
    <link href="${pageContext.request.contextPath}/assets/vendors/jqvmap/dist/jqvmap.min.css" rel="stylesheet"/>
    <!-- bootstrap-daterangepicker -->
    <link href="${pageContext.request.contextPath}/assets/vendors/bootstrap-daterangepicker/daterangepicker.css" rel="stylesheet">

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
                        <!-- top tiles -->
                        <div class="row tile_count">
                            <div class="col-xl-2 col-lg-3 col-md-4 col-sm-4 col-6 tile_stats_count">
                                <span class="count_top"><i class="fa fa-cubes"></i> Total de Materiais</span>
                                <div class="count">${totalMateriais}</div>
                                <span class="count_bottom"><i class="green">4% </i> Desde a semana passada</span>
                            </div>
                            <div class="col-xl-2 col-lg-3 col-md-4 col-sm-4 col-6 tile_stats_count">
                                <span class="count_top"><i class="fa fa-tags"></i> Categorias</span>
                                <div class="count">${totalCategorias}</div>
                                <span class="count_bottom"><i class="green"><i class="fa fa-sort-asc"></i>3% </i> Desde a semana passada</span>
                            </div>
                            <div class="col-xl-2 col-lg-3 col-md-4 col-sm-4 col-6 tile_stats_count">
                                <span class="count_top"><i class="fa fa-shopping-cart"></i> Quantidade Total</span>
                                <div class="count green">${totalQuantidade}</div>
                                <span class="count_bottom"><i class="green"><i class="fa fa-sort-asc"></i>34% </i> Desde a semana passada</span>
                            </div>
                            <div class="col-xl-2 col-lg-3 col-md-4 col-sm-4 col-6 tile_stats_count">
                                <span class="count_top"><i class="fa fa-money"></i> Valor Total</span>
                                <div class="count"><fmt:formatNumber value="${valorTotal}" type="currency" currencySymbol="R$ "/></div>
                                <span class="count_bottom"><i class="green"><i class="fa fa-sort-asc"></i>12% </i> Desde a semana passada</span>
                            </div>
                            <div class="col-xl-2 col-lg-3 col-md-4 col-sm-4 col-6 tile_stats_count">
                                <span class="count_top"><i class="fa fa-exclamation-triangle"></i> Estoque Baixo</span>
                                <div class="count">${materiaisEstoqueBaixo}</div>
                                <span class="count_bottom"><i class="red"><i class="fa fa-sort-desc"></i>12% </i> Desde a semana passada</span>
                            </div>
                        </div>
                        <!-- /top tiles -->

                        <div class="row">
                            <div class="col-md-12 col-sm-12 col-12">
                                <div class="dashboard_graph">
                                    <div class="row x_title">
                                        <div class="col-md-6">
                                            <h3>Materiais por Categoria
                                                <small>Distribuição dos materiais</small>
                                            </h3>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-12 col-sm-12 col-12">
                                            <div class="x_panel">
                                                <div class="x_content">
                                                    <table class="table table-striped">
                                                        <thead>
                                                            <tr>
                                                                <th>Categoria</th>
                                                                <th>Quantidade de Materiais</th>
                                                                <th>Total em Estoque</th>
                                                                <th>Valor Total</th>
                                                            </tr>
                                                        </thead>
                                                        <tbody>
                                                            <c:forEach var="categoria" items="${categorias}">
                                                                <tr>
                                                                    <td>${categoria}</td>
                                                                    <td>0</td>
                                                                    <td>0</td>
                                                                    <td>R$ 0,00</td>
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

                        <div class="row">
                            <div class="col-md-6 col-sm-6 col-12">
                                <div class="x_panel">
                                    <div class="x_title">
                                        <h4>Materiais com Estoque Baixo
                                        <small>Quantidade menor que 10</small>
                                        </h4>
                                        <div class="clearfix"></div>
                                    </div>
                                    <div class="x_content">
                                        <c:forEach var="material" items="${materiais}">
                                            <c:if test="${material.quantidade < 10}">
                                                <div class="alert alert-warning">
                                                    <strong>${material.nome}</strong> - Estoque: ${material.quantidade}
                                                </div>
                                            </c:if>
                                        </c:forEach>
                                        <c:if test="${empty materiais}">
                                            <p>Nenhum material com estoque baixo.</p>
                                        </c:if>
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-6 col-sm-6 col-12">
                                <div class="x_panel">
                                    <div class="x_title">
                                        <h4>Ações Rápidas</h4>
                                        <div class="clearfix"></div>
                                    </div>
                                    <div class="x_content">
                                        <div class="dashboard-widget-content">
                                            <ul class="quick-list">
                                                <li><i class="fa fa-plus"></i><a href="materiais?action=form">Novo Material</a></li>
                                                <li><i class="fa fa-list"></i><a href="materiais">Listar Materiais</a></li>
                                                <li><i class="fa fa-search"></i><a href="materiais">Buscar Material</a></li>
                                                <li><i class="fa fa-print"></i><a href="javascript:;">Relatório de Estoque</a></li>
                                            </ul>
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
<!-- Popper -->
<script src="${pageContext.request.contextPath}/assets/vendors/popper/popper.min.js"></script>
<!-- Bootstrap -->
<script src="${pageContext.request.contextPath}/assets/vendors/bootstrap/dist/js/bootstrap.min.js"></script>
<!-- FastClick -->
<script src="${pageContext.request.contextPath}/assets/vendors/fastclick/lib/fastclick.js"></script>
<!-- NProgress -->
<script src="${pageContext.request.contextPath}/assets/vendors/nprogress/nprogress.js"></script>
<!-- Chart.js -->
<script src="${pageContext.request.contextPath}/assets/vendors/Chart.js/dist/Chart.min.js"></script>
<!-- gauge.js -->
<script src="${pageContext.request.contextPath}/assets/vendors/gauge.js/dist/gauge.min.js"></script>
<!-- bootstrap-progressbar -->
<script src="${pageContext.request.contextPath}/assets/vendors/bootstrap-progressbar/bootstrap-progressbar.min.js"></script>
<!-- iCheck -->
<script src="${pageContext.request.contextPath}/assets/vendors/iCheck/icheck.min.js"></script>
<!-- Skycons -->
<script src="${pageContext.request.contextPath}/assets/vendors/skycons/skycons.js"></script>
<!-- Flot -->
<script src="${pageContext.request.contextPath}/assets/vendors/Flot/jquery.flot.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendors/Flot/jquery.flot.pie.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendors/Flot/jquery.flot.time.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendors/Flot/jquery.flot.stack.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendors/Flot/jquery.flot.resize.js"></script>
<!-- Flot plugins -->
<script src="${pageContext.request.contextPath}/assets/vendors/flot.orderbars/js/jquery.flot.orderBars.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendors/flot-spline/js/jquery.flot.spline.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendors/flot.curvedlines/curvedLines.js"></script>
<!-- DateJS -->
<script src="${pageContext.request.contextPath}/assets/vendors/DateJS/build/date.js"></script>
<!-- JQVMap -->
<script src="${pageContext.request.contextPath}/assets/vendors/jqvmap/dist/jquery.vmap.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendors/jqvmap/dist/maps/jquery.vmap.world.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendors/jqvmap/examples/js/jquery.vmap.sampledata.js"></script>
<!-- bootstrap-daterangepicker -->
<script src="${pageContext.request.contextPath}/assets/vendors/moment/min/moment.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendors/bootstrap-daterangepicker/daterangepicker.js"></script>

<!-- Custom Theme Scripts -->
<script src="${pageContext.request.contextPath}/assets/js/custom.min.js"></script>

</body>
</html>
