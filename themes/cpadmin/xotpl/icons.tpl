<div class="x_toolbar">
    <{foreach item=op from=$adminmenu}>
    <a href="<{$op.link}>">
        <div class="x_tool float-left hoverable" data-toggle="tooltip" title="<{$op.desc}>">
            <div class="x_toolicon">
                <i class="<{$op.icon}>"></i>
            </div>
            <div class="x_tooltext">
                <{$op.title}>
            </div>
        </div>
    </a>
    <{/foreach}>
    <a href="<{xoAppUrl 'modules/system/admin.php'}>">
        <div class="x_tool float-left hoverable">
            <div class="x_toolicon">
                <i class="fa fa-cog"></i>
            </div>
            <div class="x_tooltext">
                <{$smarty.const._AM_SYSTEM_CONFIG}>
            </div>
        </div>
    </a>
    <a href="<{xoAppUrl 'modules/system/help.php'}>">
        <div class="x_tool float-left hoverable">
            <div class="x_toolicon">
                <i class="fa fa-question-circle"></i>
            </div>
            <div class="x_tooltext">
                <{$smarty.const._AM_SYSTEM_HELP}>
            </div>
        </div>
    </a>
</div>