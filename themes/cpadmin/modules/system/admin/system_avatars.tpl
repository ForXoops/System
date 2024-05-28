<!-- Header -->
<{include file="db:system_header.tpl"}>
<script type="text/javascript">
    IMG_ON = '<{xoAdminIcons 'success.png'}>';
    IMG_OFF = '<{xoAdminIcons 'cancel.png'}>';
</script>
<!-- Buttons -->
<{if $type == 's'}>
    <div class="row">
        <div class="col">
            <a id="xo-addavatar-btn" class="btn btn-secondary floatright" href="admin.php?fct=avatars&amp;op=multiupload" data-toggle="tooltip"
                    title="<{$smarty.const._AM_SYSTEM_AVATAR_MULTIUPLOAD}>">
                <i class="fa fa-upload ic-w mr-1"></i>
                <{$smarty.const._AM_SYSTEM_AVATAR_MULTIUPLOAD}>
            </a>
        </div>
    </div>
<{/if}>
<{if $view_cat}>
<!-- Display Avatar header for switch between system & custom category -->
<div class="row">
    <div class="col">
        <div class="card card-default color-palette-box">
            <a class="" href="admin.php?fct=avatars&amp;op=listavt&amp;type=s" title="<{$smarty.const._AM_SYSTEM_AVATAR_SYSTEM}>">
                <div class="card-body text-center hoverable">
                    <img src="<{xoAdminIcons 'avatar_system.png'}>" alt="<{$smarty.const._AM_SYSTEM_AVATAR_SYSTEM}>"/>
                    <p class="text-center">
                        <{$smarty.const._AM_SYSTEM_AVATAR_SYSTEM}>&nbsp;:&nbsp;<strong><{$count_system}></strong>
                    </p>
                </div>
            </a>
        </div>
    </div>
    <div class="col">
        <div class="card card-default color-palette-box">
            <a class="" href="admin.php?fct=avatars&amp;op=listavt&amp;type=s" title="<{$smarty.const._AM_SYSTEM_AVATAR_CUSTOM}>">
                <div class="card-body text-center hoverable">
                    <img src="<{xoAdminIcons 'avatar_custom.png'}>" alt="<{$smarty.const._AM_SYSTEM_AVATAR_CUSTOM}>"/>
                    <p class="text-center">
                        <{$smarty.const._AM_SYSTEM_AVATAR_CUSTOM}>&nbsp;:&nbsp;<strong><{$count_custom}></strong>
                    </p>
                </div>
            </a>
        </div>
    </div>
</div>
<{/if}>
<!-- Display Avatar list for each category -->
<{if $avatars_list}>
    <{foreach item=avatar from=$avatars_list}>
        <div class="floatleft">
            <div class="card xo-thumb txtcenter">
                <div class="xo-thumbimg">
                    <img src="<{$xoops_url}>/uploads/<{$avatar.avatar_file}>" data-toggle="tooltip"
                         alt="<{$avatar.avatar_name}>" title="<{$avatar.avatar_name}>"/>
                </div>
                <div class="xo-actions txtcenter">
                    <div class="spacer bold"><{$avatar.avatar_name}></div>
                    <img id="loading_avt<{$avatar.avatar_id}>" src="images/spinner.gif" style="display:none;" title="<{$smarty.const._AM_SYSTEM_LOADING}>"
                         alt="<{$smarty.const._AM_SYSTEM_LOADING}>"/><img id="avt<{$avatar.avatar_id}>" data-toggle="tooltip"
                                                                          onclick="system_setStatus( { fct: 'avatars', op: 'display', avatar_id: <{$avatar.avatar_id}> }, 'avt<{$avatar.avatar_id}>', 'admin.php' )"
                                                                          src="<{if $avatar.avatar_display}><{xoAdminIcons 'success.png'}><{else}><{xoAdminIcons 'cancel.png'}><{/if}>"
                                                                          alt="<{$smarty.const._IMGDISPLAY}>" title="<{$smarty.const._IMGDISPLAY}>"/>
                    <{if $avatar.type == 'c'}>
                        <a href="<{$xoops_url}>/modules/profile/userinfo.php?uid=<{$avatar.user}>" title="<{$smarty.const._AM_SYSTEM_AVATAR_USERS}>">
                            <img src="<{xoAdminIcons 'edit.png'}>" alt="<{$smarty.const._AM_SYSTEM_AVATAR_USERS}>"/>
                        </a>
                    <{else}>
                        <img class="cursorhelp" src="<{xoAdminIcons 'forum.png'}>" alt="<{$avatar.count}> <{$smarty.const._AM_SYSTEM_AVATAR_USERS}>" data-toggle="tooltip"
                             title="<{$avatar.count}> <{$smarty.const._AM_SYSTEM_AVATAR_USERS}>"/>
                    <{/if}>
                    <a href="admin.php?fct=avatars&amp;op=edit&amp;avatar_id=<{$avatar.avatar_id}>" data-toggle="tooltip" title="<{$smarty.const._EDIT}>"> 
                        <img src="<{xoAdminIcons 'edit.png'}>" alt="<{$smarty.const._EDIT}>"/>
                    </a>
                    <a href="admin.php?fct=avatars&amp;op=delfile&amp;avatar_id=<{$avatar.avatar_id}>" data-toggle="tooltip" title="<{$smarty.const._DELETE}>">
                        <img src="<{xoAdminIcons 'delete.png'}>" alt="<{$smarty.const._DELETE}>"/>
                    </a>
                </div>
            </div>
        </div>
    <{/foreach}>
    <!-- Display Avatars navigation -->
    <div class="clear">&nbsp;</div>
    <{if $nav_menu}>
    <div class="row">
        <div class="xo-pagenav col floatright"><{$nav_menu}></div>
    </div>
    <{/if}>
<{/if}>

<{if $multiupload}>
    <div class="row">
        <div class="col">
            <a id="xo-addavatar-btn" class="btn btn-secondary floatright" href="admin.php?fct=avatars&amp;op=listavt&amp;type=s" data-toggle="tooltip"
                title="<{$smarty.const._AM_SYSTEM_AVATAR_SYSTEM}>">
                <i class="fa fa-list ic-w mr-1"></i><{$smarty.const._AM_SYSTEM_AVATAR_SYSTEM}>
            </a>
        </div>
    </div>
    <div class="clear">&nbsp;</div>
    <{include file="db:system_trigger_uploads.tpl"}>
    <h2><{$smarty.const._AM_SYSTEM_AVATAR_SYSTEM}></h2>
    <div id="fine-uploader-manual-trigger"></div>
    <div><{$smarty.const._IMGMAXSIZE}> <{$imgcat_maxsize}></div>
    <div><{$smarty.const._IMGMAXWIDTH}> <{$imgcat_maxwidth}></div>
    <div><{$smarty.const._IMGMAXHEIGHT}> <{$imgcat_maxheight}></div>
    <!-- Your code to create an instance of Fine Uploader and bind to the DOM/template
    ====================================================================== -->
    <script>
        var manualUploader = new qq.FineUploader({
            element: document.getElementById('fine-uploader-manual-trigger'),
            template: 'qq-template-manual-trigger',
            request: {
                endpoint: '<{$xoops_url}>/ajaxfineupload.php',
                params: {
                    "Authorization": "<{$jwt}>"
                }
            },
            text: {
                formatProgress: "<{$smarty.const._FORMATPROGRESS}>",
                failUpload: "<{$smarty.const._FAILUPLOAD}>",
                waitingForResponse: "<{$smarty.const._WAITINGFORRESPONSE}>",
                paused: "<{$smarty.const._PAUSED}>"
            },
            messages: {
                typeError: "<{$smarty.const._TYPEERROR}>",
                sizeError: "<{$smarty.const._SIZEERROR}>",
                minSizeError: "<{$smarty.const._MINSIZEERROR}>",
                emptyError: "<{$smarty.const._EMPTYERROR}>",
                noFilesError: "<{$smarty.const._NOFILESERROR}>",
                tooManyItemsError: "<{$smarty.const._TOOMANYITEMSERROR}>",
                maxHeightImageError: "<{$smarty.const._MAXHEIGHTIMAGEERROR}>",
                maxWidthImageError: "<{$smarty.const._MAXWIDTHIMAGEERROR}>",
                minHeightImageError: "<{$smarty.const._MINHEIGHTIMAGEERROR}>",
                minWidthImageError: "<{$smarty.const.__MINWIDTHIMAGEERROR}>",
                retryFailTooManyItems: "<{$smarty.const._RETRYFAILTOOMANYITEMS}>",
                onLeave: "<{$smarty.const._ONLEAVE}>",
                unsupportedBrowserIos8Safari: "<{$smarty.const._UNSUPPORTEDBROWSERIOS8SAFARI}>"
            },
            thumbnails: {
                placeholders: {
                    waitingPath: '<{$xoops_url}>/media/fine-uploader/placeholders/waiting-generic.png',
                    notAvailablePath: '<{$xoops_url}>/media/fine-uploader/placeholders/not_available-generic.png'
                }
            },
            validation: {
                acceptFiles: ['image/jpeg', 'image/gif', 'image/png'],
                allowedExtensions: ['jpeg', 'jpg', 'png', 'gif'],
                image: {
                    maxHeight: <{$imgcat_maxheight}>,
                    maxWidth: <{$imgcat_maxwidth}>
                },
                sizeLimit: <{$imgcat_maxsize}>
            },
            autoUpload: false,
            callbacks: {
            onError: function(id, name, errorReason, xhrOrXdr) {
                 console.log(qq.format("Error uploading {}.  Reason: {}", name, errorReason));
             }
         },
        debug: <{$fineup_debug}>
        });

        qq(document.getElementById("trigger-upload")).attach("click", function() {
            manualUploader.uploadStoredFiles();
        });
    </script>
<{/if}>

<!-- Display Avatar form (add,edit) -->
<{if $form}>
    <div class="spacer"><{$form}></div>
<{/if}>
<!-- Display Avatar images on edit page -->
