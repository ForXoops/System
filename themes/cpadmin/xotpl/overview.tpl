<div class="accordion" id="accordion">
    <div class="card mb-0">
        <div class="card-header" id="overview">
            <h2 class="mb-0">
                <button class="btn btn-link btn-block text-left" type="button" data-toggle="collapse" data-target="#collapseOverview" aria-expanded="true" aria-controls="collapseOverview">
                <i class="fa fa-desktop ic-w mr-1"></i><{$smarty.const._MD_CPANEL_OVERVIEW}>
                </button>
            </h2>
        </div>
        <div id="collapseOverview" class="collapse" aria-labelledby="collapseOverview" data-parent="#accordion">
            <div class="card-body">
                <table>
                    <tr>
                        <td><{$smarty.const._CPADMIN_VERSION_XOOPS}></td>
                        <td><{$xoops_version}></td>
                    </tr>
                    <tr>
                        <td><{$smarty.const._CPADMIN_VERSION_PHP}></td>
                        <td><{$lang_php_vesion}></td>
                    </tr>
                    <tr>
                        <td><{$smarty.const._CPADMIN_VERSION_MYSQL}></td>
                        <td><{$lang_mysql_version}></td>
                    </tr>
                    <tr>
                        <td><{$smarty.const._CPADMIN_SERVER_API}></td>
                        <td><{$lang_server_api}></td>
                    </tr>
                    <tr>
                        <td><{$smarty.const._CPADMIN_OS}></td>
                        <td><{$lang_os_name}></td>
                    </tr>
                    <tr>
                        <td>fsockopen</td>
                        <td><{$fsockopen}></td>
                    </tr>
                    <tr>
                        <td>post_max_size</td>
                        <td><{$post_max_size}></td>
                    </tr>
                    <tr>
                        <td>max_input_time</td>
                        <td><{$max_input_time}></td>
                    </tr>
                    <tr>
                        <td>output_buffering</td>
                        <td><{$output_buffering}></td>
                    </tr>
                    <tr>
                        <td>max_execution_time</td>
                        <td><{$max_execution_time}></td>
                    </tr>
                    <tr>
                        <td>memory_limit</td>
                        <td><{$memory_limit}></td>
                    </tr>
                    <tr>
                        <td>file_uploads</td>
                        <td><{$file_uploads}></td>
                    </tr>
                    <tr>
                        <td>upload_max_filesize</td>
                        <td><{$upload_max_filesize}></td>
                    </tr>
                </table>
            </div>
        </div>
    </div>
    <div class="card mb-0">
        <div class="card-header" id="overview">
            <h2 class="mb-0">
                <button class="btn btn-link btn-block text-left" type="button" data-toggle="collapse" data-target="#collapseLicence" aria-expanded="true" aria-controls="collapseLicence">
                <i class="fa fa-file-o ic-w mr-1"></i><{$smarty.const._CPADMIN_XOOPS_LICENSE}>
                </button>
            </h2>
        </div>
        <div id="collapseLicence" class="collapse" aria-labelledby="collapseLicence" data-parent="#accordion">
            <div class="card-body">
                <p><a data-toggle="tooltip" rel="external" href="http://www.gnu.org/licenses/gpl-2.0.html" title="<{$smarty.const.XOOPS_LICENSE_TEXT}>"><{$smarty.const.XOOPS_LICENSE_TEXT}></a></p>
            </div>
        </div>
    </div>
    <div class="card mb-0">
        <div class="card-header" id="overview">
            <h2 class="mb-0">
                <button class="btn btn-link btn-block text-left" type="button" data-toggle="collapse" data-target="#collapseInfo" aria-expanded="true" aria-controls="collapseInfo">
                <i class="fas fa-info-circle ic-w mr-1"></i><{$smarty.const._CPADMIN_ABOUT}>
                </button>
            </h2>
        </div>
        <div id="collapseInfo" class="collapse" aria-labelledby="collapseInfo" data-parent="#accordion">
            <div class="card-body">
                <p><{$smarty.const._CPADMIN_ABOUT_TEXT}></p>
            </div>
        </div>
    </div>
    <div class="card mb-0">
        <div class="card-header" id="overview">
            <h2 class="mb-0">
                <button class="btn btn-link btn-block text-left" type="button" data-toggle="collapse" data-target="#collapseLinks" aria-expanded="true" aria-controls="collapseLinks">
                <i class="fa fa-link ic-w mr-1"></i><{$smarty.const._CPADMIN_XOOPS_LINKS}>
                </button>
            </h2>
        </div>
        <div id="collapseLinks" class="collapse" aria-labelledby="collapseLinks" data-parent="#accordion">
            <div class="card-body">
                <table>
                    <tr>
                        <td><a rel="external" href="http://xoops.org"><{$smarty.const._CPADMIN_XOOPSPROJECT}></a></td>
                        <td><a rel="external" href="https://github.com/XOOPS/XoopsCore25/releases"><{$smarty.const._CPADMIN_XOOPSCORE}></a></td>
                    </tr>
                    <tr>
                        <td><a rel="external" href="http://www.xoops.org/modules/xoopspartners"><{$smarty.const._CPADMIN_LOCALSUPPORT}></a></td>
                        <td><a rel="external" href="https://github.com/XOOPS/XoopsCore25"><{$smarty.const._CPADMIN_CODESVN}></a></td>
                    </tr>
                    <tr>
                        <td><a rel="external" href="https://github.com/XOOPS/XoopsCore25/issues"><{$smarty.const._CPADMIN_REPORTBUG}></a></td>
                    </tr>
                </table>
            </div>
        </div>
    </div>
</div>
