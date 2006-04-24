<?php
/**
 * This class is part of shop project
 *
 * @package medickart.models
 * $Id$
 */
class User extends ActiveRecord {

    const ADMIN = 0;

    const NORMAL= 1;
 
    /** virtual field */
    public $repass;
    
    protected function before_save() {
        $this->validates()->presence_of('name', 'mail', 'pass');
        $this->validates()->uniqueness_of('name', 'mail');
        
        // {{ { this will go to medick core, soon :)
        if (strlen($this->name) <= 3) { // validez daca numele are cel putin 4 caractere.
            $this->row->getFieldByName('name')->addError('should have at least 4 chars.');
        }
        
        if (strlen($this->pass) <= 3) { // validez daca parola are cel putin 4 caractere
            $this->row->getFieldByName('pass')->addError('should have at least 4 chars.');
        }
        
        $p = '/^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i';
        if (!preg_match($p, $this->mail)) { // validez daca mailul are formatul corect.
            $this->row->getFieldByName('mail')->addError('is not a valid email address');
        }

        if ($this->pass != $this->repass) {
            $this->row->getFieldByName('pass')->addError('!=');
        }
        
        // }} }

        return true;
    }
    
    protected function before_insert() {
        $this->pass= md5($this->pass);
        return true;
    }
    
    /**
     * Finds a User
     *
     * @see ActiveRecord::build()
     * @return mixed
     */
    public static function find() {
        $args = func_get_args();
        return ActiveRecord::build(new QueryBuilder(__CLASS__, $args));
    }
}
  
