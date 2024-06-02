

<title><{if isset($xoops_pagetitle) && $xoops_pagetitle !=''}><{$xoops_pagetitle}> : <{/if}><{$xoops_sitename}></title>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<meta http-equiv="content-language" content="<{$xoops_langcode}>"/>
<meta http-equiv="content-type" content="text/html; charset=<{$xoops_charset}>"/>
<meta name="robots" content="<{$xoops_meta_robots}>"/>
<meta name="keywords" content="<{$xoops_meta_keywords}>"/>
<meta name="description" content="<{$xoops_meta_description}>"/>
<meta name="rating" content="<{$xoops_meta_rating}>"/>
<meta name="author" content="<{$xoops_meta_author}>"/>
<meta name="copyright" content="<{$xoops_meta_copyright}>"/>
<meta name="generator" content="XOOPS"/>

<{if isset($url)}>
    <meta http-equiv="Refresh" content="<{$time}>; url=<{$url}>"/>
<{/if}>

<!-- Rss -->
<link rel="alternate" type="application/rss+xml" title="" href="<{xoAppUrl 'backend.php'}>"/>

<!-- path favicon -->
<link rel="shortcut icon" type="image/ico" href="<{xoAppUrl 'favicon.ico'}>"/>

<!-- Xoops style sheet -->
<link rel="stylesheet" type="text/css" media="screen" href="<{xoAppUrl 'xoops.css'}>"/>

<!-- Font Awesome -->
<link rel="stylesheet" href="<{$theme_url}>/css/fontawesome-free/css/all.min.css">

<!-- customized header contents -->
<{$xoops_module_header}>
