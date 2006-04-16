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
        $this->user->repass = $this->request->getParameter('repass');
        if ($this->user->save() === FALSE) {
            // reset passwds?
            $this->user->repass=$this->user->pass=NULL;
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
	public function update() {
        try {
            $this->user= User::find($this->request->getParameter('id'))->attributes($this->request->getParameter('user'));
            if ($this->user->save() === FALSE) {
                $this->render('edit');
            } else {
                $this->flash('notice', $this->user->name . ' updated');
                $this->redirect_to('index');
            }
        } catch (ActiveRecordException $arEx) {
            $this->logger->warn($arEx->getMessage());
            $this->flash('error', $arEx->getMessage());
            $this->redirect_to('index');
        }
    }

    /**
     * Sterge un utilizator din baza de date
     */ 
	public function delete() {
        try {
            $user= User::find($this->request->getParameter('id'));
            if ($user->delete()===FALSE) {
                $this->flash('error', 'Cannot delete <em>' . $user->name . '</em>!');
                return $this->redirect_to('index');
            }
            $this->flash('notice', '<em>' . $user->name . '</em> succesfully removed');
            $this->redirect_to('index');
        } catch (ActiveRecordException $arEx) {
            $this->flash('error', $arEx->getMessage());
            $this->redirect_to('index');
        }
    }

}

