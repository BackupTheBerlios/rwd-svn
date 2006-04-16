<?php
/**
 * This class is part of medickart project
 *
 * Methods added here will be available in all your controllers.
 * $Id$
 * @package medickart.controllers
 */
class ApplicationController extends ActionController {

    protected function authenticate() {
        return TRUE;
    }
    
}

