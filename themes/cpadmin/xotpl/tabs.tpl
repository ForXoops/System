<div class="card card-secondary card-outline card-outline-tabs">
    <div class="card-header p-0 border-bottom-0">
        <ul class="nav nav-tabs bar_tabs" id="myTab" role="tablist">
            <li class="nav-item">
            <a class="nav-link active" id="help-tab" data-toggle="tab" href="#help" role="tab" aria-controls="help" aria-selected="true"><{$smarty.const._AM_SYSTEM_HELP}></a>
            </li>
            <li class="nav-item">
            <a class="nav-link" id="waiting-tab" data-toggle="tab" href="#waiting" role="tab" aria-controls="waiting" aria-selected="false"><{xoBlock id=4 display='title'}></a>
            </li>
            <li class="nav-item">
            <a class="nav-link" id="user-tab" data-toggle="tab" href="#user" role="tab" aria-controls="user" aria-selected="false"><{xoBlock id=9 display='title'}></a>
            </li>
            <li class="nav-item">
            <a class="nav-link" id="top-tab" data-toggle="tab" href="#top" role="tab" aria-controls="top" aria-selected="false"><{xoBlock id=8 display='title'}></a>
            </li>
            <li class="nav-item">
            <a class="nav-link" id="comment-tab" data-toggle="tab" href="#comment" role="tab" aria-controls="comment" aria-selected="false"><{xoBlock id=10 display='title'}></a>
            </li>
        </ul>
    </div>
    <div class="card-body">
        <div class="tab-content" id="myTabContent">
            <div class="tab-pane fade show active" id="help" role="tabpanel" aria-labelledby="help-tab">
                <h3><{$smarty.const._CPADMIN_HELP_1}></h3>
                <p><{$smarty.const._CPADMIN_HELP_DESC_1}></p>
                <h3><{$smarty.const._CPADMIN_HELP_2}></h3>
                <p><{$smarty.const._CPADMIN_HELP_DESC_2}></p>
                <h3><{$smarty.const._CPADMIN_HELP_3}></h3>
                <p><{$smarty.const._CPADMIN_HELP_DESC_3}></p>
            </div>
            <div class="tab-pane fade" id="waiting" role="tabpanel" aria-labelledby="waiting-tab">
                <{xoBlock id=4}>
            </div>
            <div class="tab-pane fade" id="user" role="tabpanel" aria-labelledby="user-tab">
                <{xoBlock id=9}>
            </div>
            <div class="tab-pane fade" id="top" role="tabpanel" aria-labelledby="top-tab">
                <{xoBlock id=8}>
            </div>
            <div class="tab-pane fade" id="comment" role="tabpanel" aria-labelledby="comment-tab">
                <{xoBlock id=8}>
            </div>
        </div>
    </div>
</div>