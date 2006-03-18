<?php
// $Id$

// 
// This file is part of shop project
// auto-generated on 2006 Mar 19 00:16:26 with medick version: 0.2.2-svn
// 

// complete path to medick boot.php file.
include_once('/wwwroot/medick/trunk/boot.php');
// complete path to shop.xml
// and environment to load
$d= new Dispatcher(
          ContextManager::load(
            '/wwwroot/rwd/trunk/shop/conf/shop.xml',
            'localhost')
        );
$d->dispatch();

