<?php
/**
 * This class is part of medickart project
 * 
 * @package controllers.medickart
 *
 * $Id$
 */
class AdminController extends ApplicationController {
    
    protected $before_filter= array('authenticate');
    
    public function index() {    }
    
}
