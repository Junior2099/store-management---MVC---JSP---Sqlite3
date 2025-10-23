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

    <title>Paraíso Gráfica Rápida - ${material != null ? 'Editar' : 'Novo'} Material</title>

    <!-- Bootstrap -->
    <link href="${pageContext.request.contextPath}/assets/vendors/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="${pageContext.request.contextPath}/assets/vendors/font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <!-- NProgress -->
    <link href="${pageContext.request.contextPath}/assets/vendors/nprogress/nprogress.css" rel="stylesheet">
    <!-- iCheck -->
    <link href="${pageContext.request.contextPath}/assets/vendors/iCheck/skins/flat/green.css" rel="stylesheet">
    <!-- bootstrap-wysiwyg -->
    <link href="${pageContext.request.contextPath}/assets/vendors/google-code-prettify/bin/prettify.min.css" rel="stylesheet">
    <!-- Select2 -->
    <link href="${pageContext.request.contextPath}/assets/vendors/select2/dist/css/select2.min.css" rel="stylesheet">
    <!-- Switchery -->
    <link href="${pageContext.request.contextPath}/assets/vendors/switchery/dist/switchery.min.css" rel="stylesheet">
    <!-- starrr -->
    <link href="${pageContext.request.contextPath}/assets/vendors/starrr/dist/starrr.css" rel="stylesheet">
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
                        <div class="">
                            <div class="page-title">
                                <div class="title_left">
                                    <h3>${material != null ? 'Editar' : 'Novo'} Material</h3>
                                </div>
                                <div class="title_right">
                                    <div class="col-md-5 col-sm-5 col-12 form-group pull-right top_search">
                                        <a href="materiais" class="btn btn-secondary">
                                            <i class="fa fa-arrow-left"></i> Voltar
                                        </a>
                                    </div>
                                </div>
                            </div>

                            <div class="clearfix"></div>

                            <div class="row">
                                <div class="col-md-12 col-sm-12 col-12">
                                    <div class="x_panel">
                                        <div class="x_title">
                                            <h2>Dados do Material</h2>
                                            <div class="clearfix"></div>
                                        </div>
                                        <div class="x_content">
                                            <br />
                                            
                                            <% if (request.getAttribute("erro") != null) { %>
                                                <div class="alert alert-danger">
                                                    <strong>Erro:</strong> ${erro}
                                                </div>
                                            <% } %>
                                            
                                            <% if (request.getAttribute("sucesso") != null) { %>
                                                <div class="alert alert-success">
                                                    <strong>Sucesso:</strong> ${sucesso}
                                                </div>
                                            <% } %>
                                            
                                            <form id="material-form" data-parsley-validate class="form-horizontal form-label-left" 
                                                  action="materiais" method="post">
                                                <input type="hidden" name="action" value="save">
                                                <c:if test="${material != null}">
                                                    <input type="hidden" name="id" value="${material.id}">
                                                </c:if>

                                                <div class="form-group">
                                                    <label class="control-label col-md-3 col-sm-3 col-12" for="nome">Nome <span class="required">*</span>
                                                    </label>
                                                    <div class="col-md-6 col-sm-6 col-12">
                                                        <input type="text" id="nome" name="nome" required="required" 
                                                               class="form-control col-md-7 col-xs-12" 
                                                               value="${material != null ? material.nome : ''}">
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="control-label col-md-3 col-sm-3 col-12" for="descricao">Descrição
                                                    </label>
                                                    <div class="col-md-6 col-sm-6 col-12">
                                                        <textarea id="descricao" name="descricao" class="form-control" rows="3">${material != null ? material.descricao : ''}</textarea>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="control-label col-md-3 col-sm-3 col-12" for="categoria">Categoria <span class="required">*</span>
                                                    </label>
                                                    <div class="col-md-6 col-sm-6 col-12">
                                                        <select id="categoria" name="categoria" required="required" class="form-control">
                                                            <option value="">Selecione uma categoria</option>
                                                            <option value="Papel" ${material != null && material.categoria == 'Papel' ? 'selected' : ''}>Papel</option>
                                                            <option value="Tinta" ${material != null && material.categoria == 'Tinta' ? 'selected' : ''}>Tinta</option>
                                                            <option value="Acessórios" ${material != null && material.categoria == 'Acessórios' ? 'selected' : ''}>Acessórios</option>
                                                            <option value="Equipamentos" ${material != null && material.categoria == 'Equipamentos' ? 'selected' : ''}>Equipamentos</option>
                                                            <option value="Outros" ${material != null && material.categoria == 'Outros' ? 'selected' : ''}>Outros</option>
                                                        </select>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="control-label col-md-3 col-sm-3 col-12" for="quantidade">Quantidade <span class="required">*</span>
                                                    </label>
                                                    <div class="col-md-6 col-sm-6 col-12">
                                                        <input type="number" id="quantidade" name="quantidade" required="required" 
                                                               class="form-control col-md-7 col-xs-12" min="0"
                                                               value="${material != null ? material.quantidade : ''}">
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="control-label col-md-3 col-sm-3 col-12" for="precoUnitario">Preço Unitário <span class="required">*</span>
                                                    </label>
                                                    <div class="col-md-6 col-sm-6 col-12">
                                                        <input type="number" id="precoUnitario" name="precoUnitario" required="required" 
                                                               class="form-control col-md-7 col-xs-12" min="0" step="0.01"
                                                               value="${material != null ? material.precoUnitario : ''}">
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="control-label col-md-3 col-sm-3 col-12" for="fornecedor">Fornecedor
                                                    </label>
                                                    <div class="col-md-6 col-sm-6 col-12">
                                                        <input type="text" id="fornecedor" name="fornecedor" 
                                                               class="form-control col-md-7 col-xs-12"
                                                               value="${material != null ? material.fornecedor : ''}">
                                                    </div>
                                                </div>
                                                <div class="ln_solid"></div>
                                                <div class="form-group">
                                                    <div class="col-md-6 col-sm-6 col-12 col-md-offset-3">
                                                        <button type="button" class="btn btn-primary" onclick="window.location.href='materiais'">Cancelar</button>
                                                        <button type="submit" class="btn btn-success">Salvar</button>
                                                    </div>
                                                </div>
                                            </form>
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
<!-- bootstrap-progressbar -->
<script src="${pageContext.request.contextPath}/assets/vendors/bootstrap-progressbar/bootstrap-progressbar.min.js"></script>
<!-- iCheck -->
<script src="${pageContext.request.contextPath}/assets/vendors/iCheck/icheck.min.js"></script>
<!-- bootstrap-daterangepicker -->
<script src="${pageContext.request.contextPath}/assets/vendors/moment/min/moment.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendors/bootstrap-daterangepicker/daterangepicker.js"></script>
<!-- bootstrap-wysiwyg -->
<script src="${pageContext.request.contextPath}/assets/vendors/bootstrap-wysiwyg/js/bootstrap-wysiwyg.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendors/jquery.hotkeys/jquery.hotkeys.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendors/google-code-prettify/src/prettify.js"></script>
<!-- jQuery Tags Input -->
<script src="${pageContext.request.contextPath}/assets/vendors/jquery.tagsinput/src/jquery.tagsinput.js"></script>
<!-- Switchery -->
<script src="${pageContext.request.contextPath}/assets/vendors/switchery/dist/switchery.min.js"></script>
<!-- Select2 -->
<script src="${pageContext.request.contextPath}/assets/vendors/select2/dist/js/select2.full.min.js"></script>
<!-- Parsley -->
<script src="${pageContext.request.contextPath}/assets/vendors/parsleyjs/dist/parsley.min.js"></script>
<!-- Autosize -->
<script src="${pageContext.request.contextPath}/assets/vendors/autosize/dist/autosize.min.js"></script>
<!-- jQuery autocomplete -->
<script src="${pageContext.request.contextPath}/assets/vendors/devbridge-autocomplete/dist/jquery.autocomplete.min.js"></script>
<!-- starrr -->
<script src="${pageContext.request.contextPath}/assets/vendors/starrr/dist/starrr.js"></script>

<!-- Custom Theme Scripts -->
<script src="${pageContext.request.contextPath}/assets/js/custom.min.js"></script>

</body>
</html>
