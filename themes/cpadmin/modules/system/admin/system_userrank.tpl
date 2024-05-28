<{include file="db:system_header.tpl"}>
<script type="text/javascript">
    IMG_ON = "<{xoAdminIcons 'success.png'}>";
    IMG_OFF = "<{xoAdminIcons 'cancel.png'}>";
</script>
<!--User rank-->
<{if isset($userrank_count) && $userrank_count == true}>
<div class="card">
    <div class="card-header">
        <div class="card-tools">
            <a class="btn btn-sm btn-secondary floatright" href="admin.php?fct=userrank&amp;op=userrank_new" title="<{$smarty.const._AM_SYSTEM_USERRANK_ADD}>">
                <i class="fa fa-plus-circle ic-w mr-1" ></i><{$smarty.const._AM_SYSTEM_USERRANK_ADD}>
            </a>
        </div>
    </div>
    <div class="card-body table-responsive p-0">
    <table id="xo-rank-sorter" class="table table-bordered table-striped">
        <thead class="table-head">
        <tr>
            <th class="txtcenter"><{$smarty.const._AM_SYSTEM_USERRANK_IMAGE}></th>
            <th class="txtcenter"><{$smarty.const._AM_SYSTEM_USERRANK_TITLE}></th>
            <th class="txtcenter"><{$smarty.const._AM_SYSTEM_USERRANK_MINPOST}></th>
            <th class="txtcenter"><{$smarty.const._AM_SYSTEM_USERRANK_MAXPOST}></th>
            <th class="txtcenter"><{$smarty.const._AM_SYSTEM_USERRANK_SPECIAL}></th>
            <th class="txtcenter width10"><{$smarty.const._AM_SYSTEM_USERRANK_ACTION}></th>
        </tr>
        </thead>
        <tbody>
        <{foreach item=rankinfo from=$userrank|default:null}>
            <tr class="<{cycle values='even,odd'}> alignmiddle">
                <td class="txtcenter"><{$rankinfo.rank_image}></td>
                <td class="txtcenter"><{$rankinfo.rank_title}></td>
                <td class="txtcenter"><{$rankinfo.rank_min}></td>
                <td class="txtcenter"><{$rankinfo.rank_max}></td>
                <td class="xo-actions txtcenter"><img id="loading_sml<{$rankinfo.rank_id}>" src="images/spinner.gif" style="display:none;"
                                                      alt="<{$smarty.const._AM_SYSTEM_LOADING}>"/><img class="cursorpointer tooltip"
                                                                                                       id="sml<{$rankinfo.rank_id}>"
                                                                                                       onclick="system_setStatus( { fct: 'rankinfo', op: 'userrank_update_special', rank_id: <{$rankinfo.rank_id}> }, 'sml<{$rankinfo.rank_id}>', 'admin.php' )"
                                                                                                       src="<{if $rankinfo.rank_special}><{xoAdminIcons 'success.png'}><{else}><{xoAdminIcons 'cancel.png'}><{/if}>"
                                                                                                       alt="<{if $rankinfo.rank_special}><{$smarty.const._AM_SYSTEM_USERRANK_OFF}><{else}><{$smarty.const._AM_SYSTEM_USERRANK_ON}><{/if}>"
                                                                                                       title="<{if $rankinfo.rank_special}><{$smarty.const._AM_SYSTEM_USERRANK_OFF}><{else}><{$smarty.const._AM_SYSTEM_USERRANK_ON}><{/if}>"/>
                </td>
                <td class="xo-actions txtcenter">
                    <a data-toggle="tooltip" href="admin.php?fct=userrank&amp;op=userrank_edit&amp;rank_id=<{$rankinfo.rank_id}>"
                       title="<{$smarty.const._AM_SYSTEM_USERRANK_EDIT}>">
                        <img src="<{xoAdminIcons 'edit.png'}>" alt="<{$smarty.const._AM_SYSTEM_USERRANK_EDIT}>"/>
                    </a>
                    <a data-toggle="tooltip" href="admin.php?fct=userrank&amp;op=userrank_delete&amp;rank_id=<{$rankinfo.rank_id}>"
                       title="<{$smarty.const._AM_SYSTEM_USERRANK_DELETE}>">
                        <img src="<{xoAdminIcons 'delete.png'}>" alt="<{$smarty.const._AM_SYSTEM_USERRANK_DELETE}>"/>
                    </a>
                </td>
            </tr>
        <{/foreach}>
        </tbody>
    </table>
    </div>
    <!-- Display rank navigation -->
    <{if !empty($nav_menu)}>
    <div class="card-footer">
        <div class="col floatright"><{$nav_menu}></div>
    </div>
    <{/if}>
</div>
<{/if}>
<!--Display rank form (add,edit)-->
<{if !empty($form)}>
    <div class="spacer"><{$form}></div>
<{/if}>

