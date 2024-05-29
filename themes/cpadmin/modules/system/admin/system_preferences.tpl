
<{if $breadcrumb}>
<{include file="db:system_header.tpl"}>
<{/if}>
<{if $menu}>
<div class="card">
    <div class="card-body">
        <!--Preferences-->
        <div class="x_toolbar">
            <{foreach item=preference from=$preferences}>
            <a href="admin.php?fct=preferences&amp;op=show&amp;confcat_id=<{$preference.id}>" title="<{$preference.name}>">
                <div class="x_tool float-left hoverable" data-toggle="tooltip" title="<{$preference.name}>">
                    <div class="x_toolicon">
                        <img src="<{$preference.image}>" alt="<{$preference.name}>" width="24px">
                    </div>
                    <div class="x_tooltext">
                        <{$preference.name}>
                    </div>
                </div>
            </a>

            <{/foreach}>
            <a href="admin.php?fct=preferences&amp;op=showmod&amp;mod=1" title="<{$smarty.const._AM_SYSTEM_PREFERENCES_SETTINGS}>">
                <div class="x_tool float-left hoverable" data-toggle="tooltip" title="<{$smarty.const._AM_SYSTEM_PREFERENCES_SETTINGS}>">
                    <div class="x_toolicon">
                        <img src="<{xoAdminIcons 'xoops/system_mods.png'}>" alt="<{$smarty.const._AM_SYSTEM_PREFERENCES_SETTINGS}>" width="24px">
                    </div>
                    <div class="x_tooltext">
                        <{$smarty.const._AM_SYSTEM_PREFERENCES_SETTINGS}>
                    </div>
                </div>
            </a>
        </div>
    </div>
</div>
<{/if}>


