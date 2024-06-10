<!doctype html>
<html lang="<{$xoops_langcode}>">

<head>
  <{include file="$theme_tpl/metas.tpl"}>
</head>

<body class="hold-transition sidebar-mini layout-fixed">
  <div class="wrapper">
    <!-- Preloader -->
    <div class="preloader flex-column justify-content-center align-items-center">
      <img class="animation__shake" src="<{xoImgUrl 'images/icon_xoops.png'}>" alt="XOOPS" height="60" width="60">
    </div>
  </div>

  <!-- Navbar -->
  <nav class="main-header navbar navbar-expand navbar-white navbar-light">
    <!-- Left navbar links -->
    <ul class="navbar-nav">
      <li class="nav-item">
        <a class="nav-link" data-widget="pushmenu" href="#" role="button"><i class="fas fa-bars"></i></a>
      </li>
      <li class="nav-item d-none d-sm-inline-block">
        <a href="<{xoAppUrl 'admin.php'}>" class="nav-link">
          <{$smarty.const._CPADMIN_DASHBOARD}>
        </a>
      </li>
    </ul>

    <!-- Right navbar links -->
    <ul class="navbar-nav ml-auto">
      <li class="nav-item">
        <a class="nav-link" rel="external" href="<{xoAppUrl}>" role="button" data-toggle="tooltip" title="<{$smarty.const._CPADMIN_WEBSITE}>">
          <i class="fas fa-globe-europe"></i>
        </a>
      </li>
      <li class="nav-item dropdown">
        <a class="nav-link" data-toggle="dropdown" href="#" aria-expanded="true">
          <i class="fa fa-user"></i>
        </a>
        <div class="dropdown-menu dropdown-menu-lg dropdown-menu-right" style="left: inherit; right: 0px;">
          <a href="<{xoAppUrl 'user.php'}>" class="dropdown-item">
            <i class="fa fa-user-o mr-2"></i> <{$smarty.const._CPADMIN_VIEWACCOUNT}>
          </a>
          <div class="dropdown-divider"></div>
          <a href="<{xoAppUrl 'edituser.php'}>" class="dropdown-item">
            <i class="fa fa-pencil mr-2"></i> <{$smarty.const._CPADMIN_EDITACCOUNT}>
          </a>
          <div class="dropdown-divider"></div>
          <a href="<{xoAppUrl 'user.php?op=logout'}>" class="dropdown-item">
            <i class="fa fa-sign-out mr-2"></i> <{$smarty.const._CPADMIN_LOGOUT}>
          </a>
        </div>
      </li>
      <li class="nav-item">
        <a class="nav-link" data-widget="fullscreen" href="#" role="button" data-toggle="tooltip" title="<{$smarty.const._CPADMIN_FULLSCREEN}>">
          <i class="fas fa-expand-arrows-alt"></i>
        </a>
      </li>
    </ul>
  </nav>

  <!-- Main Sidebar Container -->
  <aside class="main-sidebar sidebar-dark-primary elevation-4 mb-2">
    <!-- Brand Logo -->
    <a href="<{xoAppUrl 'admin.php'}>" class="brand-link">
      <img src="<{xoImgUrl 'images/icon_xoops.png'}>" alt="XOOPS" class="brand-image img-circle elevation-3"
        style="opacity: .8">
      <span class="brand-text font-weight-light">XOOPS</span>
    </a>
    <!-- Sidebar -->
    <div class="sidebar">
      <!-- Sidebar user panel (optional) -->
      <div class="user-panel mt-3 pb-3 mb-3 d-flex">
        <div class="image">
		<{if !empty($xoops_name)}>
           <img src="<{$xoops_avatar}>" class="img-circle elevation-2" alt="User Image" title="<{$xoops_name}>">		
		  <{else}>
           <img src="<{$xoops_avatar}>" class="img-circle elevation-2" alt="User Image" title="<{$xoops_uname}>">
		<{/if}>	
        </div>
        <div class="info">
		<{if !empty($xoops_name)}>
          <a href="<{xoAppUrl 'user.php'}>" class="d-block text-wrap" rel="external">
            <{$xoops_name}>
          </a>				
		  <{else}>
          <a href="<{xoAppUrl 'user.php'}>" class="d-block" rel="external">
            <{$xoops_uname}>
          </a>
		<{/if}>	
        </div>
      </div>
      <!-- SidebarSearch Form -->
      <div class="form-inline">
        <div class="input-group" data-widget="sidebar-search">
          <input class="form-control form-control-sidebar" type="search" placeholder="<{$smarty.const._CPADMIN_SEARCHMENU}>" aria-label="Search">
          <div class="input-group-append">
            <button class="btn btn-sidebar"><i class="fas fa-search fa-fw"></i></button>
          </div>
        </div>
      </div>
      <!-- Sidebar Menu -->
      <nav class="mt-2">
        <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
          <li class="nav-item">
            <a href="<{xoAppUrl 'admin.php'}>" class="nav-link">
              <i class="nav-icon fas fa-tachometer-alt"></i>
              <p>
                <{$smarty.const._CPADMIN_DASHBOARD}>
              </p>
            </a>
          </li>
          <li class="nav-item">
            <a href="<{xoAppUrl '#'}>" class="nav-link">
              <i class="nav-icon fas fa-th"></i>
              <p>
                <{$smarty.const._CPADMIN_SYSTEM}>
                  <i class="fas fa-angle-left right"></i>
              </p>
            </a>
            <ul class="nav nav-treeview">
              <{foreach item=op from=$adminmenu|default:null}>
                  <li class="nav-item">
                    <a href="<{$op.link}>" class="nav-link">
                      <i class="<{$op.icon}>"></i>
                      <p>
                        <{$op.title}>
                      </p>
                    </a>
                  </li>
                <{/foreach}>
            </ul>
          </li>
          <li class="nav-item">
            <{foreach item=pref from=$prefs|default:null}>
            <a href="<{xoAppUrl '#'}>" class="nav-link">
              <i class="nav-icon <{$pref.icon}>"></i>
              <p>
                <{$pref.text}><i class="fas fa-angle-left right"></i>
              </p>
            </a> 
            <ul class="nav nav-treeview">
              <{foreach item=op from=$pref.menu|default:null}>
                  <li class="nav-item">
                    <a href="<{$op.link}>" class="nav-link">
                      <i class="nav-icon <{$op.icon}>"></i>
                      <p>
                        <{$op.title}><{if isset($op.options) && $op.options != 0}><i class="fas fa-angle-left right"></i><{/if}>
                      </p>
                    </a>
                  <{if isset($op.options) && $op.options != 0}></li><{/if}>
                    <ul class="nav nav-treeview">
                    <{foreach item=sub from=$op.options|default:null}>
                      <li class="nav-item">
                        <a href="<{$sub.link}>" class="nav-link">
                          <i class="nav-icon <{$sub.icon}>"></i>
                          <p>
                            <{$sub.title}>
                          </p>
                        </a>
                      </li>
                    <{/foreach}>
                    </ul>
                  <{if isset($op.options) && $op.options != 0}></li><{/if}>
                <{/foreach}>
            </ul>
            <{/foreach}>  
          </li>
          <li class="nav-item">
            <{foreach item=module from=$modules|default:null}>
            <li class="nav-item">
              <a href="<{xoAppUrl '#'}>" class="nav-link">
                <i class="nav-icon <{$module.icon}>"></i>
                <p>
                  <{$module.text}><i class="fas fa-angle-left right"></i>
                </p>
              </a>
              <ul class="nav nav-treeview">
                <{foreach item=sub from=$module.menu|default:null}>
                    <{if isset($sub.dir) && $sub.dir != 'system'}>
                        <li class="nav-item">
                          <a href="#" class="nav-link">
                            <i class="fa fa-cog"></i>
                            <p>
                              <{$sub.title}><i class="fas fa-angle-left right"></i>
                            </p>
                          </a>
                          <ul class="nav nav-treeview" style="display: none;">
                            <{foreach item=optn from=$sub.options|default:null}>
                                <li class="nav-item">
                                  <a href="<{$sub.url}><{$optn.link}>" class="nav-link">
                                    <i class="far fa-circle nav-icon"></i>
                                    <p>
                                      <{$optn.title}>
                                    </p>
                                  </a>
                                </li>
                              <{/foreach}>
                          </ul>
                        </li>
                      <{/if}>
                      <{/foreach}>
              </ul>
            </li>
          <{/foreach}>
            </li>
        </ul>
      </nav>
    </div>
  </aside>

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <div class="content-header">
      <{if !empty($xoops_contents)}>
      <div id="xo-content" class="container-fluid">
        <{*Display Admin menu*}>
          <{if !empty($xo_system_menu)}>
              <{$xo_system_menu}>
              <{/if}>
                <{$xoops_contents}>
      </div>
      <{/if}>
      <{if !empty($dashboard)}>
      <div class="container-fluid">
        <div class="row">
          <div class="col">
            <{include file="$theme_tpl/icons.tpl"}>
          </div>
        </div>
        <div class="row">
          <div class="col-8 col-md-8">
            <{include file="$theme_tpl/tabs.tpl"}>
          </div>
          <div class="col-4 col-md-4 mb-2">
            <{include file="$theme_tpl/overview.tpl"}>
          </div>
        </div>
        <div class="row">
          <div class="col">
            <div class="card">
              <div class="card-header">
                <h3 class="card-title">
                  <i class="fa fa-cogs mr-1"></i>
                  <{$smarty.const._CPADMIN_INSTALLEDMODULES}>
                </h3>
                <div class="card-tools">

                </div>
              </div>
              <div class="card-body">
                <div class="x_toolbar">
                  <{foreach item=module from=$modules|default:null}>
                  <{foreach item=mod from=$module.menu|default:null}>
                  <a href="<{$mod.link}>">
                    <div class="x_tool float-left hoverable" data-toggle="tooltip" title="<{$mod.title}>">
                      <div class="x_toolicon">
                        <i class="fas fa-cog"></i>
                      </div>
                      <div class="x_tooltext">
                        <{$mod.title}>
                      </div>
                    </div>
                  </a>
                  <{/foreach}>
                  <{/foreach}>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
      <{/if}>
    </div>
    <!--{xo-logger-output}-->
  </div>
  
  <footer class="main-footer">
    <strong>Copyright &copy; <{$smarty.now|date_format:"%Y"}> <a href="https://xoops.org">XOOPS</a>.</strong> All rights
    reserved.
    <div class="float-right d-none d-sm-inline-block">
      <b>Version</b>
      <{$xoops_version}>
    </div>
  </footer>
</div>
  

  <!-- jQuery 
  <script src="<{$theme_url}>/js/jquery/jquery.min.js"></script>-->
  <!-- jQuery UI 1.11.4 -->
  <script src="<{$theme_url}>/js/jquery-ui/jquery-ui.min.js"></script>
  <!-- Resolve conflict in jQuery UI tooltip with Bootstrap tooltip -->
  <script>
    $.widget.bridge('uibutton', $.ui.button)
  </script>
  <!-- Bootstrap 4 -->
  <script src="<{$theme_url}>/js/bootstrap/js/bootstrap.bundle.min.js"></script>
  <!-- AdminLTE App -->
  <script src="<{$theme_url}>/js/adminlte.js"></script>
  <script src="<{$theme_url}>/js/admin.js"></script>
</body>

</html>
