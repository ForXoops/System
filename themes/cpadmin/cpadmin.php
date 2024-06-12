<?php
/*
 You may not change or alter any portion of this comment or credits
 of supporting developers from this source code or any supporting source code
 which is considered copyrighted (c) material of the original comment or credit authors.

 This program is distributed in the hope that it will be useful,
 but WITHOUT ANY WARRANTY; without even the implied warranty of
 MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
 */

xoops_load('gui', 'system');

/*
 * Xoops Cpanel default GUI class
 *
 * @copyright   (c) 2000-2021 XOOPS Project (www.xoops.org)
 * @license     GNU GPL 2 or later (http://www.gnu.org/licenses/gpl-2.0.html)
 * @package     system
 * @usbpackage  GUI
 * @since       2.5.11
 * @author      ForMuss     <nicolas.andricq@gmail.com>
 */

 use Xmf\Request;

 /**
 * Class XoopsGuiCpadmin
 */
class XoopsGuiCpadmin extends XoopsSystemGui
{
    /**
     * @return bool
     */
    public static function validate()
    {
        return true;
    }

    public function header()
    {
        parent::header();

        global $xoopsConfig, $xoopsUser, $xoopsModule, $xoTheme, $xoopsTpl, $xoopsDB;
        $tpl =& $this->template;

        /*xoops_load('XoopsFormRendererBootstrap4');
        XoopsFormRenderer::getInstance()->set(new XoopsFormRendererBootstrap4());*/

        include_once __DIR__ . '/class/XoopsFormRendererBootstrap4.php';
        XoopsFormRenderer::getInstance()->set(new XoopsFormRendererBootstrap4());

        include_once dirname(__DIR__) . '/ComposerInfo.php';

        // Determine if information box must be shown
        $currentScript = str_replace(XOOPS_ROOT_PATH . '/', '', $_SERVER['SCRIPT_FILENAME']);

        if('admin.php' == $currentScript){
            $show = $_GET['show'] ?? '';
            if('info' == $show){
                $tpl->assign('showCpadminInfo', true);
            }
        }

        $iconsSet = xoops_getModuleOption('typeicons', 'system');

        if ($iconsSet == '') {
            $icons = 'cpadmin';
        }

        $tpl->assign('theme_url', XOOPS_ADMINTHEME_URL . '/cpadmin' );
        $tpl->assign('theme_icons', XOOPS_URL . '/modules/system/images/icons/' . $iconsSet );

        // language
        $tpl->assign('xoops_language', $xoopsConfig['language']);
        $tpl->assign('xoops_sitename', $xoopsConfig['sitename']);

        $xoTheme->addScript('browse.php?Frameworks/jquery/jquery.js');

        $xoTheme->addStylesheet(XOOPS_URL . '/modules/system/css/admin.css');
        $xoTheme->addStylesheet(XOOPS_ADMINTHEME_URL . '/cpadmin/css/adminlte.min.css');
        $xoTheme->addStylesheet(XOOPS_ADMINTHEME_URL . '/cpadmin/css/color.css');
        $xoTheme->addStylesheet(XOOPS_ADMINTHEME_URL . '/cpadmin/css/style.css');

        $tpl->assign('lang_cp', _CPHOME);
        

        // ADD MENU *****************************************

        //Add  CONTROL PANEL  Menu  items
        $menu                = [];
        $menu[0]['link']     = XOOPS_URL;
        $menu[0]['title']    = "<span class='fa fa-home'></span> " . _YOURHOME;
        $menu[0]['absolute'] = 1;
        $menu[1]['link']     = XOOPS_URL . '/admin.php?xoopsorgnews=1';
        $menu[1]['title']    = "<span class='fa fa-newspaper-o'></span> " . _CPADMIN_NEWS;
        $menu[1]['absolute'] = 1;
        $menu[1]['icon']     = XOOPS_ADMINTHEME_URL . '/transition/images/xoops.png';
        $menu[2]['link']     = XOOPS_URL . '/user.php?op=logout';
        $menu[2]['title']    = "<span class='fa fa-sign-out'></span> " . _LOGOUT;
        $menu[2]['absolute'] = 1;
        $menu[2]['icon']     = XOOPS_ADMINTHEME_URL . '/transition/images/logout.png';
        $tpl->append('navitems', ['link' => XOOPS_URL . '/admin.php', 'text' => '<span class="fa fa-cog"></span> ' . _CPADMIN_DASHBOARD, 'menu' => $menu]);

        // Add server configuration
        $this->getServerConfig();

        // Add Composer packages versions
        ComposerInfo::getComposerInfo($tpl);

        // Add System menu items
        $this->getAdminMenu();

        // Get module list
        $this->getModules();

        // Get preferences
        $this->getPreferences();

        // add MODULES  Menu items
        /* @var XoopsModuleHandler $module_handler */
        $module_handler = xoops_getHandler('module');
        $criteria       = new CriteriaCompo();
        $criteria->add(new Criteria('hasadmin', 1));
        $criteria->add(new Criteria('isactive', 1));
        $criteria->setSort('mid');
        $mods = $module_handler->getObjects($criteria);

        $menu               = [];
        /* @var XoopsGroupPermHandler $moduleperm_handler */
        $moduleperm_handler = xoops_getHandler('groupperm');
        foreach ($mods as $mod) {
            $rtn        = [];
            $modOptions = [];                                                         //add for sub menus
            $sadmin     = $moduleperm_handler->checkRight('module_admin', $mod->getVar('mid'), $xoopsUser->getGroups());

            if ($sadmin) {
                $info = $mod->getInfo();
                if (!empty($info['adminindex'])) {
                    $rtn['link'] = XOOPS_URL . '/modules/' . $mod->getVar('dirname', 'n') . '/' . $info['adminindex'];
                } else {
                    $rtn['link'] = XOOPS_URL . '/modules/system/admin.php?fct=preferences&amp;op=showmod&amp;mod=' . $mod->getVar('mid');
                }
                $rtn['title']    = htmlspecialchars($mod->name(), ENT_QUOTES);
                $rtn['absolute'] = 1;
                $rtn['url']      = XOOPS_URL . '/modules/' . $mod->getVar('dirname', 'n') . '/'; //add for sub menus
                $modOptions      = $mod->getAdminMenu();                                        //add for sub menus
                $rtn['options']  = $modOptions;                                             //add for sub menus

                if (isset($info['icon']) && $info['icon'] !== '') {
                    $rtn['icon'] = XOOPS_URL . '/modules/' . $mod->getVar('dirname', 'n') . '/' . $info['icon'];
                }
                $menu[] = $rtn;
            }
        }
        $tpl->append('navitems', [
            'link' => XOOPS_URL . '/modules/system/admin.php?fct=modulesadmin',
            'text' => '<span class="fa fa-puzzle-piece"></span> ' . _AM_SYSTEM_MODULES,
            'dir'  => $mod->getVar('dirname', 'n'),
            'menu' => $menu]);
        
        //add OPTIONS/links for local support
        if (file_exists($file = XOOPS_ADMINTHEME_PATH . '/transition/language/' . $xoopsConfig['language'] . '/localsupport.php')) {
            $links = include XOOPS_ADMINTHEME_PATH . '/transition/language/' . $xoopsConfig['language'] . '/localsupport.php';
            if (count($links) > 0) {
                $tpl->append('navitems', ['link' => XOOPS_URL . '/admin.php', 'text' => '<span class="fa fa-link"></span> ' . _OXYGEN_LOCALSUPPORT, 'menu' => $links]);
            }
        }

        if (is_object($xoopsModule) || !empty($_GET['xoopsorgnews'])) {
            if (is_object($xoopsModule) && file_exists($file = XOOPS_ROOT_PATH . '/modules/' . $xoopsModule->getVar('dirname') . '/' . $xoopsModule->getInfo('adminmenu'))) {
                include $file;
            }

            return null;
        }
        
    }

    /**
     * Get all system menu item
     */
    public function getAdminMenu() {
        global $xoopsConfig, $xoopsUser, $xoopsModule, $xoTheme, $xoopsTpl, $xoopsDB;

        include_once $GLOBALS['xoops']->path('/modules/system/constants.php');

        $groups = $xoopsUser->getGroups();
        $all_ok = false;
        if (!in_array(XOOPS_GROUP_ADMIN, $groups)) {
            $sysperm_handler = xoops_getHandler('groupperm');
            $ok_syscats      = $sysperm_handler->getItemIds('system_admin', $groups);
        } else {
            $all_ok = true;
        }

        xoops_load('xoopslists');

        $admin_dir        = XOOPS_ROOT_PATH . '/modules/system/admin';
        $dirlist          = XoopsLists::getDirListAsArray($admin_dir);
        $inactive_section = ['blocksadmin', 'groups', 'modulesadmin', 'preferences', 'tplsets'];
        foreach ($dirlist as $directory) {
            if (file_exists($admin_dir . '/' . $directory . '/xoops_version.php')) {
                require $admin_dir . '/' . $directory . '/xoops_version.php';

                if ($modversion['hasAdmin']) {
                    if (xoops_getModuleOption('active_' . $directory, 'system')) {
                        $category = isset($modversion['category']) ? (int)$modversion['category'] : 0;
                        if (false !== $all_ok || in_array($modversion['category'], $ok_syscats)) {
                            $menu['file']   = $directory;
                            $menu['title']  = trim($modversion['name']);
                            $menu['desc']   = str_replace('<br>', ' ', $modversion['description']);
                            $menu['image']  = $modversion['image'];
                            $menu['icon']   = $modversion['icon'] ?? '';
                            $menu['link']   = XOOPS_URL . '/modules/system/admin.php?fct=' . $directory;
                            $menu['status'] = true;
                        }
                    } else {
                        $category = isset($modversion['category']) ? (int)$modversion['category'] : 0;
                        if (false !== $all_ok || in_array($modversion['category'], $ok_syscats)) {
                            $menu['file']   = $directory;
                            $menu['title']  = trim($modversion['name']);
                            $menu['desc']   = str_replace('<br>', ' ', $modversion['description']);
                            $menu['image']  = $modversion['image'];
                            $menu['icon']   = $modversion['icon'] ?? '';
                            $menu['link']   = XOOPS_URL . '/modules/system/admin.php?fct=' . $directory;
                            $menu['status'] = false;
                        }
                    }
                    if (!in_array($directory, $inactive_section)) {
                        $menu['used'] = true;
                    }
                    if (false !== $all_ok || in_array($modversion['category'], $ok_syscats)) {
                        switch ($directory) {
                            case 'avatars':
                                /* @var  SystemAvatarHandler $avatar_handler */
                                $avatar_handler = xoops_getHandler('avatar');
                                $avatar         = $avatar_handler->getCount();
                                $menu['infos']  = sprintf(_AM_SYSTEM_AVATAR_INFO, $avatar);
                                break;
                            case 'banners':
                                /* @var  SystemBannerHandler $banner_handler */
                                $banner_handler = xoops_getModuleHandler('banner', 'system');
                                $banner         = $banner_handler->getCount();
                                $menu['infos']  = sprintf(_AM_SYSTEM_BANNER_INFO, $banner);
                                break;
                            case 'comments':
                                /* @var  XoopsCommentHandler $comment_handler */
                                $comment_handler = xoops_getHandler('comment');
                                $comment         = $comment_handler->getCount();
                                $menu['infos']   = sprintf(_AM_SYSTEM_COMMENT_INFO, $comment);
                                break;
                            case 'groups':
                                /* @var  XoopsMembershipHandler $groups_Handler */
                                $groups_Handler = xoops_getModuleHandler('group', 'system');
                                $groups         = $groups_Handler->getCount();
                                $menu['infos']  = sprintf(_AM_SYSTEM_GROUP_INFO, $groups);
                                break;
                            case 'images':
                                /* @var  XoopsImageHandler $imgcat_handler */
                                $imgcat_handler = xoops_getHandler('image');
                                $img            = $imgcat_handler->getCount();
                                $menu['infos']  = sprintf(_AM_SYSTEM_IMG_INFO, $img);
                                break;
                            case 'smilies':
                                /* @var  SystemsmiliesHandler $smilies_Handler */
                                $smilies_Handler = xoops_getModuleHandler('smilies', 'system');
                                $smilies         = $smilies_Handler->getCount();
                                $menu['infos']   = sprintf(_AM_SYSTEM_SMILIES_INFO, $smilies);
                                break;
                            case 'userrank':
                                /* @var  SystemUserrankHandler $userrank_Handler */
                                $userrank_Handler = xoops_getModuleHandler('userrank', 'system');
                                $userrank         = $userrank_Handler->getCount();
                                $menu['infos']    = sprintf(_AM_SYSTEM_RANKS_INFO, $userrank);
                                break;
                            case 'users':
                                /* @var  SystemUsersHandler $member_handler */
                                $member_handler = xoops_getModuleHandler('users', 'system');
                                $member         = $member_handler->getCount();
                                $menu['infos']  = sprintf(_AM_SYSTEM_USERS_INFO, $member);
                                break;
                        }
                    }
                    $xoopsTpl->appendByRef('adminmenu', $menu);
                    unset($menu);
                }
                unset($modversion);
            }
        }
        unset($dirlist);
    }

    /**
     * Get All modules
     */
    public function getModules() {
        global $xoopsDB, $xoopsTpl, $xoopsUser, $xoopsModule;

        // add MODULES  Menu items
        /* @var XoopsModuleHandler $module_handler */
        $module_handler = xoops_getHandler('module');
        $criteria       = new CriteriaCompo();
        $criteria->add(new Criteria('hasadmin', 1));
        $criteria->add(new Criteria('isactive', 1));
        $criteria->setSort('mid');
        $mods = $module_handler->getObjects($criteria);

        $menu               = [];
        /* @var XoopsGroupPermHandler $moduleperm_handler */
        $moduleperm_handler = xoops_getHandler('groupperm');
        foreach ($mods as $mod) {
            $rtn        = [];
            $modOptions = [];                                                         //add for sub menus
            $sadmin     = $moduleperm_handler->checkRight('module_admin', $mod->getVar('mid'), $xoopsUser->getGroups());
            if ($sadmin) {
                $info = $mod->getInfo();
                if (!empty($info['adminindex'])) {
                    $rtn['link'] = XOOPS_URL . '/modules/' . $mod->getVar('dirname', 'n') . '/' . $info['adminindex'];
                } else {
                    $rtn['link'] = XOOPS_URL . '/modules/system/admin.php?fct=preferences&amp;op=showmod&amp;mod=' . $mod->getVar('mid');
                }
                $rtn['title']    = htmlspecialchars($mod->name(), ENT_QUOTES);
                $rtn['dir']      = $mod->getVar('dirname', 'n');
                $rtn['absolute'] = 1;
                $rtn['url']      = XOOPS_URL . '/modules/' . $mod->getVar('dirname', 'n') . '/'; //add for sub menus
                $modOptions      = $mod->getAdminMenu();                                        //add for sub menus
                $rtn['options']  = $modOptions;                                             //add for sub menus
                $rtn['icon'] = '<i class="fas fa-cog"></i>';
                if (isset($info['icon']) && $info['icon'] !== '') {
                    $rtn['image'] = XOOPS_URL . '/modules/' . $mod->getVar('dirname', 'n') . '/' . $info['icon'];
                }
                $menu[] = $rtn;
            }
        }
        //$xoopsTpl->append('modules', $menu);
        $fct = Request::getString('fct', '');
        if($fct != '') {
            $xoopsTpl->assign('dashboard', false);
        } else {
            $xoopsTpl->assign('dashboard', true);
        }
        if(is_object($xoopsModule)) {
            $xoopsTpl->assign('dashboard', false);
        }

        $xoopsTpl->append('modules', [
            'link' => XOOPS_URL . '/modules/system/admin.php?fct=modulesadmin',
            'text' => _AM_SYSTEM_MODULES,
            'icon' => 'fa fa-puzzle-piece',
            'dir'  => $mod->getVar('dirname', 'n'),
            'menu' => $menu]);
    }

    /**
     * Get System and module preferences link
     */
    public function getPreferences(){
        global $xoopsDB, $xoopsTpl, $xoopsUser;

        $pref = [];

        $opt   = [];
        $opt[] = [
            'link'     => XOOPS_URL . '/modules/system/admin.php?fct=preferences&amp;op=show&amp;confcat_id=1',
            'title'    => _CPADMIN_GENERAL,
            'absolute' => 1,
            'icon'     => 'fas fa-cog'];
        $opt[] = [
            'link'     => XOOPS_URL . '/modules/system/admin.php?fct=preferences&amp;op=show&amp;confcat_id=2',
            'title'    => _CPADMIN_USERSETTINGS,
            'absolute' => 1,
            'icon'     => 'fas fa-cog'];
        $opt[] = [
            'link'     => XOOPS_URL . '/modules/system/admin.php?fct=preferences&amp;op=show&amp;confcat_id=3',
            'title'    => _CPADMIN_METAFOOTER,
            'absolute' => 1,
            'icon'     => 'fas fa-cog'];
        $opt[] = [
            'link'     => XOOPS_URL . '/modules/system/admin.php?fct=preferences&amp;op=show&amp;confcat_id=4',
            'title'    => _CPADMIN_CENSOR,
            'absolute' => 1,
            'icon'     => 'fas fa-cog'];
        $opt[] = [
            'link'     => XOOPS_URL . '/modules/system/admin.php?fct=preferences&amp;op=show&amp;confcat_id=5',
            'title'    => _CPADMIN_SEARCH,
            'absolute' => 1,
            'icon'     => 'fas fa-cog'];
        $opt[] = [
            'link'     => XOOPS_URL . '/modules/system/admin.php?fct=preferences&amp;op=show&amp;confcat_id=6',
            'title'    => _CPADMIN_MAILER,
            'absolute' => 1,
            'icon'     => 'fas fa-cog'];
        $opt[] = [
            'link'     => XOOPS_URL . '/modules/system/admin.php?fct=preferences&amp;op=show&amp;confcat_id=7',
            'title'    => _CPADMIN_AUTHENTICATION,
            'absolute' => 1,
            'icon'     => 'fas fa-cog'];
        $opt[] = [
            'link'     => XOOPS_URL . '/modules/system/admin.php?fct=preferences&amp;op=showmod&amp;mod=1',
            'title'    => _CPADMIN_MODULESETTINGS,
            'absolute' => 1,
            'icon'     => 'fas fa-cog'];

        $pref[] = [
            'link'     => XOOPS_URL . '/modules/system/admin.php?fct=preferences',
            'title'    => _CPADMIN_SYSOPTIONS,
            'icon'     => 'fas fa-cogs',
            'absolute' => 1,
            'url'      => XOOPS_URL . '/modules/system/',
            'options'  => $opt];
        
        // add MODULES  Menu items
        /* @var XoopsModuleHandler $module_handler */
        $module_handler = xoops_getHandler('module');
        $criteria       = new CriteriaCompo();
        $criteria->add(new Criteria('hasadmin', 1));
        $criteria->add(new Criteria('isactive', 1));
        $criteria->setSort('mid');
        $mods = $module_handler->getObjects($criteria);

        /* @var XoopsGroupPermHandler $moduleperm_handler */
        $moduleperm_handler = xoops_getHandler('groupperm');
        foreach ($mods as $mod) {
            $rtn    = [];
            
            $sadmin = $moduleperm_handler->checkRight('module_admin', $mod->getVar('mid'), $xoopsUser->getGroups());
            if ($sadmin && ($mod->getVar('hasnotification') || is_array($mod->getInfo('config')) || is_array($mod->getInfo('comments')))) {
                $rtn['link']     = XOOPS_URL . '/modules/system/admin.php?fct=preferences&amp;op=showmod&amp;mod=' . $mod->getVar('mid');
                $rtn['title']    = htmlspecialchars($mod->name(), ENT_QUOTES | ENT_HTML5);
                $rtn['absolute'] = 1;
                $rtn['icon']     = 'fas fa-cogs';
                $pref[]          = $rtn;
            }
        }
        $xoopsTpl->append('prefs', [
            'link' => XOOPS_URL . '/modules/system/admin.php?fct=preferences',
            'text' => _CPADMIN_SITEPREF,
            'icon' => 'fa fa-wrench',
            'dir'  => $mod->getVar('dirname', 'n'),
            'menu' => $pref]);
        /*$xoopsTpl->append('preferences', array(
            'link' => XOOPS_URL . '/modules/system/admin.php?fct=preferences',
            'text' => '<span class="fa fa-wrench"></span> ' . _CPADMIN_SITEPREF,
            //'dir'  => $mod->getVar('dirname', 'n'),
            'menu' => $pref));*/
    }

    /**
     * Get the server configuration
     */
    public function getServerConfig() {
        global $xoopsDB, $xoopsTpl;

        $xoopsTpl->assign('lang_php_version', PHP_VERSION);
        $xoopsTpl->assign('lang_smarty_version', $xoopsTpl::SMARTY_VERSION);
        $xoopsTpl->assign('lang_mysql_version', mysqli_get_server_info($xoopsDB->conn));
        $xoopsTpl->assign('lang_server_api', PHP_SAPI);
        $xoopsTpl->assign('lang_os_name', PHP_OS);
        $xoopsTpl->assign('allow_url_fopen', ini_get('allow_url_fopen') ? 'On' : 'Off');
        $xoopsTpl->assign('fsockopen', function_exists('fsockopen') ? 'On' : 'Off');
        $xoopsTpl->assign('post_max_size', ini_get('post_max_size'));
        $xoopsTpl->assign('max_input_time', ini_get('max_input_time'));
        $xoopsTpl->assign('output_buffering', ini_get('output_buffering'));
        $xoopsTpl->assign('max_execution_time', ini_get('max_execution_time'));
        $xoopsTpl->assign('memory_limit', ini_get('memory_limit'));
        $xoopsTpl->assign('file_uploads', ini_get('file_uploads') ? 'On' : 'Off');
        $xoopsTpl->assign('upload_max_filesize', ini_get('upload_max_filesize'));
    }



}
