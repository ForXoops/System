<{include file="db:system_header.tpl"}>
<!--Comments-->
<{if !empty($form)}>
    <div class="spacer"><{$form}></div>
<{else}>
<div class="card">
    <div class="card-header">
        <div class="row">
            <div class="col">
                <form class="form-inline" action="admin.php?fct=comments" method="post">
                <select class="browser-default custom-select custom-select-sm mr-1" name="comments_module"> 
                    <{$comments_module|default:''}>
                </select>
                <select class="browser-default custom-select custom-select-sm mr-1" name="comments_status"> 
                    <{$comments_status|default:''}>
                </select>
                <select class="browser-default custom-select custom-select-sm mr-1" name="comments_limit"> 
                    <{$comments_limit|default:''}>
                </select>
                <input type="hidden" name="fct" value="comments" />
                <input class="btn btn-sm btn-primary" type="submit" value="<{$smarty.const._GO}>" name="selsubmit" />
                </form>
            </div>
            <div class="col ml-auto ">
                <a class="btn btn-sm btn-secondary floatright" href="admin.php?fct=comments&op=comments_form_purge">
                    <i class="fas fa-eraser ic-w mr-1"></i>
                    <{$smarty.const._AM_SYSTEM_COMMENTS_FORM_PURGE}>
                </a>
            </div>
        </div>
    </div>
    <div class="card-body table-responsive p-0">
        <table class="table table-bordered table-striped">
            <thead class="table-head">
            <tr>
                <th class="txtcenter width5"><input name='allbox' id='allbox' onclick='xoopsCheckAll("commentslist", "allbox");' type='checkbox'
                                                    value='Check All'/></th>
                <th class="txtcenter width5"></th>
                <th class="txtleft"><{$smarty.const._AM_SYSTEM_COMMENTS_TITLE}></th>
                <th class="txtcenter"><{$smarty.const._AM_SYSTEM_COMMENTS_POSTED}></th>
                <th class="txtcenter"><{$smarty.const._AM_SYSTEM_COMMENTS_IP}></th>
                <th class="txtcenter"><{$smarty.const._DATE}></th>
                <th class="txtcenter"><{$smarty.const._AM_SYSTEM_COMMENTS_MODULE}></th>
                <th class="txtcenter"><{$smarty.const._AM_SYSTEM_COMMENTS_STATUS}></th>
                <th class="txtcenter width10"><{$smarty.const._AM_SYSTEM_COMMENTS_ACTION}></th>
            </tr>
            </thead>
            <form name='commentslist' id='commentslist' action='<{$php_selft}>' method="post">
                <tbody>
                <{foreach item=comment from=$comments|default:null}>
                    <tr class="<{cycle values='even,odd'}> alignmiddle">
                        <td class="txtcenter"><input type='checkbox' name='commentslist_id[]' id='commentslist_id[]' value='<{$comment.comments_id}>'/></td>
                        <td class="txtcenter"><{$comment.comments_icon}></td>
                        <td>
                            <a href="admin.php?fct=comments&amp;op=comments_jump&amp;com_id=<{$comment.comments_id}>" title="<{$comment.comments_title}>">
                                <{$comment.comments_title}>
                            </a>
                        </td>
                        <td class="txtcenter"><{$comment.comments_poster}></td>
                        <td class="txtcenter"><{$comment.comments_ip}></td>
                        <td class="txtcenter"><{$comment.comments_date}></td>
                        <td class="txtcenter"><{$comment.comments_modid}></td>
                        <td class="txtcenter"><{$comment.comments_status}></td>
                        <td class="xo-actions txtcenter">
                            <a data-toggle="modal" data-target="#dialog<{$comment.comments_id}>">
                                <img class="cursorpointer"
                                    src="<{xoAdminIcons 'display.png'}>" alt="<{$smarty.const._AM_SYSTEM_COMMENTS_VIEW}>"
                                    title="<{$smarty.const._AM_SYSTEM_COMMENTS_VIEW}>"/></a>
                            <a href="admin/comments/comment_edit.php?com_id=<{$comment.comments_id}>" title="<{$smarty.const._EDIT}>">
                                <img src="<{xoAdminIcons 'edit.png'}>" alt="<{$smarty.const._EDIT}>">
                            </a>
                            <a href="admin/comments/comment_delete.php?com_id=<{$comment.comments_id}>" title="<{$smarty.const._DELETE}>">
                                <img src="<{xoAdminIcons 'delete.png'}>" alt="<{$smarty.const._DELETE}>">
                            </a>
                        </td>
                    </tr>
                <{/foreach}>
                </tbody>
            </form>
        </table>
    </div>
    <div class="card-footer">
        <input class="btn btn-sm btn-primary" type='submit' name='<{$smarty.const._DELETE}>' value='<{$smarty.const._DELETE}>'/>
        <div class="float-right"><{$nav|default:''}></div>
    </div>
</div>
<{foreach item=comment from=$comments_popup|default:null}>
<!--Pop-pup-->
<div class="modal fade" id="dialog<{$comment.comments_id}>" tabindex="-1">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title"><{$comment.comments_title}></h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <p><{$comment.comments_text}></p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>
<{/foreach}>
<!--Pop-pup-->
<{/if}>
