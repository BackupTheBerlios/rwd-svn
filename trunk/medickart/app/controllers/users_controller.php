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
    public function index() {
        $this->users= User::find();
    }

    /**
     * Afiseaza formularul ptr. adaugarea unui nou utilizator
     */ 
	public function add() {
        $this->user = new User();
    }

    /**
     * Salveaza un nou utilizator in baza de date
     */ 
    public function create() {
        $this->user= new User($this->request->getParameter('user'));
        if ($this->user->save() === FALSE) {
            $this->render('add');
        } else {
            $this->flash('notice', '<em>' . $this->user->name . '</em> created');
            $this->redirect_to('index');
        }        
    }

    /**
     * Afizeaza formularul pentru editarea unui utilizator
     */ 
	public function edit() {
        $this->user= User::find($this->request->getParameter('id'));
    }

    /**
     * Actualizeaza un utilizator in baza de date
     */ 
	public function update() {    }

    /**
     * Sterge un utilizator din baza de date
     */ 
	public function delete() {    }

}

