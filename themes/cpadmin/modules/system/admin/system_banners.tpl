<{include file="db:system_header.tpl"}>
<!--Banner-->
<{if isset($banner_count) && $banner_count == true}>
<div class="row">
    <div class="col">
        <div class="card">
            <div class="card-header">
                <h3 class="card-title"><{$smarty.const._AM_SYSTEM_BANNERS_CURACTBNR}></h3>
                <div class="card-tools">
                    <a class="btn btn-sm btn-secondary" href="admin.php?fct=banners&amp;op=new_banner" data-toggle="tooltip"
                        title="<{$smarty.const._AM_SYSTEM_BANNERS_ADDNWBNR}>">
                        <i class="fa fa-paperclip ic-w mr-1"></i><{$smarty.const._AM_SYSTEM_BANNERS_ADDNWBNR}>
                    </a>
                    <a class="btn btn-sm btn-secondary" href="admin.php?fct=banners&amp;op=new_client" data-toggle="tooltip"
                        title="<{$smarty.const._AM_SYSTEM_BANNERS_ADDCLI}>">
                        <i class="fa fa-user-plus ic-w mr-1"></i><{$smarty.const._AM_SYSTEM_BANNERS_ADDCLI}>
                    </a>
                </div>
            </div>
            <div class="card-body table-responsive p-0">
                <table class="table table-bordered table-striped">
                    <thead class="table-head">
                    <tr>
                        <th class="txtcenter"><{$smarty.const._AM_SYSTEM_BANNERS_IMPRESION}></th>
                        <th class="txtcenter"><{$smarty.const._AM_SYSTEM_BANNERS_IMPLEFT}></th>
                        <th class="txtcenter"><{$smarty.const._AM_SYSTEM_BANNERS_CLICKS}></th>
                        <th class="txtcenter"><{$smarty.const._AM_SYSTEM_BANNERS_NCLICKS}></th>
                        <th class="txtcenter"><{$smarty.const._AM_SYSTEM_BANNERS_CLINAME}></th>
                        <th class="txtcenter width10"><{$smarty.const._AM_SYSTEM_BANNERS_FUNCTION}></th>
                    </tr>
                    </thead>
                    <tbody>
                    <{foreach item=bannerdetail from=$banner|default:null}>
                        <tr class="<{cycle values='even,odd'}>">
                            <td class="txtcenter"><{$bannerdetail.impmade}></td>
                            <td class="txtcenter"><{$bannerdetail.left}></td>
                            <td class="txtcenter"><{$bannerdetail.clicks}></td>
                            <td class="txtcenter"><{$banbannerdetailner.percent}>%</td>
                            <td class="txtcenter"><{$bannerdetail.name}></td>
                            <td class="xo-actions txtcenter">
                                <a data-toggle="modal" data-target="#dialog<{$bannerdetail.bid}>">
                                <img src="<{xoAdminIcons 'display.png'}>"
                                    alt="<{$smarty.const._AM_SYSTEM_BANNERS_VIEW}>" data-toggle="tooltip" title="<{$smarty.const._AM_SYSTEM_BANNERS_VIEW}>"/></a>
                                <a href="admin.php?fct=banners&amp;op=banner_edit&amp;bid=<{$bannerdetail.bid}>" data-toggle="tooltip"
                                    title="<{$smarty.const._AM_SYSTEM_BANNERS_EDIT}>">
                                    <img src="<{xoAdminIcons 'edit.png'}>" alt="<{$smarty.const._AM_SYSTEM_BANNERS_EDIT}>"/>
                                </a>
                                <a href="admin.php?fct=banners&amp;op=banner_delete&amp;bid=<{$bannerdetail.bid}>" data-toggle="tooltip"
                                    title="<{$smarty.const._AM_SYSTEM_BANNERS_DELETE}>">
                                    <img src="<{xoAdminIcons 'delete.png'}>" alt="<{$smarty.const._AM_SYSTEM_BANNERS_DELETE}>"/>
                                </a>
                            </td>
                        </tr>
                    <{/foreach}>
                    </tbody>
                </table>
            </div>
            <<{if !empty($nav_menu_banner)}>
            <div class="card-footer">
                <div class="xo-avatar-pagenav col floatright"><{$nav_menu_banner}></div>
            </div>
            <{/if}>
        </div>
    </div>
</div>
<!--Pop-pup-->
<{foreach item=banner from=$popup_banner|default:null}>
<div class="modal fade" id="dialog<{$banner.bid}>" tabindex="-1">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title"><{$banner.name}></h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <p><{$banner.imageurl}></p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal"><{$smarty.const._CLOSE}></button>
      </div>
    </div>
  </div>
</div>
<{/foreach}>
<!--Pop-pup-->
<{/if}>

<!--Banner Finish-->
<{if isset($banner_finish_count) && $banner_finish_count == true}>
<div class="card">
    <div class="card-header">
        <h3 class="card-title"><{$smarty.const._AM_SYSTEM_BANNERS_FINISHBNR}></h3>
    </div>
    <div class="card-body table-responsive p-0">
        <table class="table table-bordered table-striped">
            <thead class="table-head">
            <tr>
                <th class="txtcenter"><{$smarty.const._AM_SYSTEM_BANNERS_IMPD}></th>
                <th class="txtcenter"><{$smarty.const._AM_SYSTEM_BANNERS_CLICKS}></th>
                <th class="txtcenter"><{$smarty.const._AM_SYSTEM_BANNERS_NCLICKS}></th>
                <th class="txtcenter"><{$smarty.const._AM_SYSTEM_BANNERS_STARTDATE}></th>
                <th class="txtcenter"><{$smarty.const._AM_SYSTEM_BANNERS_ENDDATE}></th>
                <th class="txtcenter"><{$smarty.const._AM_SYSTEM_BANNERS_CLINAME}></th>
                <th class="txtcenter width10"><{$smarty.const._AM_SYSTEM_BANNERS_FUNCTION}></th>
            </tr>
            </thead>
            <tbody>
            <{foreach item=finished_banner from=$banner_finish|default:null}>
                <tr class="<{cycle values='even,odd'}>">
                    <td class="txtcenter"><{$finished_banner.impressions}></td>
                    <td class="txtcenter"><{$finished_banner.clicks}></td>
                    <td class="txtcenter"><{$finished_banner.percent}>%</td>
                    <td class="txtcenter"><{$finished_banner.datestart}></td>
                    <td class="txtcenter"><{$finished_banner.dateend}></td>
                    <td class="txtcenter"><{$finished_banner.name}></td>
                    <td class="xo-actions txtcenter">
                        <a class="tooltip" href="admin.php?fct=banners&amp;op=banner_finish_delete&amp;bid=<{$finished_banner.bid}>"
                            title="<{$smarty.const._AM_SYSTEM_BANNERS_DELETE}>">
                            <img src="<{xoAdminIcons 'delete.png'}>" alt="<{$smarty.const._AM_SYSTEM_BANNERS_DELETE}>"/>
                        </a>
                    </td>
                </tr>
            <{/foreach}>
            </tbody>
        </table>
    </div>
    <{if !empty($nav_menu_bannerF)}>
    <div class="card-footer">
        <div class="col floatright"><{$nav_menu_bannerF}></div>
    </div>
    <{/if}>
</div>
<{/if}>
<!--Banner Client-->
<{if isset($banner_client_count) && $banner_client_count == true}>
<div class="card">
    <div class="card-header">
        <h3 class="card-title"><{$smarty.const._AM_SYSTEM_BANNERS_ADVCLI}></h3>
    </div>
    <div class="card-body table-responsive p-0">
        <table class="table table-bordered table-striped">
            <thead class="table-head">
            <tr>
                <th class="txtcenter"><{$smarty.const._AM_SYSTEM_BANNERS_CLINAME}></th>
                <th class="txtcenter"><{$smarty.const._AM_SYSTEM_BANNERS_ACTIVEBNR}></th>
                <th class="txtcenter"><{$smarty.const._AM_SYSTEM_BANNERS_CONTNAME}></th>
                <th class="txtcenter"><{$smarty.const._AM_SYSTEM_BANNERS_CONTMAIL}></th>
                <th class="txtcenter width10"><{$smarty.const._AM_SYSTEM_BANNERS_FUNCTION}></th>
            </tr>
            </thead>
            <tbody>
            <{foreach item=banner_client_detail from=$banner_client|default:null}>
                <tr class="<{cycle values='even,odd'}>">
                    <td class="txtcenter"><{$banner_client_detail.name}></td>
                    <td class="txtcenter"><{$banner_client_detail.banner_active}></td>
                    <td class="txtcenter"><{$banner_client_detail.contact}></td>
                    <td class="txtcenter"><{$banner_client_detail.email}></td>
                    <td class="xo-actions txtcenter">
                        <a href="admin.php?fct=banners&amp;op=banner_client_edit&amp;cid=<{$banner_client_detail.cid}>" data-toggle="tooltip"
                            title="<{$smarty.const._AM_SYSTEM_BANNERS_EDIT}>">
                            <img src="<{xoAdminIcons 'edit.png'}>" alt="<{$smarty.const._AM_SYSTEM_BANNERS_EDIT}>"/>
                        </a>
                        <a href="admin.php?fct=banners&amp;op=banner_client_delete&amp;cid=<{$banner_client_detail.cid}>" data-toggle="tooltip"
                            title="<{$smarty.const._AM_SYSTEM_BANNERS_DELETE}>">
                            <img src="<{xoAdminIcons 'delete.png'}>" alt="<{$smarty.const._AM_SYSTEM_BANNERS_DELETE}>"/>
                        </a>
                    </td>
                </tr>
            <{/foreach}>
            </tbody>
        </table>
    </div>
    <{if !empty($nav_menu_client)}>
    <div class="card-footer">
        <div class="col floatright"><{$nav_menu_client}></div>
    </div>
    <{/if}>
</div>
<{/if}>
<br>
<!-- Display Avatar form (add,edit) -->
<{if !empty($form)}>
    <div class="spacer"><{$form}></div>
<{/if}>
