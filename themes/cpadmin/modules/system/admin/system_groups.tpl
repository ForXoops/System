<!--groups-->
<{include file="db:system_header.tpl"}>
<{if isset($groups_count) && $groups_count == true}>
<div class="card">
    <div class="card-header">
        <div class="card-tools">
            <a class="btn btn-sm btn-secondary floatright" href="admin.php?fct=groups&op=groups_add" data-toggle="tooltip" 
            title="<{$smarty.const._AM_SYSTEM_GROUPS_ADD}>">
            <i class="fa fa-plus-circle ic-w mr-1" ></i><{$smarty.const._AM_SYSTEM_GROUPS_ADD}>
        </a>
        </div>
    </div>
    <div class="card-body table-responsive p-0">
        <table class="table table-bordered table-striped">
            <thead class="table-head">
            <tr>
                <th class="txtcenter width5"><{$smarty.const._AM_SYSTEM_GROUPS_ID}></th>
                <th class="txtcenter width20"><{$smarty.const._AM_SYSTEM_GROUPS_NAME}></th>
                <th class="txtcenter"><{$smarty.const._AM_SYSTEM_GROUPS_DESCRIPTION}></th>
                <th class="txtcenter"><{$smarty.const._AM_SYSTEM_GROUPS_NB_USERS_BY_GROUPS}></th>
                <th class="txtcenter width10"><{$smarty.const._AM_SYSTEM_GROUPS_ACTION}></th>
            </tr>
            </thead>
            <tbody>
            <{foreach item=groupdetail from=$groups|default:null}>
                <tr class="<{cycle values='odd, even'}> alignmiddle">
                    <td class="txtcenter"><{$groupdetail.groups_id}></td>
                    <td class="txtleft">
                        <a href="admin.php?fct=groups&amp;op=groups_edit&amp;groups_id=<{$groupdetail.groups_id}>" data-toggle="tooltip"
                            title="<{$smarty.const._AM_SYSTEM_GROUPS_EDIT}>">
                            <{$groupdetail.name}>
                        </a>
                    </td>
                    <td class="txtleft"><{$groupdetail.description}></td>
                    <td class="txtcenter width25">
                        <a href="./admin.php?fct=users&amp;selgroups=<{$groupdetail.groups_id}>"><{$groupdetail.nb_users_by_groups}></a>
                    </td>
                    <td class="xo-actions txtcenter">
                        <a href="admin.php?fct=groups&amp;op=groups_edit&amp;groups_id=<{$groupdetail.groups_id}>" data-toggle="tooltip"
                            title="<{$smarty.const._AM_SYSTEM_GROUPS_EDIT}>">
                            <img src="<{xoAdminIcons 'edit.png'}>" alt="<{$smarty.const._AM_SYSTEM_GROUPS_EDIT}>"/></a>
                        <{if $groupdetail.delete|default:false}>
                            <a href="admin.php?fct=groups&amp;op=groups_delete&amp;groups_id=<{$groupdetail.groups_id}>" data-toggle="tooltip"
                                title="<{$smarty.const._AM_SYSTEM_GROUPS_DELETE}>">
                                <img src="<{xoAdminIcons 'delete.png'}>" alt="<{$smarty.const._AM_SYSTEM_GROUPS_DELETE}>"/></a>
                        <{/if}>
                    </td>
                </tr>
            <{/foreach}>
            </tbody>
        </table>
    </div>
    <!-- Display groups navigation -->
    <{if !empty($nav_menu)}>
    <div class="card-footer">
        <div class="col floatright"><{$nav_menu}></div>
    </div>
    <{/if}>
</div>
<{/if}>
<!-- Display groups form (add,edit) -->
<{if !empty($form)}>
    <div class="spacer"><{$form}></div>
<{/if}>
