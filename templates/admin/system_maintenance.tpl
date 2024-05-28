<!--maintenance-->
<{include file="db:system_header.tpl"}>
<!-- Display mailusers form  -->
<br>
<{if !empty($form_maintenance)}>
    <div class="spacer"><{$form_maintenance}></div>
    <br>
    <div class="spacer"><{$form_dump}></div>
<{elseif !empty($maintenance)}>
    <{if $verif_cache || $verif_session || $verif_avatar}>
        <table class="outer ui-corner-all" cellspacing="1">
            <tr>
                <th><{$smarty.const._AM_SYSTEM_MAINTENANCE}></th>
                <th><{$smarty.const._AM_SYSTEM_MAINTENANCE_RESULT}></th>
            </tr>
            <{if isset($verif_cache)}>
                <tr>
                    <td class="aligntop txtcenter"><{$smarty.const._AM_SYSTEM_MAINTENANCE_RESULT_CACHE}></td>
                    <td class="aligntop txtcenter"><{if isset($result_cache)}><img width="16" src="<{xoAdminIcons 'success.png'}>"/><{else}><img style="width:16px;"
                                                                                                                                        src="<{xoAdminIcons 'cancel.png'}>"
                                                                                                                                        alt="Cancel"/><{/if}>
                    </td>
                </tr>
            <{/if}>

            <{if isset($verif_session)}>
                <tr>
                    <td class="aligntop" align="center"><{$smarty.const._AM_SYSTEM_MAINTENANCE_RESULT_SESSION}></td>
                    <td class="aligntop" align="center"><{if isset($result_session)}><img style="width:16px;" src="<{xoAdminIcons 'success.png'}>"
                                                                                   alt="Success"/><{else}><img style="width:16px;"
                                                                                                               src="<{xoAdminIcons 'cancel.png'}>" alt="Cancel"/><{/if}>
                    </td>
                </tr>
            <{/if}>

            <{if isset($verif_avatar)}>
                <tr>
                    <td class="aligntop" align="center"><{$smarty.const._AM_SYSTEM_MAINTENANCE_RESULT_AVATAR}></td>
                    <td class="aligntop" align="center"><{if isset($result_avatar)}><img style="width:16px;" src="<{xoAdminIcons 'success.png'}>"
                                                                                  alt="Success"/><{else}><img style="width:16px;"
                                                                                                              src="<{xoAdminIcons 'cancel.png'}>" alt="Cancel"/><{/if}>
                    </td>
                </tr>
            <{/if}>
        </table>
        <br>
    <{/if}>
    <{if !empty($verif_maintenance)}>
        <{$result_maintenance}>
    <{/if}>
<{else}>
    <{$result_dump}>
<{/if}>
