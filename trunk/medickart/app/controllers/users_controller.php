<?php
/**
 * This class is part of medickart project
 * 
 * Managementul utilizatorilor, (CRUD ptr. `users`)
 * 
 * $Id$
 * @package medickart.controllers
 */ 
class UsersController extends ApplicationController {

    protected $before_filters= array('authenticate');

    protected $use_layout= 'admin';
    
    /**
     * Afiseaza toti utilizatori din sistem
     */ 
    public function index() {    }

    /**
     * Afiseaza formularul ptr. adaugarea unui nou utilizator
     */ 
	public function add() {    }

    /**
     * Salveaza un nou utilizator in baza de date
     */ 
    public function create() {    }

    /**
     * Afizeaza formularul pentru editarea unui utilizator
     */ 
	public function edit() {    }

    /**
     * Actualizeaza un utilizator in baza de date
     */ 
	public function update() {    }

    /**
     * Sterge un utilizator din baza de date
     */ 
	public function delete() {    }

}

