<div class="card card-default color-palette-box">
<div class="card-header">
        <{foreach item=breadcrumb from=$xo_sys_breadcrumb}>
        <{if $breadcrumb.home}>
        <a class="text-dark" href="<{$breadcrumb.link}>" data-toggle="tooltip" title="<{$breadcrumb.title}>"><i class="fas fa-home"></i></a>
        <{else}>
            <{if $breadcrumb.link}>
            &nbsp;\&nbsp;<a href="<{$breadcrumb.link}>" data-toggle="tooltip" title="<{$breadcrumb.title}>"><{$breadcrumb.title}></a>
            <{else}>
            &nbsp;\&nbsp;<span><{$breadcrumb.title}></span>
            <{/if}>
        <{/if}>
        <{/foreach}> 
    <div class="card-tools">
        <i class="fas fa-question help-view" data-toggle="tooltip" title="<{$smarty.const._AM_SYSTEM_HELP_VIEW}>"></i>
        <i class="fas fa-question help-hide d-none" data-toggle="tooltip" title="<{$smarty.const._AM_SYSTEM_HELP_HIDE}>"></i>
    </div>
</div>
</div>
<{if $help_content}>

    <div class="row mb-2">
        <div class="col">
            <div class="hide" id="xo-system-help">
                <{include file="$help_content"}>
            </div>
        </div>
    </div>

<{/if}>
<{if $xo_sys_tips}>

    <div class="row">
        <div class="col">
            <div class="callout callout-success clearfix">
                <img class="floatleft" src="<{xoAdminIcons 'tips.png'}>" data-toggle="tooltip" alt="<{$smarty.const._AM_SYSTEM_TIPS}>" title="<{$smarty.const._AM_SYSTEM_TIPS}>"/>
                <div class="floatleft"><{$xo_sys_tips}></div>
            </div>
        </div>
    </div>

<{/if}>
